// SINCRONIZAÇÃO DO TEMA COM LOCALSTORAGE
document.addEventListener('DOMContentLoaded', () => {
  const root = document.documentElement;
  const savedTheme = localStorage.getItem('theme') || 'light';
  
  // Aplica o tema salvo
  root.setAttribute('data-theme', savedTheme);
  
  // Renderiza os ícones do Feather
  feather.replace();
  
  // Atualiza o ícone do tema
  const themeIcon = document.getElementById('themeIcon');
  if (themeIcon) {
    themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
  }

  // Inicializa o toggle de senha e medidor de força
  initPasswordToggle();
  initPasswordStrength();
});

// Toggle de Tema
const toggleThemeBtn = document.getElementById('toggleTheme');
const themeIcon = document.getElementById('themeIcon');

if (toggleThemeBtn && themeIcon) {
  toggleThemeBtn.addEventListener('click', () => {
    const root = document.documentElement;
    const currentTheme = root.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    
    root.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
    themeIcon.textContent = newTheme === 'dark' ? '☀️' : '🌙';
  });
}

// Toggle de mostrar/ocultar senha
function initPasswordToggle() {
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('senha');
  
  if (togglePassword && passwordInput) {
    togglePassword.addEventListener('click', function () {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      
      // Atualiza o ícone
      this.innerHTML = '';
      const icon = type === 'password' ? 'eye' : 'eye-off';
      const iconSvg = feather.icons[icon].toSvg();
      this.innerHTML = iconSvg;
    });
  }
}

document.addEventListener("DOMContentLoaded", function() {
  // Seleciona todas as mensagens flash
  const flashMessages = document.querySelectorAll('.flash-message');

  if (flashMessages.length > 0) {
    // Define um tempo (em milissegundos) para a mensagem desaparecer
    // 4000ms = 4 segundos
    setTimeout(function() {
      flashMessages.forEach(function(msg) {
        // Passo 1: Torna transparente e move um pouco para cima
        msg.style.opacity = '0';
        msg.style.transform = 'translateY(-10px)';
        
        // Passo 2: Remove do HTML após a animação terminar (500ms)
        setTimeout(function() {
          msg.remove();
        }, 500); 
      });
    }, 4000);
  }
});

// Medidor de força da senha
function initPasswordStrength() {
  const passwordInput = document.getElementById('senha');
  const strengthContainer = document.getElementById('passwordStrength');
  const strengthBar = document.getElementById('strengthBar');
  const strengthText = document.getElementById('strengthText');
  
  if (!passwordInput || !strengthContainer || !strengthBar || !strengthText) {
    return;
  }
  
  passwordInput.addEventListener('input', function() {
    const password = this.value;
    
    // Se o campo estiver vazio, oculta o medidor
    if (password.length === 0) {
      strengthContainer.style.display = 'none';
      return;
    }
    
    // Mostra o medidor
    strengthContainer.style.display = 'block';
    
    // Calcula a força da senha
    const strength = calculatePasswordStrength(password);
    
    // Remove classes anteriores
    strengthBar.classList.remove('weak', 'medium', 'strong');
    strengthText.classList.remove('weak', 'medium', 'strong');
    
    // Aplica a classe correspondente
    if (strength.level === 'weak') {
      strengthBar.classList.add('weak');
      strengthText.classList.add('weak');
      strengthText.textContent = 'Senha fraca';
    } else if (strength.level === 'medium') {
      strengthBar.classList.add('medium');
      strengthText.classList.add('medium');
      strengthText.textContent = 'Senha média';
    } else if (strength.level === 'strong') {
      strengthBar.classList.add('strong');
      strengthText.classList.add('strong');
      strengthText.textContent = 'Senha forte';
    }
  });
}

