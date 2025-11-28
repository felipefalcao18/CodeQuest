"""
Controller de Perguntas e Respostas
Gerencia todas as operações relacionadas a perguntas e respostas
"""

from flask import request, redirect, url_for, session, flash, render_template, jsonify

from app.controllers import bp
from app.controllers.user_controller import verificar_e_notificar_conquistas
from app.models.pergunta import Pergunta
from app.models.resposta import Resposta
from app.models.usuario import Usuario
from app.models.log_pergunta import LogPergunta
from app import db


@bp.route('/perguntas')
def listar_perguntas():
    """Página de listagem de perguntas"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))
    return render_template('perguntas.html')


@bp.route('/api/perguntas')
def api_listar_perguntas():
    """API para listar perguntas com filtros"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    usuario_logado_id = session['usuario_id']
    q = request.args.get('q', '').strip()
    categoria = request.args.get('categoria')
    dificuldade = request.args.get('dificuldade')

    query = Pergunta.query
    if q:
        query = query.filter(
            (Pergunta.titulo.ilike(f'%{q}%')) | (Pergunta.conteudo.ilike(f'%{q}%'))
        )
    if categoria:
        query = query.filter_by(categoria=categoria)
    if dificuldade:
        query = query.filter_by(dificuldade=dificuldade)

    perguntas = query.order_by(Pergunta.criado_em.desc()).all()

    return jsonify([
        {
            'id': p.id,
            'titulo': p.titulo,
            'conteudo': p.conteudo,
            'categoria': p.categoria,
            'dificuldade': p.dificuldade,
            'criado_em': p.criado_em.strftime('%d/%m/%Y'),
            'usuario_id': p.usuario_id,
            'usuario_nome': p.usuario.nome,
            'usuario_logado_id': usuario_logado_id,
            'respostas': [
                {
                    'id': r.id,
                    'conteudo': r.conteudo,
                    'usuario_nome': Usuario.query.get(r.usuario_id).nome
                } for r in p.respostas
            ]
        } for p in perguntas
    ])


@bp.route('/api/perguntas/<int:pergunta_id>')
def api_obter_pergunta(pergunta_id):
    """API para obter detalhes de uma pergunta específica"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    p = Pergunta.query.get_or_404(pergunta_id)
    usuario_logado_id = session['usuario_id']

    return jsonify({
        'id': p.id,
        'titulo': p.titulo,
        'conteudo': p.conteudo,
        'categoria': p.categoria,
        'dificuldade': p.dificuldade,
        'criado_em': p.criado_em.strftime('%d/%m/%Y'),
        'usuario_id': p.usuario_id,
        'usuario_nome': p.usuario.nome,
        'usuario_logado_id': usuario_logado_id,
        'respostas': [
            {
                'id': r.id,
                'conteudo': r.conteudo,
                'usuario_id': r.usuario_id,
                'usuario_nome': Usuario.query.get(r.usuario_id).nome
            } for r in p.respostas
        ]
    })


@bp.route('/nova-pergunta', methods=['GET', 'POST'])
def adicionar_pergunta():
    """Criação de nova pergunta"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))

    if request.method == 'POST':
        nova = Pergunta(
            titulo=request.form['titulo'],
            conteudo=request.form['conteudo'],
            categoria=request.form['categoria'],
            dificuldade=request.form['dificuldade'],
            usuario_id=session.get('usuario_id')
        )
        db.session.add(nova)
        db.session.commit()

        # Registrar log
        try:
            log = LogPergunta(
                pergunta_id=nova.id,
                usuario_id=session.get('usuario_id'),
                acao='criacao'
            )
            db.session.add(log)
            db.session.commit()
        except Exception as e:
            print(f"Erro ao salvar log de pergunta: {e}")
            db.session.rollback()

        # Verificar conquistas
        conquistas_novas = verificar_e_notificar_conquistas(session['usuario_id'])
        
        if conquistas_novas:
            flash(f'Pergunta adicionada! 🎉 Nova(s) conquista(s): {", ".join(conquistas_novas)}', 'success')
        else:
            flash('Pergunta adicionada com sucesso!', 'success')
            
        return redirect(url_for('routes.listar_perguntas'))

    return render_template('adicionar_pergunta.html')


