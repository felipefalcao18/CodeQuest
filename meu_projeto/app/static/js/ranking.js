

document.addEventListener('DOMContentLoaded', () => {
  initThemeToggle();
  initNavToggle();
  initRankingAnimations();
  initFlashMessages();
});

// ===================================
// Tema Claro/Escuro
// ===================================
function initThemeToggle() {
  const toggle = document.getElementById('dark-mode-toggle');
  const root = document.documentElement;
  const label = document.querySelector('.mode-label');
  
  if (!toggle) return;
  
  const savedTheme = localStorage.getItem('theme') || 'light';
  root.setAttribute('data-theme', savedTheme);
  toggle.checked = savedTheme === 'dark';
  if (label) label.textContent = savedTheme === 'dark' ? 'Escuro' : 'Claro';

  toggle.addEventListener('change', () => {
    const theme = toggle.checked ? 'dark' : 'light';
    root.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
    if (label) label.textContent = theme === 'dark' ? 'Escuro' : 'Claro';
  });
}

// ===================================
// Menu Hambúrguer (Mobile)
// ===================================
function initNavToggle() {
  const navToggle = document.querySelector('.nav-toggle');
  const navLinks = document.querySelector('.nav-links');

  if (!navToggle || !navLinks) return;

  navToggle.addEventListener('click', () => {
    navLinks.classList.toggle('open');
    navToggle.classList.toggle('active');
  });

  // Fecha menu ao clicar em um link
  navLinks.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      if (navLinks.classList.contains('open')) {
        navLinks.classList.remove('open');
        navToggle.classList.remove('active');
      }
    });
  });

  // Fecha menu ao clicar fora
  document.addEventListener('click', (e) => {
    if (!navToggle.contains(e.target) && !navLinks.contains(e.target)) {
      navLinks.classList.remove('open');
      navToggle.classList.remove('active');
    }
  });
}

// ===================================
// Animações do Ranking
// ===================================
function initRankingAnimations() {
  const rankingItems = document.querySelectorAll('.ranking-item');
  
  if (rankingItems.length === 0) return;

  // Animação de entrada com delay progressivo
  rankingItems.forEach((item, index) => {
    item.style.opacity = '0';
    item.style.transform = 'translateY(20px)';
    
    setTimeout(() => {
      item.style.transition = 'all 0.4s ease';
      item.style.opacity = '1';
      item.style.transform = 'translateY(0)';
    }, 100 + (index * 80));
  });

  // Animar pontuação dos usuários
  rankingItems.forEach((item, index) => {
    const pontosEl = item.querySelector('.pontos-valor');
    if (pontosEl) {
      const targetPontos = parseInt(pontosEl.textContent) || 0;
      animateCounter(pontosEl, targetPontos, 100 + (index * 100));
    }
  });

  // Destaque especial para o usuário logado
  const usuarioLogado = document.querySelector('.ranking-item.usuario-logado');
  if (usuarioLogado) {
    setTimeout(() => {
      usuarioLogado.classList.add('highlight-pulse');
    }, 1000);
  }

  // Efeito nas medalhas
  animateMedals();
}

// ===================================
// Animação de Contador
// ===================================
function animateCounter(element, target, delay = 0) {
  setTimeout(() => {
    const duration = 1200;
    const start = 0;
    let current = start;
    const increment = target / (duration / 16);

    const timer = setInterval(() => {
      current += increment;
      if (current >= target) {
        current = target;
        clearInterval(timer);
      }
      element.textContent = Math.floor(current).toLocaleString('pt-BR');
    }, 16);
  }, delay);
}

// ===================================
// Animação das Medalhas
// ===================================
function animateMedals() {
  const medalhas = document.querySelectorAll('.medalha');
  
  medalhas.forEach((medalha, index) => {
    if (index < 3) {
      medalha.style.opacity = '0';
      medalha.style.transform = 'scale(0) rotate(-180deg)';
      
      setTimeout(() => {
        medalha.style.transition = 'all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55)';
        medalha.style.opacity = '1';
        medalha.style.transform = 'scale(1) rotate(0deg)';
      }, 300 + (index * 150));
    }
  });
}

