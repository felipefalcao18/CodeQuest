from app import db
from datetime import datetime

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    senha = db.Column(db.String(255), nullable=False)
    criado_em = db.Column(db.DateTime, default=datetime.utcnow)
    atualizado_em = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    bio = db.Column(db.Text)
    foto_perfil = db.Column(db.String(255))
    capa_perfil = db.Column(db.String(255), nullable=True)
    total_conquistas = db.Column(db.Integer, default=0)
    total_perguntas = db.Column(db.Integer, default=0)
    total_respostas = db.Column(db.Integer, default=0)
    pontuacao_total = db.Column(db.Integer, default=0)  # ✨ NOVA COLUNA
    
    # Relacionamentos
    conquistas = db.relationship('Conquista', backref='usuario', lazy=True)
    perguntas = db.relationship('Pergunta', back_populates='usuario', lazy=True)
    respostas = db.relationship('Resposta', back_populates='usuario', lazy=True)
    resultados_quiz = db.relationship('QuizResultado', back_populates='usuario', lazy=True)

    def calcular_pontuacao_total(self):
        """
        Calcula a pontuação total do usuário baseada em suas atividades:
        - Quiz Fácil: 5 pontos por acerto
        - Quiz Médio: 10 pontos por acerto
        - Quiz Difícil: 15 pontos por acerto
        - Conquistas: 20 pontos cada
        """
        from sqlalchemy import func
        from app.models.quiz_resultado import QuizResultado
        
        # Pontos de quizzes separados por dificuldade
        stats_quiz = db.session.query(
            QuizResultado.dificuldade,
            func.sum(QuizResultado.acertos).label('total_acertos')
        ).filter_by(usuario_id=self.id).group_by(QuizResultado.dificuldade).all()
        
        pontos_quiz = 0
        for stat in stats_quiz:
            if stat.dificuldade == 'facil':
                pontos_quiz += (stat.total_acertos or 0) * 5
            elif stat.dificuldade == 'medio':
                pontos_quiz += (stat.total_acertos or 0) * 10
            elif stat.dificuldade == 'dificil':
                pontos_quiz += (stat.total_acertos or 0) * 15
        
        # Pontos de conquistas (20 por conquista)
        pontos_conquistas = self.total_conquistas * 20
        
        total = pontos_quiz + pontos_conquistas
        
        # Atualiza a coluna pontuacao_total
        self.pontuacao_total = total
        
        return total
    
    def atualizar_pontuacao(self):
        """Atualiza e salva a pontuação total no banco de dados"""
        self.pontuacao_total = self.calcular_pontuacao_total()
        db.session.commit()