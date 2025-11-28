src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"

    // Função para animar um contador de um valor inicial até um alvo
    function animateCounter(elementId, target) {
      const element = document.getElementById(elementId);
      const numberSpan = element.querySelector('span:first-child') || element;
      
      const duration = 1500; 
      const start = 0;
      let current = start;
      const increment = target / (duration / 16);

      const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
          current = target;
          clearInterval(timer);
        }
        numberSpan.textContent = Math.floor(current);
      }, 16);
    }

   function initDashboard() {
  const quizCount = parseInt(document.getElementById('quiz-count').textContent) || 0;
  const userScore = parseInt(document.getElementById('user-score').querySelector('span').textContent) || 0;
  const accuracyRate = parseInt(document.getElementById('accuracy-rate').querySelector('span').textContent) || 0;

  animateCounter('quiz-count', quizCount);
  animateCounter('user-score', userScore);
  animateCounter('accuracy-rate', accuracyRate);
  
  // Animar barra de progresso com delay
  setTimeout(() => {
    animateProgressBar();
  }, 800);
}


    function setGoals() {
      const goals = prompt('Quantas perguntas você quer responder esta semana?', '10');
      if (goals && !isNaN(goals)) {
        alert(`Meta definida: ${goals} perguntas esta semana! 🎯`);
      }
    }

    document.addEventListener('DOMContentLoaded', () => {
      const toggle = document.getElementById('dark-mode-toggle');
      const root = document.documentElement;
      const label = document.querySelector('.mode-label');
      const savedTheme = localStorage.getItem('theme') || 'light';

      root.setAttribute('data-theme', savedTheme);
      toggle.checked = savedTheme === 'dark';
      label.textContent = savedTheme === 'dark' ? 'Escuro' : 'Claro';

      toggle.addEventListener('change', () => {
        const theme = toggle.checked ? 'dark' : 'light';
        root.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
        label.textContent = theme === 'dark' ? 'Escuro' : 'Claro';
      });

      document.querySelectorAll('.flash-message').forEach(msg => {
        setTimeout(() => {
          msg.style.opacity = '0';
          setTimeout(() => { msg.style.display = 'none'; }, 500);
        }, 3000);
      });

      initDashboard();

      // Função para fechar o modal
      function closeModal() {
        document.getElementById('statsModal').style.display = 'none';
      }
      
      async function showStats(tipo = 'dificuldade') {
  const modal = document.getElementById('statsModal');
  const tableBody = document.getElementById('stats-table-body');
  const modalTitle = document.getElementById('stats-modal-title');
  const modalSubtitle = document.getElementById('stats-modal-subtitle');
  const headerCol1 = document.getElementById('stats-header-col1');
  
  // Atualiza os textos do modal conforme o tipo
  if (tipo === 'categoria') {
    modalTitle.textContent = 'Desempenho por Categoria';
    modalSubtitle.textContent = 'Veja como você está indo em cada categoria de quiz.';
    headerCol1.textContent = 'Categoria';
  } else {
    modalTitle.textContent = 'Desempenho por Dificuldade';
    modalSubtitle.textContent = 'Veja como você está indo em cada nível de dificuldade.';
    headerCol1.textContent = 'Dificuldade';
  }
  
  tableBody.innerHTML = '<tr><td colspan="3">Carregando estatísticas...</td></tr>';
  modal.style.display = 'block';

  try {
    const endpoint = tipo === 'categoria' ? '/api/desempenho' : '/api/desempenho_dificuldade';
    const response = await fetch(endpoint);
    if (!response.ok) throw new Error('Falha ao buscar os dados.');
    
    const data = await response.json();
    tableBody.innerHTML = ''; 

    if (data.length === 0) {
      tableBody.innerHTML = '<tr><td colspan="3">Nenhum quiz encontrado.</td></tr>';
    } else {
      data.forEach(item => {
        const nome = tipo === 'categoria' ? item.categoria : item.dificuldade;
        const corTaxa = item.taxa_acerto >= 70 ? 'var(--success)' : 
                       item.taxa_acerto >= 50 ? 'var(--warning)' : 'var(--muted)';
        
        const row = `
          <tr>
            <td><strong>${nome}</strong></td>
            <td>${item.acertos} / ${item.total}</td>
            <td>
              <span style="color: ${corTaxa}; font-weight: 600;">
                ${item.taxa_acerto}%
              </span>
            </td>
          </tr>
        `;
        tableBody.innerHTML += row;
      });
    }
  } catch (error) {
    tableBody.innerHTML = `<tr><td colspan="3">Erro: ${error.message}</td></tr>`;
    console.error('Erro ao buscar estatísticas:', error);
  }
}

      // Fecha o modal clicando fora
      window.onclick = function(event) {
        const modal = document.getElementById('statsModal');
        if (event.target == modal) modal.style.display = "none";
      }

      // Menu hambúrguer
      const navToggle = document.querySelector('.nav-toggle');
      const navLinks = document.querySelector('.nav-links');

      navToggle.addEventListener('click', () => {
        navLinks.classList.toggle('open');
        navToggle.classList.toggle('active');
      });

      navLinks.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', () => {
          if (navLinks.classList.contains('open')) {
            navLinks.classList.remove('open');
            navToggle.classList.remove('active');
          }
        });
      });

      // Torna as funções globais
      window.showStats = showStats;
      window.closeModal = closeModal;
    });

    async function carregarMetas() {
  try {
    const response = await fetch('/api/metas');
    if (!response.ok) throw new Error('Erro ao carregar metas');
    
    const data = await response.json();
    
    // Atualiza os valores das metas
    document.getElementById('perguntas-meta').textContent = data.metas.perguntas;
    document.getElementById('respostas-meta').textContent = data.metas.respostas;
    document.getElementById('quizzes-meta').textContent = data.metas.quizzes;
    
    // Atualiza os valores atuais
    document.getElementById('perguntas-atual').textContent = data.progresso.perguntas.atual;
    document.getElementById('respostas-atual').textContent = data.progresso.respostas.atual;
    document.getElementById('quizzes-atual').textContent = data.progresso.quizzes.atual;
    
    // Atualiza as barras de progresso com animação
    setTimeout(() => {
      document.getElementById('perguntas-progress').style.width = data.progresso.perguntas.percentual + '%';
      document.getElementById('respostas-progress').style.width = data.progresso.respostas.percentual + '%';
      document.getElementById('quizzes-progress').style.width = data.progresso.quizzes.percentual + '%';
    }, 100);
    
    // Atualiza os valores no modal
    document.getElementById('meta-perguntas').value = data.metas.perguntas;
    document.getElementById('meta-respostas').value = data.metas.respostas;
    document.getElementById('meta-quizzes').value = data.metas.quizzes;
    
  } catch (error) {
    console.error('Erro ao carregar metas:', error);
  }
}

