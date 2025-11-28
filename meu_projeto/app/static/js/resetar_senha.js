// --- LÓGICA DE FORÇA DA SENHA (Mínimo 6 chars) ---
/**
 * Calcula a força da senha e retorna uma pontuação (0-4) e um texto.
 */
function getPasswordStrength(password) {
  let score = 0;
  const textLevels = ['', 'Fraca', 'Média', 'Forte', 'Muito Forte'];

  if (!password || password.length === 0) {
    return { score: 0, text: '' };
  }

  const len = password.length;
  const hasLower = /[a-z]/.test(password);
  const hasUpper = /[A-Z]/.test(password);
  const hasNumber = /\d/.test(password);
  const hasSpecial = /[^A-Za-z0-9]/.test(password);

  let charTypes = 0;
  if (hasLower) charTypes++;
  if (hasUpper) charTypes++;
  if (hasNumber) charTypes++;
  if (hasSpecial) charTypes++;

  if (len < 6 || charTypes === 1) {
    score = 1; // Fraca (menos de 6 OU apenas 1 tipo)
  } else if (charTypes === 2) {
    score = 2; // Média
  } else if (charTypes === 3) {
    score = 3; // Forte
  } else if (charTypes === 4) {
    score = 4; // Muito Forte
  }

  if (len === 0) {
      score = 0;
  }
  
  return { score: score, text: textLevels[score] || '' };
}


// --- INÍCIO DO SCRIPT PRINCIPAL ---

document.addEventListener('DOMContentLoaded', () => {
  const root = document.documentElement;
  const savedTheme = localStorage.getItem('theme') || 'light';
  
  // 1. SINCRONIZAÇÃO E ATUALIZAÇÃO DO TEMA
  root.setAttribute('data-theme', savedTheme);
  
  // Renderiza Feather Icons. Importante que seja chamado antes de usar os ícones no JS.
  if (typeof feather !== 'undefined') {
    feather.replace();
  }
  
  // Atualiza o ícone do tema (usa themeIcon do HTML)
  const themeIcon = document.getElementById('themeIcon');
  if (themeIcon) {
    themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
  }
  
  // Auto-ocultar flash messages
  document.querySelectorAll('.flash-message').forEach(msg => {
    setTimeout(() => {
      msg.style.opacity = '0';
      setTimeout(() => { 
        msg.style.display = 'none'; 
      }, 500);
    }, 5000);
  });

  // --- 2. LÓGICA DE TOGGLE DE SENHA ---
  
  // Função que configura o toggle de senha
  function setupPasswordToggle(inputId, toggleId) {
    const toggleButton = document.getElementById(toggleId);
    const passwordInput = document.getElementById(inputId);
    
    // Assegura que ambos os elementos existem e que a biblioteca Feather está carregada
    if (toggleButton && passwordInput && typeof feather !== 'undefined') {
      
      // Define os ícones do Feather (SVGs puros)
      const eyeIcon = feather.icons.eye.toSvg();
      const eyeOffIcon = feather.icons['eye-off'].toSvg();

      // O feather.replace() já deve ter colocado o ícone 'eye' no HTML.

      toggleButton.addEventListener('click', function () {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        // Atualiza o ícone
        if (type === 'password') {
          this.innerHTML = eyeIcon;
        } else {
          this.innerHTML = eyeOffIcon;
        }
      });
    }
  }

  // Configura o toggle para a Nova Senha (apenas uma chamada)
  setupPasswordToggle('senha', 'togglePassword');
  // Configura o toggle para o Confirmar Senha (se existir no HTML, apenas uma chamada)
  setupPasswordToggle('confirmar_senha', 'toggleConfirmPassword');

  
  // --- 3. LÓGICA DE FORÇA DA SENHA (ATIVAÇÃO VISUAL) ---
  const passwordInput = document.getElementById('senha');
  const strengthContainer = document.getElementById('passwordStrength');
  
  if (passwordInput && strengthContainer) {
    const strengthBar = strengthContainer.querySelector('.strength-fill');
    const strengthText = strengthContainer.querySelector('.strength-text');

    passwordInput.addEventListener('input', () => {
      const password = passwordInput.value;
      const { score, text } = getPasswordStrength(password);
      
      // Exibe o medidor na primeira digitação
      if (strengthContainer.hasAttribute('hidden')) {
        strengthContainer.removeAttribute('hidden');
      }
      
      // Atualiza a barra e o texto
      if (strengthBar) {
        strengthBar.className = 'strength-fill'; 
        strengthBar.classList.add('strength-' + score);
      }
      if (strengthText) {
        strengthText.textContent = text;
      }
    });
  }

  // --- 4. Toggle de Tema (Usando o ID 'toggleTheme' e 'themeIcon') ---
  const toggleThemeBtn = document.getElementById('toggleTheme');

  if (toggleThemeBtn && themeIcon) {
    toggleThemeBtn.addEventListener('click', () => {
      const currentTheme = root.getAttribute('data-theme');
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      
      root.setAttribute('data-theme', newTheme);
      localStorage.setItem('theme', newTheme);
      themeIcon.textContent = newTheme === 'dark' ? '☀️' : '🌙';
    });
  }

  // --- 5. Validação do Formulário ---
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('submit', function(e) {
      const senha = document.getElementById('senha').value;
      const confirmarSenha = document.getElementById('confirmar_senha');
      
      if (senha.length < 6) {
        e.preventDefault();
        alert('A senha deve ter no mínimo 6 caracteres.');
        return false;
      }

      // Validação de confirmação de senha
      if (confirmarSenha && confirmarSenha.value !== senha) {
        e.preventDefault();
        alert('As senhas não coincidem. Por favor, verifique.');
        confirmarSenha.focus();
        return false;
      }

      // Validação de força (exige no mínimo 'Média')
      const { score } = getPasswordStrength(senha);
      if (score < 2) { 
        e.preventDefault();
        alert('Sua senha é muito fraca. Tente combinar letras e números, ou letras maiúsculas e minúsculas.');
        return false;
      }
    });
  }

  // --- 6. Feedback visual em tempo real para confirmação de senha ---
  const confirmarSenhaInput = document.getElementById('confirmar_senha');

  if (confirmarSenhaInput && passwordInput) {
    function checkConfirmation() {
      if (confirmarSenhaInput.value === '') {
        confirmarSenhaInput.style.borderColor = ''; 
        return;
      }
      
      if (confirmarSenhaInput.value === passwordInput.value) {
        confirmarSenhaInput.style.borderColor = '#10b981'; // Verde (sucesso)
      } else {
        confirmarSenhaInput.style.borderColor = '#ef4444'; // Vermelho (erro)
      }
    }
    
    confirmarSenhaInput.addEventListener('input', checkConfirmation);
    passwordInput.addEventListener('input', checkConfirmation);
  }
});