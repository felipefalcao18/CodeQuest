document.addEventListener('DOMContentLoaded', () => {
  if (typeof feather !== 'undefined') {
    feather.replace();
  }

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
    
    if (typeof feather !== 'undefined') {
      feather.replace();
    }
  });

  // Menu hambúrguer mobile
  const mobileToggle = document.querySelector('.mobile-toggle');
  const navLinks = document.querySelector('.nav-links');

  if (mobileToggle) {
    mobileToggle.addEventListener('click', () => {
      navLinks.classList.toggle('open');
      mobileToggle.classList.toggle('active');
    });

    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        if (navLinks.classList.contains('open')) {
          navLinks.classList.remove('open');
          mobileToggle.classList.remove('active');
        }
      });
    });
  }
});

const fallbackQuestions = [
  {id:1,titulo:"O que é uma variável em programação?",conteudo:"Escolha a melhor resposta.",categoria:"Python",dificuldade:"facil",
      opcoes:["Um tipo de dado imutável","Um contêiner para armazenar valores","Um algoritmo","Um banco de dados"],resposta:1},
  {id:2,titulo:"Qual método itera sobre arrays em JS sem modificar o original?",conteudo:"",categoria:"JavaScript",dificuldade:"medio",
      opcoes:["forEach","map","push","splice"],resposta:1},
  {id:3,titulo:"Qual comando cria uma nova branch no Git?",conteudo:"",categoria:"DevOps",dificuldade:"facil",
      opcoes:["git init","git commit","git checkout -b <nome>","git merge"],resposta:2},
  {id:4,titulo:"O que é CSS?",conteudo:"",categoria:"Frontend",dificuldade:"facil",
      opcoes:["Uma linguagem de programação","Uma linguagem de estilização","Um framework","Um banco de dados"],resposta:1},
  {id:5,titulo:"Qual é a função do 'async/await' em JavaScript?",conteudo:"",categoria:"JavaScript",dificuldade:"medio",
      opcoes:["Criar loops","Lidar com operações assíncronas","Declarar variáveis","Importar módulos"],resposta:1},
  {id:6,titulo:"O que significa HTML?",conteudo:"",categoria:"Frontend",dificuldade:"facil",
      opcoes:["HyperText Markup Language","High Tech Modern Language","Home Tool Markup Language","Hyper Transfer Markup Language"],resposta:0},
  {id:7,titulo:"Qual operador verifica igualdade estrita em JavaScript?",conteudo:"",categoria:"JavaScript",dificuldade:"facil",
      opcoes:["==","===","=","!="],resposta:1},
  {id:8,titulo:"O que é um array?",conteudo:"",categoria:"Python",dificuldade:"facil",
      opcoes:["Uma função","Uma estrutura de dados","Um loop","Uma classe"],resposta:1},
  {id:9,titulo:"Qual comando instala pacotes no Python?",conteudo:"",categoria:"Python",dificuldade:"medio",
      opcoes:["npm install","pip install","apt-get","composer install"],resposta:1},
  {id:10,titulo:"O que faz o método 'push()' em arrays?",conteudo:"",categoria:"JavaScript",dificuldade:"facil",
      opcoes:["Remove o último elemento","Adiciona elemento no início","Adiciona elemento no final","Inverte o array"],resposta:2}
];

let questions = [], currentIndex = 0, userAnswers = [], timerInterval = null, timeLeft = 0;
let quizStartTime, quizSettings = {};
let perguntasRespondidasIDs = [];


const startBtn = document.getElementById('startBtn');
const loadingSpinner = document.getElementById('loadingSpinner');
const startBtnText = document.getElementById('startBtnText');
const startBtnIcon = document.getElementById('startBtnIcon');
const nextBtn = document.getElementById('nextBtn');

// ========================================
// 🎲 ALGORITMO DE EMBARALHAMENTO MELHORADO (Fisher-Yates)
// ========================================

/**
 * Fisher-Yates shuffle - algoritmo comprovadamente uniforme
 * Melhor que sort(() => Math.random() - 0.5)
 */
function shuffleArray(array) {
  const arr = [...array]; // Cria cópia para não modificar original
  
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]]; // Swap
  }
  
  return arr;
}

