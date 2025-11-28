"""
Controllers package
Centraliza todos os controllers da aplicação
"""

from flask import Blueprint

# Criar blueprint principal
bp = Blueprint('routes', __name__)

# Importar todos os controllers
from app.controllers import (
    auth_controller,
    user_controller,
    question_controller,
    quiz_controller,
    dashboard_controller
)

__all__ = ['bp']