// Função para calcular a força da senha
function calculatePasswordStrength(password) {
  let score = 0;
  
  // Verifica o comprimento
  if (password.length >= 8) score++;
  if (password.length >= 12) score++;
  
  // Verifica se contém letras minúsculas
  if (/[a-z]/.test(password)) score++;
  
  // Verifica se contém letras maiúsculas
  if (/[A-Z]/.test(password)) score++;
  
  // Verifica se contém números
  if (/[0-9]/.test(password)) score++;
  
  // Verifica se contém caracteres especiais
  if (/[^A-Za-z0-9]/.test(password)) score++;
  
  // Define o nível baseado na pontuação
  let level = 'weak';
  if (score >= 4) {
    level = 'medium';
  }
  if (score >= 6) {
    level = 'strong';
  }
  
  return { score, level };
}

// Preview de imagem ao selecionar arquivo
const fotoInput = document.getElementById('foto_perfil');
if (fotoInput) {
  fotoInput.addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        const preview = document.querySelector('.preview-photo');
        if (preview) {
          if (preview.tagName === 'IMG') {
            preview.src = e.target.result;
          } else {
            const img = document.createElement('img');
            img.src = e.target.result;
            img.className = 'preview-photo';
            preview.parentNode.replaceChild(img, preview);
          }
        }
      };
      reader.readAsDataURL(file);
    }
  });
}

// Preview da capa
document.getElementById("capa_perfil")?.addEventListener("change", function() {
    const file = this.files[0];
    if (!file) return;

    const wrapper = document.querySelector('.cover-preview-wrapper');
    let preview = document.getElementById("previewCapa");
    
    // Se era um div placeholder, substitui por img
    if (preview.tagName !== 'IMG') {
        const img = document.createElement('img');
        img.id = 'previewCapa';
        img.className = 'cover-preview';
        img.alt = 'Preview da capa';
        wrapper.innerHTML = '';
        wrapper.appendChild(img);
        preview = img;
    }
    
    preview.src = URL.createObjectURL(file);
});