// ========================================
// 🎯 SELEÇÃO INTELIGENTE DE PERGUNTAS
// ========================================

/**
 * Seleciona perguntas evitando repetições recentes
 * Armazena IDs das últimas perguntas respondidas
 */
function selecionarPerguntasInteligente(todasPerguntas, quantidade, categoria, dificuldade) {
  // Filtrar por categoria e dificuldade
  let perguntasFiltradas = todasPerguntas.filter(p => {
    const matchCategoria = !categoria || p.categoria === categoria;
    const matchDificuldade = !dificuldade || p.dificuldade === dificuldade;
    return matchCategoria && matchDificuldade;
  });
  
  // Se não houver perguntas suficientes após filtro, usa todas disponíveis
  if (perguntasFiltradas.length === 0) {
    console.warn('Nenhuma pergunta encontrada com os filtros, usando todas');
    perguntasFiltradas = todasPerguntas;
  }
  
  // Recuperar histórico de perguntas recentes (últimas 50)
  const perguntasRecentes = getPerguntasRecentes();
  
  // Separar perguntas em "novas" e "antigas"
  const perguntasNovas = perguntasFiltradas.filter(p => !perguntasRecentes.includes(p.id));
  const perguntasAntigas = perguntasFiltradas.filter(p => perguntasRecentes.includes(p.id));
  
  // Priorizar perguntas novas
  let perguntasSelecionadas = [];
  
  // Primeiro: pegar perguntas que não foram vistas recentemente
  if (perguntasNovas.length >= quantidade) {
    perguntasSelecionadas = shuffleArray(perguntasNovas).slice(0, quantidade);
  } else {
    // Se não houver perguntas novas suficientes, complementar com antigas
    perguntasSelecionadas = [
      ...shuffleArray(perguntasNovas),
      ...shuffleArray(perguntasAntigas)
    ].slice(0, quantidade);
  }
  
  // Embaralhar seleção final
  return shuffleArray(perguntasSelecionadas);
}

// ========================================
// 💾 GERENCIAMENTO DE HISTÓRICO LOCAL
// ========================================

/**
 * Salva IDs das perguntas do quiz atual no histórico
 */
function salvarPerguntasNoHistorico(perguntasIds) {
  try {
    const historico = getPerguntasRecentes();
    const novoHistorico = [...new Set([...perguntasIds, ...historico])].slice(0, 50);
    localStorage.setItem('quiz_perguntas_recentes', JSON.stringify(novoHistorico));
  } catch (e) {
    console.warn('Não foi possível salvar histórico:', e);
  }
}

/**
 * Recupera IDs das perguntas respondidas recentemente
 */
function getPerguntasRecentes() {
  try {
    const historico = localStorage.getItem('quiz_perguntas_recentes');
    return historico ? JSON.parse(historico) : [];
  } catch (e) {
    console.warn('Erro ao recuperar histórico:', e);
    return [];
  }
}

/**
 * Limpa histórico de perguntas (útil para testes ou reset)
 */
function limparHistoricoPerguntas() {
  localStorage.removeItem('quiz_perguntas_recentes');
  console.log('✅ Histórico de perguntas limpo');
}

/**
 * Função para usuário resetar histórico manualmente
 */
function resetarHistoricoPerguntas() {
  if (confirm('🔄 Deseja limpar o histórico de perguntas vistas?\n\nVocê começará a ver perguntas que já respondeu anteriormente.')) {
    limparHistoricoPerguntas();
    alert('✅ Histórico limpo! Agora você verá todas as perguntas novamente.');
  }
}

// ========================================
// 🎲 DISTRIBUIÇÃO BALANCEADA (OPCIONAL)
// ========================================

/**
 * Distribui perguntas balanceando categorias/dificuldades
 * Útil quando não há filtros específicos
 */
