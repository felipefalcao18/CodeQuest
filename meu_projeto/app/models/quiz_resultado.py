# Adicione este método no arquivo app/models/quiz_resultado.py

from app import db
from datetime import datetime

class QuizResultado(db.Model):
    __tablename__ = 'quiz_resultados'
    
    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    acertos = db.Column(db.Integer, nullable=False)
    total = db.Column(db.Integer, nullable=False)
    tempo_gasto = db.Column(db.Integer)
    dificuldade = db.Column(db.Enum('facil', 'medio', 'dificil'), nullable=True)
    categoria = db.Column(db.String(50))
    criado_em = db.Column(db.DateTime, default=datetime.utcnow)
    
    usuario = db.relationship('Usuario', back_populates='resultados_quiz')

    
    @staticmethod
    def calcular_dificuldade_por_perguntas(ids_perguntas):
        """
        Calcula a dificuldade predominante baseada nas perguntas do quiz.
        Retorna: 'facil', 'medio' ou 'dificil'
        """
        from app.models.pergunta_quiz import PerguntaQuiz
        
        if not ids_perguntas or len(ids_perguntas) == 0:
            return 'medio'  # Fallback padrão
        
        # Buscar as dificuldades das perguntas
        perguntas = PerguntaQuiz.query.filter(PerguntaQuiz.id.in_(ids_perguntas)).all()
        
        if not perguntas:
            return 'medio'
        
        # Contar dificuldades
        contagem = {'facil': 0, 'medio': 0, 'dificil': 0}
        
        for pergunta in perguntas:
            if pergunta.dificuldade in contagem:
                contagem[pergunta.dificuldade] += 1
        
        # Retornar a dificuldade predominante
        return max(contagem, key=contagem.get)
    
    @staticmethod
    def calcular_dificuldade_ponderada(ids_perguntas):
        """
        Calcula a dificuldade baseada em peso:
        - Se mais de 50% são difíceis: retorna 'dificil'
        - Se mais de 50% são fáceis: retorna 'facil'
        - Caso contrário: retorna 'medio'
        """
        from app.models.pergunta_quiz import PerguntaQuiz
        
        if not ids_perguntas or len(ids_perguntas) == 0:
            return 'medio'
        
        perguntas = PerguntaQuiz.query.filter(PerguntaQuiz.id.in_(ids_perguntas)).all()
        
        if not perguntas:
            return 'medio'
        
        total = len(perguntas)
        contagem = {'facil': 0, 'medio': 0, 'dificil': 0}
        
        for pergunta in perguntas:
            if pergunta.dificuldade in contagem:
                contagem[pergunta.dificuldade] += 1
        
        # Lógica ponderada
        percentual_dificil = (contagem['dificil'] / total) * 100
        percentual_facil = (contagem['facil'] / total) * 100
        
        if percentual_dificil > 50:
            return 'dificil'
        elif percentual_facil > 50:
            return 'facil'
        else:
            return 'medio'