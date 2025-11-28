from app import create_app, db
from app.models.usuario import Usuario
from sqlalchemy import func
from app.models.quiz_resultado import QuizResultado

def atualizar_todas_pontuacoes():
    """Atualiza os totais de perguntas, respostas e conquistas de todos os usuários"""
    app = create_app()
    
    with app.app_context():
        usuarios = Usuario.query.all()
        
        print(f"Atualizando {len(usuarios)} usuários...")
        
        for usuario in usuarios:
            # Atualizar total de perguntas
            usuario.total_perguntas = len(usuario.perguntas)
            
            # Atualizar total de respostas
            usuario.total_respostas = len(usuario.respostas)
            
            # Atualizar total de conquistas
            usuario.total_conquistas = len(usuario.conquistas)
            
            pontos = usuario.calcular_pontuacao_total()
            
            print(f"✅ {usuario.nome}: {pontos} pontos")
            print(f"   - Perguntas: {usuario.total_perguntas}")
            print(f"   - Respostas: {usuario.total_respostas}")
            print(f"   - Conquistas: {usuario.total_conquistas}")
        
        db.session.commit()
        print("\n✨ Atualização concluída!")

if __name__ == '__main__':
    atualizar_todas_pontuacoes()