function selecionarPerguntasBalanceadas(todasPerguntas, quantidade) {
  // Agrupar por dificuldade
  const porDificuldade = {
    facil: todasPerguntas.filter(p => p.dificuldade === 'facil'),
    medio: todasPerguntas.filter(p => p.dificuldade === 'medio'),
    dificil: todasPerguntas.filter(p => p.dificuldade === 'dificil')
  };
  
  // Calcular proporção ideal (40% fácil, 40% médio, 20% difícil)
  const proporcao = {
    facil: Math.round(quantidade * 0.4),
    medio: Math.round(quantidade * 0.4),
    dificil: Math.round(quantidade * 0.2)
  };
  
  let selecionadas = [];
  
  // Selecionar de cada dificuldade
  for (const [dif, qtd] of Object.entries(proporcao)) {
    const disponiveis = porDificuldade[dif] || [];
    const embaralhadas = shuffleArray(disponiveis);
    selecionadas.push(...embaralhadas.slice(0, Math.min(qtd, disponiveis.length)));
  }
  
  // Se não atingiu a quantidade, complementar com perguntas aleatórias
  if (selecionadas.length < quantidade) {
    const faltam = quantidade - selecionadas.length;
    const idsUsados = new Set(selecionadas.map(p => p.id));
    const restantes = todasPerguntas.filter(p => !idsUsados.has(p.id));
    selecionadas.push(...shuffleArray(restantes).slice(0, faltam));
  }
  
  // Embaralhar ordem final
  return shuffleArray(selecionadas).slice(0, quantidade);
}

// ========================================
// INICIALIZAÇÃO
// ========================================

async function carregarCategorias() {
  try {
    const res = await fetch('/api/categorias');
    if (!res.ok) throw new Error('Erro ao buscar categorias');
    const categorias = await res.json();
    const select = document.getElementById('categoriaSelect');
    select.innerHTML = `<option value="">Todas as categorias</option>`;
    categorias.forEach(cat => {
      const option = document.createElement('option');
      option.value = cat;
      option.textContent = cat;
      select.appendChild(option);
    });
    showStartButton();
  } catch (e) {
    console.error(e);
    showStartButton();
  }
}

function showStartButton() {
  loadingSpinner.style.display = 'none';
  startBtnText.style.display = 'inline';
  startBtnIcon.style.display = 'inline';
  startBtn.disabled = false;
  
  if (typeof feather !== 'undefined') {
    feather.replace();
  }
}

carregarCategorias();

// ========================================
// INICIAR QUIZ - VERSÃO MELHORADA
// ========================================

document.getElementById('startBtn').addEventListener('click', async () => {
  const amount = parseInt(document.getElementById('numQuestions').value);
  const categoria = document.getElementById('categoriaSelect').value;
  const dificuldade = document.getElementById('dificuldadeSelect').value;
  const tempo = parseInt(document.getElementById('tempoPergunta').value);

  // 🔒 LIMITE MÁXIMO DE QUESTÕES
  const MAX_QUESTOES = 50; // coloque o valor que quiser

  if (amount > MAX_QUESTOES) {
    alert(`⚠️ O máximo permitido é ${MAX_QUESTOES} questões.`);
    return; // impede o quiz de iniciar
  }

  // Salvar configurações
  quizSettings = { amount, categoria, dificuldade, tempo };
  
  startBtn.disabled = true;
  startBtn.innerHTML = '<span class="loading"></span> Carregando...';
  
  try {
    const q = encodeURIComponent(categoria);
    const d = encodeURIComponent(dificuldade);
    const res = await fetch(`/api/perguntas_quiz?categoria=${q}&dificuldade=${d}`);
    if(!res.ok) throw new Error('Sem API');
    const data = await res.json();
    
    // Formatar perguntas
    const perguntasFormatadas = data.map(p => ({
      id: p.id,
      titulo: p.titulo,
      conteudo: p.conteudo,
      categoria: p.categoria,
      dificuldade: p.dificuldade,
      opcoes: p.opcoes || ['Opção A','Opção B','Opção C','Opção D'],
      resposta: p.respostaIndex ?? 0
    }));
    
    // ✨ USAR SELEÇÃO INTELIGENTE COM EMBARALHAMENTO MELHORADO
    if (categoria || dificuldade) {
      // Com filtros: seleção inteligente evitando repetições
      questions = selecionarPerguntasInteligente(
        perguntasFormatadas, 
        amount, 
        categoria, 
        dificuldade
      );
      perguntasRespondidasIDs = questions.map(q => q.id);

    } else {
      // Sem filtros: seleção balanceada
      questions = selecionarPerguntasBalanceadas(perguntasFormatadas, amount);
    }
    
    if (questions.length === 0) throw new Error('Sem perguntas na API');
    
    // Salvar IDs no histórico para evitar repetições futuras
    salvarPerguntasNoHistorico(questions.map(q => q.id));
    
  } catch(e) {
    console.warn('Usando perguntas fallback:', e);
    
    // Aplicar mesma lógica inteligente ao fallback
    if (categoria || dificuldade) {
      questions = selecionarPerguntasInteligente(
        fallbackQuestions, 
        amount, 
        categoria, 
        dificuldade
      );

      perguntasRespondidasIDs = questions.map(q => q.id);

    } else {
      questions = selecionarPerguntasBalanceadas(fallbackQuestions, amount);
    }
    
    salvarPerguntasNoHistorico(questions.map(q => q.id));
  }
  
  userAnswers = Array(questions.length).fill(null);
  currentIndex = 0;
  document.getElementById('quizSetup').style.display='none';
  document.getElementById('quizPlay').style.display='block';
  
  quizStartTime = new Date();
  startTimer(tempo);
  renderQuestion();
});

