from app import db
from sqlalchemy.dialects.mysql import JSON
from sqlalchemy import Enum
import enum


class DificuldadeEnum(enum.Enum):
    facil = "facil"
    medio = "medio"
    dificil = "dificil"


class PerguntaQuiz(db.Model):
    __tablename__ = "pergunta_quiz"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    enunciado = db.Column(db.Text, nullable=False)

    categoria = db.Column(db.String(100), nullable=True)

    dificuldade = db.Column(
        Enum(DificuldadeEnum, name="dificuldade_enum"),
        nullable=False,
        default=DificuldadeEnum.facil
    )

    criado_em = db.Column(db.DateTime, default=db.func.current_timestamp())

    opcoes = db.Column(JSON, nullable=False)  # lista de strings

    resposta_index = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"<PerguntaQuiz {self.id}>"