// Função para abrir o modal de metas
function abrirModalMetas() {
  document.getElementById('metasModal').style.display = 'block';
}

// Função para fechar o modal de metas
function fecharModalMetas() {
  document.getElementById('metasModal').style.display = 'none';
}

// Função para resetar as metas
async function resetarMetas() {
  if (!confirm('Deseja realmente resetar suas metas para os valores padrão?')) return;
  
  try {
    const response = await fetch('/api/metas/resetar', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' }
    });
    
    if (!response.ok) throw new Error('Erro ao resetar metas');
    
    const data = await response.json();
    alert(data.message);
    carregarMetas(); // Recarrega as metas
    
  } catch (error) {
    console.error('Erro ao resetar metas:', error);
    alert('Erro ao resetar metas. Tente novamente.');
  }
}


// Configurar o formulário de metas
document.addEventListener('DOMContentLoaded', function() {
  // Carregar metas ao iniciar
  carregarMetas();
  
  // Configurar o formulário
  const metasForm = document.getElementById('metas-form');
  if (metasForm) {
    metasForm.addEventListener('submit', async function(e) {
      e.preventDefault();
      
      const metas = {
        meta_perguntas: parseInt(document.getElementById('meta-perguntas').value),
        meta_respostas: parseInt(document.getElementById('meta-respostas').value),
        meta_quizzes: parseInt(document.getElementById('meta-quizzes').value)
      };
      
      try {
        const response = await fetch('/api/metas', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(metas)
        });
        
        if (!response.ok) throw new Error('Erro ao salvar metas');
        
        const data = await response.json();
        alert('Metas atualizadas com sucesso!');
        fecharModalMetas();
        carregarMetas(); // Recarrega as metas atualizadas
        
      } catch (error) {
        console.error('Erro ao salvar metas:', error);
        alert('Erro ao salvar metas. Tente novamente.');
      }
    });
  }
  
  // Fechar modal ao clicar fora dele
  window.addEventListener('click', function(event) {
    const modal = document.getElementById('metasModal');
    if (event.target == modal) {
      fecharModalMetas();
    }
  });
  
  // Atualizar metas a cada 30 segundos
  setInterval(carregarMetas, 30000);
});