@bp.route('/editar-pergunta/<int:id>', methods=['GET', 'POST'])
def editar_pergunta(id):
    """Edição de pergunta existente"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))

    pergunta = Pergunta.query.get_or_404(id)
    usuario_logado_id = session['usuario_id']

    if pergunta.usuario_id != usuario_logado_id:
        flash('Você não tem permissão para editar esta pergunta.', 'warning')
        return redirect(url_for('routes.listar_perguntas'))

    if request.method == 'POST':
        pergunta.titulo = request.form['titulo']
        pergunta.conteudo = request.form['conteudo']
        db.session.commit()

        # Registrar log
        try:
            log = LogPergunta(
                pergunta_id=pergunta.id,
                usuario_id=session.get('usuario_id'),
                acao='edicao'
            )
            db.session.add(log)
            db.session.commit()
        except Exception as e:
            print(f"Erro ao salvar log de edição de pergunta: {e}")
            db.session.rollback()

        flash('Pergunta atualizada com sucesso!', 'success')
        return redirect(url_for('routes.listar_perguntas'))

    return render_template('editar_pergunta.html', pergunta=pergunta)


@bp.route('/api/perguntas/<int:pergunta_id>', methods=['DELETE'])
def api_excluir_pergunta(pergunta_id):
    """API para excluir pergunta"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    pergunta = Pergunta.query.get_or_404(pergunta_id)
    usuario_logado_id = session['usuario_id']
    
    if pergunta.usuario_id != usuario_logado_id:
        return jsonify({'error': 'Sem permissão'}), 403
    
    try:
        # Registrar log antes de excluir
        log = LogPergunta(
            pergunta_id=pergunta.id,
            usuario_id=usuario_logado_id,
            acao='remocao'
        )
        db.session.add(log)
        
        # Excluir respostas associadas
        Resposta.query.filter_by(pergunta_id=pergunta_id).delete()
        
        # Excluir pergunta
        db.session.delete(pergunta)
        db.session.commit()
        
        return jsonify({'message': 'Pergunta excluída com sucesso'}), 200
        
    except Exception as e:
        db.session.rollback()
        print(f"Erro ao excluir pergunta: {e}")
        return jsonify({'error': 'Erro ao excluir pergunta'}), 500


@bp.route('/responder/<int:pergunta_id>', methods=['GET', 'POST'])
def adicionar_resposta(pergunta_id):
    """Adicionar resposta a uma pergunta (página)"""
    if 'usuario_id' not in session:
        return redirect(url_for('routes.login'))

    pergunta = Pergunta.query.get_or_404(pergunta_id)

    if request.method == 'POST':
        resposta = Resposta(
            conteudo=request.form['conteudo'],
            usuario_id=session.get('usuario_id'),
            pergunta_id=pergunta.id
        )
        db.session.add(resposta)
        db.session.commit()
        
        # Verificar conquistas
        conquistas_novas = verificar_e_notificar_conquistas(session['usuario_id'])
        
        if conquistas_novas:
            flash(f'Resposta enviada! 🎉 Nova(s) conquista(s): {", ".join(conquistas_novas)}', 'success')
        else:
            flash('Resposta enviada com sucesso!', 'success')
            
        return redirect(url_for('routes.listar_respostas_por_pergunta', pergunta_id=pergunta_id))

    return render_template('adicionar_resposta.html', pergunta=pergunta)


@bp.route('/api/respostas', methods=['POST'])
def api_adicionar_resposta():
    """API para adicionar resposta"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401

    data = request.get_json()
    pergunta_id = data.get('pergunta_id')
    conteudo = data.get('conteudo')

    if not pergunta_id or not conteudo:
        return jsonify({'error': 'Dados inválidos'}), 400

    nova_resposta = Resposta(
        conteudo=conteudo,
        usuario_id=session['usuario_id'],
        pergunta_id=pergunta_id
    )
    db.session.add(nova_resposta)
    db.session.commit()
    
    # Verificar conquistas
    conquistas_novas = verificar_e_notificar_conquistas(session['usuario_id'])
    
    return jsonify({
        'message': 'Resposta adicionada com sucesso',
        'conquistas': conquistas_novas
    }), 201


@bp.route('/api/respostas/<int:resposta_id>', methods=['PUT'])
def api_editar_resposta(resposta_id):
    """API para editar resposta"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    resposta = Resposta.query.get_or_404(resposta_id)
    usuario_logado_id = session['usuario_id']
    
    if resposta.usuario_id != usuario_logado_id:
        return jsonify({'error': 'Sem permissão'}), 403
    
    data = request.get_json()
    conteudo = data.get('conteudo')
    
    if not conteudo:
        return jsonify({'error': 'Conteúdo inválido'}), 400
    
    resposta.conteudo = conteudo
    db.session.commit()
    
    return jsonify({'message': 'Resposta atualizada com sucesso'}), 200


@bp.route('/api/respostas/<int:resposta_id>', methods=['DELETE'])
def api_excluir_resposta(resposta_id):
    """API para excluir resposta"""
    if 'usuario_id' not in session:
        return jsonify({'error': 'Não autorizado'}), 401
    
    resposta = Resposta.query.get_or_404(resposta_id)
    usuario_logado_id = session['usuario_id']
    
    if resposta.usuario_id != usuario_logado_id:
        return jsonify({'error': 'Sem permissão'}), 403
    
    db.session.delete(resposta)
    db.session.commit()
    
    return jsonify({'message': 'Resposta excluída com sucesso'}), 200


@bp.route('/perguntas/<int:pergunta_id>/respostas')
def listar_respostas_por_pergunta(pergunta_id):
    """Página de respostas de uma pergunta"""
    pergunta = Pergunta.query.get_or_404(pergunta_id)
    respostas = Resposta.query.filter_by(pergunta_id=pergunta_id).all()
    return render_template('respostas.html', pergunta=pergunta, respostas=respostas)