"""
Controller de Usuário
Gerencia perfil, conquistas, ranking e exclusão de conta
"""

import os
from datetime import datetime
from flask import request, redirect, url_for, session, flash, render_template, jsonify
from werkzeug.utils import secure_filename
from werkzeug.security import generate_password_hash
from sqlalchemy import desc

from app.controllers import bp
from app.models.usuario import Usuario
from app.models.conquistas import Conquista, verificar_conquistas
from app.models.pergunta import Pergunta
from app.models.resposta import Resposta
from app.models.quiz_resultado import QuizResultado
from app.models.metas_semanal import MetaSemanal
from app.models.log_pergunta import LogPergunta
from app import db

# Configurações de upload
ALLOWED_EXTENSIONS = {'.png', '.jpg', '.jpeg', '.gif'}
UPLOAD_FOLDER = 'app/static/uploads'
MAX_FILE_SIZE = 5 * 1024 * 1024  # 5MB


def arquivo_permitido(nome_arquivo):
    """Verifica se a extensão do arquivo é permitida"""
    extensao = os.path.splitext(nome_arquivo)[1].lower()
    return extensao in ALLOWED_EXTENSIONS


def verificar_e_notificar_conquistas(usuario_id):
    """Verifica conquistas do usuário e retorna lista de novas conquistas"""
    try:
        usuario = Usuario.query.get(usuario_id)
        if usuario:
            conquistas_novas = verificar_conquistas(usuario)
            return conquistas_novas
    except Exception as e:
        print(f"Erro ao verificar conquistas: {e}")
    return []


@bp.route('/perfil', methods=['GET', 'POST'])
def perfil():
    """Visualização e edição de perfil"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))

    usuario = Usuario.query.get_or_404(session['usuario_id'])
    modo = request.args.get('modo', 'visualizar')

    if request.method == 'POST':
        # Atualiza dados básicos
        nome = request.form.get('nome', '').strip()
        senha = request.form.get('senha', '').strip()
        bio = request.form.get('bio', '').strip()

        if nome:
            usuario.nome = nome
            session['usuario_nome'] = nome
        
        if senha:
            usuario.senha = generate_password_hash(senha)
        
        usuario.bio = bio

        # Upload de foto de perfil
        if 'foto_perfil' in request.files:
            arquivo = request.files['foto_perfil']

            if arquivo and arquivo.filename != '':
                if not arquivo_permitido(arquivo.filename):
                    flash('Formato de arquivo não permitido. Use JPG, PNG ou GIF.', 'error')
                    return redirect(url_for('routes.perfil', modo='editar'))

                arquivo.seek(0, os.SEEK_END)
                tamanho = arquivo.tell()
                arquivo.seek(0)

                if tamanho > MAX_FILE_SIZE:
                    flash('Arquivo muito grande. Máximo 5MB.', 'error')
                    return redirect(url_for('routes.perfil', modo='editar'))

                extensao = os.path.splitext(arquivo.filename)[1].lower()
                nome_arquivo = f"perfil_{usuario.id}_{int(datetime.now().timestamp())}{extensao}"
                nome_seguro = secure_filename(nome_arquivo)

                os.makedirs(UPLOAD_FOLDER, exist_ok=True)

                if usuario.foto_perfil:
                    caminho_antigo = os.path.join(UPLOAD_FOLDER, usuario.foto_perfil)
                    if os.path.exists(caminho_antigo):
                        try:
                            os.remove(caminho_antigo)
                        except:
                            pass

                caminho_completo = os.path.join(UPLOAD_FOLDER, nome_seguro)
                arquivo.save(caminho_completo)
                usuario.foto_perfil = nome_seguro

        # Upload de capa do perfil
        if 'capa_perfil' in request.files:
            capa = request.files['capa_perfil']

            if capa and capa.filename != '':
                if not arquivo_permitido(capa.filename):
                    flash('Formato de capa não permitido. Use JPG, PNG ou GIF.', 'error')
                    return redirect(url_for('routes.perfil', modo='editar'))

                capa.seek(0, os.SEEK_END)
                tamanho = capa.tell()
                capa.seek(0)

                if tamanho > MAX_FILE_SIZE:
                    flash('Arquivo muito grande. Máximo 5MB.', 'error')
                    return redirect(url_for('routes.perfil', modo='editar'))

                extensao = os.path.splitext(capa.filename)[1].lower()
                nome_capa = f"capa_{usuario.id}_{int(datetime.now().timestamp())}{extensao}"
                nome_capa_seguro = secure_filename(nome_capa)

                os.makedirs(UPLOAD_FOLDER, exist_ok=True)

                if usuario.capa_perfil:
                    caminho_capa_antiga = os.path.join(UPLOAD_FOLDER, usuario.capa_perfil)
                    if os.path.exists(caminho_capa_antiga):
                        try:
                            os.remove(caminho_capa_antiga)
                        except:
                            pass

                caminho_completo_capa = os.path.join(UPLOAD_FOLDER, nome_capa_seguro)
                capa.save(caminho_completo_capa)
                usuario.capa_perfil = nome_capa_seguro

        # Salva tudo
        db.session.commit()
        verificar_e_notificar_conquistas(usuario.id)
        flash('Perfil atualizado com sucesso!', 'success')
        return redirect(url_for('routes.perfil', modo='visualizar'))

    # Recupera conquistas e estatísticas
    conquistas = Conquista.query.filter_by(usuario_id=usuario.id).all()
    usuario.total_conquistas = len(conquistas)
    usuario.total_perguntas = Pergunta.query.filter_by(usuario_id=usuario.id).count()
    usuario.total_respostas = Resposta.query.filter_by(usuario_id=usuario.id).count()
    db.session.commit()

    return render_template(
        'perfil.html',
        usuario=usuario,
        modo=modo,
        conquistas=conquistas
    )


@bp.route('/api/usuario/deletar', methods=['DELETE'])
def api_deletar_usuario():
    """Exclusão completa da conta do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    usuario_id = session['usuario_id']
    usuario = Usuario.query.get(usuario_id)

    if not usuario:
        return jsonify({'error': 'Usuário não encontrado'}), 404

    try:
        # Remover foto do perfil
        if usuario.foto_perfil:
            caminho_foto = os.path.join(UPLOAD_FOLDER, usuario.foto_perfil)
            if os.path.exists(caminho_foto):
                os.remove(caminho_foto)

        # Excluir dados associados
        LogPergunta.query.filter_by(usuario_id=usuario_id).delete()
        MetaSemanal.query.filter_by(usuario_id=usuario_id).delete()
        Conquista.query.filter_by(usuario_id=usuario_id).delete()
        QuizResultado.query.filter_by(usuario_id=usuario_id).delete()
        Resposta.query.filter_by(usuario_id=usuario_id).delete()
        
        perguntas_usuario = Pergunta.query.filter_by(usuario_id=usuario_id).all()
        for p in perguntas_usuario:
            Resposta.query.filter_by(pergunta_id=p.id).delete()
            db.session.delete(p)
        
        db.session.delete(usuario)
        db.session.commit()
        session.clear()
        
        return jsonify({'message': 'Conta excluída com sucesso'}), 200

    except Exception as e:
        db.session.rollback()
        print(f"Erro ao excluir conta: {e}")
        return jsonify({'error': 'Erro interno ao excluir conta'}), 500


