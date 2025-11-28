from app import db
from datetime import datetime, timedelta
from sqlalchemy import func

# ===================== CLASSE CONQUISTA =====================
class Conquista(db.Model):
    __tablename__ = 'conquistas'
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(100), nullable=False)
    icone = db.Column(db.String(10))
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'), nullable=False)
    
    __table_args__ = (
        db.UniqueConstraint('usuario_id', 'titulo', name='uq_conquista_usuario_titulo'),
    )

def atribuir_conquista(usuario_id, titulo, icone):
    """
    Adiciona uma conquista ao usuário se ainda não existir.
    """
    try:
        conquista_existe = Conquista.query.filter_by(
            usuario_id=usuario_id, 
            titulo=titulo
        ).first()
        
        if conquista_existe:
            return False
        
        nova_conquista = Conquista(
            titulo=titulo, 
            icone=icone, 
            usuario_id=usuario_id
        )
        db.session.add(nova_conquista)
        db.session.flush()
        
        from app.models.usuario import Usuario
        usuario = Usuario.query.get(usuario_id)
        if usuario:
            total = Conquista.query.filter_by(usuario_id=usuario_id).count()
            usuario.total_conquistas = total
        
        db.session.commit()
        print(f"✅ Conquista desbloqueada: {icone} {titulo}")
        return True
        
    except Exception as e:
        db.session.rollback()
        print(f"❌ Erro ao atribuir conquista '{titulo}': {str(e)}")
        return False

