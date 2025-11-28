"""
Arquivo routes.py simplificado
Agora apenas importa o blueprint dos controllers
"""

from app.controllers import bp

# O blueprint já vem configurado com todas as rotas dos controllers
__all__ = ['bp']