@bp.route('/api/usuario/perguntas')
def get_usuario_perguntas():
    """Lista perguntas do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    perguntas = Pergunta.query.filter_by(usuario_id=session['usuario_id'])\
        .order_by(Pergunta.criado_em.desc()).all()
    
    return jsonify([{
        'id': p.id,
        'titulo': p.titulo,
        'categoria': p.categoria,
        'dificuldade': p.dificuldade,
        'criado_em': p.criado_em.strftime('%d/%m/%Y')
    } for p in perguntas])


@bp.route('/api/usuario/respostas')
def get_usuario_respostas():
    """Lista respostas do usuário"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    respostas = Resposta.query.filter_by(usuario_id=session['usuario_id'])\
        .order_by(Resposta.criado_em.desc()).all()
    
    return jsonify([{
        'id': r.id,
        'conteudo': r.conteudo,
        'pergunta_titulo': r.pergunta.titulo,
        'criado_em': r.criado_em.strftime('%d/%m/%Y')
    } for r in respostas])


@bp.route('/ranking')
def ranking():
    """Página de ranking dos usuários"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))
    
    # Atualiza pontuação de todos os usuários
    usuarios = Usuario.query.all()
    for u in usuarios:
        pontuacao = u.calcular_pontuacao_total()
        u.pontuacao_total = pontuacao
    db.session.commit()
    
    # Top 20 usuários
    top_usuarios = Usuario.query.order_by(
        desc(Usuario.pontuacao_total),
        Usuario.nome.asc()
    ).limit(20).all()
    
    top_usuarios_formatados = []
    for usuario in top_usuarios:
        top_usuarios_formatados.append({
            'id': usuario.id,
            'nome': usuario.nome,
            'foto_perfil': usuario.foto_perfil,
            'pontuacao_total': usuario.pontuacao_total
        })
    
    usuario_logado = Usuario.query.get(session['usuario_id'])
    
    return render_template(
        'ranking.html', 
        top_usuarios=top_usuarios_formatados,
        usuario_logado=usuario_logado,
        ano_atual=datetime.utcnow().year
    )