// ===================================
// Flash Messages
// ===================================
function initFlashMessages() {
  document.querySelectorAll('.flash-message').forEach(msg => {
    setTimeout(() => {
      msg.style.opacity = '0';
      msg.style.transform = 'translateY(-10px)';
      setTimeout(() => { msg.style.display = 'none'; }, 500);
    }, 3000);
  });
}

// ===================================
// Scroll suave para o usuário logado
// ===================================
function scrollToUser() {
  const usuarioLogado = document.querySelector('.ranking-item.usuario-logado');
  if (usuarioLogado) {
    usuarioLogado.scrollIntoView({
      behavior: 'smooth',
      block: 'center'
    });
    
    // Efeito de destaque
    usuarioLogado.classList.add('highlight-flash');
    setTimeout(() => {
      usuarioLogado.classList.remove('highlight-flash');
    }, 2000);
  }
}

// ===================================
// Filtros de Ranking (expansão futura)
// ===================================
function filterRanking(periodo) {
  // Preparado para filtrar por período (semanal, mensal, geral)
  console.log('Filtrar por:', periodo);
  // Implementar chamada à API quando disponível
}

// ===================================
// Compartilhar posição no ranking
// ===================================
function sharePosition() {
  const usuarioLogado = document.querySelector('.ranking-item.usuario-logado');
  if (!usuarioLogado) return;
  
  const posicao = usuarioLogado.querySelector('.ranking-posicao').textContent.trim();
  const pontos = usuarioLogado.querySelector('.pontos-valor').textContent.trim();
  
  const texto = `🏆 Estou na posição ${posicao} do ranking do CodeQuest com ${pontos} pontos! Venha competir comigo!`;
  
  if (navigator.share) {
    navigator.share({
      title: 'Minha posição no CodeQuest',
      text: texto,
      url: window.location.href
    });
  } else {
    // Fallback: copiar para clipboard
    navigator.clipboard.writeText(texto).then(() => {
      showToast('Link copiado para a área de transferência!');
    });
  }
}

// ===================================
// Toast Notification
// ===================================
function showToast(message, type = 'success') {
  const toast = document.createElement('div');
  toast.className = `toast toast-${type}`;
  toast.textContent = message;
  toast.style.cssText = `
    position: fixed;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%) translateY(100px);
    background: ${type === 'success' ? 'var(--success)' : 'var(--warning)'};
    color: white;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 600;
    z-index: 1000;
    transition: transform 0.3s ease;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
  `;
  
  document.body.appendChild(toast);
  
  setTimeout(() => {
    toast.style.transform = 'translateX(-50%) translateY(0)';
  }, 10);
  
  setTimeout(() => {
    toast.style.transform = 'translateX(-50%) translateY(100px)';
    setTimeout(() => toast.remove(), 300);
  }, 3000);
}

// ===================================
// Atualização automática do ranking
// ===================================
let rankingUpdateInterval = null;

function startRankingUpdates(intervalMs = 60000) {
  if (rankingUpdateInterval) return;
  
  rankingUpdateInterval = setInterval(async () => {
    try {
      const response = await fetch('/api/ranking');
      if (!response.ok) return;
      
      const data = await response.json();
      // Atualizar DOM se necessário
      console.log('Ranking atualizado:', data);
    } catch (error) {
      console.error('Erro ao atualizar ranking:', error);
    }
  }, intervalMs);
}

function stopRankingUpdates() {
  if (rankingUpdateInterval) {
    clearInterval(rankingUpdateInterval);
    rankingUpdateInterval = null;
  }
}

// Parar updates quando a página não está visível
document.addEventListener('visibilitychange', () => {
  if (document.hidden) {
    stopRankingUpdates();
  } else {
    startRankingUpdates();
  }
});

// Exportar funções para uso global
window.scrollToUser = scrollToUser;
window.filterRanking = filterRanking;
window.sharePosition = sharePosition;
window.showToast = showToast;