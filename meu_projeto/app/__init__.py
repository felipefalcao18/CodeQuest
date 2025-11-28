"""
Inicialização da aplicação Flask
Configuração de extensões e registro de blueprints
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_mail import Mail
from config import (
    SQLALCHEMY_DATABASE_URI, 
    SQLALCHEMY_TRACK_MODIFICATIONS, 
    MAIL_SERVER, 
    MAIL_PORT, 
    MAIL_USE_TLS, 
    MAIL_USERNAME, 
    MAIL_PASSWORD
)

# Inicialização de extensões
db = SQLAlchemy()
migrate = Migrate()
mail = Mail()


def create_app():
    """Factory function para criar a aplicação Flask"""
    app = Flask(__name__)
    
    # Configurações do banco de dados
    app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = SQLALCHEMY_TRACK_MODIFICATIONS

    # Configurações de email
    app.config['MAIL_SERVER'] = MAIL_SERVER
    app.config['MAIL_PORT'] = MAIL_PORT
    app.config['MAIL_USE_TLS'] = MAIL_USE_TLS
    app.config['MAIL_USERNAME'] = MAIL_USERNAME
    app.config['MAIL_PASSWORD'] = MAIL_PASSWORD

    # Chave secreta
    app.secret_key = 'sua_chave_secreta_segura'

    # Inicializar extensões
    db.init_app(app)
    migrate.init_app(app, db)
    mail.init_app(app)

    # Registrar blueprints
    from app.controllers import bp as main_bp
    app.register_blueprint(main_bp)

    return app