// Dados das conquistas com detalhes
const conquistasDetalhes = {
  "Pergunteiro Nível 10": {
    icone: "📝",
    descricao: "Parabéns! Você demonstrou curiosidade e sede de conhecimento fazendo suas primeiras 10 perguntas na plataforma.",
    requisitos: "Fazer 10 perguntas na comunidade"
  },
  "Mestre das Perguntas": {
    icone: "❓",
    descricao: "Você é um verdadeiro mestre da curiosidade! Suas 50 perguntas mostram seu comprometimento em buscar conhecimento.",
    requisitos: "Fazer 50 perguntas na comunidade"
  },
  "Enciclopédia Viva": {
    icone: "📚",
    descricao: "Incrível! Com 100 perguntas feitas, você se tornou uma fonte inesgotável de curiosidade e aprendizado para toda a comunidade.",
    requisitos: "Fazer 100 perguntas na comunidade"
  },
  "Respondedor Pro": {
    icone: "💬",
    descricao: "Você demonstrou generosidade ao compartilhar seu conhecimento, ajudando outros usuários com 20 respostas úteis.",
    requisitos: "Responder 20 perguntas de outros usuários"
  },
  "Respondedor Mestre": {
    icone: "🧠",
    descricao: "Seu conhecimento e disposição para ajudar são exemplares! 50 respostas mostram seu valor para a comunidade.",
    requisitos: "Responder 50 perguntas de outros usuários"
  },
  "Sábio Supremo": {
    icone: "🎖",
    descricao: "Você atingiu o mais alto nível de contribuição! Com 100 respostas, você é um pilar fundamental da nossa comunidade.",
    requisitos: "Responder 100 perguntas de outros usuários"
  },
  "Primeiro Desafio": {
    icone: "🎯",
    descricao: "Você deu o primeiro passo no mundo dos desafios! Completar seu primeiro quiz mostra coragem e vontade de aprender.",
    requisitos: "Completar 1 quiz"
  },
  "Caçador de Quizzes": {
    icone: "�",
    descricao: "Sua dedicação aos desafios é notável! 10 quizzes completados demonstram sua persistência e amor pelo conhecimento.",
    requisitos: "Completar 10 quizzes"
  },
  "Maratonista de Quiz": {
    icone: "🏃",
    descricao: "Você é incansável! 50 quizzes completados provam que você é um verdadeiro atleta do conhecimento.",
    requisitos: "Completar 50 quizzes"
  },
  "Acertador Nível 10": {
    icone: "✅",
    descricao: "Sua precisão é impressionante! Conseguir 10 acertos em quizzes mostra seu conhecimento sólido.",
    requisitos: "Acertar 10 questões em quizzes"
  },
  "Mestre dos Acertos": {
    icone: "🌟",
    descricao: "Você tem um conhecimento excepcional! 20 acertos demonstram sua expertise em diversas áreas.",
    requisitos: "Acertar 20 questões em quizzes"
  },
  "Cem Acertos!": {
    icone: "💯",
    descricao: "Extraordinário! 100 acertos em quizzes fazem de você uma lenda do conhecimento na nossa plataforma.",
    requisitos: "Acertar 100 questões em quizzes"
  },
  "Primeiros Passos": {
    icone: "🌱",
    descricao: "Bem-vindo à comunidade! Seus primeiros passos com 10 atividades marcam o início de uma jornada incrível.",
    requisitos: "Realizar 10 atividades (perguntas + respostas)"
  },
  "Explorador do Conhecimento": {
    icone: "🚀",
    descricao: "Você é um verdadeiro explorador! 50 atividades mostram sua dedicação em descobrir e compartilhar conhecimento.",
    requisitos: "Realizar 50 atividades (perguntas + respostas)"
  },
  "Lenda da Comunidade": {
    icone: "👑",
    descricao: "Você se tornou uma lenda! Com 200 atividades, você é um dos membros mais valiosos da nossa comunidade.",
    requisitos: "Realizar 200 atividades (perguntas + respostas)"
  },
  "Frequência Assídua": {
    icone: "📅",
    descricao: "Sua consistência é admirável! Manter atividade por 3 dias consecutivos mostra seu comprometimento.",
    requisitos: "Estar ativo por 3 dias consecutivos"
  },
  "Semanal Guerreiro": {
    icone: "🔥",
    descricao: "Você é imparável! Uma semana inteira de atividade consecutiva demonstra sua paixão pelo aprendizado.",
    requisitos: "Estar ativo por 7 dias consecutivos"
  },
  "Maratonista do Conhecimento": {
    icone: "🏃‍♂️",
    descricao: "Inacreditável! 30 dias consecutivos de atividade fazem de você um verdadeiro maratonista do conhecimento.",
    requisitos: "Estar ativo por 30 dias consecutivos"
  },
  "Explorador de Dificuldades": {
    icone: "⚡",
    descricao: "Você não tem medo de desafios! Completar quizzes de todas as dificuldades mostra sua coragem e versatilidade.",
    requisitos: "Completar quizzes de todas as dificuldades (fácil, médio, difícil)"
  },
  "Meta Semanal Completa": {
    icone: "🏆",
    descricao: "Você é focado e determinado! Completou todas as suas metas de perguntas, respostas e quizzes da semana.",
    requisitos: "Atingir 100% em todas as metas semanais"
  },
  "Produtividade Máxima": {
    icone: "⚡",
    descricao: "Impressionante! Você foi além e superou em 150% todas as suas metas semanais, mostrando um desempenho extraordinário.",
    requisitos: "Superar em 150% as metas de perguntas, respostas e quizzes"
  },
  "Criador Dedicado": {
    icone: "✏️",
    descricao: "Sua contribuição com perguntas é valiosa! Você atingiu sua meta semanal de perguntas, ajudando a comunidade a crescer.",
    requisitos: "Atingir a meta semanal de  perguntas"
  },
  "Ajudante da Comunidade": {
    icone: "🤝",
    descricao: "Obrigado por ajudar! Você bateu sua meta de respostas da semana, compartilhando seu conhecimento com outros usuários.",
    requisitos: "Atingir a meta semanal de respostas"
  },
  "Quiz Master Semanal": {
    icone: "🎮",
    descricao: "Você é um mestre dos desafios! Cumpriu sua meta de quizzes da semana e provou seu conhecimento.",
    requisitos: "Atingir a meta semanal de quizzes"
  },

  "Perfeccionista": {
    icone: "🎯",
    descricao: "Precisão cirúrgica! Você acertou 100% das questões em um quiz com pelo menos 10 perguntas.",
    requisitos: "Gabaritar um quiz (min. 10 questões)"
  },
  "Mente Veloz": {
    icone: "⚡",
    descricao: "Você pensa rápido! Gabaritou um quiz respondendo em média em menos de 5 segundos por pergunta.",
    requisitos: "100% de acerto com média de tempo < 5s/pergunta"
  },
  "Poliglota": {
    icone: "🌐",
    descricao: "Você não se limita a um único assunto. Explorou e completou quizzes em 5 categorias diferentes.",
    requisitos: "Completar quizzes de 5 categorias diferentes (ex: Python, SQL, Frontend, Engenharia de Software e Algoritmos)"
  },
  "Identidade Digital": {
    icone: "🆔",
    descricao: "Você personalizou seu espaço na comunidade adicionando uma foto e uma biografia.",
    requisitos: "Adicionar foto de perfil e bio"
  },
  "Coruja da Noite": {
    icone: "🦉",
    descricao: "A madrugada é sua aliada! Você demonstrou dedicação estudando enquanto o mundo dorme.",
    requisitos: "Completar um quiz entre 00:00 e 05:00"
  },
  "Imparável": {
    icone: "🔥",
    descricao: "Você entrou no fluxo! Completou 10 quizzes em um único dia.",
    requisitos: "Fazer 10 quizzes no mesmo dia (UTC)"
  },
};