// Adicionar esta função no initDashboard()
function initDashboard() {
  const quizCount = parseInt(document.getElementById('quiz-count').textContent) || 0;
  const userScore = parseInt(document.getElementById('user-score').querySelector('span').textContent) || 0;
  const accuracyRate = parseInt(document.getElementById('accuracy-rate').querySelector('span').textContent) || 0;

  animateCounter('quiz-count', quizCount);
  animateCounter('user-score', userScore);
  animateCounter('accuracy-rate', accuracyRate);
  
  // ✨ NOVO: Animar barra de progresso com delay
  setTimeout(() => {
    animateProgressBar();
  }, 500);
}

// ✨ FUNÇÃO MELHORADA: Animar barra de progresso
function animateProgressBar() {
  const progressBar = document.getElementById('progress-pontuacao');
  if (!progressBar) return;
  
  const targetWidth = parseInt(progressBar.getAttribute('data-porcentagem')) || 0;
  
  // Começa em 0 e anima até o valor real
  progressBar.style.width = '0%';
  
  setTimeout(() => {
    progressBar.style.transition = 'width 1.5s cubic-bezier(0.4, 0, 0.2, 1)';
    progressBar.style.width = targetWidth + '%';
  }, 300);
}


async function atualizarPontuacao() {
  try {
    const response = await fetch('/api/pontuacao/detalhes');
    if (!response.ok) return;
    
    const data = await response.json();
    
    // Atualizar o número de pontos com animação
    const userScoreElement = document.getElementById('user-score');
    if (userScoreElement) {
      const currentScore = parseInt(userScoreElement.querySelector('span').textContent) || 0;
      if (currentScore !== data.pontos_totais) {
        animateCounter('user-score', data.pontos_totais);
      }
    }
  } catch (error) {
    console.error('Erro ao atualizar pontuação:', error);
  }
}

// ✨ Atualizar pontuação a cada 30 segundos
setInterval(atualizarPontuacao, 30000);

// Função para abrir o modal de pontuação
async function abrirModalPontuacao() {
  const modal = document.getElementById('pontuacaoModal');
  const loading = document.getElementById('pontuacao-loading');
  const detalhes = document.getElementById('pontuacao-detalhes');
  
  modal.style.display = 'block';
  loading.style.display = 'block';
  detalhes.style.display = 'none';
  
  try {
    const response = await fetch('/api/pontuacao/detalhes');
    if (!response.ok) throw new Error('Erro ao carregar pontuação');
    
    const data = await response.json();
    
    // Atualiza pontuação total com animação
    animarPontuacaoTotal(data.pontos_totais);
    
    // Preenche a tabela de detalhes
    preencherTabelaPontuacao(data.detalhes);
    
    // Mostra os detalhes
    loading.style.display = 'none';
    detalhes.style.display = 'block';
    
  } catch (error) {
    console.error('Erro ao carregar pontuação:', error);
    loading.innerHTML = '<p style="color: var(--warning);">❌ Erro ao carregar detalhes. Tente novamente.</p>';
  }
}

// Função para fechar o modal de pontuação
function fecharModalPontuacao() {
  document.getElementById('pontuacaoModal').style.display = 'none';
}

// Função para animar a pontuação total
function animarPontuacaoTotal(target) {
  const element = document.getElementById('pontos-totais-modal');
  const duration = 1500;
  const start = 0;
  let current = start;
  const increment = target / (duration / 16);

  const timer = setInterval(() => {
    current += increment;
    if (current >= target) {
      current = target;
      clearInterval(timer);
    }
    element.textContent = Math.floor(current);
  }, 16);
}

