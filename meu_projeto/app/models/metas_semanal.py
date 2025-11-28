from app import db
from datetime import datetime, timedelta
from pytz import timezone as pytz_timezone

# Definir timezone do Brasil
TIMEZONE_BR = pytz_timezone('America/Sao_Paulo')

class MetaSemanal(db.Model):
    __tablename__ = 'metas_semanal'
    
    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    meta_perguntas = db.Column(db.Integer, default=5)
    meta_respostas = db.Column(db.Integer, default=5)
    meta_quizzes = db.Column(db.Integer, default=3)
    atualizado_em = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    usuario = db.relationship('Usuario', backref='metas_semanais')
    
    @staticmethod
    def obter_ou_criar_meta(usuario_id):
        """Obtém a meta do usuário ou cria uma nova com valores padrão"""
        meta = MetaSemanal.query.filter_by(usuario_id=usuario_id).first()
        if not meta:
            meta = MetaSemanal(
                usuario_id=usuario_id,
                meta_perguntas=5,
                meta_respostas=5,
                meta_quizzes=3
            )
            db.session.add(meta)
            db.session.commit()
        return meta
    
    def calcular_progresso_semanal(self):
        """
        Calcula o progresso do usuário na semana atual.
        CORRIGIDO: Agora usa timezone do Brasil para consistência.
        """
        from app.models.pergunta import Pergunta
        from app.models.resposta import Resposta
        from app.models.quiz_resultado import QuizResultado
        
        # CORREÇÃO: Usar horário local do Brasil
        agora_br = datetime.now(TIMEZONE_BR)
        
        # Calcular início da semana (segunda-feira 00:00:00)
        inicio_semana = agora_br - timedelta(days=agora_br.weekday())
        inicio_semana = inicio_semana.replace(hour=0, minute=0, second=0, microsecond=0)
        
        # Converter para naive datetime (sem timezone) para comparar com banco
        inicio_semana_naive = inicio_semana.replace(tzinfo=None)
        
        # Contar atividades da semana
        perguntas_feitas = Pergunta.query.filter(
            Pergunta.usuario_id == self.usuario_id,
            Pergunta.criado_em >= inicio_semana_naive
        ).count()
        
        respostas_feitas = Resposta.query.filter(
            Resposta.usuario_id == self.usuario_id,
            Resposta.criado_em >= inicio_semana_naive
        ).count()
        
        quizzes_feitos = QuizResultado.query.filter(
            QuizResultado.usuario_id == self.usuario_id,
            QuizResultado.criado_em >= inicio_semana_naive
        ).count()
        
        # Calcular percentuais (máximo 100%)
        def calcular_percentual(atual, meta):
            if meta <= 0:
                return 0
            return min(100, int((atual / meta) * 100))
        
        return {
            'perguntas': {
                'atual': perguntas_feitas,
                'meta': self.meta_perguntas,
                'percentual': calcular_percentual(perguntas_feitas, self.meta_perguntas)
            },
            'respostas': {
                'atual': respostas_feitas,
                'meta': self.meta_respostas,
                'percentual': calcular_percentual(respostas_feitas, self.meta_respostas)
            },
            'quizzes': {
                'atual': quizzes_feitos,
                'meta': self.meta_quizzes,
                'percentual': calcular_percentual(quizzes_feitos, self.meta_quizzes)
            },
            'inicio_semana': inicio_semana_naive,  # Para debug
            'agora': agora_br.replace(tzinfo=None)  # Para debug
        }
    
    def verificar_e_atribuir_conquistas(self):
        """
        NOVA FUNÇÃO: Verifica e atribui conquistas baseadas nas metas atuais.
        Deve ser chamada após qualquer atualização de atividade.
        """
        from app.models.conquistas import verificar_conquistas_metas
        
        try:
            from app.models.usuario import Usuario
            usuario = Usuario.query.get(self.usuario_id)
            if usuario:
                conquistas = verificar_conquistas_metas(usuario)
                return conquistas
        except Exception as e:
            print(f"❌ Erro ao verificar conquistas de metas: {str(e)}")
        
        return []