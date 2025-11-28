
    // SINCRONIZAÇÃO DO TEMA COM LOCALSTORAGE
    document.addEventListener('DOMContentLoaded', () => {
      const root = document.documentElement;
      const savedTheme = localStorage.getItem('theme') || 'light';
      
      // Aplica o tema salvo
      root.setAttribute('data-theme', savedTheme);
    });
