
from app import db
from datetime import datetime

class LogResposta(db.Model):
    __tablename__ = 'log_respostas'
    id = db.Column(db.Integer, primary_key=True)
    resposta_id = db.Column(db.Integer, db.ForeignKey('respostas.id'), nullable=False)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    acao = db.Column(db.String(100))
    data_log = db.Column(db.DateTime, default=datetime.utcnow)