// Função para abrir modal
function abrirModal(tituloConquista) {
  const modal = document.getElementById('modalConquista');
  const detalhes = conquistasDetalhes[tituloConquista];
  
  if (detalhes) {
    document.getElementById('modalIcon').textContent = detalhes.icone;
    document.getElementById('modalTitle').textContent = tituloConquista;
    document.getElementById('modalDescription').textContent = detalhes.descricao;
    document.getElementById('modalRequirements').textContent = detalhes.requisitos;
  } else {
    document.getElementById('modalIcon').textContent = "🏆";
    document.getElementById('modalTitle').textContent = tituloConquista;
    document.getElementById('modalDescription').textContent = "Uma conquista especial que você desbloqueou!";
    document.getElementById('modalRequirements').textContent = "Continue participando da comunidade para descobrir mais conquistas.";
  }
  
  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
  
  // Re-renderiza os ícones do Feather no modal
  feather.replace();
}

// Função para fechar modal
function fecharModal() {
  const modal = document.getElementById('modalConquista');
  modal.classList.remove('active');
  document.body.style.overflow = '';
}

// Fechar modal clicando fora dele
const modalOverlay = document.getElementById('modalConquista');
if (modalOverlay) {
  modalOverlay.addEventListener('click', function(e) {
    if (e.target === this) {
      fecharModal();
    }
  });
}

// Função para mostrar perguntas
async function mostrarPerguntasUsuario() {
  const section = document.getElementById('userQuestionsSection');
  const list = document.getElementById('userQuestionsList');
  
  // 1. Fecha a outra seção
  fecharSecaoRespostas();
  
  // 2. Mostra a seção
  section.style.display = 'block';
  
  // 3. Rola suavemente (com o delay que adicionamos antes)
  setTimeout(() => {
      section.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }, 100);

  list.innerHTML = '<div style="text-align:center; padding:40px; color: var(--muted);"><i data-feather="loader" class="spinning"></i> Carregando...</div>';
  feather.replace();

  try {
    const response = await fetch('/api/usuario/perguntas', { credentials: 'same-origin' });
    if (!response.ok) throw new Error('Erro ao carregar');
    
    const perguntas = await response.json();
    
    if (perguntas.length === 0) {
      list.innerHTML = '<div class="empty-state"><i data-feather="help-circle"></i><p>Você ainda não fez nenhuma pergunta.</p></div>';
    } else {
      list.innerHTML = perguntas.map(p => `
        <div class="question-item">
          <div class="question-title" style="font-weight: bold; font-size: 16px; margin-bottom: 8px; color: var(--text);">
             ${escapeHtml(p.titulo)}
          </div>
          
          <div class="question-meta">
            <span class="badge">📂 ${escapeHtml(p.categoria || 'Geral')}</span>
            <span class="question-difficulty ${p.dificuldade?.toLowerCase()}">${getDifficultyIcon(p.dificuldade)} ${escapeHtml(p.dificuldade)}</span>
            <span>📅 ${escapeHtml(p.criado_em)}</span>
          </div>
        </div>
      `).join('');
    }
    feather.replace();
    
  } catch (error) {
    list.innerHTML = '<div class="empty-state" style="color: #ef4444;"><i data-feather="alert-circle"></i><p>Erro ao carregar dados.</p></div>';
    feather.replace();
  }
}

