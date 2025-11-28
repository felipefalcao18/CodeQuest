
document.addEventListener('DOMContentLoaded', () => {
  // Tema claro/escuro
  const toggle = document.getElementById('dark-mode-toggle');
  const root = document.documentElement;
  const label = document.querySelector('.mode-label');
  const saved = localStorage.getItem('theme') || 'light';

  root.setAttribute('data-theme', saved);
  toggle.checked = saved === 'dark';
  label.textContent = saved === 'dark' ? 'Escuro' : 'Claro';

  toggle.addEventListener('change', () => {
    const theme = toggle.checked ? 'dark' : 'light';
    root.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
    label.textContent = theme === 'dark' ? 'Escuro' : 'Claro';
  });

  // Menu hambúrguer mobile - IGUAL AO DASHBOARD
  const mobileToggle = document.querySelector('.mobile-toggle');
  const navLinks = document.querySelector('.nav-links');

  if (mobileToggle) {
    mobileToggle.addEventListener('click', () => {
      navLinks.classList.toggle('open');
      mobileToggle.classList.toggle('active');
    });

    // Fecha o menu ao clicar em qualquer link
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        if (navLinks.classList.contains('open')) {
          navLinks.classList.remove('open');
          mobileToggle.classList.remove('active');
        }
      });
    });
  }

  // Remove mensagens flash automaticamente após 4 segundos
  const flashMessages = document.querySelectorAll('.flash-message');
  if (flashMessages.length > 0) {
    setTimeout(() => {
      flashMessages.forEach(msg => {
        msg.style.opacity = '0';
        msg.style.transform = 'translateY(-10px)';
        setTimeout(() => msg.remove(), 500);
      });
    }, 4000);
  }

  // Inicializa funcionalidades da página
  fetchPerguntas();
  carregarCategorias();
});



    // Tema claro/escuro - mesmo do dashboard
    document.addEventListener('DOMContentLoaded', () => {
      const toggle = document.getElementById('dark-mode-toggle');
      const root = document.documentElement;
      const label = document.querySelector('.mode-label');
      const saved = localStorage.getItem('theme') || 'light';

      // Inicializa tema e label
      root.setAttribute('data-theme', saved);
      toggle.checked = saved === 'dark';
      label.textContent = saved === 'dark' ? 'Escuro' : 'Claro';

      // Escuta mudanças no switch
      toggle.addEventListener('change', () => {
        const theme = toggle.checked ? 'dark' : 'light';
        root.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
        label.textContent = theme === 'dark' ? 'Escuro' : 'Claro';
      });

      // Inicializa funcionalidades da página
      fetchPerguntas();
      carregarCategorias();
    });

    let debounceTimer;
    let currentPerguntaId = null;
    let usuarioLogadoId = null;
    
    function debouncedFetch(){ 
      clearTimeout(debounceTimer); 
      debounceTimer = setTimeout(fetchPerguntas, 300); 
    }

    async function fetchPerguntas(){
      const listaEl = document.getElementById('listaPerguntas');
      listaEl.classList.add('loading');
      
      const q = encodeURIComponent(document.getElementById('q').value.trim());
      const categoria = encodeURIComponent(document.getElementById('categoria').value);
      const dificuldade = encodeURIComponent(document.getElementById('dificuldade').value);
      const url = `/api/perguntas?q=${q}&categoria=${categoria}&dificuldade=${dificuldade}`;
      
      try{
        const res = await fetch(url, {credentials:'same-origin'});
        if(!res.ok) throw new Error('Erro ao buscar perguntas');
        const data = await res.json();
        renderLista(data);
      }catch(err){
        console.error(err);
        listaEl.innerHTML = '<div class="qcard"><div class="empty-state">❌ Erro ao carregar. Verifique o back-end.</div></div>';
      } finally {
        listaEl.classList.remove('loading');
      }
    }

    function renderLista(perguntas){
      const el = document.getElementById('listaPerguntas');
      if(!perguntas || perguntas.length === 0){ 
        el.innerHTML = '<div class="qcard"><div class="empty-state">Nenhuma pergunta encontrada.<br>Que tal criar a primeira?</div></div>'; 
        return; 
      }
      
      el.innerHTML = perguntas.map(p => {
        usuarioLogadoId = p.usuario_logado_id;
        
        const getDifficultyIcon = (diff) => {
          switch(diff?.toLowerCase()) {
            case 'facil': return '🟢';
            case 'medio': return '🟡';
            case 'dificil': return '🔴';
            default: return '⚪';
          }
        };
        
        const actionsHtml = (p.usuario_id === p.usuario_logado_id)
          ? `<div class="btn-actions">
              <a href="/editar-pergunta/${p.id}" class="btn-edit" style="text-decoration: none;">✏️ Editar</a>
              <button class="btn-delete" onclick="confirmarExclusaoPergunta(${p.id})">🗑️ Excluir</button>
            </div>`
          : '';
          
        return `
          <article class="qcard">
            <h3>${escapeHtml(p.titulo)}</h3>
            <div class="meta">
              <strong>${escapeHtml(p.usuario_nome || 'Anônimo')}</strong> • 
              <span>📂 ${escapeHtml(p.categoria || '—')}</span> • 
              <span>${getDifficultyIcon(p.dificuldade)} ${escapeHtml(p.dificuldade || '—')}</span> • 
              <span>📅 ${escapeHtml(p.criado_em || '')}</span>
            </div>
            <p>${escapeHtml((p.conteudo || '').slice(0, 200))}${(p.conteudo || '').length > 200 ? '...' : ''} 
            <a href="#" onclick="abrirModal(${p.id});return false">ver completo / responder</a></p>
            ${actionsHtml}
          </article>
        `;
      }).join('');
    }

    function escapeHtml(s){ 
      return (s||'')
        .replaceAll('&','&amp;')
        .replaceAll('<','&lt;')
        .replaceAll('>','&gt;')
        .replaceAll('"','&quot;')
        .replaceAll("'","&#39;");
    }

    async function abrirModal(id){
      currentPerguntaId = id;
      const modal = document.getElementById('modal');
      
      try{
        const res = await fetch(`/api/perguntas/${id}`, {credentials:'same-origin'});
        if(!res.ok) throw new Error('Não encontrado');
        const p = await res.json();
        
        document.getElementById('modalTitle').textContent = p.titulo;
        
        const getDifficultyIcon = (diff) => {
          switch(diff?.toLowerCase()) {
            case 'facil': return '🟢 Fácil';
            case 'medio': return '🟡 Médio';
            case 'dificil': return '🔴 Difícil';
            default: return '⚪ —';
          }
        };
        
        document.getElementById('modalMeta').innerHTML = `
          <strong>👤 ${escapeHtml(p.usuario_nome || 'Anônimo')}</strong> • 
          <span>📂 ${p.categoria || '—'}</span> • 
          <span>${getDifficultyIcon(p.dificuldade)}</span> •
          <span>📅 ${p.criado_em || ''}</span>
        `;
        
        document.getElementById('modalContent').textContent = p.conteudo;
        document.getElementById('respostaPerguntaId').value = p.id;
        
        // Mostra botão de excluir se for o dono da pergunta
        const perguntaActions = document.getElementById('perguntaActions');
        if (p.usuario_id === p.usuario_logado_id) {
          perguntaActions.style.display = 'block';
        } else {
          perguntaActions.style.display = 'none';
        }
        
        const ansEl = document.getElementById('modalAnswers');
        const respostasHtml = (p.respostas && p.respostas.length) ?
          p.respostas.map(a => {
            const isOwner = usuarioLogadoId && a.usuario_id === usuarioLogadoId;
            const actionsHtml = isOwner ? `
              <div class="answer-actions">
                <button class="btn-small btn-edit" onclick="editarResposta(${a.id})" title="Editar resposta">✏️</button>
                <button class="btn-small btn-delete" onclick="excluirResposta(${a.id})" title="Excluir resposta">🗑️</button>
              </div>
            ` : '';
            
            return `
              <div class="answer" id="answer-${a.id}">
                <div class="answer-header">
                  <div class="answer-user">${escapeHtml(a.usuario_nome||'Usuário')}</div>
                  ${actionsHtml}
                </div>
                <div class="answer-content" id="content-${a.id}">${escapeHtml(a.conteudo)}</div>
                <div class="edit-form" id="edit-form-${a.id}">
                  <textarea id="edit-textarea-${a.id}" placeholder="Edite sua resposta...">${escapeHtml(a.conteudo)}</textarea>
                  <div class="form-actions">
                    <button class="btn-small btn-secondary" onclick="cancelarEdicaoResposta(${a.id})">❌ Cancelar</button>
                    <button class="btn-small btn-edit" onclick="salvarEdicaoResposta(${a.id})">💾 Salvar</button>
                  </div>
                </div>
              </div>
            `;
          }).join('') :
          '<div class="empty-state">Ainda não há respostas.<br>Seja o primeiro a responder!</div>';
        
        ansEl.innerHTML = '<h4>Respostas</h4>' + respostasHtml;
        modal.classList.add('show');
        
      }catch(e){
        alert('❌ Não foi possível carregar a pergunta.');
      }
    }
    
    function closeModal(){ 
      document.getElementById('modal').classList.remove('show'); 
      currentPerguntaId = null;
    }

    // Funções para gerenciar perguntas
    function confirmarExclusaoPergunta(id) {
      if (confirm('⚠️ Tem certeza que deseja excluir esta pergunta? Esta ação não pode ser desfeita.')) {
        excluirPerguntaById(id);
      }
    }

    async function excluirPergunta() {
      if (!currentPerguntaId) return;
      if (confirm('⚠️ Tem certeza que deseja excluir esta pergunta? Esta ação não pode ser desfeita.')) {
        await excluirPerguntaById(currentPerguntaId);
        closeModal();
      }
    }

    async function excluirPerguntaById(id) {
      try {
        const res = await fetch(`/api/perguntas/${id}`, {
          method: 'DELETE',
          credentials: 'same-origin'
        });
        if (!res.ok) throw new Error('Erro ao excluir');
        alert('✅ Pergunta excluída com sucesso!');
        fetchPerguntas();
      } catch (err) {
        alert('❌ Erro ao excluir pergunta.');
      }
    }

    // Funções para gerenciar respostas
    function editarResposta(respostaId) {
      const contentDiv = document.getElementById(`content-${respostaId}`);
      const editForm = document.getElementById(`edit-form-${respostaId}`);
      
      contentDiv.style.display = 'none';
      editForm.classList.add('show');
      
      // Foca no textarea
      const textarea = document.getElementById(`edit-textarea-${respostaId}`);
      textarea.focus();
      textarea.setSelectionRange(textarea.value.length, textarea.value.length);
    }

    function cancelarEdicaoResposta(respostaId) {
      const contentDiv = document.getElementById(`content-${respostaId}`);
      const editForm = document.getElementById(`edit-form-${respostaId}`);
      
      contentDiv.style.display = 'block';
      editForm.classList.remove('show');
      
      // Restaura o conteúdo original
      const textarea = document.getElementById(`edit-textarea-${respostaId}`);
      const originalContent = contentDiv.textContent;
      textarea.value = originalContent;
    }

    async function salvarEdicaoResposta(respostaId) {
      const textarea = document.getElementById(`edit-textarea-${respostaId}`);
      const novoConteudo = textarea.value.trim();
      
      if (!novoConteudo) {
        alert('⚠️ O conteúdo não pode estar vazio.');
        textarea.focus();
        return;
      }

      // Adiciona estado de loading
      const saveBtn = event.target;
      const originalText = saveBtn.textContent;
      saveBtn.textContent = '⏳ Salvando...';
      saveBtn.disabled = true;

      try {
        const res = await fetch(`/api/respostas/${respostaId}`, {
          method: 'PUT',
          credentials: 'same-origin',
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({conteudo: novoConteudo})
        });
        
        if (!res.ok) throw new Error('Erro ao editar');
        
        // Atualiza o conteúdo na tela
        const contentDiv = document.getElementById(`content-${respostaId}`);
        contentDiv.textContent = novoConteudo;
        
        cancelarEdicaoResposta(respostaId);
        
        // Mostra feedback visual
        contentDiv.style.background = '#dcfce7';
        setTimeout(() => {
          contentDiv.style.background = '';
        }, 2000);
        
        alert('✅ Resposta editada com sucesso!');
      } catch (err) {
        alert('❌ Erro ao editar resposta.');
      } finally {
        saveBtn.textContent = originalText;
        saveBtn.disabled = false;
      }
    }

    async function excluirResposta(respostaId) {
      if (!confirm('⚠️ Tem certeza que deseja excluir esta resposta?')) return;
      
      const answerDiv = document.getElementById(`answer-${respostaId}`);
      const originalOpacity = answerDiv.style.opacity;
      answerDiv.style.opacity = '0.5';
      
      try {
        const res = await fetch(`/api/respostas/${respostaId}`, {
          method: 'DELETE',
          credentials: 'same-origin'
        });
        
        if (!res.ok) throw new Error('Erro ao excluir');
        
        // Animação de saída
        answerDiv.style.transform = 'translateX(-100%)';
        answerDiv.style.transition = 'all 0.3s ease';
        
        setTimeout(() => {
          answerDiv.remove();
        }, 300);
        
        alert('✅ Resposta excluída com sucesso!');
      } catch (err) {
        answerDiv.style.opacity = originalOpacity;
        alert('❌ Erro ao excluir resposta.');
      }
    }

    async function enviarResposta(e){
      e.preventDefault();
      const conteudo = document.getElementById('respostaTexto').value.trim();
      const pergunta_id = document.getElementById('respostaPerguntaId').value;
      
      if(!conteudo) {
        alert('⚠️ Por favor, escreva uma resposta.');
        document.getElementById('respostaTexto').focus();
        return;
      }
      
      // Adiciona estado de loading
      const submitBtn = e.target.querySelector('button[type="submit"]');
      const originalText = submitBtn.textContent;
      submitBtn.textContent = '📤 Enviando...';
      submitBtn.disabled = true;
      
      try{
        const res = await fetch('/api/respostas', {
          method:'POST',
          credentials:'same-origin',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({pergunta_id,conteudo})
        });
        
        if(!res.ok) throw new Error('Erro no envio');
        
        alert('✅ Resposta enviada com sucesso!');
        document.getElementById('respostaTexto').value = '';
        
        // Recarrega o modal para mostrar a nova resposta
        abrirModal(currentPerguntaId);
        
      }catch(err){
        alert('❌ Erro ao enviar resposta. Verifique o servidor.');
      } finally {
        submitBtn.textContent = originalText;
        submitBtn.disabled = false;
      }
    }

    // Carrega as perguntas assim que a página é aberta
    // (removido pois agora é chamado no DOMContentLoaded acima)

    async function carregarCategorias(){
      try {
        const res = await fetch('/api/categorias', {credentials:'same-origin'});
        if(!res.ok) throw new Error('Erro ao buscar categorias');
        const categorias = await res.json();
        const select = document.getElementById('categoria');
        
        // Limpa opções atuais, exceto a "Todas as categorias"
        select.innerHTML = '<option value="">📂 Todas as categorias</option>';
        
        const categoryIcons = {
          'Python': '🐍',
          'JavaScript': '🟨',
          'Frontend': '🎨',
          'Banco de Dados': '🗃️',
          'Outros': '📦'
        };
        
        categorias.forEach(cat => {
          const opt = document.createElement('option');
          opt.value = cat;
          opt.textContent = `${categoryIcons[cat] || '📂'} ${cat}`;
          select.appendChild(opt);
        });
      } catch(err){
        console.error('Erro ao carregar categorias:', err);
      }
    }

    // Atalhos de teclado
    document.addEventListener('keydown', (e) => {
      // ESC para fechar modal
      if (e.key === 'Escape' && document.getElementById('modal').classList.contains('show')) {
        closeModal();
      }
      
      // Ctrl/Cmd + K para focar na busca
      if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        document.getElementById('q').focus();
      }
    });

    // Auto-resize do textarea
    document.addEventListener('input', (e) => {
      if (e.target.tagName === 'TEXTAREA') {
        e.target.style.height = 'auto';
        e.target.style.height = e.target.scrollHeight + 'px';
      }
    });

    // Feedback visual para ações
    function showToast(message, type = 'success') {
      const toast = document.createElement('div');
      toast.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: ${type === 'success' ? '#10b981' : '#ef4444'};
        color: white;
        padding: 12px 20px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        z-index: 1000;
        transform: translateX(100%);
        transition: transform 0.3s ease;
      `;
      toast.textContent = message;
      document.body.appendChild(toast);
      
      setTimeout(() => toast.style.transform = 'translateX(0)', 100);
      setTimeout(() => {
        toast.style.transform = 'translateX(100%)';
        setTimeout(() => toast.remove(), 300);
      }, 3000);
    }
 