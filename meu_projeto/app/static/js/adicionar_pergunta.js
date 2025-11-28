// SINCRONIZAÇÃO DO TEMA COM LOCALSTORAGE
document.addEventListener('DOMContentLoaded', () => {
  const root = document.documentElement;
  const savedTheme = localStorage.getItem('theme') || 'light';
  
  // Aplica o tema salvo ANTES de renderizar os ícones
  root.setAttribute('data-theme', savedTheme);
  
  // Agora renderiza os ícones do Feather
  feather.replace();
  
  // Auto-ocultar flash messages
  document.querySelectorAll('.flash-messages').forEach(msg => {
    setTimeout(() => {
      msg.style.opacity = '0';
      setTimeout(() => { msg.style.display = 'none'; }, 500);
    }, 5000);
  });

  // Botão de alternar tema
  const toggleThemeBtn = document.getElementById('toggleTheme');
  const themeIcon = document.getElementById('themeIcon');

  if (toggleThemeBtn && themeIcon) {
    // Atualiza ícone ao carregar
    themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';

    toggleThemeBtn.addEventListener('click', () => {
      const currentTheme = root.getAttribute('data-theme');
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      
      root.setAttribute('data-theme', newTheme);
      localStorage.setItem('theme', newTheme);
      themeIcon.textContent = newTheme === 'dark' ? '☀️' : '🌙';
      
      // Reaplica os ícones do Feather após mudar o tema
      feather.replace();
    });
  }

  // Validação em tempo real (opcional)
  const form = document.querySelector('form');
  const titulo = document.getElementById('titulo');
  const conteudo = document.getElementById('conteudo');
  const categoria = document.getElementById('categoria');
  const dificuldade = document.getElementById('dificuldade');

  // Adiciona contador de caracteres no título
  if (titulo) {
    const maxLength = 200;
    const counterDiv = document.createElement('div');
    counterDiv.style.fontSize = '12px';
    counterDiv.style.color = 'var(--muted)';
    counterDiv.style.marginTop = '4px';
    counterDiv.style.textAlign = 'right';
    titulo.parentElement.appendChild(counterDiv);

    titulo.addEventListener('input', () => {
      const remaining = maxLength - titulo.value.length;
      counterDiv.textContent = `${titulo.value.length}/${maxLength} caracteres`;
      
      if (remaining < 20) {
        counterDiv.style.color = 'var(--error-text)';
      } else {
        counterDiv.style.color = 'var(--muted)';
      }
    });
    
    // Inicializa o contador
    counterDiv.textContent = `0/${maxLength} caracteres`;
  }

  // Adiciona contador de caracteres no conteúdo
  if (conteudo) {
    const maxLength = 2000;
    const counterDiv = document.createElement('div');
    counterDiv.style.fontSize = '12px';
    counterDiv.style.color = 'var(--muted)';
    counterDiv.style.marginTop = '4px';
    counterDiv.style.textAlign = 'right';
    conteudo.parentElement.appendChild(counterDiv);

    conteudo.addEventListener('input', () => {
      const remaining = maxLength - conteudo.value.length;
      counterDiv.textContent = `${conteudo.value.length}/${maxLength} caracteres`;
      
      if (remaining < 100) {
        counterDiv.style.color = 'var(--error-text)';
      } else {
        counterDiv.style.color = 'var(--muted)';
      }
    });
    
    // Inicializa o contador
    counterDiv.textContent = `0/${maxLength} caracteres`;
  }

  // Validação antes do envio
  if (form) {
    form.addEventListener('submit', (e) => {
      let isValid = true;
      let errorMessage = '';

      if (titulo.value.trim().length < 10) {
        isValid = false;
        errorMessage = 'O título deve ter pelo menos 10 caracteres.';
      }

      if (conteudo.value.trim().length < 5) {
        isValid = false;
        errorMessage = 'O conteúdo deve ter pelo menos 5 caracteres.';
      }

      if (!categoria.value) {
        isValid = false;
        errorMessage = 'Por favor, selecione uma categoria.';
      }

      if (!dificuldade.value) {
        isValid = false;
        errorMessage = 'Por favor, selecione a dificuldade.';
      }

      if (!isValid) {
        e.preventDefault();
        showNotification(errorMessage, 'error');
      }
    });
  }

  // Função para mostrar notificações personalizadas
  function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `flash-messages ${type}`;
    notification.textContent = message;
    notification.style.position = 'fixed';
    notification.style.top = '20px';
    notification.style.left = '50%';
    notification.style.transform = 'translateX(-50%)';
    notification.style.zIndex = '9999';
    notification.style.minWidth = '300px';
    notification.style.maxWidth = '500px';
    
    document.body.appendChild(notification);

    setTimeout(() => {
      notification.style.opacity = '0';
      setTimeout(() => {
        notification.remove();
      }, 500);
    }, 4000);
  }

  // Animação suave ao focar nos campos
  const inputs = document.querySelectorAll('.input-field');
  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.style.transform = 'scale(1.01)';
    });
    
    input.addEventListener('blur', function() {
      this.style.transform = 'scale(1)';
    });
  });
});