// Função para mostrar respostas (Na própria página)
async function mostrarRespostasUsuario() {
  const section = document.getElementById('userAnswersSection');
  const list = document.getElementById('userAnswersList');
  
  // 1. Fecha a outra seção
  fecharSecaoPerguntas();
  
  // 2. Mostra a seção de respostas
  section.style.display = 'block';
  
  // 3. Rola a tela até a seção SUAVEMENTE
  setTimeout(() => {
      section.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }, 100);

  // Loading state
  list.innerHTML = '<div style="text-align:center; padding:40px; color: var(--muted);"><i data-feather="loader" class="spinning"></i> Carregando...</div>';
  feather.replace();

  try {
    const response = await fetch('/api/usuario/respostas', { credentials: 'same-origin' });
    if (!response.ok) throw new Error('Erro ao carregar');
    
    const respostas = await response.json();
    
    if (respostas.length === 0) {
      list.innerHTML = '<div class="empty-state"><i data-feather="message-circle"></i><p>Você ainda não respondeu nada.</p></div>';
    } else {
      list.innerHTML = respostas.map(r => `
        <div class="answer-item">
          <div class="answer-content" style="margin-bottom: 10px;">
            ${escapeHtml(r.conteudo)}
          </div>
          <div class="answer-meta">
            <span>Em resposta a: <strong>${escapeHtml(r.pergunta_titulo)}</strong></span>
            <span>📅 ${escapeHtml(r.criado_em)}</span>
          </div>
        </div>
      `).join('');
    }
    feather.replace();
    
  } catch (error) {
    list.innerHTML = '<div class="empty-state" style="color: #ef4444;"><i data-feather="alert-circle"></i><p>Erro ao carregar dados.</p></div>';
    feather.replace();
  }
}

function fecharSecaoPerguntas() {
  document.getElementById('userQuestionsSection').style.display = 'none';
}

function fecharSecaoRespostas() {
  document.getElementById('userAnswersSection').style.display = 'none';
}

function escapeHtml(text) {
  const div = document.createElement('div');
  div.textContent = text;
  return div.innerHTML;
}

function getDifficultyIcon(diff) {
  switch(diff?.toLowerCase()) {
    case 'facil': return '🟢';
    case 'medio': return '🟡';
    case 'dificil': return '🔴';
    default: return '⚪';
  }
}

// Adiciona eventos de clique nos cards de estatísticas
document.addEventListener('DOMContentLoaded', () => {
  const statItems = document.querySelectorAll('.stat-item');
  
  statItems.forEach((item, index) => {
    item.addEventListener('click', () => {
      if (index === 1) { // Segundo card = Perguntas
        mostrarPerguntasUsuario();
      } else if (index === 2) { // Terceiro card = Respostas
        mostrarRespostasUsuario();
      }
    });
  });
});

// Fechar modal com ESC
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    const modal = document.getElementById('modalConquista');
    if (modal && modal.classList.contains('active')) {
      fecharModal();
    }
  }
});