// ========================================
// RENDERIZAR PERGUNTA
// ========================================

function renderQuestion(){
  const q = questions[currentIndex];
  document.getElementById('progressText').textContent = `Pergunta ${currentIndex+1} / ${questions.length}`;
  document.getElementById('questionText').textContent = q.titulo;
  
  const choicesEl = document.getElementById('choices');
  choicesEl.innerHTML = q.opcoes.map((opt,i) => 
    `<div class="choice" onclick="selectChoice(${i})" data-index="${i}">${opt}</div>`
  ).join('');
  
  const sel = userAnswers[currentIndex];
  if(sel !== null){
    const els = choicesEl.querySelectorAll('.choice');
    if(els[sel]) {
      els[sel].classList.add('selected');
      // Se já respondeu, mostra correto/errado
      els.forEach((el, index) => {
        if (index === q.resposta) {
          el.classList.add('correct');
        }
        if (index === sel && sel !== q.resposta) {
          el.classList.add('wrong');
        }
      });
    }
    nextBtn.disabled = false;
  } else {
    nextBtn.disabled = true;
  }
  
  updateProgressBar();
  updateQuestionIndicators();
  
  if (typeof feather !== 'undefined') {
    feather.replace();
  }
}

// ========================================
// SELECIONAR RESPOSTA 
// ========================================

function selectChoice(i) {
  // Se já respondeu, não deixa trocar
  if (userAnswers[currentIndex] !== null) {
    return;
  }
  
  userAnswers[currentIndex] = i;
  const q = questions[currentIndex];
  const choices = document.querySelectorAll('.choice');

  // Para o timer ao responder
  stopTimer();
  
  // Adiciona animação de feedback
  choices.forEach((el, index) => {
    el.style.pointerEvents = 'none'; // Desabilita cliques
    
    if (index === q.resposta) {
      setTimeout(() => el.classList.add('correct'), 100);
    }
    if (index === i && i !== q.resposta) {
      setTimeout(() => el.classList.add('wrong'), 100);
    }
  });
  
  // Habilita botão próxima
  nextBtn.disabled = false;
  
  // Feedback sonoro (opcional)
  if (i === q.resposta) {
    console.log('✅ Resposta correta!');
  } else {
    console.log('❌ Resposta incorreta!');
  }
}

// ========================================
// NAVEGAÇÃO 
// ========================================

function prevQuestion(){
  if(currentIndex === 0) return;
  
  stopTimer();
  currentIndex--;
  
  // Se a pergunta anterior foi respondida, não reinicia o timer
  if (userAnswers[currentIndex] !== null) {
    renderQuestion();
  } else {
    startTimer(quizSettings.tempo);
    renderQuestion();
  }
}

function nextQuestion(){
  // Confirmação se não respondeu
  if (userAnswers[currentIndex] === null) {
    const confirmar = confirm(
      '⚠️ Você não respondeu esta pergunta!\n\n' +
      'Deseja pular mesmo assim? A questão será contada como errada.'
    );
    if (!confirmar) return;
  }
  
  stopTimer();
  currentIndex++;
  
  if(currentIndex >= questions.length){
    finishQuiz();
  } else {
    // Só inicia timer se a próxima pergunta não foi respondida
    if (userAnswers[currentIndex] === null) {
      startTimer(quizSettings.tempo);
    }
    renderQuestion();
  }
}

