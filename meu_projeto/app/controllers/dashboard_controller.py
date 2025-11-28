"""
Controller do Dashboard
Gerencia dashboard, metas, estatísticas e página sobre
"""

from datetime import datetime
from flask import request, redirect, url_for, session, flash, render_template, jsonify
from sqlalchemy import func

from app.controllers import bp
from app.models.usuario import Usuario
from app.models.pergunta import Pergunta
from app.models.resposta import Resposta
from app.models.quiz_resultado import QuizResultado
from app.models.metas_semanal import MetaSemanal
from app.models.conquistas import Conquista, verificar_conquistas_metas
from app import db


@bp.route('/dashboard')
def dashboard():
    """Página principal do dashboard"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))
    
    usuario = Usuario.query.get_or_404(session['usuario_id'])
    
    # Métricas gerais
    total_perguntas = Pergunta.query.count()
    total_respostas = Resposta.query.count()
    
    # Métricas do usuário logado
    usuario_id = session['usuario_id']
    ultimo_quiz = QuizResultado.query.filter_by(usuario_id=usuario_id) \
                                      .order_by(QuizResultado.criado_em.desc()) \
                                      .first()
    total_quiz_feitos = QuizResultado.query.filter_by(usuario_id=usuario_id).count()

    # Calcular pontuação
    user_score = usuario.calcular_pontuacao_total()
    usuario.pontuacao_total = user_score
    db.session.commit()
    
    # Calcular estatísticas dos quizzes
    stats = db.session.query(
        func.sum(QuizResultado.acertos).label('total_acertos'),
        func.sum(QuizResultado.total).label('total_perguntas_quiz')
    ).filter_by(usuario_id=usuario_id).first()

    total_acertos = stats.total_acertos or 0
    total_perguntas_quiz = stats.total_perguntas_quiz or 0
    
    accuracy_rate = 0
    if total_perguntas_quiz > 0:
        accuracy_rate = round((total_acertos / total_perguntas_quiz) * 100)

    # Sistema de níveis
    niveis = [
        {'nivel': 1, 'pontos': 0, 'titulo': 'Iniciante', 'icone': '🌱'},
        {'nivel': 2, 'pontos': 500, 'titulo': 'Aprendiz', 'icone': '📚'},
        {'nivel': 3, 'pontos': 1000, 'titulo': 'Intermediário', 'icone': '🎓'},
        {'nivel': 4, 'pontos': 2000, 'titulo': 'Avançado', 'icone': '⭐'},
        {'nivel': 5, 'pontos': 5000, 'titulo': 'Expert', 'icone': '🏆'},
        {'nivel': 6, 'pontos': 10000, 'titulo': 'Mestre', 'icone': '👑'}
    ]
    
    nivel_atual = niveis[0]
    proximo_nivel = niveis[1] if len(niveis) > 1 else niveis[0]
    
    for i in range(len(niveis) - 1):
        if user_score >= niveis[i]['pontos'] and user_score < niveis[i + 1]['pontos']:
            nivel_atual = niveis[i]
            proximo_nivel = niveis[i + 1]
            break
    
    # Nível máximo
    if user_score >= niveis[-1]['pontos']:
        nivel_atual = niveis[-1]
        proximo_nivel = niveis[-1]
    
    # Progresso no nível
    pontos_no_nivel = user_score - nivel_atual['pontos']
    pontos_necessarios = proximo_nivel['pontos'] - nivel_atual['pontos']
    
    if pontos_necessarios > 0:
        porcentagem_nivel = round((pontos_no_nivel / pontos_necessarios) * 100)
    else:
        porcentagem_nivel = 100

    # Metas e progresso
    meta = MetaSemanal.obter_ou_criar_meta(usuario_id)
    progresso = meta.calcular_progresso_semanal()

    return render_template('dashboard.html',
                           usuario=usuario,
                           total_perguntas=total_perguntas,
                           total_respostas=total_respostas,
                           total_quiz_feitos=total_quiz_feitos,
                           user_score=user_score,
                           accuracy_rate=accuracy_rate,
                           metas=meta,
                           progresso=progresso,
                           ultimo_quiz=ultimo_quiz,
                           nivel_atual=nivel_atual,
                           proximo_nivel=proximo_nivel,
                           porcentagem_nivel=porcentagem_nivel,
                           total_perguntas_respondidas=total_perguntas_quiz,
                           ano_atual=datetime.utcnow().year)


@bp.route('/api/desempenho')
def api_desempenho_usuario():
    """API para estatísticas de desempenho por categoria"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    usuario_id = session['usuario_id']

    desempenho = db.session.query(
        QuizResultado.categoria,
        func.sum(QuizResultado.acertos).label('total_acertos'),
        func.sum(QuizResultado.total).label('total_questoes')
    ).filter(
        QuizResultado.usuario_id == usuario_id,
        QuizResultado.categoria.isnot(None)
    ).group_by(QuizResultado.categoria).order_by(QuizResultado.categoria).all()

    resultado_formatado = []
    for r in desempenho:
        if r.total_questoes > 0:
            taxa_acerto = round((r.total_acertos / r.total_questoes) * 100)
            resultado_formatado.append({
                "categoria": r.categoria,
                "acertos": r.total_acertos,
                "total": r.total_questoes,
                "taxa_acerto": taxa_acerto
            })

    return jsonify(resultado_formatado)