// Função para abrir modal da foto
function abrirModalFoto() {
  const fotoPerfil = document.getElementById('fotoPerfil');
  if (!fotoPerfil) return; // Se não houver foto, não abre o modal
  
  const modal = document.getElementById('modalFoto');
  const fotoAmpliada = document.getElementById('fotoAmpliada');
  
  fotoAmpliada.src = fotoPerfil.src;
  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
  
  feather.replace();
}

// Função para fechar modal da foto
function fecharModalFoto() {
  const modal = document.getElementById('modalFoto');
  modal.classList.remove('active');
  document.body.style.overflow = '';
}

// Fechar modal da foto clicando fora dela
const modalFoto = document.getElementById('modalFoto');
if (modalFoto) {
  modalFoto.addEventListener('click', function(e) {
    if (e.target === this) {
      fecharModalFoto();
    }
  });
}

// --- LÓGICA PARA EXCLUIR CONTA ---

// Seleciona os elementos do DOM
const btnAbrirModalExcluir = document.getElementById('btnAbrirModalExcluir');
const modalExcluirConta = document.getElementById('modalExcluirConta');
const btnFecharModalExcluir = document.getElementById('btnFecharModalExcluir');
const btnCancelarModalExcluir = document.getElementById('btnCancelarModalExcluir');
const btnConfirmarExcluir = document.getElementById('btnConfirmarExcluir');

// Função para abrir o modal de exclusão
function abrirModalExcluir() {
  if (modalExcluirConta) {
    modalExcluirConta.classList.add('active');
    document.body.style.overflow = 'hidden';
    feather.replace(); // Renderiza ícones do Feather no modal
  }
}

// Função para fechar o modal de exclusão
function fecharModalExcluir() {
  if (modalExcluirConta) {
    modalExcluirConta.classList.remove('active');
    document.body.style.overflow = '';
  }
}

// Adiciona eventos de clique
if (btnAbrirModalExcluir) {
  btnAbrirModalExcluir.addEventListener('click', abrirModalExcluir);
}

if (btnFecharModalExcluir) {
  btnFecharModalExcluir.addEventListener('click', fecharModalExcluir);
}

if (btnCancelarModalExcluir) {
  btnCancelarModalExcluir.addEventListener('click', fecharModalExcluir);
}

// Fechar modal de exclusão clicando fora
if (modalExcluirConta) {
  modalExcluirConta.addEventListener('click', function(e) {
    if (e.target === this) {
      fecharModalExcluir();
    }
  });
}

// Fechar modal de exclusão com ESC (adiciona a verificação)
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    if (modalExcluirConta && modalExcluirConta.classList.contains('active')) {
      fecharModalExcluir();
    }
  }
});

// Ação de confirmar exclusão
if (btnConfirmarExcluir) {
  btnConfirmarExcluir.addEventListener('click', async () => {
    btnConfirmarExcluir.disabled = true;
    btnConfirmarExcluir.innerHTML = 'Excluindo...';

    try {
      const response = await fetch('/api/usuario/deletar', {
        method: 'DELETE',
        credentials: 'same-origin', // Garante que os cookies (sessão) sejam enviados
        headers: {
          'Content-Type': 'application/json'
        }
      });

      if (response.ok) {
        // Sucesso
        alert('Sua conta foi excluída com sucesso.');
        // Redireciona para o login (pois a sessão foi destruída)
        window.location.href = '/login';
      } else {
        // Erro
        const data = await response.json();
        alert(data.error || 'Ocorreu um erro ao excluir sua conta. Tente novamente.');
        btnConfirmarExcluir.disabled = false;
        btnConfirmarExcluir.innerHTML = '<i data-feather="trash-2"></i> Sim, excluir minha conta';
        feather.replace();
      }
    } catch (error) {
      console.error('Erro na requisição:', error);
      alert('Erro de conexão. Verifique sua internet e tente novamente.');
      btnConfirmarExcluir.disabled = false;
      btnConfirmarExcluir.innerHTML = '<i data-feather="trash-2"></i> Sim, excluir minha conta';
      feather.replace();
    }
  });
}