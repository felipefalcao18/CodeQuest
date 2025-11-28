"""
Controller de Autenticação
Gerencia login, logout, cadastro e recuperação de senha
"""

from flask import request, redirect, url_for, session, flash, render_template, current_app
from werkzeug.security import generate_password_hash, check_password_hash
from itsdangerous import URLSafeTimedSerializer
from flask_mail import Message

from app.controllers import bp
from app.models.usuario import Usuario
from app import db, mail


def get_serializer():
    return URLSafeTimedSerializer(current_app.secret_key)


@bp.route('/')
def home():
    """Página inicial - redireciona para dashboard ou login"""
    if 'usuario_id' in session:
        return redirect(url_for('routes.dashboard'))
    return redirect(url_for('routes.login'))


@bp.route('/login', methods=['GET', 'POST'])
def login():
    """Autenticação de usuário"""
    if request.method == 'POST':
        email = request.form.get('email')
        senha = request.form.get('senha')
        usuario = Usuario.query.filter_by(email=email).first()

        if usuario and check_password_hash(usuario.senha, senha):
            session['usuario_id'] = usuario.id
            session['usuario_nome'] = usuario.nome
            flash('Login realizado com sucesso!', 'success')
            return redirect(url_for('routes.dashboard'))
        else:
            flash('Email ou senha inválidos.', 'error')

    return render_template('login.html')


@bp.route('/cadastro', methods=['GET', 'POST'])
def cadastrar_usuario():
    """Cadastro de novo usuário"""
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']

        if Usuario.query.filter_by(email=email).first():
            flash("Este email já está cadastrado.", "error")
        else:
            senha_criptografada = generate_password_hash(senha)
            novo = Usuario(nome=nome, email=email, senha=senha_criptografada)
            db.session.add(novo)
            db.session.commit()
            flash("Usuário cadastrado com sucesso!", "success")
            return redirect(url_for('routes.login'))

    return render_template('cadastro.html')


@bp.route('/logout')
def logout():
    """Encerra sessão do usuário"""
    session.clear()
    flash('Você saiu da conta.', 'success')
    return redirect(url_for('routes.login'))


@bp.route('/esqueci-senha', methods=['GET', 'POST'])
def esqueci_senha():
    """Solicitação de recuperação de senha"""
    s = get_serializer()

    if request.method == 'POST':
        email = request.form['email']
        usuario = Usuario.query.filter_by(email=email).first()

        if usuario:
            token = s.dumps(email, salt='recuperar-senha')
            link = url_for('routes.resetar_senha', token=token, _external=True)

            msg = Message(
                subject="🔒 Recuperação de Senha - CodeQuest",
                sender=current_app.config['MAIL_USERNAME'],
                recipients=[email]
            )

            from flask import render_template_string
            html_body = render_template_string(f"""
            <!DOCTYPE html>
            <html lang="pt-br">
              <head>
                <meta charset="UTF-8">
                <style>
                  body {{
                    font-family: 'Arial', sans-serif;
                    background-color: #f5f6fa;
                    color: #333;
                    padding: 20px;
                  }}
                  .container {{
                    background-color: #fff;
                    border-radius: 10px;
                    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
                    max-width: 500px;
                    margin: auto;
                    padding: 30px;
                  }}
                  .title {{
                    color: #2c3e50;
                    font-size: 20px;
                    font-weight: bold;
                    margin-bottom: 15px;
                  }}
                  .button {{
                    display: inline-block;
                    background-color: #3498db;
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 6px;
                    margin-top: 15px;
                    font-weight: bold;
                  }}
                  .button:hover {{
                    background-color: #2980b9;
                  }}
                  .footer {{
                    font-size: 12px;
                    color: #888;
                    margin-top: 20px;
                  }}
                </style>
              </head>
              <body>
                <div class="container">
                  <p class="title">Recuperação de Senha</p>
                  <p>Olá, <strong>{usuario.nome}</strong>,</p>
                  <p>Recebemos uma solicitação para redefinir a senha da sua conta no <strong>CodeQuest</strong>.</p>
                  <p>Para continuar, clique no botão abaixo:</p>
                  <p style="text-align: center;">
                    <a href="{link}" class="button">Redefinir Senha</a>
                  </p>
                  <p>Este link é válido por <strong>1 hora</strong>. Se você não solicitou a recuperação, ignore este e-mail.</p>
                  <p class="footer">Atenciosamente,<br>Equipe de Suporte • CodeQuest</p>
                </div>
              </body>
            </html>
            """)

            msg.body = f"Olá, {usuario.nome}! Para redefinir sua senha, acesse o link: {link} (válido por 1 hora)."
            msg.html = html_body
            mail.send(msg)

            flash('Um e-mail com instruções para redefinir sua senha foi enviado.', 'success')
        else:
            flash('E-mail não cadastrado.', 'warning')

        return redirect(url_for('routes.login'))

    return render_template('esqueci_senha.html')


@bp.route('/resetar-senha/<token>', methods=['GET', 'POST'])
def resetar_senha(token):
    """Redefinição de senha via token"""
    s = get_serializer()
    try:
        email = s.loads(token, salt='recuperar-senha', max_age=3600)
    except Exception:
        flash('Link inválido ou expirado.', 'danger')
        return redirect(url_for('routes.login'))

    if request.method == 'POST':
        nova_senha = request.form['senha']
        usuario = Usuario.query.filter_by(email=email).first()
        if usuario:
            usuario.senha = generate_password_hash(nova_senha)
            db.session.commit()
            flash('Senha atualizada com sucesso! Faça login.', 'success')
            return redirect(url_for('routes.login'))
        else:
            flash('Usuário não encontrado.', 'danger')
            return redirect(url_for('routes.login'))

    return render_template('resetar_senha.html')