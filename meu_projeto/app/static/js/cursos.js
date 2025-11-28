let allCourses = [];
let filteredCourses = [];

function getIconForCourse(tags, category) {
    const t = tags.join(' ').toLowerCase();
    // Mapeamento de tecnologias para ícones FontAwesome
    if (t.includes('python')) return 'fa-brands fa-python';
    if (t.includes('java') && !t.includes('script')) return 'fa-brands fa-java';
    if (t.includes('javascript') || t.includes('js')) return 'fa-brands fa-js';
    if (t.includes('react')) return 'fa-brands fa-react';
    if (t.includes('vue')) return 'fa-brands fa-vuejs';
    if (t.includes('angular')) return 'fa-brands fa-angular';
    if (t.includes('html')) return 'fa-brands fa-html5';
    if (t.includes('css')) return 'fa-brands fa-css3-alt';
    if (t.includes('docker')) return 'fa-brands fa-docker';
    if (t.includes('aws')) return 'fa-brands fa-aws';
    if (t.includes('git')) return 'fa-brands fa-git-alt';
    if (t.includes('linux')) return 'fa-brands fa-linux';
    if (category === 'design') return 'fa-solid fa-pen-nib';
    if (category === 'data') return 'fa-solid fa-database';
    if (category === 'ai') return 'fa-solid fa-brain';
    
    return 'fa-solid fa-laptop-code'; // Ícone padrão
}

function renderCourses(courses) {
    const container = document.getElementById('courses-container');
    const error = document.getElementById('error');
    
    container.innerHTML = '';
    error.style.display = 'none';

    if (courses.length === 0) {
        // Melhorar a mensagem de vazio
        container.innerHTML = `
            <div style="grid-column: 1 / -1; text-align: center; padding: 40px;">
                <i class="fa-regular fa-folder-open" style="font-size: 48px; color: var(--muted); margin-bottom: 16px;"></i>
                <p style="color: var(--muted);">Nenhum curso encontrado com os filtros aplicados.</p>
            </div>`;
        return;
    }

    const coursesHTML = courses.map(course => {
        const difficultyClasses = {
            beginner: 'difficulty-beginner',
            intermediate: 'difficulty-intermediate',
            advanced: 'difficulty-advanced'
        };
        const difficultyClass = difficultyClasses[course.level] || 'difficulty-beginner';
        const difficultyText = course.level ? course.level.charAt(0).toUpperCase() + course.level.slice(1) : 'Iniciante';
        
        // Define o ícone
        const iconClass = getIconForCourse(course.tags || [], course.category);

        const tagsHTML = course.tags && course.tags.length > 0 
            ? `<div class="course-tags">${course.tags.slice(0, 3).map(tag => `<span class="tag">${tag}</span>`).join('')}</div>`
            : '';

        return `
            <div class="course-card">
                <span class="difficulty-badge ${difficultyClass}">${difficultyText}</span>
                <div class="course-header">
                    <div class="course-icon-wrapper">
                        <i class="${iconClass}"></i>
                    </div>
                    <div>
                        <p class="course-provider">${course.provider}</p>
                        <h3 class="course-title" title="${course.title}">${course.title}</h3>
                    </div>
                </div>
                <div class="course-body">
                    <p class="course-description">${course.description}</p>
                    
                    <div class="course-meta">
                         <div class="meta-item">
                            <i class="fa-solid fa-star" style="color: var(--warning); font-size: 14px;"></i>
                            <span>${course.rating}</span>
                        </div>
                         <div class="meta-item">
                            <i class="fa-solid fa-layer-group" style="font-size: 14px;"></i>
                            <span>${course.category.toUpperCase()}</span>
                        </div>
                    </div>

                    ${tagsHTML}
                    
                    <div class="course-footer" style="padding: 0; margin-top: auto;">
                        <a href="${course.url}" target="_blank" rel="noopener noreferrer" class="course-btn course-btn-primary">
                            Acessar Curso <i class="fa-solid fa-external-link-alt" style="margin-left: 6px;"></i>
                        </a>
                    </div>
                </div>
            </div>
        `;
    }).join('');
    
    container.innerHTML = coursesHTML;
}


async function loadCourses() {
    const loading = document.getElementById('loading');
    const error = document.getElementById('error');
    const container = document.getElementById('courses-container');

    loading.style.display = 'block';
    error.style.display = 'none';
    container.innerHTML = '';

    try {
        // Carregando do arquivo local cursos.json
        const res = await fetch("/static/cursos.json");
        if (!res.ok) throw new Error("Erro ao carregar o arquivo cursos.json");

        const data = await res.json();

        // Mapeia os dados do JSON
        allCourses = data.map((c, i) => ({
            id: i,
            title: c.title,
            provider: c.provider,
            description: c.description,
            url: c.url,
            level: c.level,
            category: c.category,
            tags: c.tags || [],
            rating: (Math.random() * (5 - 4.5) + 4.5).toFixed(1)
        }));

        filteredCourses = allCourses;
        renderCourses(filteredCourses);
        
    } catch (err) {
        console.error("Falha ao carregar cursos:", err);
        error.style.display = 'block';
    } finally {
        loading.style.display = 'none';
    }
}



function searchCourses() {
    const search = document.getElementById("search").value.toLowerCase();
    const category = document.getElementById("category").value;
    const level = document.getElementById("level").value;
    const provider = document.getElementById("provider").value.toLowerCase();

    filteredCourses = allCourses.filter(c => {
        const providerMatch = c.provider ? c.provider.toLowerCase().includes(provider) : true;
        return (
            (!search || c.title.toLowerCase().includes(search)) &&
            (!category || c.category === category) &&
            (!level || c.level === level) &&
            (!provider || providerMatch)
        );
    });

    renderCourses(filteredCourses);
}

function clearFilters() {
    document.getElementById("search").value = "";
    document.getElementById("category").value = "";
    document.getElementById("level").value = "";
    document.getElementById("provider").value = "";
    filteredCourses = allCourses;
    renderCourses(filteredCourses);
}

document.addEventListener('DOMContentLoaded', () => {
    loadCourses();

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

    // Enter key para buscar
    document.getElementById('search').addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            searchCourses();
        }
    });

    // Menu hambúrguer
    const navToggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelector('.nav-links');
    if (navToggle) {
        navToggle.addEventListener('click', () => {
            navLinks.classList.toggle('open');
            navToggle.classList.toggle('active');
        });
    }
});