// ========================================
// ENCERRAR ANTECIPADAMENTE 
// ========================================

function confirmarEncerrarQuiz() {
  const confirmar = confirm(
    '⚠️ Tem certeza que deseja encerrar o quiz agora?\n\n' +
    'Suas respostas até o momento serão salvas, mas você não completará todas as perguntas.'
  );
  
  if (confirmar) {
    finishQuiz(true);
  }
}

// ========================================
// FINALIZAR QUIZ 
// ========================================

function finishQuiz(antecipado = false){
  stopTimer();
  document.getElementById('quizPlay').style.display='none';
  document.getElementById('quizResult').style.display='block';
  
  // Calcula quantas perguntas foram respondidas
  const perguntasRespondidas = antecipado ? currentIndex + 1 : questions.length;
  
  let acertos = 0;
  for (let i = 0; i < perguntasRespondidas; i++) {
    if (userAnswers[i] === questions[i].resposta) {
      acertos++;
    }
  }
  
  const tempoGasto = Math.round((new Date() - quizStartTime) / 1000);
  const scorePercent = perguntasRespondidas > 0 ? Math.round(acertos / perguntasRespondidas * 100) : 0;
  
  // Emoji baseado no desempenho
  let emoji = '📊';
  if (scorePercent >= 90) emoji = '🏆';
  else if (scorePercent >= 70) emoji = '⭐';
  else if (scorePercent >= 50) emoji = '👍';
  else emoji = '📚';
  
  // Monta HTML do resultado
  let resultHTML = '';
  
  if (antecipado) {
    resultHTML += `<p style="color: #f59e0b; font-weight: 600; margin-bottom: 12px;">⚠️ Quiz encerrado antecipadamente</p>`;
  }
  
  resultHTML += `
    <p style="font-size: 48px; margin: 20px 0;">${emoji}</p>
    <p>Você acertou <strong>${acertos}</strong> de <strong>${perguntasRespondidas}</strong> perguntas ${antecipado ? 'respondidas' : ''}</p>
    <p>Aproveitamento: <strong style="font-size: 24px; color: var(--accent);">${scorePercent}%</strong></p>
    <p>Tempo total: <strong>${formatarTempo(tempoGasto)}</strong></p>
  `;
  
  document.getElementById('scoreSummary').innerHTML = resultHTML;
  
  // Adiciona botão de revisão
  const resultActions = document.querySelector('.result-actions');
  if (!document.getElementById('revisaoBtn')) {
    const revisaoBtn = document.createElement('button');
    revisaoBtn.id = 'revisaoBtn';
    revisaoBtn.className = 'btn btn-secondary';
    revisaoBtn.innerHTML = '<i data-feather="eye"></i> Ver Revisão';
    revisaoBtn.onclick = mostrarRevisao;
    resultActions.insertBefore(revisaoBtn, resultActions.firstChild);
  }
  
  // Salva resultado
  saveResult({
    acertos,
    total: perguntasRespondidas,
    dificuldade: quizSettings.dificuldade || null,
    categoria: quizSettings.categoria || null,
    tempo_gasto: tempoGasto,
    ids_perguntas: perguntasRespondidasIDs
  });
  
  if (typeof feather !== 'undefined') {
    feather.replace();
  }
}

// ========================================
// MODO REVISÃO
// ========================================