// Função para preencher a tabela de detalhes
function preencherTabelaPontuacao(detalhes) {
  const tbody = document.getElementById('pontuacao-tbody');
  tbody.innerHTML = '';
  
  // Ícones para cada tipo de atividade
  const icones = {
    'quizzes_facil': '🟢',
    'quizzes_medio': '🟡',
    'quizzes_dificil': '🔴',
    'conquistas': '🏆'
  };
  
  // Cores para cada tipo
  const cores = {
    'quizzes_facil': '#22c55e',
    'quizzes_medio': '#f59e0b',
    'quizzes_dificil': '#ef4444',
    'conquistas': 'var(--info)'
  };
  
  // Ordem de exibição
  const ordem = ['quizzes_facil', 'quizzes_medio', 'quizzes_dificil', 'conquistas'];
  
  ordem.forEach(tipo => {
    const item = detalhes[tipo];
    if (item && item.quantidade > 0) {
      const row = `
        <tr style="transition: all 0.2s ease;">
          <td>
            <div style="display: flex; align-items: center; gap: 8px;">
              <span style="font-size: 20px;">${icones[tipo]}</span>
              <strong>${item.descricao}</strong>
            </div>
          </td>
          <td style="text-align: center;">
            <span style="font-size: 18px; font-weight: 700; color: ${cores[tipo]};">
              ${item.quantidade}
            </span>
          </td>
          <td style="text-align: center;">
            <span style="color: var(--muted);">
              ${item.valor_unitario} pts cada
            </span>
          </td>
          <td style="text-align: right;">
            <span style="font-size: 18px; font-weight: 800; color: ${cores[tipo]};">
              ${item.pontos}
            </span>
          </td>
        </tr>
      `;
      tbody.innerHTML += row;
    }
  });

  // Calcular total
  const totalPontos = Object.values(detalhes)
    .reduce((sum, item) => sum + Number(item.pontos || 0), 0);

  tbody.innerHTML += `
    <tr style="border-top: 2px solid var(--border); background: var(--accent-light);">
      <td colspan="3" style="text-align: right; font-weight: 700; font-size: 16px;">
        Total:
      </td>
      <td style="text-align: right;">
        <span style="font-size: 24px; font-weight: 800; color: var(--accent);">
          ${totalPontos}
        </span>
      </td>
    </tr>
  `;
}
  
  // Adiciona linha de total
  tbody.innerHTML += `
    <tr style="border-top: 2px solid var(--border); background: var(--accent-light);">
      <td colspan="3" style="text-align: right; font-weight: 700; font-size: 16px;">
        Total:
      </td>
      <td style="text-align: right;">
        <span style="font-size: 24px; font-weight: 800; color: var(--accent);">
          ${Object.values(detalhes).reduce((sum, item) => sum + item.pontos, 0)}
        </span>
      </td>
    </tr>
  `;


// Adicionar event listeners para fechar modal ao clicar fora
document.addEventListener('DOMContentLoaded', function() {
  window.addEventListener('click', function(event) {
    const modal = document.getElementById('pontuacaoModal');
    if (event.target == modal) {
      fecharModalPontuacao();
    }
  });
  
  // Adicionar efeito hover nas linhas da tabela (quando o modal estiver aberto)
  document.addEventListener('mouseover', function(event) {
    if (event.target.closest('#pontuacao-tbody tr')) {
      const row = event.target.closest('tr');
      row.style.background = 'rgba(59, 130, 246, 0.05)';
    }
  });
  
  document.addEventListener('mouseout', function(event) {
    if (event.target.closest('#pontuacao-tbody tr')) {
      const row = event.target.closest('tr');
      if (!row.querySelector('td[colspan]')) {
        row.style.background = 'transparent';
      }
    }
  });
});

/**
 * Abre o modal de níveis
 */
function abrirModalNiveis() {
  const modal = document.getElementById('niveisModal');
  
  if (modal) {
    modal.style.display = 'block';
    
    // Previne scroll do body quando modal está aberto
    document.body.style.overflow = 'hidden';
    
    // Adiciona animação de entrada suave
    setTimeout(() => {
      modal.style.opacity = '1';
    }, 10);
  }
}

/**
 * Fecha o modal de níveis
 */
function fecharModalNiveis() {
  const modal = document.getElementById('niveisModal');
  
  if (modal) {
    // Animação de saída
    modal.style.opacity = '0';
    
    setTimeout(() => {
      modal.style.display = 'none';
      // Restaura scroll do body
      document.body.style.overflow = 'auto';
    }, 200);
  }
}

/**
 * Event Listeners para o Modal de Níveis
 */