# ===================== FUNÇÃO PRINCIPAL DE VERIFICAÇÃO =====================
def verificar_conquistas(usuario):
    """
    Verifica e atribui conquistas com base nas atividades do usuário.
    """
    from app.models.quiz_resultado import QuizResultado
    from app.models.pergunta import Pergunta
    from app.models.resposta import Resposta
    
    conquistas_desbloqueadas = []
    
    try:
        # Perguntas
        total_perguntas = Pergunta.query.filter_by(usuario_id=usuario.id).count()
        conquistas_perguntas = [
            (10, "Pergunteiro Nível 10", "📝"),
            (50, "Mestre das Perguntas", "❓"),
            (100, "Enciclopédia Viva", "📚")
        ]
        for limite, titulo, icone in conquistas_perguntas:
            if total_perguntas >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_desbloqueadas.append(titulo)
        
        # Respostas - CORREÇÃO: Ícone correto para Sábio Supremo
        total_respostas = Resposta.query.filter_by(usuario_id=usuario.id).count()
        conquistas_respostas = [
            (20, "Respondedor Pro", "💬"),
            (50, "Respondedor Mestre", "🧠"),
            (100, "Sábio Supremo", "🎖")  # CORRIGIDO: antes era 🏅
        ]
        for limite, titulo, icone in conquistas_respostas:
            if total_respostas >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_desbloqueadas.append(titulo)
        
        # Quizzes realizados
        total_quizzes = QuizResultado.query.filter_by(usuario_id=usuario.id).count()
        conquistas_quiz_jogos = [
            (1, "Primeiro Desafio", "🎯"),
            (10, "Caçador de Quizzes", "🏹"),
            (50, "Maratonista de Quiz", "🏃")
        ]
        for limite, titulo, icone in conquistas_quiz_jogos:
            if total_quizzes >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_desbloqueadas.append(titulo)
        
        # Total de acertos em quizzes
        resultado_acertos = db.session.query(
            func.sum(QuizResultado.acertos).label('total_acertos')
        ).filter_by(usuario_id=usuario.id).first()
        total_acertos = resultado_acertos.total_acertos if resultado_acertos.total_acertos else 0
        
        conquistas_quiz_acertos = [
            (10, "Acertador Nível 10", "✅"),
            (20, "Mestre dos Acertos", "🌟"),
            (100, "Cem Acertos!", "💯")
        ]
        for limite, titulo, icone in conquistas_quiz_acertos:
            if total_acertos >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_desbloqueadas.append(titulo)
        
        # Dificuldades variadas
        dificuldades_distintas = db.session.query(
            QuizResultado.dificuldade
        ).filter(
            QuizResultado.usuario_id == usuario.id,
            QuizResultado.dificuldade.isnot(None)
        ).distinct().all()
        dificuldades_set = {d[0] for d in dificuldades_distintas}
        if {"facil", "medio", "dificil"}.issubset(dificuldades_set):
            if atribuir_conquista(usuario.id, "Explorador de Dificuldades", "⚡"):
                conquistas_desbloqueadas.append("Explorador de Dificuldades")
        
        # Atividade geral
        total_atividade = total_perguntas + total_respostas
        conquistas_atividade = [
            (10, "Primeiros Passos", "🌱"),
            (50, "Explorador do Conhecimento", "🚀"),
            (200, "Lenda da Comunidade", "👑")
        ]
        for limite, titulo, icone in conquistas_atividade:
            if total_atividade >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_desbloqueadas.append(titulo)

        # 1. PERFECCIONISTA (Acertar 100% em um quiz com pelo menos 5 perguntas)
        quiz_perfeito = QuizResultado.query.filter(
            QuizResultado.usuario_id == usuario.id,
            QuizResultado.acertos == QuizResultado.total,
            QuizResultado.total >= 10
        ).first()
        
        if quiz_perfeito:
            if atribuir_conquista(usuario.id, "Perfeccionista", "🎯"):
                conquistas_desbloqueadas.append("Perfeccionista")

        # 2. MENTE VELOZ (100% de acerto com média de menos de 5s por pergunta)
        # Precisa verificar se tempo_gasto existe e é maior que 0
        quiz_veloz = QuizResultado.query.filter(
            QuizResultado.usuario_id == usuario.id,
            QuizResultado.acertos == QuizResultado.total,
            QuizResultado.total >= 5,
            (QuizResultado.tempo_gasto / QuizResultado.total) <= 5
        ).first()

        if quiz_veloz:
            if atribuir_conquista(usuario.id, "Mente Veloz", "⚡"):
                conquistas_desbloqueadas.append("Mente Veloz")

        # 3. POLIGLOTA (Jogar quizzes de 3 categorias diferentes)
        categorias_distintas = db.session.query(QuizResultado.categoria).filter(
            QuizResultado.usuario_id == usuario.id,
            QuizResultado.categoria.isnot(None)
        ).distinct().count()

        if categorias_distintas >= 5:
            if atribuir_conquista(usuario.id, "Poliglota", "🌐"):
                conquistas_desbloqueadas.append("Poliglota")

        # 4. IDENTIDADE DIGITAL (Ter foto de perfil E bio preenchidas)
        if usuario.foto_perfil and usuario.bio:
            if atribuir_conquista(usuario.id, "Identidade Digital", "🆔"):
                conquistas_desbloqueadas.append("Identidade Digital")

        # 5. CORUJA DA NOITE (Completar um quiz entre 00:00 e 05:00 da manhã)
        # Verifica o último quiz feito
        ultimo_quiz = QuizResultado.query.filter_by(usuario_id=usuario.id).order_by(QuizResultado.criado_em.desc()).first()
        if ultimo_quiz:
            hora = ultimo_quiz.criado_em.hour
            if 0 <= hora < 5:
                if atribuir_conquista(usuario.id, "Coruja da Noite", "🦉"):
                    conquistas_desbloqueadas.append("Coruja da Noite")

        # 6. IMPARÁVEL (Fazer 10 quizzes no mesmo dia)
        hoje = datetime.utcnow().date()
        quizzes_hoje = QuizResultado.query.filter(
            QuizResultado.usuario_id == usuario.id,
            func.date(QuizResultado.criado_em) == hoje
        ).count()

        if quizzes_hoje >= 10:
            if atribuir_conquista(usuario.id, "Imparável", "🔥"):
                conquistas_desbloqueadas.append("Imparável")


        # NOVO: Conquistas de frequência (dias consecutivos)
        conquistas_freq = verificar_conquistas_frequencia(usuario)
        conquistas_desbloqueadas.extend(conquistas_freq)
        
        # Conquistas de metas
        conquistas_metas = verificar_conquistas_metas(usuario)
        conquistas_desbloqueadas.extend(conquistas_metas)
        
        # Atualiza totais
        usuario.total_perguntas = total_perguntas
        usuario.total_respostas = total_respostas
        db.session.commit()
        
    except Exception as e:
        print(f"❌ Erro ao verificar conquistas: {str(e)}")
        db.session.rollback()
    
    return conquistas_desbloqueadas