function mostrarRevisao() {
  const quizResult = document.getElementById('quizResult');
  quizResult.innerHTML = `
    <div class="result-container">
      <h3 style="display: flex; align-items: center; gap: 10px; margin-bottom: 24px;">
        <i data-feather="eye"></i>
        Revisão do Quiz
      </h3>
      <div id="revisaoContainer"></div>
      <button class="btn btn-primary" onclick="location.reload()" style="margin-top: 24px;">
        <i data-feather="refresh-cw"></i>
        Novo Quiz
      </button>
    </div>
  `;
  
  const container = document.getElementById('revisaoContainer');
  
  questions.forEach((q, index) => {
    const userAnswer = userAnswers[index];
    const correct = userAnswer === q.resposta;
    const answered = userAnswer !== null;
    
    const questionDiv = document.createElement('div');
    questionDiv.className = 'historico-item';
    questionDiv.style.marginBottom = '20px';
    
    let statusIcon = '';
    let statusColor = '';
    
    if (!answered) {
      statusIcon = '⭕️';
      statusColor = '#94a3b8';
    } else if (correct) {
      statusIcon = '✅';
      statusColor = '#10b981';
    } else {
      statusIcon = '❌';
      statusColor = '#ef4444';
    }
    
    questionDiv.innerHTML = `
      <div style="margin-bottom: 12px;">
        <span style="font-size: 24px;">${statusIcon}</span>
        <strong style="color: ${statusColor}; margin-left: 8px;">
          Questão ${index + 1}
        </strong>
      </div>
      <p style="font-weight: 600; margin-bottom: 12px;">${q.titulo}</p>
      ${q.opcoes.map((opt, i) => {
        let style = 'padding: 8px 12px; margin: 4px 0; border-radius: 6px; border: 2px solid ';
        
        if (i === q.resposta) {
          style += '#10b981; background: rgba(16, 185, 129, 0.1); font-weight: 600;';
        } else if (i === userAnswer && userAnswer !== q.resposta) {
          style += '#ef4444; background: rgba(239, 68, 68, 0.1);';
        } else {
          style += 'var(--border); background: var(--bg);';
        }
        
        let prefix = '';
        if (i === q.resposta) prefix = '✓ ';
        if (i === userAnswer && userAnswer !== q.resposta) prefix = '✗ ';
        
        return `<div style="${style}">${prefix}${opt}</div>`;
      }).join('')}
      ${!answered ? '<p style="color: #f59e0b; margin-top: 12px;"><strong>⚠️ Não respondida</strong></p>' : ''}
    `;
    
    container.appendChild(questionDiv);
  });
  
  if (typeof feather !== 'undefined') {
    feather.replace();
  }
}

// ========================================
// INDICADORES DE PROGRESSO
// ========================================

function updateQuestionIndicators() {
  const progressText = document.getElementById('progressText');
  const answered = userAnswers.filter(a => a !== null).length;
  progressText.innerHTML = `
    Pergunta ${currentIndex+1} / ${questions.length}
    <span style="color: var(--success); margin-left: 8px;">
      (${answered} ${answered === 1 ? 'respondida' : 'respondidas'})
    </span>
  `;
}

// ========================================
// TIMER 
// ========================================

function startTimer(seconds){
  timeLeft = seconds;
  updateTimerDisplay();
  if(timerInterval) clearInterval(timerInterval);
  
  timerInterval = setInterval(()=> {
    timeLeft--;
    updateTimerDisplay();
    
    // Alerta visual quando faltam 10 segundos
    const timerEl = document.getElementById('timer');
    if (timeLeft <= 10) {
      timerEl.style.animation = 'pulse 1s infinite';
    } else {
      timerEl.style.animation = 'none';
    }
    
    if(timeLeft <= 0){
      clearInterval(timerInterval);
      // Marca como não respondida e avança
      if (userAnswers[currentIndex] === null) {
        console.log('⏰ Tempo esgotado!');
      }
      setTimeout(() => nextQuestion(), 1000);
    }
  }, 1000);
}

function updateTimerDisplay() {
  const minutes = Math.floor(timeLeft / 60);
  const seconds = timeLeft % 60;
  const timerEl = document.getElementById('timer');
  const timerSpan = timerEl.querySelector('span');
  if (timerSpan) {
    timerSpan.textContent = `${String(minutes).padStart(2,'0')}:${String(seconds).padStart(2,'0')}`;
  }
}

function stopTimer(){ 
  if(timerInterval) {
    clearInterval(timerInterval);
    timerInterval = null;
  }
  
  // Remove animação do timer
  const timerEl = document.getElementById('timer');
  if (timerEl) {
    timerEl.style.animation = 'none';
  }
}

// ========================================
// UTILS
// ========================================

function updateProgressBar(){
  const pct = Math.round(((currentIndex + 1) / questions.length) * 100);
  document.getElementById('progressBar').style.width = pct + '%';
}