document.addEventListener('DOMContentLoaded', function() {
  
  // Fechar modal ao clicar fora dele
  window.addEventListener('click', function(event) {
    const modal = document.getElementById('niveisModal');
    if (event.target === modal) {
      fecharModalNiveis();
    }
  });
  
  // Fechar modal com a tecla ESC
  document.addEventListener('keydown', function(event) {
    const modal = document.getElementById('niveisModal');
    if (event.key === 'Escape' && modal && modal.style.display === 'block') {
      fecharModalNiveis();
    }
  });
  
  // Scroll suave para o nível atual quando abrir o modal
  const nivelAtualElement = document.querySelector('.nivel-item.nivel-atual');
  if (nivelAtualElement) {
    // Adiciona observer para scroll quando modal abrir
    const observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
          const modal = document.getElementById('niveisModal');
          if (modal && modal.style.display === 'block') {
            setTimeout(() => {
              nivelAtualElement.scrollIntoView({
                behavior: 'smooth',
                block: 'center'
              });
            }, 300);
          }
        }
      });
    });
    
    const modal = document.getElementById('niveisModal');
    if (modal) {
      observer.observe(modal, {
        attributes: true,
        attributeFilter: ['style']
      });
    }
  }
});

/**
 * Animação de contagem para pontos
 */
function animarContagemPontos(elementId, valorFinal) {
  const elemento = document.getElementById(elementId);
  if (!elemento) return;
  
  const duracao = 1500;
  const incremento = valorFinal / (duracao / 16);
  let valorAtual = 0;
  
  const timer = setInterval(() => {
    valorAtual += incremento;
    if (valorAtual >= valorFinal) {
      valorAtual = valorFinal;
      clearInterval(timer);
    }
    elemento.textContent = Math.floor(valorAtual).toLocaleString('pt-BR');
  }, 16);
}

/**
 * Função auxiliar para formatar números grandes
 */
function formatarPontos(pontos) {
  if (pontos >= 1000000) {
    return (pontos / 1000000).toFixed(1) + 'M';
  } else if (pontos >= 1000) {
    return (pontos / 1000).toFixed(1) + 'K';
  }
  return pontos.toString();
}

/**
 * Calcula progresso até próximo nível
 */
function calcularProgressoNivel(pontosAtuais, pontosNivelAtual, pontosProximoNivel) {
  const pontosNoNivel = pontosAtuais - pontosNivelAtual;
  const pontosNecessarios = pontosProximoNivel - pontosNivelAtual;
  
  if (pontosNecessarios <= 0) return 100;
  
  return Math.min(100, Math.round((pontosNoNivel / pontosNecessarios) * 100));
}

/**
 * Obtém informações do nível baseado na pontuação
 */
function obterNivelPorPontuacao(pontos) {
  const niveis = [
    { nivel: 1, pontos: 0, titulo: 'Iniciante', icone: '🌱' },
    { nivel: 2, pontos: 500, titulo: 'Aprendiz', icone: '📚' },
    { nivel: 3, pontos: 1000, titulo: 'Intermediário', icone: '🎓' },
    { nivel: 4, pontos: 2000, titulo: 'Avançado', icone: '⭐' },
    { nivel: 5, pontos: 5000, titulo: 'Expert', icone: '🏆' },
    { nivel: 6, pontos: 10000, titulo: 'Mestre', icone: '👑' }
  ];
  
  let nivelAtual = niveis[0];
  let proximoNivel = niveis[1];
  
  for (let i = 0; i < niveis.length - 1; i++) {
    if (pontos >= niveis[i].pontos && pontos < niveis[i + 1].pontos) {
      nivelAtual = niveis[i];
      proximoNivel = niveis[i + 1];
      break;
    }
  }
  
  // Se atingiu o nível máximo
  if (pontos >= niveis[niveis.length - 1].pontos) {
    nivelAtual = niveis[niveis.length - 1];
    proximoNivel = niveis[niveis.length - 1];
  }
  
  return {
    atual: nivelAtual,
    proximo: proximoNivel,
    progresso: calcularProgressoNivel(pontos, nivelAtual.pontos, proximoNivel.pontos)
  };
}

/**
 * Adiciona efeito de brilho nos níveis completos (opcional)
 */
function adicionarEfeitoBrilhoNiveis() {
  const niveisCompletos = document.querySelectorAll('.nivel-item.nivel-completo');
  
  niveisCompletos.forEach((nivel, index) => {
    setTimeout(() => {
      nivel.style.animation = 'fadeInUp 0.5s ease forwards';
    }, index * 100);
  });
}

// Executar efeitos quando o modal abrir
document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('niveisModal');
  
  if (modal) {
    // Observer para detectar quando modal abre
    const observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
          if (modal.style.display === 'block') {
            // Adiciona efeitos quando modal abre
            adicionarEfeitoBrilhoNiveis();
          }
        }
      });
    });
    
    observer.observe(modal, {
      attributes: true,
      attributeFilter: ['style']
    });
  }
});