# ===================== NOVA FUNÇÃO: VERIFICAÇÃO DE FREQUÊNCIA =====================
def verificar_conquistas_frequencia(usuario):
    """
    Verifica conquistas baseadas em dias consecutivos de atividade.
    """
    from app.models.pergunta import Pergunta
    from app.models.resposta import Resposta
    from app.models.quiz_resultado import QuizResultado
    
    conquistas_adicionadas = []
    
    try:
        # Busca todas as datas de atividade do usuário
        datas_perguntas = db.session.query(
            func.date(Pergunta.criado_em).label('data')
        ).filter(Pergunta.usuario_id == usuario.id).all()
        
        datas_respostas = db.session.query(
            func.date(Resposta.criado_em).label('data')
        ).filter(Resposta.usuario_id == usuario.id).all()
        
        datas_quizzes = db.session.query(
            func.date(QuizResultado.criado_em).label('data')
        ).filter(QuizResultado.usuario_id == usuario.id).all()
        
        # Combina todas as datas únicas
        todas_datas = set()
        for d in datas_perguntas + datas_respostas + datas_quizzes:
            todas_datas.add(d[0])
        
        if not todas_datas:
            return conquistas_adicionadas
        
        # Ordena as datas
        datas_ordenadas = sorted(todas_datas, reverse=True)
        
        # Calcula dias consecutivos (contando de trás para frente a partir de hoje)
        hoje = datetime.utcnow().date()
        dias_consecutivos = 0
        data_esperada = hoje
        
        for data in datas_ordenadas:
            if data == data_esperada:
                dias_consecutivos += 1
                data_esperada = data - timedelta(days=1)
            elif data < data_esperada:
                # Se há uma quebra na sequência, para de contar
                break
        
        # Verifica conquistas baseadas em dias consecutivos
        conquistas_freq = [
            (3, "Frequência Assídua", "📅"),
            (7, "Semanal Guerreiro", "🔥"),
            (30, "Maratonista do Conhecimento", "🏃‍♂️")
        ]
        
        for limite, titulo, icone in conquistas_freq:
            if dias_consecutivos >= limite:
                if atribuir_conquista(usuario.id, titulo, icone):
                    conquistas_adicionadas.append(titulo)
        
    except Exception as e:
        print(f"❌ Erro ao verificar conquistas de frequência: {str(e)}")
    
    return conquistas_adicionadas

# ===================== FUNÇÃO DE VERIFICAÇÃO DE METAS (CORRIGIDA) =====================
def verificar_conquistas_metas(usuario):
    from app.models.metas_semanal import MetaSemanal

    conquistas_adicionadas = []
    meta = MetaSemanal.obter_ou_criar_meta(usuario.id)
    progresso = meta.calcular_progresso_semanal()

    # CORREÇÃO: Garantir que o nome da chave seja consistente
    perguntas = progresso.get('perguntas', {})
    respostas = progresso.get('respostas', {})
    quizzes = progresso.get('quizzes', {})  # Removido fallback confuso

    # Meta Semanal Completa
    if (perguntas.get('percentual', 0) >= 100 and
        respostas.get('percentual', 0) >= 100 and
        quizzes.get('percentual', 0) >= 100):
        if atribuir_conquista(usuario.id, "Meta Semanal Completa", "🏆"):
            conquistas_adicionadas.append("Meta Semanal Completa")

    # Produtividade Máxima
    if (perguntas.get('atual', 0) >= meta.meta_perguntas * 1.5 and
        respostas.get('atual', 0) >= meta.meta_respostas * 1.5 and
        quizzes.get('atual', 0) >= meta.meta_quizzes * 1.5):
        if atribuir_conquista(usuario.id, "Produtividade Máxima", "⚡"):
            conquistas_adicionadas.append("Produtividade Máxima")

    # Criador Dedicado
    if perguntas.get('atual', 0) >= meta.meta_perguntas:
        if atribuir_conquista(usuario.id, "Criador Dedicado", "✏️"):
            conquistas_adicionadas.append("Criador Dedicado")

    # Ajudante da Comunidade
    if respostas.get('atual', 0) >= meta.meta_respostas:
        if atribuir_conquista(usuario.id, "Ajudante da Comunidade", "🤝"):
            conquistas_adicionadas.append("Ajudante da Comunidade")

    # Quiz Master Semanal
    if quizzes.get('atual', 0) >= meta.meta_quizzes:
        if atribuir_conquista(usuario.id, "Quiz Master Semanal", "🎮"):
            conquistas_adicionadas.append("Quiz Master Semanal")
    
    return conquistas_adicionadas

# ===================== FUNÇÃO PARA RECALCULAR TODAS AS CONQUISTAS =====================
def recalcular_todas_conquistas(usuario_id=None):
    from app.models.usuario import Usuario
    
    if usuario_id:
        usuarios = [Usuario.query.get(usuario_id)]
    else:
        usuarios = Usuario.query.all()
    
    for usuario in usuarios:
        if usuario:
            print(f"\n🔄 Recalculando conquistas para: {usuario.nome}")
            conquistas = verificar_conquistas(usuario)
            if conquistas:
                print(f"   ✅ {len(conquistas)} conquista(s) processada(s)")
            else:
                print(f"   ℹ️  Nenhuma nova conquista")
    
    print("\n✅ Recálculo concluído!")