function formatarTempo(segundos) {
  const mins = Math.floor(segundos / 60);
  const secs = segundos % 60;
  if (mins > 0) {
    return `${mins}min ${secs}s`;
  }
  return `${secs} segundos`;
}

// ========================================
// SALVAR RESULTADO
// ========================================

async function saveResult(payload){
  try{
    const response = await fetch('/api/quiz/result', {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body:JSON.stringify(payload)
    });
    
    if (response.ok) {
      console.log('✅ Resultado salvo com sucesso');
    }
  }catch(e){
    console.warn('⚠️ Não foi possível salvar resultado:',e);
  }
}

// ========================================
// HISTÓRICO - PARTE COMPLETA
// ========================================

let historicoAberto = false;
const setupDiv = document.getElementById('quizSetup');
const verHistoricoBtn = document.getElementById('verHistoricoBtn');
let containerHistorico = null;

verHistoricoBtn.addEventListener('click', async () => {
  if (historicoAberto) {
    if (containerHistorico) {
      setupDiv.removeChild(containerHistorico);
      containerHistorico = null;
    }
    historicoAberto = false;
    verHistoricoBtn.innerHTML = '<i data-feather="bar-chart"></i> Ver Histórico';
    if (typeof feather !== 'undefined') {
      feather.replace();
    }
    return;
  }

  try {
    verHistoricoBtn.innerHTML = '<span class="loading"></span> Carregando...';
    
    const res = await fetch('/api/quiz/historico');
    if (!res.ok) throw new Error('Erro ao buscar histórico');
    const historico = await res.json();

    containerHistorico = document.createElement('div');
    containerHistorico.className = 'historico-container';
    
    // Header com botão de reset
    const headerDiv = document.createElement('div');
    headerDiv.style.cssText = 'display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 12px;';
    headerDiv.innerHTML = `
      <h3 style="margin: 0;">Histórico de Resultados</h3>
      <button class="btn btn-secondary" onclick="resetarHistoricoPerguntas()" style="font-size: 14px; padding: 8px 16px;">
        <i data-feather="refresh-cw"></i>
        Resetar Perguntas Vistas
      </button>
    `;
    containerHistorico.appendChild(headerDiv);

    if (historico.length === 0) {
      const noData = document.createElement('p');
      noData.textContent = 'Nenhum resultado encontrado. Complete um quiz para ver seu histórico!';
      noData.style.textAlign = 'center';
      noData.style.color = 'var(--muted)';
      noData.style.padding = '20px';
      containerHistorico.appendChild(noData);
    } else {
      historico.forEach((r) => {
        const scorePercent = Math.round((r.acertos / r.total) * 100);
        
        const item = document.createElement('div');
        item.className = 'historico-item';
        item.innerHTML = `
          <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
            <div>
              <strong>${r.acertos}/${r.total}</strong> 
              <span style="color: var(--muted);">(${scorePercent}%)</span>
              ${r.categoria ? `• <span style="color: var(--accent);">${r.categoria}</span>` : ''}
              ${r.dificuldade ? `• <span style="color: var(--muted);">${r.dificuldade}</span>` : ''}
            </div>
            <div style="text-align: right;">
              <div style="font-weight: 600; color: var(--accent);">
                ⏱️ ${r.tempo_gasto !== null ? formatarTempo(r.tempo_gasto) : 'N/A'}
              </div>
              <small style="color: var(--muted);">${new Date(r.criado_em).toLocaleString('pt-BR')}</small>
            </div>
          </div>
        `;
        containerHistorico.appendChild(item);
      });
    }

    setupDiv.appendChild(containerHistorico);
    historicoAberto = true;
    verHistoricoBtn.innerHTML = '<i data-feather="x"></i> Fechar Histórico';
    
    if (typeof feather !== 'undefined') {
      feather.replace();
    }
    
  } catch (e) {
    alert('Não foi possível carregar o histórico. Tente novamente.');
    console.error(e);
    verHistoricoBtn.innerHTML = '<i data-feather="bar-chart"></i> Ver Histórico';
    if (typeof feather !== 'undefined') {
      feather.replace();
    }
  }
});