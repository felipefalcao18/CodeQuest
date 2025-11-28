"""
Controller de Quiz
Gerencia perguntas de quiz, resultados e histórico
"""

from datetime import timezone, timedelta
from flask import request, redirect, url_for, session, flash, render_template, jsonify
from sqlalchemy import text

from app.controllers import bp
from app.controllers.user_controller import verificar_e_notificar_conquistas
from app.models.pergunta_quiz import PerguntaQuiz
from app.models.quiz_resultado import QuizResultado
from app import db


def calcular_dificuldade_por_desempenho(acertos, total):
    """
    Calcula dificuldade baseada na taxa de acerto do usuário.
    
    Lógica:
    - Acima de 80%: quiz foi fácil para o usuário
    - Entre 50% e 80%: quiz foi médio
    - Abaixo de 50%: quiz foi difícil
    """
    if total == 0:
        return 'medio'
    
    taxa_acerto = (acertos / total) * 100
    
    if taxa_acerto >= 80:
        return 'facil'
    elif taxa_acerto >= 50:
        return 'medio'
    else:
        return 'dificil'


@bp.route('/quiz')
def quiz():
    """Página principal do quiz"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))
    return render_template('quiz.html')


@bp.route('/api/perguntas_quiz')
def api_perguntas_quiz():
    """API para listar perguntas do quiz com filtros"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    categoria = request.args.get('categoria')
    dificuldade = request.args.get('dificuldade')

    query = PerguntaQuiz.query
    if categoria:
        query = query.filter_by(categoria=categoria)
    if dificuldade:
        query = query.filter_by(dificuldade=dificuldade)

    perguntas = query.order_by(PerguntaQuiz.criado_em.desc()).all()

    return jsonify([
        {
            'id': p.id,
            'titulo': p.enunciado,
            'opcoes': p.opcoes,
            'respostaIndex': p.resposta_index
        } for p in perguntas
    ])


@bp.route('/api/categorias')
def categorias():
    """API para listar todas as categorias disponíveis"""
    query = text("SELECT DISTINCT categoria FROM pergunta_quiz WHERE categoria IS NOT NULL ORDER BY categoria")
    result = db.session.execute(query).fetchall()
    categorias = [row[0] for row in result]
    return jsonify(categorias)


@bp.route('/nova-pergunta-quiz', methods=['GET', 'POST'])
def adicionar_pergunta_quiz():
    """Criação de nova pergunta de quiz"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))

    if request.method == 'POST':
        enunciado = request.form['enunciado']
        categoria = request.form['categoria']
        dificuldade = request.form['dificuldade']
        opcoes = [
            request.form['opcao_0'],
            request.form['opcao_1'],
            request.form['opcao_2'],
            request.form['opcao_3']
        ]
        resposta_index = int(request.form['resposta_index'])

        nova = PerguntaQuiz(
            enunciado=enunciado,
            categoria=categoria,
            dificuldade=dificuldade,
            opcoes=opcoes,
            resposta_index=resposta_index
        )
        db.session.add(nova)
        db.session.commit()
        flash('Pergunta de quiz adicionada com sucesso!', 'success')
        return redirect(url_for('routes.quiz'))

    return render_template('adicionar_pergunta_quiz.html')


@bp.route('/api/quiz/result', methods=['POST'])
def salvar_resultado_quiz():
    """API para salvar resultado do quiz"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    data = request.get_json()

    acertos = data.get('acertos')
    total = data.get('total')
    dificuldade = data.get('dificuldade')
    categoria = data.get('categoria')
    tempo_gasto = data.get('tempo_gasto')
    ids_perguntas = data.get('ids_perguntas', [])

    # Calcular dificuldade baseada nas perguntas respondidas
    if not dificuldade and ids_perguntas:
        dificuldade = QuizResultado.calcular_dificuldade_ponderada(ids_perguntas)
        print(f"🎯 Dificuldade calculada automaticamente: {dificuldade}")
        print(f"📊 Baseada em {len(ids_perguntas)} perguntas: {ids_perguntas}")
    elif not dificuldade:
        dificuldade = calcular_dificuldade_por_desempenho(acertos, total)
        print(f"⚡ Dificuldade calculada por desempenho: {dificuldade}")
    
    print(f"✅ Dificuldade final definida: {dificuldade}")

    novo_resultado = QuizResultado(
        usuario_id=session['usuario_id'],
        acertos=acertos,
        total=total,
        dificuldade=dificuldade,
        categoria=categoria,
        tempo_gasto=tempo_gasto
    )

    db.session.add(novo_resultado)
    db.session.commit()

    # Verificar conquistas
    conquistas_novas = verificar_e_notificar_conquistas(session['usuario_id'])

    return jsonify({
        'message': 'Resultado salvo com sucesso',
        'dificuldade_calculada': dificuldade,
        'metodo_calculo': 'ponderado' if ids_perguntas else 'desempenho',
        'conquistas': conquistas_novas
    }), 201


@bp.route('/api/quiz/historico')
def quiz_historico():
    """API para obter histórico de quizzes do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    fuso_brasilia = timezone(timedelta(hours=-3))
    resultados = QuizResultado.query.filter_by(usuario_id=session['usuario_id']) \
        .order_by(QuizResultado.criado_em.desc()).all()

    historico = []
    for r in resultados:
        dt_utc = r.criado_em.replace(tzinfo=timezone.utc) if r.criado_em.tzinfo is None else r.criado_em
        criado_em_brasilia = dt_utc.astimezone(fuso_brasilia)

        historico.append({
            "acertos": r.acertos,
            "total": r.total,
            "dificuldade": r.dificuldade,
            "categoria": r.categoria,
            "tempo_gasto": r.tempo_gasto,
            "criado_em": criado_em_brasilia.isoformat()
        })

    return jsonify(historico)