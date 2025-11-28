document.addEventListener('DOMContentLoaded', () => {
  // Theme toggle com label atualizado (igual ao dashboard)
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

  // Menu hambúrguer
  const navToggle = document.querySelector('.nav-toggle');
  const navLinks = document.querySelector('.nav-links');

  if (navToggle && navLinks) {
    navToggle.addEventListener('click', () => {
      navLinks.classList.toggle('open');
      navToggle.classList.toggle('active');
    });

    // Fecha o menu ao clicar em um link
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        if (navLinks.classList.contains('open')) {
          navLinks.classList.remove('open');
          navToggle.classList.remove('active');
        }
      });
    });
  }
});