@bp.route('/api/desempenho_dificuldade')
def api_desempenho_dificuldade():
    """API para estatísticas de desempenho por dificuldade"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    usuario_id = session['usuario_id']

    desempenho = db.session.query(
        QuizResultado.dificuldade,
        func.sum(QuizResultado.acertos).label('total_acertos'),
        func.sum(QuizResultado.total).label('total_questoes')
    ).filter(
        QuizResultado.usuario_id == usuario_id,
        QuizResultado.dificuldade.isnot(None)
    ).group_by(QuizResultado.dificuldade).all()

    resultado = []
    for r in desempenho:
        taxa_acerto = 0
        if r.total_questoes > 0:
            taxa_acerto = round((r.total_acertos / r.total_questoes) * 100)

        resultado.append({
            "dificuldade": r.dificuldade,
            "acertos": r.total_acertos or 0,
            "total": r.total_questoes or 0,
            "taxa_acerto": taxa_acerto
        })

    return jsonify(resultado)


@bp.route('/api/pontuacao/detalhes')
def api_pontuacao_detalhes():
    """API para detalhes de pontuação"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    usuario_id = session['usuario_id']
    usuario = Usuario.query.get_or_404(usuario_id)
    
    # Calcular pontos de quizzes por dificuldade
    stats_quiz = db.session.query(
        QuizResultado.dificuldade,
        func.sum(QuizResultado.acertos).label('total_acertos')
    ).filter_by(usuario_id=usuario_id).group_by(QuizResultado.dificuldade).all()
    
    pontos_facil = 0
    pontos_medio = 0
    pontos_dificil = 0
    acertos_facil = 0
    acertos_medio = 0
    acertos_dificil = 0
    
    for stat in stats_quiz:
        if stat.dificuldade == 'facil':
            acertos_facil = stat.total_acertos or 0
            pontos_facil = acertos_facil * 5
        elif stat.dificuldade == 'medio':
            acertos_medio = stat.total_acertos or 0
            pontos_medio = acertos_medio * 10
        elif stat.dificuldade == 'dificil':
            acertos_dificil = stat.total_acertos or 0
            pontos_dificil = acertos_dificil * 15
    
    # Pontos de conquistas
    total_conquistas = usuario.total_conquistas
    pontos_conquistas = total_conquistas * 20
    
    pontos_totais = pontos_facil + pontos_medio + pontos_dificil + pontos_conquistas
    
    usuario.pontuacao_total = pontos_totais
    db.session.commit()
    
    return jsonify({
        'pontos_totais': pontos_totais,
        'detalhes': {
            'quizzes_facil': {
                'pontos': pontos_facil,
                'quantidade': acertos_facil,
                'descricao': 'Acertos em quizzes fáceis',
                'valor_unitario': 5
            },
            'quizzes_medio': {
                'pontos': pontos_medio,
                'quantidade': acertos_medio,
                'descricao': 'Acertos em quizzes médios',
                'valor_unitario': 10
            },
            'quizzes_dificil': {
                'pontos': pontos_dificil,
                'quantidade': acertos_dificil,
                'descricao': 'Acertos em quizzes difíceis',
                'valor_unitario': 15
            },
            'conquistas': {
                'pontos': pontos_conquistas,
                'quantidade': total_conquistas,
                'descricao': 'Conquistas desbloqueadas',
                'valor_unitario': 20
            }
        }
    })


@bp.route('/api/metas', methods=['GET'])
def api_obter_metas():
    """API para obter metas do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    meta = MetaSemanal.obter_ou_criar_meta(session['usuario_id'])
    progresso = meta.calcular_progresso_semanal()
    
    return jsonify({
        'metas': {
            'perguntas': meta.meta_perguntas,
            'respostas': meta.meta_respostas,
            'quizzes': meta.meta_quizzes
        },
        'progresso': progresso,
        'atualizado_em': meta.atualizado_em.strftime('%d/%m/%Y %H:%M')
    })


@bp.route('/api/metas', methods=['POST'])
def api_atualizar_metas():
    """API para atualizar metas do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    data = request.get_json()
    meta = MetaSemanal.obter_ou_criar_meta(session['usuario_id'])
    
    if 'meta_perguntas' in data:
        meta.meta_perguntas = max(1, int(data['meta_perguntas']))
    if 'meta_respostas' in data:
        meta.meta_respostas = max(1, int(data['meta_respostas']))
    if 'meta_quizzes' in data:
        meta.meta_quizzes = max(1, int(data['meta_quizzes']))
    
    db.session.commit()
    
    usuario = Usuario.query.get(session['usuario_id'])
    conquistas_novas = verificar_conquistas_metas(usuario)
    
    return jsonify({
        'message': 'Metas atualizadas com sucesso',
        'metas': {
            'perguntas': meta.meta_perguntas,
            'respostas': meta.meta_respostas,
            'quizzes': meta.meta_quizzes
        },
        'conquistas': conquistas_novas
    })


@bp.route('/api/metas/resetar', methods=['POST'])
def api_resetar_metas():
    """API para resetar metas para valores padrão"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    meta = MetaSemanal.obter_ou_criar_meta(session['usuario_id'])
    meta.meta_perguntas = 5
    meta.meta_respostas = 5
    meta.meta_quizzes = 3
    
    db.session.commit()
    
    return jsonify({
        'message': 'Metas resetadas para valores padrão',
        'metas': {
            'perguntas': 5,
            'respostas': 5,
            'quizzes': 3
        }
    })


@bp.route('/cursos')
def cursos():
    """Página de cursos"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))
    return render_template('cursos.html', usuario=Usuario.query.get(session['usuario_id']))


@bp.route('/sobre')
def sobre():
    """Página sobre a plataforma"""
    total_usuarios = Usuario.query.count()
    total_perguntas = Pergunta.query.count()
    total_quizzes = QuizResultado.query.count()
    total_conquistas = Conquista.query.count()
    
    return render_template(
        'sobre.html',
        total_usuarios=total_usuarios,
        total_perguntas=total_perguntas,
        total_quizzes=total_quizzes,
        total_conquistas=total_conquistas
    )