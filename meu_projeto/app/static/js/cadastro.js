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
  
  // Auto-ocultar flash messages após 3 segundos
  document.querySelectorAll('.flash-message').forEach(msg => {
    setTimeout(() => {
      msg.style.opacity = '0';
      setTimeout(() => { 
        msg.style.display = 'none'; 
      }, 500);
    }, 3000);
  });

  // Toggle de mostrar/ocultar senha
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('senha');
  
  if (togglePassword && passwordInput) {
    const eyeIcon = feather.icons.eye.toSvg();
    const eyeOffIcon = feather.icons['eye-off'].toSvg();

    togglePassword.addEventListener('click', function () {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      
      if (type === 'password') {
        this.innerHTML = eyeIcon;
      } else {
        this.innerHTML = eyeOffIcon;
      }
    });
  }

  // --- LÓGICA DE FORÇA DA SENHA (Mínimo 6 chars) ---
  
  const strengthBar = document.getElementById('passwordStrengthBar');
  const strengthText = document.getElementById('passwordStrengthText');

  function getPasswordStrength(password) {
    let score = 0;
    const textLevels = ['', 'Fraca', 'Média', 'Forte', 'Muito Forte']; // 0, 1, 2, 3, 4

    if (!password || password.length === 0) {
      return { score: 0, text: '' };
    }

    const len = password.length;
    const hasLower = /[a-z]/.test(password);
    const hasUpper = /[A-Z]/.test(password);
    const hasNumber = /\d/.test(password);
    const hasSpecial = /[^A-Za-z0-9]/.test(password);

    // Contar os tipos de caracteres presentes
    let charTypes = 0;
    if (hasLower) charTypes++;
    if (hasUpper) charTypes++;
    if (hasNumber) charTypes++;
    if (hasSpecial) charTypes++;

    // --- Nova Lógica de Pontuação ---

    if (len < 6) {
      // Muito curta, sempre fraca
      score = 1;
    } else if (charTypes === 1) {
      // Tem 6+ chars, mas só 1 tipo (Ex: "123456" ou "abcdef")
      score = 1; // Fraca
    } else if (charTypes === 2) {
      score = 2; // Média
    } else if (charTypes === 3) {
      score = 3; // Forte
    } else if (charTypes === 4) {
      score = 4; // Muito Forte
    }

    // Garante que se estiver vazia, a pontuação é 0
    if (len === 0) {
        score = 0;
    }
    
    return { score: score, text: textLevels[score] || '' };
  }

  // Adiciona o listener no campo de senha
  if (passwordInput && strengthBar && strengthText) {
    passwordInput.addEventListener('input', () => {
      const password = passwordInput.value;
      const { score, text } = getPasswordStrength(password);
      
      // Atualiza a barra
      strengthBar.className = 'strength-bar-fill'; // Reseta as classes
      strengthBar.classList.add('strength-' + score);
      
      // Atualiza o texto
      strengthText.textContent = text;
    });
  }

  // --- FIM DA LÓGICA DE FORÇA DA SENHA ---


  // Toggle de Tema
  const toggleThemeBtn = document.getElementById('toggleTheme');
  // const themeIcon = document.getElementById('themeIcon'); // Já declarado acima

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

  // Validação do formulário (Mantendo 6 chars + Força)
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('submit', function(e) {
      const senha = document.getElementById('senha').value;
      
      // 1. Validação de senha mínima (como no seu original)
      if (senha.length < 6) {
        e.preventDefault();
        alert('A senha deve ter no mínimo 6 caracteres.');
        return false;
      }
      
      // 2. Validação de força mínima (para evitar "123456")
      const { score } = getPasswordStrength(senha);
      
      // Permite cadastrar apenas com 'Média' (score 2) ou superior
      if (score < 2) { 
        e.preventDefault();
        alert('Sua senha é muito fraca. Tente combinar letras e números, ou letras maiúsculas e minúsculas.');
        return false;
      }
    });
  }
});