# app/models/log_pergunta.py

from app import db
from datetime import datetime

class LogPergunta(db.Model):
    __tablename__ = 'log_perguntas'
    
    id = db.Column(db.Integer, primary_key=True)
    # Referencia 'perguntas.id' em vez de 'respostas.id'
    pergunta_id = db.Column(db.Integer, db.ForeignKey('perguntas.id', ondelete='CASCADE'), nullable=False) 
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id', ondelete='CASCADE'), nullable=False)
    
    # Recomendo usar Enum aqui, assim como você fez no model Pergunta
    acao = db.Column(db.Enum('criacao', 'edicao', 'remocao'), nullable=False) 
    
    data_log = db.Column(db.DateTime, default=datetime.utcnow)