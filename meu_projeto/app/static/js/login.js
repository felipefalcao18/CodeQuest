
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
    });
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

  // Atualiza ícone ao carregar
  const savedTheme = document.documentElement.getAttribute('data-theme');
  themeIcon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
}

