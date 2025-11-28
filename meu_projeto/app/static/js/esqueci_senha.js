// SINCRONIZAÇÃO DO TEMA COM LOCALSTORAGE
document.addEventListener('DOMContentLoaded', () => {
  const root = document.documentElement;
  const savedTheme = localStorage.getItem('theme') || 'light';
  
  // Aplica o tema salvo ANTES de renderizar os ícones
  root.setAttribute('data-theme', savedTheme);
  
  // Agora renderiza os ícones do Feather
  feather.replace();
  
  // Atualiza o ícone do tema
  const themeIcon = document.getElementById('themeIcon');
  if (themeIcon) {
    themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
  }
  
  // Auto-ocultar flash messages após 5 segundos
  document.querySelectorAll('.flash-message').forEach(msg => {
    setTimeout(() => {
      msg.style.opacity = '0';
      setTimeout(() => { 
        msg.style.display = 'none'; 
      }, 500);
    }, 5000);
  });
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

// Validação do formulário
const form = document.querySelector('form');
if (form) {
  form.addEventListener('submit', function(e) {
    const email = document.getElementById('email').value;
    
    // Validação básica de email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      e.preventDefault();
      alert('Por favor, insira um e-mail válido.');
      return false;
    }

    // Feedback visual durante o envio
    const submitBtn = this.querySelector('button[type="submit"]');
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.innerHTML = '<i data-feather="loader"></i> Enviando...';
      feather.replace();
      
      // Re-habilita o botão após 3 segundos (caso não redirecione)
      setTimeout(() => {
        submitBtn.disabled = false;
        submitBtn.innerHTML = '<i data-feather="send"></i> Enviar Link de Recuperação';
        feather.replace();
      }, 3000);
    }
  });
}

// Validação em tempo real do campo de email
const emailInput = document.getElementById('email');
if (emailInput) {
  emailInput.addEventListener('blur', function() {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (this.value && !emailRegex.test(this.value)) {
      this.style.borderColor = '#ef4444';
    } else if (this.value) {
      this.style.borderColor = '#10b981';
    } else {
      this.style.borderColor = '';
    }
  });

  emailInput.addEventListener('input', function() {
    // Remove a borda colorida enquanto digita
    this.style.borderColor = '';
  });
}