-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/11/2025 às 20:22
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `code_quest`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conquistas`
--

CREATE TABLE `conquistas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `icone` varchar(10) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conquistas`
--

INSERT INTO `conquistas` (`id`, `titulo`, `icone`, `usuario_id`) VALUES
(1, 'Primeiro Desafio', '🎯', 14),
(2, 'Pergunteiro Nível 10', '🔍', 14),
(3, 'Acertador Nível 10', '✅', 14),
(4, 'Primeiros Passos', '🌱', 14),
(5, 'Caçador de Quizzes', '🏹', 14),
(6, 'Mestre dos Acertos', '🌟', 14),
(7, 'Explorador de Dificuldades', '⚡', 14),
(9, 'Ajudante da Comunidade', '🤝', 14),
(10, 'Quiz Master Semanal', '🎮', 14),
(12, 'Primeiro Desafio', '🎯', 15),
(13, 'Frequência Assídua', '📅', 14),
(14, 'Cem Acertos!', '💯', 14),
(15, 'Acertador Nível 10', '✅', 15),
(16, 'Quiz Master Semanal', '🎮', 15),
(17, 'Maratonista de Quiz', '🏃', 14),
(18, 'Perfeccionista', '🎯', 14),
(19, 'Mente Veloz', '⚡', 14),
(20, 'Poliglota', '🌐', 14),
(21, 'Identidade Digital', '🆔', 14),
(22, 'Poliglota', '🌐', 15),
(23, 'Identidade Digital', '🆔', 15),
(24, 'Coruja da Noite', '🦉', 14);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_perguntas`
--

CREATE TABLE `log_perguntas` (
  `id` int(11) NOT NULL,
  `pergunta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `acao` enum('criacao','edicao','remocao') NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_perguntas`
--

INSERT INTO `log_perguntas` (`id`, `pergunta_id`, `usuario_id`, `acao`, `data_log`) VALUES
(3, 108, 14, 'criacao', '2025-10-21 02:16:34'),
(4, 108, 14, 'edicao', '2025-10-21 02:17:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_respostas`
--

CREATE TABLE `log_respostas` (
  `id` int(11) NOT NULL,
  `resposta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `acao` enum('criacao','edicao','remocao') NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_respostas`
--

INSERT INTO `log_respostas` (`id`, `resposta_id`, `usuario_id`, `acao`, `data_log`) VALUES
(24, 37, 11, 'criacao', '2025-06-11 23:05:30'),
(25, 38, 11, 'criacao', '2025-06-11 23:08:17'),
(26, 39, 2, 'criacao', '2025-06-11 23:14:50'),
(27, 40, 2, 'criacao', '2025-06-11 23:14:50'),
(28, 41, 2, 'criacao', '2025-06-11 23:14:50'),
(29, 42, 2, 'criacao', '2025-06-11 23:14:50'),
(30, 43, 2, 'criacao', '2025-06-11 23:14:50'),
(31, 44, 3, 'criacao', '2025-06-11 23:14:50'),
(32, 45, 3, 'criacao', '2025-06-11 23:14:50'),
(33, 46, 3, 'criacao', '2025-06-11 23:14:50'),
(34, 47, 3, 'criacao', '2025-06-11 23:14:50'),
(35, 48, 3, 'criacao', '2025-06-11 23:14:50'),
(36, 49, 7, 'criacao', '2025-06-11 23:14:50'),
(37, 50, 7, 'criacao', '2025-06-11 23:14:50'),
(38, 51, 7, 'criacao', '2025-06-11 23:14:50'),
(39, 52, 7, 'criacao', '2025-06-11 23:14:50'),
(40, 53, 7, 'criacao', '2025-06-11 23:14:50'),
(41, 54, 8, 'criacao', '2025-06-11 23:14:50'),
(42, 55, 8, 'criacao', '2025-06-11 23:14:50'),
(43, 56, 8, 'criacao', '2025-06-11 23:14:50'),
(44, 57, 8, 'criacao', '2025-06-11 23:14:50'),
(45, 58, 8, 'criacao', '2025-06-11 23:14:50'),
(46, 59, 10, 'criacao', '2025-06-11 23:14:50'),
(47, 60, 10, 'criacao', '2025-06-11 23:14:50'),
(48, 61, 10, 'criacao', '2025-06-11 23:14:50'),
(49, 62, 10, 'criacao', '2025-06-11 23:14:50'),
(50, 63, 10, 'criacao', '2025-06-11 23:14:50'),
(51, 64, 2, 'criacao', '2025-06-11 23:14:50'),
(52, 65, 2, 'criacao', '2025-06-11 23:14:50'),
(53, 66, 2, 'criacao', '2025-06-11 23:14:50'),
(54, 67, 3, 'criacao', '2025-06-11 23:14:50'),
(55, 68, 3, 'criacao', '2025-06-11 23:14:50'),
(62, 75, 2, '', '2025-09-03 23:29:46'),
(63, 76, 3, '', '2025-09-03 23:29:46'),
(64, 77, 7, '', '2025-09-03 23:29:46'),
(65, 78, 8, '', '2025-09-03 23:29:47'),
(66, 79, 10, '', '2025-09-03 23:29:47'),
(67, 80, 14, '', '2025-09-03 23:29:47'),
(68, 81, 14, '', '2025-09-03 23:29:47'),
(69, 82, 14, '', '2025-09-03 23:29:47'),
(70, 83, 14, '', '2025-09-03 23:29:47'),
(71, 84, 14, '', '2025-09-03 23:29:47'),
(72, 85, 2, '', '2025-09-03 23:29:47'),
(73, 86, 3, '', '2025-09-03 23:29:47'),
(74, 87, 7, '', '2025-09-03 23:29:47'),
(75, 88, 8, '', '2025-09-03 23:29:47'),
(76, 89, 10, '', '2025-09-03 23:29:47'),
(77, 90, 14, '', '2025-09-03 23:29:47'),
(78, 91, 2, '', '2025-09-03 23:29:47'),
(79, 92, 3, '', '2025-09-03 23:29:47'),
(80, 93, 7, '', '2025-09-03 23:29:47'),
(81, 94, 8, '', '2025-09-03 23:29:47'),
(82, 95, 10, '', '2025-09-03 23:29:47'),
(83, 96, 14, '', '2025-09-03 23:29:47'),
(84, 97, 2, '', '2025-09-03 23:29:47'),
(85, 98, 3, '', '2025-09-03 23:29:47'),
(86, 99, 7, '', '2025-09-03 23:29:47'),
(87, 100, 8, '', '2025-09-03 23:29:47'),
(88, 101, 10, '', '2025-09-03 23:29:47'),
(89, 102, 14, '', '2025-09-03 23:29:47'),
(90, 103, 2, '', '2025-09-03 23:29:47'),
(91, 104, 3, '', '2025-09-03 23:29:47'),
(92, 105, 7, '', '2025-09-03 23:29:47'),
(93, 106, 8, '', '2025-09-03 23:29:47'),
(94, 107, 10, '', '2025-09-03 23:29:47'),
(95, 108, 14, '', '2025-09-03 23:29:47');

-- --------------------------------------------------------

--
-- Estrutura para tabela `metas_semanal`
--

CREATE TABLE `metas_semanal` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `meta_perguntas` int(11) DEFAULT 5,
  `meta_quizzes` int(11) DEFAULT 3,
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_respostas` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `metas_semanal`
--

INSERT INTO `metas_semanal` (`id`, `usuario_id`, `meta_perguntas`, `meta_quizzes`, `atualizado_em`, `meta_respostas`) VALUES
(1, 14, 10, 8, '2025-10-22 03:21:41', 5),
(3, 16, 5, 3, '2025-10-14 19:05:55', 5),
(4, 15, 5, 3, '2025-10-14 21:57:35', 5),
(5, 8, 5, 3, '2025-10-15 03:25:25', 5),
(6, 17, 5, 3, '2025-11-22 02:21:33', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `dificuldade` enum('facil','medio','dificil') DEFAULT 'medio',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perguntas`
--

INSERT INTO `perguntas` (`id`, `usuario_id`, `titulo`, `conteudo`, `categoria`, `dificuldade`, `criado_em`, `atualizado_em`) VALUES
(23, 11, 'O que são variáveis em programação?', 'Explique o conceito de variáveis, sua finalidade e como elas são usadas para armazenar dados em um programa.', 'Outros', 'facil', '2025-06-12 02:04:34', '2025-06-12 02:04:34'),
(24, 11, ' Qual a diferença entre if/else e switch (ou match/case em Python) em estruturas de controle?', 'Descreva quando usar cada uma dessas estruturas para controlar o fluxo de execução do seu código.', 'Python', 'medio', '2025-06-12 02:07:37', '2025-06-12 02:07:37'),
(25, 2, 'O que é um array em Python?', 'Explique o conceito de array (lista) em Python e como ele é diferente de outros tipos de coleção.', 'Python', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(26, 2, 'Como funciona o Virtual DOM no React?', 'Descreva o conceito de Virtual DOM no React e seus benefícios para a performance.', 'Frontend', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(27, 2, 'O que são filas e pilhas (queues e stacks)?', 'Explique as estruturas de dados de fila e pilha, suas operações básicas e aplicações.', 'Estrutura de Dados', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(28, 2, 'Qual a diferença entre SQL e NoSQL?', 'Compare bancos de dados SQL e NoSQL, mencionando seus pontos fortes e casos de uso típicos.', 'Banco de Dados', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(29, 2, 'O que é Injeção de Dependência?', 'Defina Injeção de Dependência (DI) e como ela ajuda na arquitetura de software.', 'Arquitetura', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(30, 3, 'Como otimizar queries SQL lentas?', 'Quais são as principais estratégias para melhorar a performance de consultas SQL complexas?', 'SQL', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(31, 3, 'O que é TDD (Test-Driven Development)?', 'Explique o que é Desenvolvimento Orientado a Testes (TDD) e seus ciclos.', 'Metodologias Ágeis', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(32, 3, 'Para que serve o método `map()` em JavaScript?', 'Descreva a função do método `map()` para arrays em JavaScript e um exemplo de uso.', 'JavaScript', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(33, 3, 'O que é encapsulamento em POO?', 'Defina o princípio de encapsulamento na Programação Orientada a Objetos.', 'POO', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(34, 3, 'Como lidar com erros em Python (try-except)?', 'Explique como usar blocos `try`, `except` e `finally` para tratamento de exceções em Python.', 'Python', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(35, 7, 'O que é versionamento de código (Git)?', 'Explique a importância do controle de versão com Git para projetos de software.', 'DevOps', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(36, 7, 'Qual a diferença entre Threads e Processos?', 'Compare threads e processos em sistemas operacionais e como eles se relacionam com a concorrência.', 'Sistemas Operacionais', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(37, 7, 'O que é um ORM (Object-Relational Mapper)?', 'Descreva o papel de um ORM como SQLAlchemy ou Hibernate no desenvolvimento web.', 'Banco de Dados', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(38, 7, 'O que são APIs GraphQL?', 'Compare APIs GraphQL com APIs RESTful e seus benefícios.', 'Backend', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(39, 7, 'Como depurar código em Python?', 'Quais ferramentas e técnicas são úteis para depurar programas Python?', 'Python', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(40, 8, 'Qual a função de um servidor web?', 'Explique o que faz um servidor web e exemplos populares.', 'Redes', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(41, 8, 'O que é programação assíncrona?', 'Descreva o conceito de programação assíncrona e quando usá-la.', 'Lógica de Programação', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(42, 8, 'Como funciona o CSS Grid e Flexbox?', 'Compare CSS Grid e Flexbox para layouts responsivos em CSS.', 'Frontend', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(43, 8, 'O que é Teste de Integração?', 'Explique o que é Teste de Integração e sua importância no ciclo de desenvolvimento.', 'Qualidade', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(44, 8, 'O que é Docker e para que serve?', 'Defina Docker e como ele facilita o deploy de aplicações.', 'DevOps', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(45, 10, 'O que são algoritmos de ordenação?', 'Liste e descreva brevemente alguns algoritmos de ordenação comuns.', 'Algoritmos', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(46, 10, 'Qual a importância de um bom design de banco de dados?', 'Por que é crucial ter um bom design de esquema de banco de dados?', 'Banco de Dados', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(47, 10, 'O que é Single Page Application (SPA)?', 'Descreva o conceito de SPA no desenvolvimento web frontend.', 'Frontend', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(48, 10, 'O que é Clean Code?', 'Explique os princípios de Clean Code e por que é importante escrever código limpo.', 'Boas Práticas', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(49, 10, 'Como funciona o OAuth 2.0?', 'Explique o fluxo básico de autenticação e autorização com OAuth 2.0.', 'Segurança', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(50, 2, 'O que é o conceito de DRY na programação?', 'Explique o princípio DRY (Don\'t Repeat Yourself) e sua aplicação.', 'Boas Práticas', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(51, 2, 'Para que servem os Decorators em Python?', 'Descreva o uso de decorators em Python com um exemplo básico.', 'Python', 'dificil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(52, 2, 'Como funciona a comunicação Cliente-Servidor?', 'Explique o modelo de comunicação cliente-servidor em redes.', 'Redes', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(53, 3, 'O que é uma chave primária e estrangeira em SQL?', 'Defina chave primária e estrangeira e sua relação em um banco de dados relacional.', 'SQL', 'facil', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(54, 3, 'O que é um callback em JavaScript?', 'Explique o conceito de função callback em JavaScript e quando utilizá-la.', 'JavaScript', 'medio', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(56, 2, 'O que é uma chave estrangeira em banco de dados?', 'Explique o conceito de chave estrangeira e como ela relaciona tabelas.', 'Banco de Dados', 'facil', '2025-08-26 23:11:24', '2025-08-26 23:11:24'),
(57, 3, 'O que é programação orientada a objetos?', 'Defina o paradigma de programação orientada a objetos e seus quatro pilares.', 'POO', 'medio', '2025-08-26 23:11:24', '2025-08-26 23:11:24'),
(58, 7, 'Qual a diferença entre variáveis locais e globais?', 'Explique quando usar variáveis locais e globais e como elas são tratadas na memória.', 'Lógica de Programação', 'facil', '2025-08-26 23:11:24', '2025-08-26 23:11:24'),
(59, 8, 'O que é recursão em programação?', 'Descreva o conceito de recursão, como ela funciona e exemplos de uso.', 'Algoritmos', 'medio', '2025-08-26 23:11:24', '2025-08-26 23:11:24'),
(60, 10, 'Qual a importância de normalização em bancos de dados?', 'Explique os objetivos da normalização e os tipos de normal forms (1FN, 2FN, 3FN).', 'Banco de Dados', 'dificil', '2025-08-26 23:11:24', '2025-08-26 23:11:24'),
(61, 14, 'O que é um índice em banco de dados?', 'Explique o conceito de índice em um banco de dados relacional e sua importância para a performance.', 'Banco de Dados', 'medio', '2025-08-26 23:48:26', '2025-08-26 23:48:26'),
(62, 14, 'O que são Promises em JavaScript?', 'Descreva o que são Promises, quando utilizá-las e um exemplo básico de uso.', 'JavaScript', 'medio', '2025-08-26 23:48:26', '2025-08-26 23:48:26'),
(63, 14, 'Explique o conceito de API REST.', 'O que é uma API REST, seus principais métodos e boas práticas?', 'Backend', 'facil', '2025-08-26 23:48:26', '2025-08-26 23:48:26'),
(64, 14, 'O que é recursão e quando usar?', 'Defina recursão, suas vantagens, desvantagens e exemplos de uso.', 'Algoritmos', 'dificil', '2025-08-26 23:48:26', '2025-08-26 23:48:26'),
(65, 14, 'O que é responsividade em Frontend?', 'Explique o conceito de design responsivo e técnicas para implementá-lo.', 'Frontend', 'facil', '2025-08-26 23:48:26', '2025-08-26 23:48:26'),
(66, 2, 'O que é middleware em desenvolvimento web?', 'Explique o conceito de middleware, como funciona e exemplos de uso em frameworks como Express.js ou Django.', 'Backend', 'medio', '2025-09-01 18:00:00', '2025-09-01 18:00:00'),
(67, 3, 'Como funciona o sistema de cache em aplicações web?', 'Descreva os tipos de cache (browser, servidor, banco de dados) e suas estratégias de implementação.', 'Performance', 'dificil', '2025-09-01 18:05:00', '2025-09-01 18:05:00'),
(68, 7, 'O que são WebSockets e quando utilizá-los?', 'Explique a diferença entre HTTP tradicional e WebSockets, e em quais cenários usar cada um.', 'Redes', 'medio', '2025-09-01 18:10:00', '2025-09-01 18:10:00'),
(69, 8, 'Qual a diferença entre testes unitários, integração e E2E?', 'Compare os três tipos de teste, suas características e quando aplicar cada um no ciclo de desenvolvimento.', 'Qualidade', 'medio', '2025-09-01 18:15:00', '2025-09-01 18:15:00'),
(70, 10, 'Como implementar autenticação JWT em uma API?', 'Descreva o processo de implementação de JSON Web Tokens, incluindo geração, validação e renovação.', 'Segurança', 'dificil', '2025-09-01 18:20:00', '2025-09-01 18:20:00'),
(71, 14, 'O que é programação reativa?', 'Explique os conceitos fundamentais da programação reativa e suas vantagens em aplicações modernas.', 'Paradigmas', 'dificil', '2025-09-01 18:25:00', '2025-09-01 18:25:00'),
(72, 2, 'Como otimizar consultas em bancos NoSQL?', 'Quais estratégias podem ser usadas para melhorar a performance em bancos como MongoDB ou Cassandra?', 'NoSQL', 'dificil', '2025-09-01 18:30:00', '2025-09-01 18:30:00'),
(73, 3, 'O que são Progressive Web Apps (PWA)?', 'Defina PWAs, suas características principais e como diferem de aplicações web tradicionais.', 'Frontend', 'medio', '2025-09-01 18:35:00', '2025-09-01 18:35:00'),
(74, 7, 'Como funciona o garbage collection em Java?', 'Explique o processo de coleta de lixo em Java, seus algoritmos e como otimizar o uso de memória.', 'Java', 'dificil', '2025-09-01 18:40:00', '2025-09-01 18:40:00'),
(75, 8, 'O que é CI/CD e como implementar?', 'Descreva os conceitos de Integração Contínua e Deploy Contínuo, incluindo ferramentas e boas práticas.', 'DevOps', 'medio', '2025-09-01 18:45:00', '2025-09-01 18:45:00'),
(76, 10, 'Qual a diferença entre SQL e HQL?', 'Compare SQL padrão com Hibernate Query Language, suas sintaxes e casos de uso específicos.', 'ORM', 'medio', '2025-09-01 18:50:00', '2025-09-01 18:50:00'),
(77, 14, 'Como implementar paginação eficiente em APIs?', 'Explique diferentes estratégias de paginação (offset, cursor-based) e suas vantagens/desvantagens.', 'Backend', 'dificil', '2025-09-01 18:55:00', '2025-09-01 18:55:00'),
(78, 2, 'O que são closures em JavaScript?', 'Defina closures, como funcionam e exemplos práticos de uso em desenvolvimento JavaScript.', 'JavaScript', 'dificil', '2025-09-01 19:00:00', '2025-09-01 19:00:00'),
(79, 3, 'Como funciona o Virtual DOM vs Shadow DOM?', 'Compare esses dois conceitos, suas diferenças e aplicações em frameworks modernos.', 'Frontend', 'dificil', '2025-09-01 19:05:00', '2025-09-01 19:05:00'),
(80, 7, 'O que é load balancing e seus tipos?', 'Explique os conceitos de balanceamento de carga e os diferentes algoritmos utilizados.', 'Infraestrutura', 'dificil', '2025-09-01 19:10:00', '2025-09-01 19:10:00'),
(81, 8, 'Como implementar busca full-text em bancos de dados?', 'Descreva técnicas de busca textual avançada em PostgreSQL, MySQL ou Elasticsearch.', 'Banco de Dados', 'dificil', '2025-09-01 19:15:00', '2025-09-01 19:15:00'),
(82, 10, 'O que são design patterns e quais os mais usados?', 'Liste e explique os principais padrões de projeto em desenvolvimento de software.', 'Arquitetura', 'medio', '2025-09-01 19:20:00', '2025-09-01 19:20:00'),
(83, 14, 'Como funciona a tipagem estática vs dinâmica?', 'Compare linguagens com tipagem estática e dinâmica, vantagens e desvantagens de cada abordagem.', 'Tipos de Dados', 'medio', '2025-09-01 19:25:00', '2025-09-01 19:25:00'),
(84, 2, 'O que são microserviços e quando usar?', 'Explique a arquitetura de microserviços, seus benefícios e desafios comparados ao monolito.', 'Arquitetura', 'dificil', '2025-09-01 19:30:00', '2025-09-01 19:30:00'),
(85, 3, 'Como implementar rate limiting em APIs?', 'Descreva estratégias para controlar o número de requisições por usuário/IP em APIs REST.', 'Segurança', 'dificil', '2025-09-01 19:35:00', '2025-09-01 19:35:00'),
(86, 7, 'O que é event-driven architecture?', 'Explique arquitetura baseada em eventos, seus componentes e casos de uso típicos.', 'Arquitetura', 'dificil', '2025-09-01 19:40:00', '2025-09-01 19:40:00'),
(87, 8, 'Como otimizar imagens para web?', 'Quais técnicas e formatos usar para melhorar o carregamento de imagens em sites?', 'Frontend', 'facil', '2025-09-01 19:45:00', '2025-09-01 19:45:00'),
(88, 10, 'O que é database sharding?', 'Explique o conceito de fragmentação horizontal de dados e quando aplicá-la.', 'Banco de Dados', 'dificil', '2025-09-01 19:50:00', '2025-09-01 19:50:00'),
(89, 14, 'Como funciona o protocolo HTTP/2?', 'Descreva as melhorias do HTTP/2 em relação ao HTTP/1.1 e seu impacto na performance web.', 'Protocolos', 'dificil', '2025-09-01 19:55:00', '2025-09-01 19:55:00'),
(90, 2, 'O que são lambdas e higher-order functions?', 'Explique funções anônimas e funções de alta ordem, com exemplos em diferentes linguagens.', 'Programação Funcional', 'medio', '2025-09-01 20:00:00', '2025-09-01 20:00:00'),
(91, 3, 'Como implementar logging eficaz em aplicações?', 'Descreva níveis de log, estruturação e boas práticas para monitoramento de aplicações.', 'Monitoramento', 'medio', '2025-09-01 20:05:00', '2025-09-01 20:05:00'),
(92, 7, 'O que é containerização vs virtualização?', 'Compare containers (Docker) com máquinas virtuais tradicionais, vantagens e casos de uso.', 'DevOps', 'medio', '2025-09-01 20:10:00', '2025-09-01 20:10:00'),
(93, 8, 'Como funciona o algoritmo de hash consistente?', 'Explique consistent hashing, sua aplicação em sistemas distribuídos e load balancing.', 'Algoritmos', 'dificil', '2025-09-01 20:15:00', '2025-09-01 20:15:00'),
(94, 10, 'O que é CORS e como configurar?', 'Explique Cross-Origin Resource Sharing, seus problemas de segurança e configurações típicas.', 'Segurança', 'medio', '2025-09-01 20:20:00', '2025-09-01 20:20:00'),
(95, 14, 'Como otimizar queries com índices compostos?', 'Explique estratégias para criar e usar índices compostos eficientemente em SQL.', 'SQL', 'dificil', '2025-09-01 20:25:00', '2025-09-01 20:25:00'),
(96, 2, 'O que são Service Workers?', 'Descreva Service Workers, sua funcionalidade offline e implementação em PWAs.', 'Frontend', 'dificil', '2025-09-01 20:30:00', '2025-09-01 20:30:00'),
(97, 3, 'Como implementar cache distribuído?', 'Explique soluções como Redis ou Memcached para cache em arquiteturas distribuídas.', 'Cache', 'dificil', '2025-09-01 20:35:00', '2025-09-01 20:35:00'),
(98, 7, 'O que é dependency injection em frameworks?', 'Explique injeção de dependências em Spring, Angular ou outros frameworks modernos.', 'Frameworks', 'medio', '2025-09-01 20:40:00', '2025-09-01 20:40:00'),
(99, 8, 'Como funciona a serialização de dados?', 'Descreva diferentes formatos (JSON, XML, Binary) e quando usar cada um.', 'Serialização', 'medio', '2025-09-01 20:45:00', '2025-09-01 20:45:00'),
(100, 10, 'O que são database triggers e stored procedures?', 'Explique triggers e procedures, suas diferenças e casos de uso apropriados.', 'SQL', 'medio', '2025-09-01 20:50:00', '2025-09-01 20:50:00'),
(101, 14, 'Como implementar autenticação multifator?', 'Descreva MFA/2FA, métodos de implementação e considerações de segurança.', 'Segurança', 'dificil', '2025-09-01 20:55:00', '2025-09-01 20:55:00'),
(102, 2, 'O que é lazy loading e eager loading?', 'Compare estratégias de carregamento de dados em ORMs e suas implicações de performance.', 'ORM', 'medio', '2025-09-01 21:00:00', '2025-09-01 21:00:00'),
(103, 3, 'Como funciona o protocolo WebRTC?', 'Explique Web Real-Time Communication para vídeo, áudio e transferência de dados P2P.', 'Protocolos', 'dificil', '2025-09-01 21:05:00', '2025-09-01 21:05:00'),
(104, 7, 'O que são atomic operations em programação?', 'Defina operações atômicas, sua importância em concorrência e exemplos práticos.', 'Concorrência', 'dificil', '2025-09-01 21:10:00', '2025-09-01 21:10:00'),
(105, 8, 'Como implementar versionamento de APIs?', 'Descreva estratégias para versionar APIs (URL, headers, media types) e suas vantagens.', 'Backend', 'medio', '2025-09-01 21:15:00', '2025-09-01 21:15:00'),
(108, 14, 'pergunta teste', 'teste para pergunta', 'Outros', 'facil', '2025-10-21 02:16:34', '2025-10-21 02:17:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas_arquivadas`
--

CREATE TABLE `perguntas_arquivadas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `dificuldade` enum('facil','medio','dificil') DEFAULT 'medio',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pergunta_quiz`
--

CREATE TABLE `pergunta_quiz` (
  `enunciado` text NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `dificuldade` varchar(50) DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `opcoes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`opcoes`)),
  `resposta_index` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pergunta_quiz`
--

INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('Qual função em Python retorna o tamanho de uma lista?', 'Python', 'facil', '2025-08-08 21:25:25', '[\"size()\", \"length()\", \"len()\", \"count()\"]', 2, 1),
('Qual operador é usado para atribuição em JavaScript?', 'JavaScript', 'facil', '2025-08-08 21:25:25', '[\"===\", \"==\", \"=\", \":=\"]', 2, 2),
('Qual propriedade CSS centraliza um elemento com margem automática?', 'Frontend', 'medio', '2025-08-08 21:25:25', '[\"text-align: center\", \"align-items: center\", \"justify-content: center\", \"margin: auto\"]', 3, 3),
('Qual comando Git cria uma nova branch?', 'DevOps', 'facil', '2025-08-08 21:25:25', '[\"git init\", \"git commit\", \"git checkout -b nome\", \"git merge\"]', 2, 4),
('Em Python, qual estrutura é usada para repetir um bloco de código?', 'Python', 'facil', '2025-08-08 21:25:25', '[\"for\", \"def\", \"try\", \"if\"]', 0, 5),
('Qual método JavaScript transforma um array sem modificar o original?', 'JavaScript', 'medio', '2025-08-08 21:25:25', '[\"forEach\", \"push\", \"map\", \"splice\"]', 2, 6),
('Qual comando instala pacotes com o npm?', 'JavaScript', 'facil', '2025-08-08 21:25:25', '[\"npm start\", \"npm run\", \"npm install\", \"npm build\"]', 2, 8),
('Qual função CSS aplica sombra ao texto?', 'Frontend', 'medio', '2025-08-08 21:25:25', '[\"box-shadow\", \"shadow-text\", \"text-shadow\", \"font-shadow\"]', 2, 9),
('Qual comando Git envia alterações para o repositório remoto?', 'DevOps', 'medio', '2025-08-08 21:25:25', '[\"git push\", \"git clone\", \"git fetch\", \"git pull\"]', 0, 10),
('Qual declaração SQL é usada para extrair dados de um banco de dados?', 'SQL', 'facil', '2025-08-10 10:00:00', '[\"GET\", \"OPEN\", \"EXTRACT\", \"SELECT\"]', 3, 11),
('No contexto de orientação a objetos, o que é herança?', 'POO', 'medio', '2025-08-10 10:05:00', '[\"A capacidade de um objeto se esconder de outros objetos\", \"A capacidade de um objeto ter múltiplas formas\", \"A capacidade de uma classe herdar propriedades e métodos de outra classe\", \"A capacidade de agrupar dados e métodos que os manipulam\"]', 2, 12),
('Qual é a principal função do arquivo `package.json` em um projeto Node.js?', 'Backend', 'medio', '2025-08-10 10:10:00', '[\"Definir as variáveis de ambiente do projeto\", \"Listar todos os arquivos do projeto\", \"Armazenar o código-fonte principal da aplicação\", \"Gerenciar as dependências e scripts do projeto\"]', 3, 13),
('Qual das seguintes opções descreve melhor o que é um \"hook\" no React?', 'Frontend', 'dificil', '2025-08-10 10:15:00', '[\"Uma forma de conectar o React com bancos de dados externos\", \"Um tipo de componente de classe obsoleto\", \"Funções que permitem usar o estado e outros recursos do React em componentes de função\", \"Um evento de ciclo de vida específico para manipulação do DOM\"]', 2, 14),
('Em Git, qual comando é usado para reverter o último commit, criando um novo commit que desfaz as alterações?', 'DevOps', 'dificil', '2025-08-10 10:20:00', '[\"git revert HEAD\", \"git undo last\", \"git checkout HEAD^\", \"git reset --hard HEAD~\"]', 0, 15),
('Qual evento é disparado quando o DOM é completamente carregado?', 'JavaScript', 'medio', '2025-08-12 20:48:29', '[\"load\", \"ready\", \"init\", \"DOMContentLoaded\"]', 3, 16),
('Qual das opções é uma diretiva CSS para importar estilos externos?', 'Frontend', 'facil', '2025-08-12 20:48:29', '[\"@include\", \"@import\", \"@extend\", \"@media\"]', 1, 17),
('No Python, qual estrutura de dados mantém a ordem de inserção e permite chaves?', 'Python', 'medio', '2025-08-12 20:48:29', '[\"list\", \"tuple\", \"set\", \"dictionary\"]', 3, 18),
('Qual comando SQL remove uma tabela?', 'SQL', 'facil', '2025-08-12 20:48:29', '[\"DELETE TABLE\", \"REMOVE TABLE\", \"TRUNCATE TABLE\", \"DROP TABLE\"]', 3, 19),
('No React, qual hook é usado para gerenciar estado em componentes funcionais?', 'Frontend', 'facil', '2025-08-12 20:48:29', '[\"useState\", \"useContext\", \"useEffect\", \"useReducer\"]', 0, 20),
('Qual das opções é um princípio da programação orientada a objetos?', 'POO', 'facil', '2025-08-12 20:48:29', '[\"Recursão\", \"Iteração\", \"Compilação\", \"Encapsulamento\"]', 3, 21),
('Em Git, qual comando exibe o histórico de commits?', 'DevOps', 'facil', '2025-08-12 20:48:29', '[\"git history\", \"git commits\", \"git log\", \"git status\"]', 2, 22),
('Qual método em JavaScript é usado para adicionar um item no final de um array?', 'JavaScript', 'facil', '2025-08-12 20:48:29', '[\"pop\", \"shift\", \"unshift\", \"push\"]', 3, 23),
('Em CSS, qual propriedade define a cor do texto?', 'Frontend', 'facil', '2025-08-12 20:48:29', '[\"background-color\", \"font-color\", \"text-color\", \"color\"]', 3, 24),
('Qual comando do npm inicia o servidor de desenvolvimento?', 'JavaScript', 'medio', '2025-08-12 20:48:29', '[\"npm start\", \"npm serve\", \"npm run start\", \"npm dev\"]', 0, 25),
('Como desfazer o último commit no Git sem perder as mudanças?', 'DevOps', 'dificil', '2025-08-12 20:56:41', '[\"git revert HEAD\", \"git reset --soft HEAD~1\", \"git reset --hard HEAD~1\", \"git checkout HEAD~1\"]', 1, 26),
('Qual comando SQL exclui registros de uma tabela?', 'SQL', 'facil', '2025-08-12 20:56:41', '[\"DROP\", \"DELETE\", \"REMOVE\", \"TRUNCATE\"]', 1, 27),
('O que é polimorfismo na programação orientada a objetos?', 'POO', 'medio', '2025-08-12 20:56:41', '[\"Método que pode se comportar de diferentes formas\", \"Herança múltipla\", \"Criação de objetos\", \"Encapsulamento\"]', 0, 28),
('Qual framework é usado para criar APIs em Node.js?', 'Backend', 'medio', '2025-08-12 20:56:41', '[\"React\", \"Express\", \"Vue\", \"Angular\"]', 1, 29),
('Qual palavra-chave em Python define uma função?', 'Python', 'facil', '2025-08-12 20:56:41', '[\"def\", \"function\", \"lambda\", \"func\"]', 0, 30),
('Qual método JavaScript adiciona um elemento no início do array?', 'JavaScript', 'medio', '2025-08-12 20:56:41', '[\"push()\", \"unshift()\", \"shift()\", \"pop()\"]', 1, 31),
('Qual propriedade CSS controla o espaçamento interno de um elemento?', 'Frontend', 'facil', '2025-08-12 20:56:41', '[\"padding\", \"margin\", \"border\", \"spacing\"]', 0, 32),
('Qual comando Git sincroniza o repositório local com o remoto?', 'DevOps', 'facil', '2025-08-12 20:56:41', '[\"git push\", \"git fetch\", \"git clone\", \"git pull\"]', 3, 33),
('Qual cláusula SQL é usada para ordenar os resultados?', 'SQL', 'facil', '2025-08-12 20:56:41', '[\"GROUP BY\", \"WHERE\", \"HAVING\", \"ORDER BY\"]', 3, 34),
('O que é encapsulamento em POO?', 'POO', 'facil', '2025-08-12 20:56:41', '[\"Herança\", \"Ocultar dados internos de uma classe\", \"Polimorfismo\", \"Abstração\"]', 1, 35),
('Qual a função usada para exibir algo no console em Python?', 'Python', 'facil', '2025-08-18 20:53:34', '[\"echo()\", \"console.log()\", \"print()\", \"write()\"]', 2, 36),
('Qual estrutura é usada para armazenar pares chave-valor em Python?', 'Python', 'medio', '2025-08-18 20:53:34', '[\"list\", \"tuple\", \"set\", \"dict\"]', 3, 37),
('Qual palavra-chave define uma função em Python?', 'Python', 'facil', '2025-08-18 20:53:34', '[\"function\", \"lambda\", \"fun\", \"def\"]', 3, 38),
('Qual comando SQL é usado para inserir dados em uma tabela?', 'SQL', 'facil', '2025-08-18 20:53:34', '[\"ADD DATA\", \"INSERT INTO\", \"UPDATE\", \"CREATE\"]', 1, 39),
('No SQL, qual comando remove uma tabela inteira?', 'SQL', 'dificil', '2025-08-18 20:53:34', '[\"DELETE * FROM\", \"REMOVE TABLE\", \"DROP TABLE\", \"TRUNCATE TABLE\"]', 2, 41),
('Qual operador é usado para comparação estrita em JavaScript?', 'JavaScript', 'medio', '2025-08-18 20:53:34', '[\"==\", \"=\", \"===\", \"!==\"]', 2, 42),
('Qual método converte JSON em objeto JavaScript?', 'JavaScript', 'medio', '2025-08-18 20:53:34', '[\"JSON.stringify()\", \"JSON.parse()\", \"toObject()\", \"parseJSON()\"]', 1, 43),
('Qual palavra-chave cria uma constante em JavaScript?', 'JavaScript', 'facil', '2025-08-18 20:53:34', '[\"var\", \"let\", \"const\", \"static\"]', 2, 44),
('Qual tag HTML é usada para criar um link?', 'Frontend', 'facil', '2025-08-18 20:53:34', '[\"a\", \"href\", \"url\", \"link\"]', 0, 45),
('Em CSS, qual propriedade altera a cor do texto?', 'Frontend', 'facil', '2025-08-18 20:53:34', '[\"font-color\", \"text-color\", \"background-color\", \"color\"]', 3, 46),
('Qual atributo HTML define um texto alternativo em imagens?', 'Frontend', 'medio', '2025-08-18 20:53:34', '[\"title\", \"description\", \"alt\", \"src\"]', 2, 47),
('Qual estrutura de controle é usada para repetir um bloco de código várias vezes?', 'POO', 'facil', '2025-08-18 20:53:34', '[\"if\", \"switch\", \"return\", \"for\"]', 3, 48),
('O que significa o conceito de encapsulamento em POO?', 'POO', 'dificil', '2025-08-18 20:53:34', '[\"Dividir o código em funções\", \"Reutilizar código\", \"Ocultar detalhes internos de uma classe\", \"Criar múltiplas instâncias\"]', 2, 49),
('Qual método JavaScript retorna o primeiro elemento que satisfaz uma condição?', 'JavaScript', 'medio', '2025-08-26 20:01:10', '[\"filter()\", \"find()\", \"map()\", \"some()\"]', 1, 51),
('Qual comando SQL atualiza registros existentes?', 'SQL', 'medio', '2025-08-26 20:01:10', '[\"INSERT\", \"ALTER\", \"UPDATE\", \"MODIFY\"]', 2, 52),
('No CSS, qual propriedade define o tamanho da fonte?', 'Frontend', 'facil', '2025-08-26 20:01:10', '[\"text-size\", \"font-size\", \"size-font\", \"font\"]', 1, 53),
('Em Python, qual palavra-chave é usada para criar um gerador?', 'Python', 'dificil', '2025-08-26 20:01:10', '[\"return\", \"async\", \"yield\", \"await\"]', 2, 54),
('Qual comando Git mostra diferenças entre commits?', 'DevOps', 'medio', '2025-08-26 20:01:10', '[\"git show\", \"git diff\", \"git status\", \"git log\"]', 1, 55),
('Qual comando cria um índice em SQL?', 'SQL', 'medio', '2025-08-26 20:48:43', '[\"CREATE INDEX\", \"MAKE INDEX\", \"NEW INDEX\", \"ADD INDEX\"]', 0, 56),
('Qual método converte uma Promise resolvida em JavaScript?', 'JavaScript', 'medio', '2025-08-26 20:48:43', '[\"resolve()\", \"async()\", \"Promise.resolve()\", \"then()\"]', 2, 57),
('Qual método HTTP é usado para atualizar um recurso em uma API REST?', 'Backend', 'facil', '2025-08-26 20:48:43', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 3, 58),
('Qual palavra-chave permite uma função chamar a si mesma?', 'Algoritmos', 'dificil', '2025-08-26 20:48:43', '[\"loop\", \"self\", \"recursion\", \"return\"]', 2, 59),
('Qual unidade de medida é recomendada para fontes responsivas?', 'Frontend', 'facil', '2025-08-26 20:48:43', '[\"rem\", \"em\", \"px\", \"%\"]', 0, 60),
('Qual comando Python cria um ambiente virtual?', 'Python', 'medio', '2025-09-01 10:00:00', '[\"virtualenv\", \"pip install venv\", \"python -m venv\", \"conda create\"]', 2, 61),
('Qual propriedade CSS torna um elemento flexível?', 'Frontend', 'facil', '2025-09-01 10:05:00', '[\"flex: 1\", \"display: flex\", \"position: flex\", \"layout: flex\"]', 1, 62),
('Em SQL, qual função retorna a data e hora atual?', 'SQL', 'medio', '2025-09-01 10:10:00', '[\"CURRENT_TIME()\", \"TODAY()\", \"NOW()\", \"GETDATE()\"]', 2, 63),
('Qual padrão de arquitetura separa dados, apresentação e lógica?', 'Arquitetura', 'medio', '2025-09-01 10:15:00', '[\"MVC\", \"MVP\", \"MVVM\", \"Todas as anteriores\"]', 3, 64),
('Qual comando Git desfaz mudanças não commitadas?', 'DevOps', 'medio', '2025-09-01 10:20:00', '[\"git checkout .\", \"git revert\", \"git reset\", \"git clean\"]', 0, 65),
('Em JavaScript, qual método remove o último elemento de um array?', 'JavaScript', 'facil', '2025-09-01 10:25:00', '[\"shift()\", \"slice()\", \"splice()\", \"pop()\"]', 3, 66),
('Qual tipo de join retorna registros quando há correspondência em ambas as tabelas?', 'SQL', 'medio', '2025-09-01 10:30:00', '[\"LEFT JOIN\", \"INNER JOIN\", \"RIGHT JOIN\", \"FULL JOIN\"]', 1, 67),
('Em Python, qual biblioteca é padrão para trabalhar com datas?', 'Python', 'facil', '2025-09-01 10:35:00', '[\"time\", \"calendar\", \"date\", \"datetime\"]', 3, 68),
('Qual atributo HTML5 torna um campo obrigatório?', 'Frontend', 'facil', '2025-09-01 10:40:00', '[\"mandatory\", \"must\", \"obligatory\", \"required\"]', 3, 69),
('Em POO, qual conceito permite que uma classe use métodos de outra?', 'POO', 'facil', '2025-09-01 10:45:00', '[\"Herança\", \"Polimorfismo\", \"Encapsulamento\", \"Abstração\"]', 0, 70),
('Qual protocolo é usado para transferir páginas web?', 'Redes', 'facil', '2025-09-01 10:50:00', '[\"FTP\", \"SMTP\", \"SSH\", \"HTTP\"]', 3, 71),
('Em JavaScript, qual operador verifica se uma propriedade existe em um objeto?', 'JavaScript', 'medio', '2025-09-01 10:55:00', '[\"in\", \"has\", \"exists\", \"contains\"]', 0, 72),
('Qual comando SQL agrupa resultados com base em uma coluna?', 'SQL', 'medio', '2025-09-01 11:00:00', '[\"ORDER BY\", \"SORT BY\", \"GROUP BY\", \"CLUSTER BY\"]', 2, 73),
('Em CSS, qual unidade é relativa ao tamanho da fonte do elemento pai?', 'Frontend', 'medio', '2025-09-01 11:05:00', '[\"px\", \"rem\", \"em\", \"vh\"]', 2, 74),
('Qual estrutura de dados segue o princípio LIFO?', 'Estrutura de Dados', 'facil', '2025-09-01 11:10:00', '[\"Pilha\", \"Lista\", \"Árvore\", \"Fila\"]', 0, 75),
('Em Python, qual palavra-chave define uma classe?', 'Python', 'facil', '2025-09-01 11:15:00', '[\"def\", \"object\", \"new\", \"class\"]', 3, 76),
('Qual comando Git exibe o status do repositório?', 'DevOps', 'facil', '2025-09-01 11:20:00', '[\"git info\", \"git state\", \"git check\", \"git status\"]', 3, 77),
('Em JavaScript, qual método converte um objeto em JSON?', 'JavaScript', 'medio', '2025-09-01 11:25:00', '[\"JSON.parse()\", \"toJSON()\", \"JSON.stringify()\", \"parseJSON()\"]', 2, 78),
('Qual propriedade CSS define a altura de um elemento?', 'Frontend', 'facil', '2025-09-01 11:30:00', '[\"size\", \"length\", \"dimension\", \"height\"]', 3, 79),
('Em SQL, qual comando cria uma nova tabela?', 'SQL', 'facil', '2025-09-01 11:35:00', '[\"CREATE TABLE\", \"MAKE TABLE\", \"NEW TABLE\", \"ADD TABLE\"]', 0, 80),
('Qual algoritmo de ordenação tem complexidade O(n log n) no caso médio?', 'Algoritmos', 'dificil', '2025-09-01 11:40:00', '[\"Bubble Sort\", \"Selection Sort\", \"Quick Sort\", \"Insertion Sort\"]', 2, 81),
('Em Python, qual método adiciona um elemento ao final de uma lista?', 'Python', 'facil', '2025-09-01 11:45:00', '[\"add()\", \"append()\", \"insert()\", \"push()\"]', 1, 82),
('Qual tag HTML define o cabeçalho principal de uma página?', 'Frontend', 'facil', '2025-09-01 11:50:00', '[\"header\", \"head\", \"title\", \"h1\"]', 3, 83),
('Em Git, qual comando cria uma cópia local de um repositório remoto?', 'DevOps', 'facil', '2025-09-01 11:55:00', '[\"git copy\", \"git download\", \"git clone\", \"git pull\"]', 2, 84),
('Qual método HTTP é usado para deletar um recurso?', 'Backend', 'facil', '2025-09-01 12:00:00', '[\"DELETE\", \"POST\", \"PUT\", \"GET\"]', 0, 85),
('Em JavaScript, qual estrutura permite executar código após um tempo determinado?', 'JavaScript', 'medio', '2025-09-01 12:05:00', '[\"setInterval()\", \"delay()\", \"wait()\", \"setTimeout()\"]', 3, 86),
('Qual propriedade CSS controla a transparência de um elemento?', 'Frontend', 'medio', '2025-09-01 12:10:00', '[\"transparency\", \"opacity\", \"alpha\", \"visibility\"]', 1, 87),
('Em Python, qual operador verifica se um valor está em uma lista?', 'Python', 'facil', '2025-09-01 12:15:00', '[\"in\", \"contains\", \"exists\", \"has\"]', 0, 88),
('Qual comando SQL limita o número de registros retornados?', 'SQL', 'medio', '2025-09-01 12:20:00', '[\"TOP\", \"LIMIT\", \"COUNT\", \"MAX\"]', 1, 89),
('Em POO, qual conceito permite que um método tenha diferentes implementações?', 'POO', 'dificil', '2025-09-01 12:25:00', '[\"Polimorfismo\", \"Encapsulamento\", \"Abstração\", \"Herança\"]', 0, 90),
('Qual porta padrão é usada pelo protocolo HTTPS?', 'Redes', 'medio', '2025-09-01 12:30:00', '[\"80\", \"8080\", \"22\", \"443\"]', 3, 91),
('Em CSS, qual propriedade define o espaçamento entre linhas?', 'Frontend', 'medio', '2025-09-01 12:35:00', '[\"line-height\", \"line-spacing\", \"text-spacing\", \"row-height\"]', 0, 92),
('Qual estrutura de controle executa código pelo menos uma vez?', 'Lógica de Programação', 'medio', '2025-09-01 12:40:00', '[\"for\", \"while\", \"if\", \"do-while\"]', 3, 93),
('Em JavaScript, qual método remove elementos de um array baseado na posição?', 'JavaScript', 'medio', '2025-09-01 12:45:00', '[\"slice()\", \"splice()\", \"delete()\", \"remove()\"]', 1, 94),
('Qual comando Git adiciona arquivos ao staging area?', 'DevOps', 'facil', '2025-09-01 12:50:00', '[\"git add\", \"git commit\", \"git push\", \"git stage\"]', 0, 95),
('Em Python, qual função converte uma string em número inteiro?', 'Python', 'facil', '2025-09-01 12:55:00', '[\"integer()\", \"number()\", \"parse()\", \"int()\"]', 3, 96),
('Em SQL, qual função conta o número de registros?', 'SQL', 'facil', '2025-09-01 13:05:00', '[\"SUM()\", \"TOTAL()\", \"NUMBER()\", \"COUNT()\"]', 3, 98),
('Qual é a complexidade de tempo da busca binária?', 'Algoritmos', 'dificil', '2025-09-01 13:10:00', '[\"O(n)\", \"O(n²)\", \"O(1)\", \"O(log n)\"]', 3, 99),
('Em JavaScript, qual palavra-chave declara uma variável de escopo de bloco?', 'JavaScript', 'medio', '2025-09-01 13:15:00', '[\"let\", \"const\", \"scope\", \"var\"]', 0, 100),
('Qual método em Python converte um número inteiro em string?', 'Python', 'medio', '2025-09-08 20:15:00', '[\"toString()\", \"str()\", \"stringify()\", \"print()\"]', 1, 101),
('Qual propriedade CSS define a cor de fundo de um elemento?', 'Frontend', 'facil', '2025-09-08 20:15:00', '[\"color\", \"bg-color\", \"background-color\", \"element-color\"]', 2, 102),
('Em SQL, qual cláusula é usada para filtrar registros?', 'SQL', 'medio', '2025-09-08 20:15:00', '[\"ORDER BY\", \"GROUP BY\", \"WHERE\", \"HAVING\"]', 2, 103),
('Qual comando Git busca novos commits do repositório remoto sem mesclá-los automaticamente?', 'DevOps', 'medio', '2025-09-08 20:15:00', '[\"git pull\", \"git clone\", \"git fetch\", \"git merge\"]', 2, 104),
('No JavaScript, qual método retorna um array contendo elementos que passam em um teste?', 'JavaScript', 'medio', '2025-09-08 20:15:00', '[\"filter()\", \"find()\", \"map()\", \"reduce()\"]', 0, 105),
('Qual padrão de projeto cria objetos sem expor a lógica de criação?', 'Arquitetura', 'medio', '2025-09-08 20:15:00', '[\"Singleton\", \"Factory Method\", \"Builder\", \"Prototype\"]', 1, 106),
('Em Python, qual declaração é usada para tratar exceções?', 'Python', 'medio', '2025-09-08 20:15:00', '[\"try\", \"catch\", \"finally\", \"except\"]', 3, 107),
('Qual propriedade JavaScript retorna o comprimento de uma string?', 'JavaScript', 'facil', '2025-09-08 20:15:00', '[\"size\", \"len\", \"length\", \"count\"]', 2, 108),
('Em SQL, qual função agrega valores somando-os?', 'SQL', 'facil', '2025-09-08 20:15:00', '[\"COUNT()\", \"SUM()\", \"AVG()\", \"MAX()\"]', 1, 109),
('Em CSS, qual propriedade ativa o layout em grade bidimensional?', 'Frontend', 'dificil', '2025-09-08 20:15:00', '[\"display: grid\", \"grid-template-rows\", \"display: flex\", \"grid-gap\"]', 0, 110),
('Qual comando em Python exibe os módulos instalados?', 'Python', 'medio', '2025-10-09 20:05:23', '[\"python --modules\", \"pip list\", \"show modules\", \"pip show all\"]', 1, 111),
('Qual método JavaScript remove o primeiro elemento de um array?', 'JavaScript', 'facil', '2025-10-09 20:05:23', '[\"pop()\", \"slice()\", \"splice()\", \"shift()\"]', 3, 112),
('Em CSS, qual propriedade define o espaçamento externo de um elemento?', 'Frontend', 'facil', '2025-10-09 20:05:23', '[\"padding\", \"margin\", \"border\", \"gap\"]', 1, 113),
('Qual comando Git cria uma nova tag?', 'DevOps', 'medio', '2025-10-09 20:05:23', '[\"git create tag\", \"git new tag\", \"git tag nome\", \"git add tag\"]', 2, 114),
('Qual palavra-chave define uma função anônima em Python?', 'Python', 'medio', '2025-10-09 20:05:23', '[\"lambda\", \"func\", \"anon\", \"def\"]', 0, 115),
('Em SQL, qual função retorna o maior valor de uma coluna?', 'SQL', 'facil', '2025-10-09 20:05:23', '[\"MAX()\", \"TOP()\", \"LIMIT()\", \"HIGHEST()\"]', 0, 116),
('Qual método JavaScript executa uma função a cada intervalo de tempo?', 'JavaScript', 'medio', '2025-10-09 20:05:23', '[\"setTimeout()\", \"setInterval()\", \"repeat()\", \"loop()\"]', 1, 117),
('Qual propriedade CSS define o tamanho da margem interna de um elemento?', 'Frontend', 'facil', '2025-10-09 20:05:23', '[\"margin\", \"padding\", \"border\", \"gap\"]', 1, 118),
('Em Python, qual tipo de dado é imutável?', 'Python', 'dificil', '2025-10-09 20:05:23', '[\"list\", \"set\", \"dict\", \"tuple\"]', 3, 119),
('Qual comando Git combina duas branches?', 'DevOps', 'medio', '2025-10-09 20:05:23', '[\"git merge\", \"git combine\", \"git join\", \"git union\"]', 0, 120),
('Em SQL, qual comando altera a estrutura de uma tabela?', 'SQL', 'medio', '2025-10-09 20:05:23', '[\"UPDATE TABLE\", \"ALTER TABLE\", \"MODIFY TABLE\", \"CHANGE TABLE\"]', 1, 121),
('Qual método JavaScript converte um array em uma string?', 'JavaScript', 'facil', '2025-10-09 20:05:23', '[\"concat()\", \"toString()\", \"join()\", \"stringify()\"]', 2, 122),
('Qual tag HTML é usada para exibir uma imagem?', 'Frontend', 'facil', '2025-10-09 20:05:23', '[\"image\", \"src\", \"img\", \"picture\"]', 2, 123),
('Qual conceito POO permite que uma classe possua várias formas?', 'POO', 'medio', '2025-10-09 20:05:23', '[\"Encapsulamento\", \"Herança\", \"Polimorfismo\", \"Abstração\"]', 2, 124),
('Qual comando SQL combina dados de duas tabelas?', 'SQL', 'facil', '2025-10-09 20:05:23', '[\"JOIN\", \"GROUP\", \"MERGE\", \"UNION\"]', 0, 125),
('Qual comando Git desfaz o último commit permanentemente?', 'DevOps', 'dificil', '2025-10-09 20:05:23', '[\"git revert HEAD\", \"git undo\", \"git reset --hard HEAD~1\", \"git delete last\"]', 2, 126),
('Em CSS, qual unidade é relativa ao tamanho da janela de visualização?', 'Frontend', 'medio', '2025-10-09 20:05:23', '[\"em\", \"rem\", \"vh\", \"pt\"]', 2, 127),
('Qual biblioteca Python é usada para manipular dados em tabelas?', 'Python', 'medio', '2025-10-09 20:05:23', '[\"numpy\", \"math\", \"pandas\", \"requests\"]', 2, 128),
('Em SQL, qual cláusula remove registros duplicados?', 'SQL', 'medio', '2025-10-09 20:05:23', '[\"UNIQUE\", \"DELETE\", \"DISTINCT\", \"FILTER\"]', 2, 129),
('Qual estrutura de controle em JavaScript interrompe um loop?', 'JavaScript', 'facil', '2025-10-09 20:05:23', '[\"stop\", \"break\", \"return\", \"exit\"]', 1, 130),
('Qual biblioteca Python é usada para criar interfaces gráficas?', 'Python', 'medio', '2025-10-09 20:07:55', '[\"pygame\", \"tkinter\", \"pandas\", \"flask\"]', 1, 131),
('Em JavaScript, qual método retorna o número de elementos de um array?', 'JavaScript', 'facil', '2025-10-09 20:07:55', '[\"length\", \"size\", \"count\", \"elements\"]', 0, 132),
('Qual propriedade CSS define o espaçamento entre letras?', 'Frontend', 'medio', '2025-10-09 20:07:55', '[\"word-spacing\", \"letter-spacing\", \"line-height\", \"text-indent\"]', 1, 133),
('Qual comando Git restaura um arquivo deletado?', 'DevOps', 'dificil', '2025-10-09 20:07:55', '[\"git revert\", \"git restore\", \"git reset\", \"git recover\"]', 1, 134),
('Qual comando SQL cria um banco de dados?', 'SQL', 'facil', '2025-10-09 20:07:55', '[\"CREATE DATABASE\", \"ADD DATABASE\", \"NEW DATABASE\", \"MAKE DATABASE\"]', 0, 135),
('Em Python, qual estrutura é usada para armazenar valores únicos?', 'Python', 'medio', '2025-10-09 20:07:55', '[\"list\", \"tuple\", \"dict\", \"set\"]', 3, 136),
('Em CSS, qual propriedade define o espaçamento entre palavras?', 'Frontend', 'facil', '2025-10-09 20:07:55', '[\"letter-spacing\", \"word-spacing\", \"line-height\", \"margin\"]', 1, 137),
('Qual método JavaScript retorna a posição de um elemento em um array?', 'JavaScript', 'medio', '2025-10-09 20:07:55', '[\"findIndex()\", \"position()\", \"indexOf()\", \"search()\"]', 2, 138),
('Qual comando Git mostra os branches existentes?', 'DevOps', 'facil', '2025-10-09 20:07:55', '[\"git show-branches\", \"git list\", \"git branch\", \"git status\"]', 2, 139),
('Qual cláusula SQL agrupa os resultados por uma condição?', 'SQL', 'medio', '2025-10-09 20:07:55', '[\"GROUP BY\", \"ORDER BY\", \"WHERE\", \"HAVING\"]', 0, 140),
('Em Python, qual palavra-chave é usada para herança de classes?', 'Python', 'medio', '2025-10-09 20:07:55', '[\"extends\", \"inherits\", \"super\", \"class(BaseClass)\"]', 3, 141),
('Qual propriedade CSS define a largura da borda?', 'Frontend', 'facil', '2025-10-09 20:07:55', '[\"border-size\", \"border-width\", \"border-thickness\", \"border-height\"]', 1, 142),
('Qual método JavaScript converte uma string em número?', 'JavaScript', 'facil', '2025-10-09 20:07:55', '[\"Number()\", \"convert()\", \"toNumber()\", \"parseInt()\"]', 3, 143),
('Qual comando Git remove um branch local?', 'DevOps', 'medio', '2025-10-09 20:07:55', '[\"git remove branch\", \"git delete\", \"git clear branch\", \"git branch -d nome\"]', 3, 144),
('Qual comando SQL cria uma chave primária?', 'SQL', 'medio', '2025-10-09 20:07:55', '[\"ADD PRIMARY KEY\", \"MAKE PRIMARY\", \"PRIMARY KEY()\", \"KEY PRIMARY\"]', 0, 145),
('Em Python, qual função retorna o valor absoluto de um número?', 'Python', 'facil', '2025-10-09 20:07:55', '[\"math.abs()\", \"absolute()\", \"value()\", \"abs()\"]', 3, 146),
('Em CSS, qual propriedade define o tipo de fonte?', 'Frontend', 'facil', '2025-10-09 20:07:55', '[\"font-type\", \"font-style\", \"font\", \"font-family\"]', 3, 147),
('Em JavaScript, qual função combina dois arrays?', 'JavaScript', 'medio', '2025-10-09 20:07:55', '[\"merge()\", \"join()\", \"concat()\", \"combine()\"]', 2, 148),
('Qual comando Git exibe as diferenças entre branchs?', 'DevOps', 'dificil', '2025-10-09 20:07:55', '[\"git compare\", \"git show\", \"git diff\", \"git branch --diff\"]', 2, 149),
('Em SQL, qual função calcula a média de valores?', 'SQL', 'facil', '2025-10-09 20:07:55', '[\"AVG()\", \"MEAN()\", \"SUM()\", \"AVERAGE()\"]', 0, 150),
('Qual padrão de arquitetura é conhecido por \"publicar/assinar\" mensagens entre componentes?', 'Arquitetura', 'medio', '2025-10-17 09:00:00', '[\"MVC\", \"Cliente-Servidor\", \"Monolítico\", \"Publish/Subscribe\"]', 3, 151),
('Qual método HTTP é idempotente e serve para criar ou substituir um recurso?', 'Backend', 'medio', '2025-10-17 09:05:00', '[\"POST\", \"GET\", \"PUT\", \"PATCH\"]', 2, 152),
('Em Sistemas Operacionais, o que é um \"deadlock\"?', 'Sistemas Operacionais', 'dificil', '2025-10-17 09:10:00', '[\"Um processo esperando por um recurso que nunca estará disponível\", \"Um erro que causa o desligamento do sistema\", \"Dois ou mais processos que esperam um pelo outro para liberar recursos\", \"Um processo que consome 100% da CPU\"]', 2, 153),
('No contexto de redes, qual é a função principal de um DNS?', 'Redes', 'facil', '2025-10-17 09:15:00', '[\"Controlar o tráfego de rede\", \"Fornecer segurança para a conexão\", \"Traduzir nomes de domínio em endereços IP\", \"Armazenar arquivos de sites\"]', 2, 154),
('Qual biblioteca Python é amplamente utilizada para aprendizado de máquina?', 'Python', 'medio', '2025-10-17 09:20:00', '[\"Scikit-learn\", \"NumPy\", \"Matplotlib\", \"Pandas\"]', 0, 155),
('O que a sigla \"SOLID\" representa no desenvolvimento de software?', 'Boas Práticas', 'dificil', '2025-10-17 09:25:00', '[\"Um framework de testes automatizados\", \"Uma metodologia de gerenciamento de projetos\", \"Um padrão de segurança de API\", \"Um conjunto de cinco princípios de design de classes\"]', 3, 156),
('Em JavaScript, o que o método `reduce()` faz?', 'JavaScript', 'dificil', '2025-10-17 09:30:00', '[\"Mapeia cada elemento para um novo valor\", \"Filtra os elementos de um array\", \"Verifica se algum elemento passa em um teste\", \"Executa uma função redutora para acumular um único valor\"]', 3, 157),
('Qual tipo de armazenamento do navegador tem um limite maior e não é enviado nas requisições HTTP?', 'Frontend', 'medio', '2025-10-17 09:35:00', '[\"Cookies\", \"Session Storage\", \"Web SQL\", \"Local Storage\"]', 3, 158),
('Qual comando SQL é usado para conceder permissões a um usuário?', 'SQL', 'medio', '2025-10-17 09:40:00', '[\"ALLOW\", \"PERMIT\", \"SET PERMISSION\", \"GRANT\"]', 3, 159),
('O que é \"Infrastructure as Code\" (IaC) no contexto de DevOps?', 'DevOps', 'dificil', '2025-10-17 09:45:00', '[\"Gerenciar e provisionar infraestrutura através de código\", \"Usar hardware físico em vez de nuvem\", \"Automatizar a documentação da infraestrutura\", \"Uma linguagem de programação para servidores\"]', 0, 160),
('Qual dos seguintes não é um pilar da Programação Orientada a Objetos?', 'POO', 'facil', '2025-10-17 09:50:00', '[\"Herança\", \"Polimorfismo\", \"Encapsulamento\", \"Concorrência\"]', 3, 161),
('Qual estrutura de dados utiliza uma política \"First-In, First-Out\" (FIFO)?', 'Estrutura de Dados', 'facil', '2025-10-17 09:55:00', '[\"Pilha (Stack)\", \"Árvore (Tree)\", \"Lista Ligada (Linked List)\", \"Fila (Queue)\"]', 3, 162),
('Em Git, qual comando é usado para aplicar commits de uma branch em outra, um por um?', 'DevOps', 'dificil', '2025-10-17 10:00:00', '[\"git merge\", \"git pull\", \"git cherry-pick\", \"git rebase\"]', 3, 163),
('Qual é a principal vantagem de usar \"Server-Side Rendering\" (SSR)?', 'Frontend', 'dificil', '2025-10-17 10:05:00', '[\"Melhorar a interatividade do lado do cliente\", \"Reduzir a carga no servidor\", \"Facilitar o gerenciamento de estado\", \"Melhorar o SEO e o tempo de carregamento inicial\"]', 3, 164),
('Qual função em Python é usada para obter a documentação (docstring) de um objeto?', 'Python', 'facil', '2025-10-17 10:10:00', '[\"help()\", \"info()\", \"details()\", \"doc()\"]', 0, 165),
('Qual método em JavaScript converte uma string em número inteiro?', 'JavaScript', 'facil', '2025-10-17 10:15:00', '[\"Number()\", \"parseFloat()\", \"toInteger()\", \"parseInt()\"]', 3, 166),
('Qual comando SQL é usado para remover linhas específicas de uma tabela?', 'SQL', 'medio', '2025-10-17 10:20:00', '[\"REMOVE ROW\", \"DELETE FROM\", \"DROP TABLE\", \"CLEAR\"]', 1, 167),
('Em CSS, qual propriedade define o espaçamento entre linhas de texto?', 'Frontend', 'facil', '2025-10-17 10:25:00', '[\"letter-spacing\", \"text-gap\", \"line-height\", \"word-spacing\"]', 2, 168),
('Qual comando Git é usado para combinar mudanças de duas branches?', 'DevOps', 'medio', '2025-10-17 10:35:00', '[\"git merge\", \"git join\", \"git attach\", \"git combine\"]', 0, 170),
('Em POO, o que é herança?', 'POO', 'facil', '2025-10-17 10:40:00', '[\"Ocultar atributos privados\", \"Permitir que uma classe derive características de outra\", \"Executar várias tarefas simultaneamente\", \"Criar múltiplas instâncias\"]', 1, 171),
('Qual estrutura de dados segue o princípio LIFO (Last In, First Out)?', 'Estrutura de Dados', 'facil', '2025-10-17 10:45:00', '[\"Fila (Queue)\", \"Árvore (Tree)\", \"Hash Table\", \"Pilha (Stack)\"]', 3, 172),
('Qual método HTTP é usado para obter dados de um servidor?', 'Backend', 'facil', '2025-10-17 10:50:00', '[\"POST\", \"PUT\", \"DELETE\", \"GET\"]', 3, 173),
('Em JavaScript, qual palavra-chave é usada para declarar uma variável com escopo de bloco?', 'JavaScript', 'medio', '2025-10-17 10:55:00', '[\"var\", \"const\", \"let\", \"define\"]', 2, 174),
('Qual técnica em DevOps permite a implantação automática de código após o commit?', 'DevOps', 'dificil', '2025-10-17 11:00:00', '[\"Continuous Deployment\", \"Rolling Update\", \"Continuous Delivery\", \"Blue-Green Deployment\"]', 0, 175),
('Qual protocolo é usado para envio de e-mails?', 'Redes', 'facil', '2025-10-17 11:25:00', '[\"HTTP\", \"FTP\", \"IMAP\", \"SMTP\"]', 3, 176),
('Qual camada do modelo OSI é responsável pelo roteamento de pacotes?', 'Redes', 'medio', '2025-10-17 11:28:00', '[\"Camada de Enlace\", \"Camada de Aplicação\", \"Camada de Rede\", \"Camada de Transporte\"]', 2, 177),
('Em POO, o que é um construtor?', 'POO', 'facil', '2025-10-17 11:31:00', '[\"Um método para deletar atributos\", \"Um atributo público\", \"Um método usado para inicializar objetos\", \"Uma variável estática\"]', 2, 178),
('O que é abstração na Programação Orientada a Objetos?', 'POO', 'medio', '2025-10-17 11:34:00', '[\"Copiar métodos de outra classe\", \"Repetir código\", \"Ocultar detalhes internos e expor apenas o necessário\", \"Executar herança múltipla\"]', 2, 179),
('Em Estrutura de Dados, qual estrutura segue o princípio FIFO?', 'Estrutura de Dados', 'facil', '2025-10-17 11:37:00', '[\"Fila\", \"Árvore\", \"Pilha\", \"Grafo\"]', 0, 180),
('O que é complexidade O(n²)?', 'Algoritmos', 'medio', '2025-10-17 11:40:00', '[\"Tempo cresce linearmente com n\", \"Tempo constante\", \"Tempo cresce quadraticamente com n\", \"Depende do hardware\"]', 2, 181),
('Em Lógica de Programação, qual operador representa “E lógico”?', 'Lógica de Programação', 'facil', '2025-10-17 11:43:00', '[\"||\", \"==\", \"&&\", \"!=\"]', 2, 182),
('O que é um firewall?', 'Segurança', 'facil', '2025-10-17 11:46:00', '[\"Filtrar tráfego de rede\", \"Um sistema que filtra tráfego de rede\", \"Um antivírus de rede\", \"Um tipo de roteador\"]', 1, 183),
('Qual técnica de segurança visa garantir que os dados não sejam alterados?', 'Segurança', 'medio', '2025-10-17 11:49:00', '[\"Confidencialidade\", \"Autenticidade\", \"Integridade\", \"Disponibilidade\"]', 2, 184),
('O que é uma API REST?', 'Backend', 'facil', '2025-10-17 11:52:00', '[\"Um padrão de comunicação entre sistemas usando HTTP\", \"Um framework de frontend\", \"Um tipo de banco de dados\", \"Uma ferramenta de versionamento\"]', 0, 185),
('O que é arquitetura em camadas?', 'Arquitetura', 'medio', '2025-10-17 11:55:00', '[\"Dividir código em arquivos menores\", \"Separar responsabilidades em diferentes níveis do sistema\", \"Usar herança entre classes\", \"Aplicar polimorfismo nas funções\"]', 1, 186),
('Qual o papel do controller no padrão MVC?', 'Arquitetura', 'facil', '2025-10-17 11:58:00', '[\"Manipular os dados do banco diretamente\", \"Renderizar a interface gráfica\", \"Receber as requisições e coordenar as respostas\", \"Validar o HTML\"]', 2, 187),
('Em lógica booleana, qual o resultado de (true || false)?', 'Lógica de Programação', 'facil', '2025-10-17 12:01:00', '[\"false\", \"null\", \"true\", \"undefined\"]', 2, 188),
('Qual estrutura de dados é mais adequada para representar hierarquias?', 'Estrutura de Dados', 'medio', '2025-10-17 12:04:00', '[\"Lista\", \"Fila\", \"Árvore\", \"Pilha\"]', 2, 189),
('Em segurança da informação, o que significa o termo “autenticação”?', 'Segurança', 'medio', '2025-10-17 12:07:00', '[\"Verificar a identidade de um usuário\", \"Criptografar os dados\", \"Garantir que o usuário tem permissão\", \"Evitar falhas de rede\"]', 0, 190),
('Qual protocolo é usado para transferência segura de arquivos?', 'Redes', 'medio', '2025-10-17 12:10:00', '[\"FTP\", \"HTTP\", \"SFTP\", \"SMTP\"]', 2, 191),
('O que significa IP?', 'Redes', 'facil', '2025-10-17 12:13:00', '[\"Internet Provider\", \"Internal Port\", \"Input Program\", \"Internet Protocol\"]', 3, 192),
('Qual camada do modelo OSI é responsável pela comunicação fim a fim?', 'Redes', 'medio', '2025-10-17 12:16:00', '[\"Camada de Sessão\", \"Camada de Aplicação\", \"Camada de Rede\", \"Camada de Transporte\"]', 3, 193),
('Qual é o principal objetivo do polimorfismo?', 'POO', 'medio', '2025-10-17 12:22:00', '[\"Permitir que objetos de diferentes classes usem o mesmo método\", \"Reduzir código duplicado\", \"Permitir herança múltipla\", \"Proteger atributos privados\"]', 0, 195),
('O que é uma interface em POO?', 'POO', 'medio', '2025-10-17 12:25:00', '[\"Um tipo especial de classe que define métodos sem implementação\", \"Um objeto instanciável\", \"Uma variável pública\", \"Um construtor padrão\"]', 0, 196),
('Qual o principal objetivo da camada de aplicação no modelo OSI?', 'Redes', 'facil', '2025-10-17 12:28:00', '[\"Transmitir pacotes\", \"Roteamento de dados\", \"Permitir interação com o usuário e aplicações\", \"Verificação de erros\"]', 2, 197),
('Qual é a função da camada de enlace de dados?', 'Redes', 'medio', '2025-10-17 12:31:00', '[\"Gerenciar endereçamento IP\", \"Converter dados em pacotes\", \"Detectar e corrigir erros de transmissão\", \"Gerar chaves criptográficas\"]', 2, 198),
('O que é criptografia simétrica?', 'Segurança', 'medio', '2025-10-17 12:34:00', '[\"Usa chaves diferentes para criptografar e descriptografar\", \"Não usa chaves\", \"Usa a mesma chave para criptografar e descriptografar\", \"Depende do protocolo HTTPS\"]', 2, 199),
('O que é um ataque de força bruta?', 'Segurança', 'medio', '2025-10-17 12:37:00', '[\"Tentativa de todas as combinações possíveis de senha\", \"Interceptação de pacotes\", \"Engenharia social\", \"Exploração de falhas de hardware\"]', 0, 200),
('Qual princípio da segurança da informação impede acesso não autorizado?', 'Segurança', 'facil', '2025-10-17 12:40:00', '[\"Integridade\", \"Disponibilidade\", \"Confidencialidade\", \"Autenticidade\"]', 2, 201),
('Em arquitetura de software, o que é um microserviço?', 'Arquitetura', 'medio', '2025-10-17 12:43:00', '[\"Um pequeno componente de UI\", \"Um plugin de sistema\", \"Um componente do banco de dados\", \"Um serviço independente e isolado que executa uma função específica\"]', 3, 202),
('O que caracteriza uma arquitetura monolítica?', 'Arquitetura', 'facil', '2025-10-17 12:46:00', '[\"Sistema distribuído em microserviços\", \"Códigos isolados e desacoplados\", \"Execução paralela obrigatória\", \"Aplicação única com todos os módulos integrados\"]', 3, 203),
('Qual vantagem principal da arquitetura em camadas?', 'Arquitetura', 'medio', '2025-10-17 12:49:00', '[\"Maior tempo de execução\", \"Menor legibilidade de código\", \"Redução da modularização\", \"Maior desacoplamento e manutenção facilitada\"]', 3, 204),
('Qual estrutura de dados é ideal para busca binária?', 'Estrutura de Dados', 'medio', '2025-10-17 12:52:00', '[\"Árvore binária\", \"Fila\", \"Grafo\", \"Lista não ordenada\"]', 0, 205),
('Qual algoritmo é usado em criptografia assimétrica?', 'Segurança', 'dificil', '2025-10-17 12:55:00', '[\"SHA-256\", \"AES\", \"MD5\", \"RSA\"]', 3, 206),
('O que é uma variável booleana?', 'Lógica de Programação', 'facil', '2025-10-17 12:58:00', '[\"Uma variável que armazena números inteiros\", \"Uma variável que armazena texto\", \"Uma variável que armazena listas\", \"Uma variável que armazena verdadeiro ou falso\"]', 3, 207),
('Qual operador lógico representa a negação?', 'Lógica de Programação', 'facil', '2025-10-17 13:01:00', '[\"&&\", \"||\", \"==\", \"!\"]', 3, 208),
('O que é recursão?', 'Algoritmos', 'medio', '2025-10-17 13:04:00', '[\"Repetir um código com laços for\", \"Usar várias variáveis simultaneamente\", \"Percorrer uma lista em ordem\", \"Uma função que chama a si mesma\"]', 3, 209),
('Qual estrutura de dados é usada em algoritmos de busca em largura (BFS)?', 'Estrutura de Dados', 'dificil', '2025-10-17 13:07:00', '[\"Fila\", \"Árvore\", \"Lista\", \"Pilha\"]', 0, 210),
('O que é um processo em Sistemas Operacionais?', 'Sistemas Operacionais', 'facil', '2025-10-17 13:10:00', '[\"Um arquivo armazenado no disco\", \"Um tipo de driver\", \"Um programa em execução\", \"Um serviço de rede\"]', 2, 211),
('Qual a função do escalonador de processos?', 'Sistemas Operacionais', 'medio', '2025-10-17 13:13:00', '[\"Gerenciar a memória RAM\", \"Controlar o acesso ao disco rígido\", \"Gerar logs do sistema\", \"Decidir qual processo será executado a seguir\"]', 3, 212),
('O que é memória virtual?', 'Sistemas Operacionais', 'medio', '2025-10-17 13:16:00', '[\"Um tipo de cache da CPU\", \"Um espaço reservado para logs\", \"Um particionamento lógico da RAM\", \"Uma expansão da memória RAM usando o disco\"]', 3, 213),
('Qual é a diferença entre processo e thread?', 'Sistemas Operacionais', 'dificil', '2025-10-17 13:19:00', '[\"Processos são mais leves que threads\", \"Threads funcionam de forma independente\", \"Não há diferença significativa\", \"Threads compartilham recursos de um mesmo processo\"]', 3, 214),
('O que é o sistema de arquivos (File System)?', 'Sistemas Operacionais', 'facil', '2025-10-17 13:22:00', '[\"Estrutura que organiza e gerencia arquivos no disco\", \"Um serviço de rede local\", \"Um gerenciador de usuários\", \"Um conjunto de processos em execução\"]', 0, 215),
('O que significa o princípio DRY em programação?', 'Boas Práticas', 'facil', '2025-10-17 13:25:00', '[\"Do Repeat Yourself\", \"Define Real Yield\", \"Dynamic Runtime Yield\", \"Dont Repeat Yourself\"]', 3, 216),
('O que é refatoração de código?', 'Boas Práticas', 'medio', '2025-10-17 13:28:00', '[\"Alterar a lógica de negócio\", \"Melhorar o código sem mudar seu comportamento\", \"Adicionar novas funcionalidades\", \"Comprimir código duplicado\"]', 1, 217),
('Qual prática ajuda a manter o código legível e modular?', 'Boas Práticas', 'facil', '2025-10-17 13:31:00', '[\"Evitar comentários\", \"Usar funções pequenas e coesas\", \"Usar variáveis genéricas\", \"Aumentar a complexidade do código\"]', 1, 218),
('O que é o princípio KISS na engenharia de software?', 'Boas Práticas', 'medio', '2025-10-17 13:34:00', '[\"Keep It Safe and Strong\", \"Keep Internal System Secure\", \"Keep It Simple, Stupid\", \"Key Integration Syntax Structure\"]', 2, 219),
('Qual o objetivo dos testes automatizados?', 'Boas Práticas', 'medio', '2025-10-17 13:37:00', '[\"Garantir que o código funcione conforme esperado\", \"Reduzir custos de hardware\", \"Detectar erros manualmente\", \"Aumentar o tempo de execução\"]', 0, 220),
('O que é um algoritmo guloso?', 'Algoritmos', 'medio', '2025-10-17 13:40:00', '[\"Aquele que testa todas as opções possíveis\", \"Aquele que usa recursão excessiva\", \"Aquele que escolhe a melhor opção local esperando o melhor resultado global\", \"Um algoritmo que consome muita memória\"]', 2, 221),
('Qual é a principal vantagem do algoritmo de Dijkstra?', 'Algoritmos', 'medio', '2025-10-17 13:43:00', '[\"Ordenar grandes listas\", \"Buscar elementos em árvores\", \"Encontrar o menor caminho em grafos ponderados\", \"Criptografar dados\"]', 2, 222),
('Qual é o pior caso de complexidade do algoritmo Bubble Sort?', 'Algoritmos', 'facil', '2025-10-17 13:46:00', '[\"O(1)\", \"O(n)\", \"O(log n)\", \"O(n²)\"]', 3, 223),
('O que é um grafo direcionado?', 'Estrutura de Dados', 'medio', '2025-10-17 13:49:00', '[\"Lista encadeada com ponteiros\", \"Árvore binária\", \"Conjunto de nós conectados por arestas com direção\", \"Tabela hash com peso\"]', 2, 224),
('O que caracteriza um algoritmo recursivo?', 'Algoritmos', 'facil', '2025-10-17 13:52:00', '[\"Usa funções que chamam a si mesmas\", \"Evita o uso de pilhas\", \"Usa apenas laços for\", \"Depende de threads\"]', 0, 225),
('O que é uma API RESTful?', 'Backend', 'facil', '2025-10-17 13:55:00', '[\"Um protocolo de rede\", \"Um padrão que define boas práticas para criação de APIs\", \"Um tipo de banco de dados\", \"Um servidor web dedicado\"]', 1, 226),
('O que é um endpoint em uma API?', 'Backend', 'facil', '2025-10-17 13:58:00', '[\"Um banco de dados remoto\", \"Um servidor de autenticação\", \"Uma rota específica que responde a uma requisição\", \"Uma biblioteca cliente\"]', 2, 227),
('O que é hashing?', 'Segurança', 'medio', '2025-10-17 14:01:00', '[\"Compactar arquivos para transmissão\", \"Criptografar dados com chave pública\", \"Transformar dados em um valor fixo e irreversível\", \"Converter números em texto\"]', 2, 228),
('Qual é a principal função de uma VPN?', 'Segurança', 'facil', '2025-10-17 14:04:00', '[\"Reduzir o uso de memória\", \"Criar um túnel seguro entre redes\", \"Bloquear cookies\", \"Aumentar a velocidade da internet\"]', 1, 229),
('O que é uma árvore binária de busca (BST)?', 'Estrutura de Dados', 'medio', '2025-10-17 14:07:00', '[\"Uma estrutura que armazena dados em ordem, com nós à esquerda menores e à direita maiores\", \"Um grafo ponderado\", \"Uma lista de nós conectados aleatoriamente\", \"Uma pilha hierárquica\"]', 0, 230),
('O que é o kernel de um sistema operacional?', 'Sistemas Operacionais', 'medio', '2025-10-17 14:10:00', '[\"A interface gráfica do sistema\", \"O núcleo responsável por gerenciar hardware e processos\", \"Um tipo de driver de dispositivo\", \"Um módulo de segurança\"]', 1, 231),
('Qual é a principal função do sistema de gerenciamento de memória?', 'Sistemas Operacionais', 'facil', '2025-10-17 14:13:00', '[\"Alocar e liberar memória para processos\", \"Armazenar logs do sistema\", \"Organizar diretórios\", \"Gerar relatórios de uso do CPU\"]', 0, 232),
('O que é um deadlock?', 'Sistemas Operacionais', 'dificil', '2025-10-17 14:16:00', '[\"Uma falha de hardware\", \"Situação em que dois processos esperam indefinidamente por recursos um do outro\", \"Um tipo de cache corrompido\", \"Erro de compilação de sistema\"]', 1, 233),
('Qual comando é usado para listar processos no Linux?', 'Sistemas Operacionais', 'facil', '2025-10-17 14:19:00', '[\"listproc\", \"procview\", \"lsproc\", \"ps\"]', 3, 234),
('O que é o sistema de arquivos NTFS?', 'Sistemas Operacionais', 'medio', '2025-10-17 14:22:00', '[\"Um sistema de arquivos usado pelo Windows\", \"O formato de arquivo usado por Linux\", \"Um sistema de segurança da Microsoft\", \"Um protocolo de rede\"]', 0, 235),
('O que é o princípio SOLID em programação?', 'Boas Práticas', 'medio', '2025-10-17 14:25:00', '[\"Uma metodologia de testes\", \"Um padrão de autenticação\", \"Um conjunto de princípios para melhorar design de software\", \"Um modelo de banco de dados\"]', 2, 236),
('O que é o conceito de “Clean Code”?', 'Boas Práticas', 'facil', '2025-10-17 14:28:00', '[\"Código que funciona apenas em ambiente local\", \"Código legível, simples e fácil de manter\", \"Código gerado automaticamente\", \"Código criptografado\"]', 1, 237),
('Por que é importante usar versionamento de código?', 'Boas Práticas', 'facil', '2025-10-17 14:31:00', '[\"Para salvar automaticamente as senhas\", \"Para gerar logs de servidor\", \"Para aumentar a performance do programa\", \"Para manter histórico e controle de alterações no código\"]', 3, 238),
('O que significa o princípio YAGNI?', 'Boas Práticas', 'medio', '2025-10-17 14:34:00', '[\"Your Application Generates New Inputs\", \"Yet Another Global Network Interface\", \"Yield A Good New Idea\", \"You Aren’t Gonna Need It\"]', 3, 239),
('O que é code smell?', 'Boas Práticas', 'dificil', '2025-10-17 14:37:00', '[\"Um indício de má qualidade de design no código\", \"Um bug que causa falhas críticas\", \"Um erro de compilação\", \"Um tipo de exceção não tratada\"]', 0, 240),
('O que é o algoritmo Quicksort?', 'Algoritmos', 'medio', '2025-10-17 14:40:00', '[\"Um algoritmo de busca linear\", \"Um algoritmo de ordenação eficiente baseado em divisão e conquista\", \"Um método de criptografia\", \"Uma estrutura de dados dinâmica\"]', 1, 241),
('Qual algoritmo tem a menor complexidade média para busca em lista ordenada?', 'Algoritmos', 'medio', '2025-10-17 14:43:00', '[\"Busca linear\", \"Busca binária\", \"Busca aleatória\", \"Busca sequencial\"]', 1, 242),
('Qual é o principal objetivo de um algoritmo de ordenação?', 'Algoritmos', 'facil', '2025-10-17 14:46:00', '[\"Calcular médias\", \"Converter dados em texto\", \"Reorganizar dados em uma sequência específica\", \"Remover duplicatas\"]', 2, 243),
('O que é uma tabela hash?', 'Estrutura de Dados', 'medio', '2025-10-17 14:49:00', '[\"Um tipo de lista encadeada\", \"Um algoritmo de ordenação\", \"Um grafo ponderado\", \"Uma estrutura que armazena pares chave-valor para busca rápida\"]', 3, 244),
('O que é balanceamento em árvores AVL?', 'Estrutura de Dados', 'dificil', '2025-10-17 14:52:00', '[\"Ajuste automático de nós para manter a árvore equilibrada\", \"Busca otimizada por índices\", \"Conversão em listas ordenadas\", \"Remoção de nós duplicados\"]', 0, 245),
('O que é autenticação de dois fatores (2FA)?', 'Segurança', 'facil', '2025-10-17 14:55:00', '[\"Um firewall avançado\", \"Um tipo de ataque DDoS\", \"Uma VPN segura\", \"Método que exige duas etapas de verificação de identidade\"]', 3, 246),
('Qual é a função de um certificado SSL?', 'Segurança', 'medio', '2025-10-17 14:58:00', '[\"Controlar acesso físico ao servidor\", \"Bloquear anúncios maliciosos\", \"Armazenar senhas do navegador\", \"Garantir criptografia e autenticação entre cliente e servidor\"]', 3, 247),
('O que é uma arquitetura cliente-servidor?', 'Arquitetura', 'facil', '2025-10-17 15:01:00', '[\"Modelo de banco de dados relacional\", \"Rede peer-to-peer\", \"Sistema embarcado local\", \"Modelo onde clientes solicitam serviços e servidores respondem\"]', 3, 248),
('O que caracteriza uma API GraphQL?', 'Backend', 'medio', '2025-10-17 15:04:00', '[\"Serve apenas para streaming de dados\", \"É um banco de dados NoSQL\", \"Usa apenas o método GET\", \"Permite consultas flexíveis e específicas em uma única requisição\"]', 3, 249),
('O que é cache em sistemas backend?', 'Backend', 'medio', '2025-10-17 15:07:00', '[\"Um armazenamento temporário para acelerar o acesso a dados frequentemente usados\", \"Uma API de autenticação\", \"Uma estrutura de controle de fluxo\", \"Um tipo de banco de dados relacional\"]', 0, 250),
('Qual operador lógico retorna verdadeiro se ambas condições forem verdadeiras?', 'Lógica de Programação', 'facil', '2025-10-18 10:00:00', '[\"||\", \"!\", \"==\", \"&&\"]', 3, 251),
('O que é uma expressão condicional ternária?', 'Lógica de Programação', 'medio', '2025-10-18 10:05:00', '[\"Três condições em sequência\", \"Um loop com três iterações\", \"Uma função com três parâmetros\", \"Uma forma compacta de if-else em uma linha\"]', 3, 252),
('Qual o resultado de (true && false)?', 'Lógica de Programação', 'facil', '2025-10-18 10:10:00', '[\"true\", \"null\", \"undefined\", \"false\"]', 3, 253),
('O que são tabelas verdade?', 'Lógica de Programação', 'medio', '2025-10-18 10:15:00', '[\"Tabelas de banco de dados\", \"Arrays de valores booleanos\", \"Matrizes binárias\", \"Representação de todas as combinações possíveis de valores lógicos\"]', 3, 254),
('Qual o resultado de (!true)?', 'Lógica de Programação', 'facil', '2025-10-18 10:20:00', '[\"false\", \"0\", \"1\", \"true\"]', 0, 255);
INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('O que é short-circuit evaluation?', 'Lógica de Programação', 'dificil', '2025-10-18 10:25:00', '[\"Avaliar todas as condições sempre\", \"Um tipo de otimização de código\", \"Um padrão de design\", \"Avaliar apenas o necessário para determinar o resultado\"]', 3, 256),
('Qual o resultado de (false || true)?', 'Lógica de Programação', 'facil', '2025-10-18 10:30:00', '[\"false\", \"null\", \"undefined\", \"true\"]', 3, 257),
('O que são operadores de comparação?', 'Lógica de Programação', 'facil', '2025-10-18 10:35:00', '[\"Operadores matemáticos\", \"Funções de comparação\", \"Métodos de ordenação\", \"Operadores que comparam valores e retornam booleano\"]', 3, 258),
('Qual a diferença entre == e === em JavaScript?', 'Lógica de Programação', 'medio', '2025-10-18 10:40:00', '[\"São iguais\", \"=== é mais rápido\", \"== é mais moderno\", \"=== compara valor e tipo, == apenas valor\"]', 3, 259),
('O que é precedência de operadores?', 'Lógica de Programação', 'medio', '2025-10-18 10:45:00', '[\"Ordem em que operadores são avaliados\", \"Sequência de declarações\", \"Hierarquia de classes\", \"Prioridade de execução de funções\"]', 0, 260),
('O que é arquitetura hexagonal (Ports and Adapters)?', 'Arquitetura', 'dificil', '2025-10-18 11:00:00', '[\"Arquitetura com seis camadas\", \"Padrão para sistemas distribuídos\", \"Framework de testes\", \"Isola lógica de negócio de detalhes técnicos usando portas e adaptadores\"]', 3, 261),
('O que caracteriza uma arquitetura orientada a serviços (SOA)?', 'Arquitetura', 'medio', '2025-10-18 11:05:00', '[\"Objetos orientados a serviços\", \"Arquitetura de banco de dados\", \"Padrão de design\", \"Serviços independentes que se comunicam via protocolos padrão\"]', 3, 262),
('O que é CQRS (Command Query Responsibility Segregation)?', 'Arquitetura', 'dificil', '2025-10-18 11:10:00', '[\"Framework de segurança\", \"Padrão de cache\", \"Tipo de banco de dados\", \"Separação entre operações de leitura e escrita\"]', 3, 263),
('Qual o papel do API Gateway em microserviços?', 'Arquitetura', 'medio', '2025-10-18 11:15:00', '[\"Ponto único de entrada para roteamento de requisições\", \"Servidor de banco de dados\", \"Cache distribuído\", \"Sistema de autenticação\"]', 0, 264),
('O que é Event Sourcing?', 'Arquitetura', 'dificil', '2025-10-18 11:20:00', '[\"Armazenar mudanças de estado como sequência de eventos\", \"Sistema de mensageria\", \"Tipo de cache\", \"Padrão de logging\"]', 0, 265),
('O que caracteriza arquitetura serverless?', 'Arquitetura', 'medio', '2025-10-18 11:25:00', '[\"Arquitetura sem backend\", \"Servidores virtuais\", \"Containers Docker\", \"Execução de código sob demanda sem gerenciar servidores\"]', 3, 266),
('O que é GraphQL Subscription?', 'Backend', 'dificil', '2025-10-18 12:00:00', '[\"Tipo de pagamento recorrente\", \"Permite receber atualizações em tempo real do servidor\", \"Sistema de autenticação\", \"Padrão de cache\"]', 1, 267),
('O que são background jobs?', 'Backend', 'medio', '2025-10-18 12:05:00', '[\"Threads da aplicação\", \"Processos em segundo plano do SO\", \"Tarefas executadas de forma assíncrona fora do fluxo principal\", \"Workers de frontend\"]', 2, 268),
('O que é idempotência em APIs REST?', 'Backend', 'dificil', '2025-10-18 12:10:00', '[\"Padrão de design\", \"Segurança de API\", \"Tipo de cache\", \"Propriedade onde múltiplas requisições idênticas têm o mesmo efeito que uma\"]', 3, 269),
('O que é server-sent events (SSE)?', 'Backend', 'medio', '2025-10-18 12:15:00', '[\"Tecnologia para servidor enviar atualizações automáticas ao cliente\", \"Tipo de WebSocket\", \"Sistema de logs\", \"Padrão de mensageria\"]', 0, 270),
('O que significa o princípio de \"Separation of Concerns\"?', 'Boas Práticas', 'medio', '2025-10-18 13:00:00', '[\"Separar código em arquivos\", \"Dividir o programa em seções distintas, cada uma tratando de um aspecto\", \"Dividir equipes de desenvolvimento\", \"Isolar bugs\"]', 1, 271),
('O que é code review?', 'Boas Práticas', 'facil', '2025-10-18 13:05:00', '[\"Documentação de código\", \"Testes automatizados\", \"Revisão de código por outros desenvolvedores antes do merge\", \"Versionamento\"]', 2, 272),
('O que é pair programming?', 'Boas Práticas', 'facil', '2025-10-18 13:10:00', '[\"Metodologia de testes\", \"Programação em dupla de computadores\", \"Backup de código\", \"Dois desenvolvedores trabalhando juntos no mesmo código\"]', 3, 273),
('O que significa \"Fail Fast\"?', 'Boas Práticas', 'medio', '2025-10-18 13:15:00', '[\"Desistir rapidamente de tarefas\", \"Detectar e reportar erros o mais cedo possível\", \"Execução rápida de testes\", \"Deploy acelerado\"]', 1, 274),
('O que é uma árvore B?', 'Estrutura de Dados', 'dificil', '2025-10-18 14:00:00', '[\"Árvore auto-balanceada otimizada para sistemas que leem/escrevem blocos\", \"Árvore binária simples\", \"Lista encadeada\", \"Grafo direcionado\"]', 0, 275),
('O que é um heap?', 'Estrutura de Dados', 'medio', '2025-10-18 14:05:00', '[\"Algoritmo de ordenação\", \"Tipo de lista\", \"Área de memória\", \"Árvore binária onde cada nó pai tem valor maior ou menor que seus filhos\"]', 3, 276),
('O que é um Trie (árvore de prefixos)?', 'Estrutura de Dados', 'dificil', '2025-10-18 14:10:00', '[\"Tipo de grafo\", \"Estrutura para armazenamento eficiente de strings com prefixos comuns\", \"Lista encadeada\", \"Tabela hash\"]', 1, 277),
('Qual a diferença entre lista ligada simples e dupla?', 'Estrutura de Dados', 'medio', '2025-10-18 14:15:00', '[\"Lista dupla usa menos memória\", \"Lista simples é mais rápida\", \"Lista dupla tem referência para próximo e anterior\", \"Não há diferença prática\"]', 2, 278),
('O que é NAT (Network Address Translation)?', 'Redes', 'medio', '2025-10-18 15:00:00', '[\"Sistema de DNS\", \"Protocolo de roteamento\", \"Tipo de firewall\", \"Tradução de endereços IP entre redes privadas e públicas\"]', 3, 279),
('O que é latência de rede?', 'Redes', 'facil', '2025-10-18 15:05:00', '[\"Tempo que um pacote leva para ir de um ponto a outro\", \"Largura de banda\", \"Velocidade de download\", \"Taxa de transferência\"]', 0, 280),
('O que é um endereço MAC?', 'Redes', 'facil', '2025-10-18 15:10:00', '[\"Endereço IP privado\", \"Identificador físico único de uma interface de rede\", \"Protocolo de rede\", \"Sistema operacional\"]', 1, 281),
('O que é QoS (Quality of Service)?', 'Redes', 'medio', '2025-10-18 15:15:00', '[\"Sistema de cache\", \"Protocolo de segurança\", \"Priorização de tráfego de rede para garantir performance\", \"Tipo de roteamento\"]', 2, 282),
('O que é uma sub-rede (subnet)?', 'Redes', 'medio', '2025-10-18 15:20:00', '[\"Sistema de DNS\", \"Tipo de VPN\", \"Protocolo de roteamento\", \"Divisão lógica de uma rede IP em redes menores\"]', 3, 283),
('O que é SQL Injection?', 'Segurança', 'medio', '2025-10-18 16:00:00', '[\"Ataque que injeta código SQL malicioso em queries\", \"Tipo de backup\", \"Técnica de otimização\", \"Sistema de cache\"]', 0, 284),
('O que é XSS (Cross-Site Scripting)?', 'Segurança', 'medio', '2025-10-18 16:05:00', '[\"Injeção de scripts maliciosos em páginas web\", \"Protocolo de segurança\", \"Tipo de firewall\", \"Sistema de autenticação\"]', 0, 285),
('O que é CSRF (Cross-Site Request Forgery)?', 'Segurança', 'dificil', '2025-10-18 16:10:00', '[\"Sistema de cache\", \"Tipo de vírus\", \"Protocolo de rede\", \"Ataque que força usuário a executar ações indesejadas em site autenticado\"]', 3, 286),
('O que é salt em criptografia de senhas?', 'Segurança', 'medio', '2025-10-18 16:15:00', '[\"Tipo de algoritmo\", \"Dados aleatórios adicionados à senha antes do hash\", \"Protocolo de segurança\", \"Sistema de backup\"]', 1, 287),
('O que é swap em sistemas operacionais?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:00:00', '[\"Sistema de arquivos\", \"Troca de processos\", \"Espaço em disco usado como extensão da memória RAM\", \"Tipo de cache\"]', 2, 288),
('O que é um daemon?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:05:00', '[\"Sistema de logs\", \"Vírus de computador\", \"Tipo de arquivo\", \"Processo que roda em background fornecendo serviços\"]', 3, 289),
('O que é I/O scheduling?', 'Sistemas Operacionais', 'dificil', '2025-10-18 17:10:00', '[\"Ordem em que operações de entrada/saída são executadas\", \"Agendamento de processos\", \"Sistema de cache\", \"Protocolo de rede\"]', 0, 290),
('O que é um inode?', 'Sistemas Operacionais', 'dificil', '2025-10-18 17:15:00', '[\"Tipo de processo\", \"Estrutura que armazena metadados de arquivos em sistemas Unix\", \"Sistema de memória\", \"Protocolo de rede\"]', 1, 291),
('O que é um loop infinito?', 'Lógica de Programação', 'facil', '2025-10-18 10:50:00', '[\"Um erro de compilação\", \"Um loop com muitas iterações\", \"Um loop que nunca termina sua execução\", \"Um tipo de recursão\"]', 2, 292),
('Qual estrutura de controle repete enquanto a condição for verdadeira?', 'Lógica de Programação', 'facil', '2025-10-18 10:55:00', '[\"try\", \"if\", \"switch\", \"while\"]', 3, 293),
('O que é fluxo de controle em programação?', 'Lógica de Programação', 'medio', '2025-10-18 11:00:00', '[\"Controle de versão\", \"A ordem em que instruções são executadas\", \"Gerenciamento de memória\", \"Sistema de logs\"]', 1, 294),
('Qual o resultado de (true || false)?', 'Lógica de Programação', 'facil', '2025-10-18 11:05:00', '[\"true\", \"false\", \"null\", \"undefined\"]', 0, 295),
('O que significa \"break\" em um loop?', 'Lógica de Programação', 'facil', '2025-10-18 11:10:00', '[\"Continua para a próxima iteração\", \"Pausa o loop temporariamente\", \"Reinicia o loop\", \"Interrompe a execução do loop imediatamente\"]', 3, 296),
('O que é Domain-Driven Design (DDD)?', 'Arquitetura', 'dificil', '2025-10-18 11:50:00', '[\"Framework de desenvolvimento\", \"Abordagem de modelagem focada no domínio do negócio\", \"Tipo de banco de dados\", \"Metodologia ágil\"]', 1, 297),
('O que é agregação no DDD?', 'Arquitetura', 'dificil', '2025-10-18 11:55:00', '[\"Tipo de join\", \"Soma de valores\", \"Grupo de objetos tratados como uma unidade\", \"Padrão de cache\"]', 2, 298),
('O que é Service Mesh?', 'Arquitetura', 'dificil', '2025-10-18 12:00:00', '[\"Sistema de cache\", \"Rede de servidores\", \"Tipo de firewall\", \"Camada de infraestrutura para comunicação entre microserviços\"]', 3, 299),
('O que é Backend for Frontend (BFF)?', 'Arquitetura', 'medio', '2025-10-18 12:05:00', '[\"API específica para cada tipo de cliente/frontend\", \"Framework backend\", \"Padrão de design\", \"Sistema de cache\"]', 0, 300),
('O que é Strangler Pattern?', 'Arquitetura', 'dificil', '2025-10-18 12:10:00', '[\"Padrão de destruição\", \"Migração gradual de sistema legado substituindo partes incrementalmente\", \"Tipo de refatoração\", \"Sistema de versionamento\"]', 1, 301),
('O que é HATEOAS em REST?', 'Backend', 'dificil', '2025-10-18 12:40:00', '[\"Tipo de cache\", \"Protocolo de segurança\", \"Hipermídia como motor do estado da aplicação\", \"Sistema de autenticação\"]', 2, 302),
('O que é throttling em APIs?', 'Backend', 'medio', '2025-10-18 12:45:00', '[\"Sistema de logs\", \"Aceleração de requisições\", \"Tipo de cache\", \"Limitação da taxa de requisições por tempo\"]', 3, 303),
('O que é Content Negotiation?', 'Backend', 'medio', '2025-10-18 12:50:00', '[\"Mecanismo para servir diferentes formatos baseado na requisição\", \"Negociação de preços\", \"Tipo de autenticação\", \"Sistema de cache\"]', 0, 304),
('O que é um Message Broker?', 'Backend', 'medio', '2025-10-18 12:55:00', '[\"Intermediário que gerencia troca de mensagens entre sistemas\", \"Tipo de servidor\", \"Sistema de cache\", \"Protocolo de rede\"]', 0, 305),
('O que é Circuit Breaker pattern?', 'Backend', 'dificil', '2025-10-18 13:00:00', '[\"Padrão de segurança\", \"Tipo de firewall\", \"Sistema de energia\", \"Padrão que previne falhas em cascata parando requisições para serviços com falha\"]', 3, 306),
('O que é technical debt?', 'Boas Práticas', 'medio', '2025-10-18 13:30:00', '[\"Dívida financeira da empresa\", \"Custo implícito de refatoração futura por escolhas rápidas no presente\", \"Bugs acumulados\", \"Documentação pendente\"]', 1, 307),
('O que significa \"Convention over Configuration\"?', 'Boas Práticas', 'medio', '2025-10-18 13:40:00', '[\"Usar apenas configurações\", \"Documentar convenções\", \"Configurar tudo manualmente\", \"Usar convenções padrão ao invés de exigir configurações explícitas\"]', 3, 309),
('O que é mob programming?', 'Boas Práticas', 'facil', '2025-10-18 13:45:00', '[\"Toda equipe trabalhando no mesmo código ao mesmo tempo\", \"Programação em massa\", \"Testes coletivos\", \"Deploy em grupo\"]', 0, 310),
('O que é defensive programming?', 'Boas Práticas', 'medio', '2025-10-18 13:50:00', '[\"Programar com segurança máxima\", \"Programar antecipando possíveis erros e validando entradas\", \"Criptografar todo código\", \"Usar firewalls\"]', 1, 311),
('O que é uma fila de prioridade?', 'Estrutura de Dados', 'medio', '2025-10-18 14:20:00', '[\"Pilha invertida\", \"Fila comum mais rápida\", \"Fila onde elementos são processados baseado em prioridade\", \"Lista ordenada\"]', 2, 312),
('O que é um grafo cíclico?', 'Estrutura de Dados', 'medio', '2025-10-18 14:25:00', '[\"Grafo sem arestas\", \"Grafo com círculos\", \"Grafo ordenado\", \"Grafo que contém pelo menos um ciclo\"]', 3, 313),
('O que é collision em hash table?', 'Estrutura de Dados', 'medio', '2025-10-18 14:30:00', '[\"Erro de memória\", \"Quando duas chaves diferentes geram o mesmo hash\", \"Sobrecarga de dados\", \"Tipo de ataque\"]', 1, 314),
('O que é um deque?', 'Estrutura de Dados', 'facil', '2025-10-18 14:35:00', '[\"Fila de duas pontas onde elementos podem ser adicionados/removidos de ambos os lados\", \"Duas filas juntas\", \"Pilha dupla\", \"Lista circular\"]', 0, 315),
('O que é BGP (Border Gateway Protocol)?', 'Redes', 'dificil', '2025-10-18 15:25:00', '[\"Protocolo de segurança\", \"Protocolo de roteamento entre sistemas autônomos na internet\", \"Tipo de firewall\", \"Sistema de DNS\"]', 1, 317),
('O que é packet switching?', 'Redes', 'medio', '2025-10-18 15:30:00', '[\"Tipo de roteador\", \"Troca de pacotes físicos\", \"Método de transmissão dividindo dados em pacotes que seguem rotas diferentes\", \"Sistema de firewall\"]', 2, 318),
('O que é DHCP?', 'Redes', 'facil', '2025-10-18 15:35:00', '[\"Protocolo de email\", \"Sistema de segurança\", \"Tipo de DNS\", \"Protocolo que atribui endereços IP automaticamente\"]', 3, 319),
('O que é throughput?', 'Redes', 'medio', '2025-10-18 15:40:00', '[\"Taxa real de transferência de dados bem-sucedida\", \"Velocidade teórica\", \"Tempo de resposta\", \"Latência média\"]', 0, 320),
('O que é ARP (Address Resolution Protocol)?', 'Redes', 'medio', '2025-10-18 15:45:00', '[\"Protocolo de roteamento\", \"Protocolo que mapeia endereços IP para endereços MAC\", \"Sistema de DNS\", \"Tipo de firewall\"]', 1, 321),
('O que é Man-in-the-Middle attack?', 'Segurança', 'medio', '2025-10-18 16:20:00', '[\"Tipo de vírus\", \"Ataque físico ao servidor\", \"Interceptação de comunicação entre duas partes\", \"Falha de rede\"]', 2, 322),
('O que é Penetration Testing?', 'Segurança', 'medio', '2025-10-18 16:25:00', '[\"Auditoria de código\", \"Teste de performance\", \"Backup de dados\", \"Teste autorizado de segurança simulando ataques reais\"]', 3, 323),
('O que é DDoS (Distributed Denial of Service)?', 'Segurança', 'facil', '2025-10-18 16:30:00', '[\"Ataque que sobrecarrega um sistema com tráfego de múltiplas fontes\", \"Vírus distribuído\", \"Erro de servidor\", \"Falha de DNS\"]', 0, 324),
('O que é Zero-day vulnerability?', 'Segurança', 'dificil', '2025-10-18 16:35:00', '[\"Vulnerabilidade descoberta antes de haver correção disponível\", \"Bug no dia de lançamento\", \"Falha conhecida\", \"Erro de programação\"]', 0, 325),
('O que é Security by Obscurity?', 'Segurança', 'medio', '2025-10-18 16:40:00', '[\"Sistema de autenticação\", \"Criptografia forte\", \"Protocolo seguro\", \"Prática questionável de segurança baseada em manter segredos do sistema\"]', 3, 326),
('O que é paginação de memória?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:20:00', '[\"Sistema de arquivos\", \"Técnica de gerenciamento de memória dividindo em páginas fixas\", \"Tipo de cache\", \"Protocolo de rede\"]', 1, 327),
('O que é context switch?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:25:00', '[\"Troca de usuário\", \"Mudança de contexto de código\", \"Troca de execução entre processos salvando e restaurando estados\", \"Alteração de variável\"]', 2, 328),
('O que é fork em sistemas Unix?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:30:00', '[\"Sistema de backup\", \"Bifurcação de código\", \"Tipo de thread\", \"Chamada de sistema que cria um novo processo clonando o atual\"]', 3, 329),
('O que é Round Robin scheduling?', 'Sistemas Operacionais', 'medio', '2025-10-18 17:35:00', '[\"Algoritmo que alterna processos em fatias de tempo iguais\", \"Tipo de loop\", \"Sistema de filas\", \"Protocolo de rede\"]', 0, 330),
('O que é race condition?', 'Sistemas Operacionais', 'dificil', '2025-10-18 17:40:00', '[\"Competição de performance\", \"Situação onde resultado depende da ordem de execução de processos concorrentes\", \"Tipo de deadlock\", \"Erro de sintaxe\"]', 1, 331),
('O que é um algoritmo de divisão e conquista?', 'Algoritmos', 'medio', '2025-10-18 18:00:00', '[\"Divide dados em partes iguais\", \"Conquista bugs do código\", \"Divide equipes de trabalho\", \"Divide problema em subproblemas menores, resolve recursivamente e combina\"]', 3, 332),
('Qual a complexidade de tempo do algoritmo Merge Sort?', 'Algoritmos', 'medio', '2025-10-18 18:05:00', '[\"O(n²)\", \"O(n)\", \"O(log n)\", \"O(n log n)\"]', 3, 333),
('O que é programação dinâmica?', 'Algoritmos', 'dificil', '2025-10-18 18:10:00', '[\"Linguagem de programação dinâmica\", \"Técnica que resolve problemas armazenando resultados de subproblemas\", \"Sistema de tipos dinâmicos\", \"Framework dinâmico\"]', 1, 334),
('O que caracteriza um algoritmo greedy (guloso)?', 'Algoritmos', 'medio', '2025-10-18 18:15:00', '[\"Faz escolha localmente ótima em cada etapa\", \"Usa muita memória\", \"É sempre o mais rápido\", \"Nunca falha\"]', 0, 335),
('Qual algoritmo de busca funciona apenas em arrays ordenados?', 'Algoritmos', 'facil', '2025-10-18 18:20:00', '[\"Busca sequencial\", \"Busca linear\", \"Busca aleatória\", \"Busca binária\"]', 3, 336),
('O que é backtracking?', 'Algoritmos', 'dificil', '2025-10-18 18:25:00', '[\"Retornar ao início do código\", \"Técnica que explora todas possibilidades voltando atrás quando necessário\", \"Desfazer commits no Git\", \"Voltar versões do sistema\"]', 1, 337),
('Qual a complexidade espacial de um algoritmo recursivo de Fibonacci ingênuo?', 'Algoritmos', 'dificil', '2025-10-18 18:30:00', '[\"O(n²)\", \"O(1)\", \"O(n)\", \"O(log n)\"]', 2, 338),
('O que é memoization?', 'Algoritmos', 'medio', '2025-10-18 18:35:00', '[\"Ferramenta de debugging\", \"Sistema de memória cache\", \"Tipo de documentação\", \"Técnica de armazenar resultados de chamadas de função para evitar recálculos\"]', 3, 339),
('O que é sobrecarga de métodos (overloading)?', 'POO', 'medio', '2025-10-18 18:45:00', '[\"Múltiplos métodos com mesmo nome mas parâmetros diferentes\", \"Método que usa muita memória\", \"Método muito longo\", \"Erro de compilação\"]', 0, 340),
('O que é sobrescrita de métodos (overriding)?', 'POO', 'medio', '2025-10-18 18:50:00', '[\"Escrever código sobre outro código\", \"Subclasse redefine método da superclasse\", \"Deletar método anterior\", \"Copiar método de outra classe\"]', 1, 341),
('O que são classes abstratas?', 'POO', 'medio', '2025-10-18 18:55:00', '[\"Classes virtuais\", \"Classes sem implementação\", \"Classes que não podem ser instanciadas e servem como base para outras\", \"Classes temporárias\"]', 2, 342),
('O que é composição em POO?', 'POO', 'dificil', '2025-10-18 19:00:00', '[\"Interface de classes\", \"Mistura de classes\", \"Herança múltipla\", \"Relacionamento onde um objeto contém outros objetos como partes\"]', 3, 343),
('Qual a complexidade de tempo (pior caso) do algoritmo QuickSort quando o pivô é mal escolhido?', 'Algoritmos', 'dificil', '2025-10-23 09:00:00', '[\"O(n²)\", \"O(n log n)\", \"O(log n)\", \"O(n)\"]', 0, 344),
('O que é uma Árvore B+ (B+ Tree) e onde ela é comumente usada?', 'Estrutura de Dados', 'dificil', '2025-10-23 09:00:00', '[\"Uma variante da Árvore B usada em sistemas de arquivos e bancos de dados para acesso eficiente em disco.\", \"Uma árvore auto-balanceada otimizada para busca em grafos.\", \"Uma árvore binária para gráficos.\", \"Uma estrutura de dados para criptografia.\"]', 0, 345),
('O que é o princípio de \"Least Privilege\" (Menor Privilégio)?', 'Segurança', 'dificil', '2025-10-23 09:00:00', '[\"Dar o menor número de privilégios a todos os usuários.\", \"Dar a um usuário ou processo apenas os acessos essenciais para realizar sua tarefa.\", \"Privilegiar sempre o administrador do sistema.\", \"Um privilégio que dura pouco tempo.\"]', 1, 346),
('Qual a principal diferença entre os protocolos TCP e UDP?', 'Redes', 'dificil', '2025-10-23 09:00:00', '[\"TCP é mais rápido, UDP é mais seguro.\", \"TCP garante a entrega ordenada dos pacotes (orientado à conexão), UDP não (não orientado à conexão).\", \"TCP é usado para DNS, UDP para email.\", \"TCP usa portas, UDP usa IPs.\"]', 1, 347),
('O que é o padrão \"Saga\" em microserviços?', 'Arquitetura', 'dificil', '2025-10-23 09:00:00', '[\"Uma sequência de transações locais que atualiza dados em múltiplos serviços, com compensações para falhas.\", \"Um serviço muito grande e complexo.\", \"Um padrão para documentar a história dos serviços.\", \"Um único banco de dados para todos os microserviços.\"]', 0, 348),
('O que é o N+1 Query Problem em ORMs?', 'Backend', 'dificil', '2025-10-23 09:00:00', '[\"Um problema onde uma query N+1 é mais rápida que N queries.\", \"Um problema de segurança que permite N+1 ataques.\", \"Um problema de performance onde uma query principal dispara N queries adicionais para buscar dados relacionados (lazy loading).\", \"Um padrão de design para ORMs.\"]', 2, 349),
('O que é \"Blue-Green Deployment\"?', 'DevOps', 'dificil', '2025-10-23 09:00:00', '[\"Usar servidores azuis e verdes para balanceamento de carga.\", \"Uma estratégia de release que mantém duas versões idênticas da produção (Azul e Verde) e alterna o tráfego entre elas.\", \"Um teste A/B para cores de interface.\", \"Um deploy que só ocorre em servidores ecológicos.\"]', 1, 350),
('O que é \"thrashing\" em gerenciamento de memória?', 'Sistemas Operacionais', 'dificil', '2025-10-23 09:00:00', '[\"Um processo que gasta muito tempo acessando a memória cache.\", \"Um estado em que o sistema gasta mais tempo trocando páginas (swapping) entre a RAM e o disco do que executando processos.\", \"Um tipo de ataque de negação de serviço.\", \"Um erro de alocação de memória.\"]', 1, 351),
('O que é o Princípio da Inversão de Dependência (DIP) do SOLID?', 'POO', 'dificil', '2025-10-23 09:00:00', '[\"Classes devem depender de implementações concretas, não de interfaces.\", \"As dependências devem ser sempre invertidas (de B para A, em vez de A para B).\", \"Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender de abstrações.\", \"Inverter o código para facilitar o debug.\"]', 2, 352),
('Qual a diferença entre `Promise.all()` e `Promise.race()`?', 'JavaScript', 'dificil', '2025-10-23 09:00:00', '[\"`all` só aceita Promises, `race` aceita qualquer valor.\", \"`race` espera todas, `all` retorna a primeira.\", \"`all` é para arrays, `race` é para objetos.\", \"`all` espera todas as Promises resolverem, `race` retorna assim que a primeira resolver ou rejeitar.\"]', 3, 353),
('O que é um \"Bloom Filter\"?', 'Estrutura de Dados', 'dificil', '2025-10-23 09:00:00', '[\"Um filtro de imagem que melhora as cores.\", \"Uma estrutura de dados probabilística para testar se um elemento é membro de um conjunto, permitindo falsos positivos.\", \"Um algoritmo de ordenação para dados florais.\", \"Um tipo de cache de CPU.\"]', 1, 354),
('O que é \"criptografia assimétrica\" (chave pública/privada)?', 'Segurança', 'dificil', '2025-10-23 09:00:00', '[\"Usa a mesma chave para criptografar e descriptografar.\", \"Usa um par de chaves: uma pública (para criptografar) e uma privada (para descriptografar).\", \"Uma criptografia que não é balanceada (assimétrica).\", \"Um tipo de hash unidirecional.\"]', 1, 355),
('O que é o \"Three-Way Handshake\" do TCP?', 'Redes', 'dificil', '2025-10-23 09:00:00', '[\"Um handshake entre três dispositivos diferentes.\", \"Uma troca de três pacotes para encerrar uma conexão.\", \"Um método de segurança com três chaves.\", \"Um processo de três etapas (SYN, SYN-ACK, ACK) para estabelecer uma conexão confiável.\"]', 3, 356),
('O que é o Teorema CAP (Consistência, Disponibilidade, Tolerância a Particionamento)?', 'Arquitetura', 'dificil', '2025-10-23 09:00:00', '[\"Um sistema deve ter todas as três propriedades.\", \"Um sistema distribuído pode ter no máximo duas dessas três propriedades simultaneamente.\", \"Um teorema sobre a capacidade máxima de um servidor.\", \"Um padrão de design para APIs.\"]', 1, 357),
('O que é gRPC?', 'Backend', 'dificil', '2025-10-23 09:00:00', '[\"Um framework de API RESTful do Google.\", \"Um sistema de RPC (Remote Procedure Call) de alta performance que usa HTTP/2 e Protocol Buffers.\", \"Um banco de dados de grafos do Google.\", \"Uma linguagem de programação concorrente.\"]', 1, 358),
('O que é \"Canary Release\"?', 'DevOps', 'dificil', '2025-10-23 09:00:00', '[\"Liberar a nova versão para 100% dos usuários de uma vez.\", \"Liberar a nova versão gradualmente para um pequeno subconjunto de usuários antes de liberar para todos.\", \"Um teste de segurança em um ambiente isolado.\", \"Um deploy que só funciona em redes \\\"canário\\\".\"]', 1, 359),
('Qual a diferença entre \"Composição\" e \"Herança\"?', 'POO', 'dificil', '2025-10-23 09:00:00', '[\"Composição é mais forte que Herança.\", \"Herança é um relacionamento \\\"é um\\\" (is-a), Composição é um relacionamento \\\"tem um\\\" (has-a).\", \"Herança permite reutilizar código, Composição não.\", \"São conceitos idênticos.\"]', 1, 361),
('O que é um \"Generator\" em JavaScript (funções `function*`)?', 'JavaScript', 'dificil', '2025-10-23 09:00:00', '[\"Uma função que gera números aleatórios.\", \"Uma função que gera HTML dinamicamente.\", \"Uma função que pode ser pausada e retomada, permitindo iterar valores sob demanda (lazy evaluation) usando `yield`.\", \"Um construtor de classes obsoleto.\"]', 2, 362),
('O que é uma \"Window Function\" em SQL?', 'SQL', 'dificil', '2025-10-23 09:00:00', '[\"Uma função que abre uma nova janela de resultados.\", \"Uma função que opera em um conjunto de linhas (uma \\\"janela\\\") relacionadas à linha atual, sem agrupar o resultado (como `ROW_NUMBER()`).\", \"Uma função para filtrar dados (`WHERE`).\", \"Uma função para criar tabelas temporárias.\"]', 1, 363),
('O que é \"Sharding\" em bancos de dados SQL?', 'SQL', 'dificil', '2025-10-23 09:15:00', '[\"Uma técnica de particionamento horizontal onde os dados são divididos entre múltiplos servidores.\", \"Um tipo de criptografia de dados.\", \"Um backup completo do banco de dados.\", \"Uma técnica de otimização de índices.\"]', 0, 364),
('O que é o \"Global Interpreter Lock\" (GIL) no Python (CPython)?', 'Python', 'dificil', '2025-10-23 09:15:00', '[\"Uma trava que impede que múltiplas threads executem bytecode Python simultaneamente (em um único processo).\", \"Um mecanismo de segurança para o interpretador.\", \"Uma trava que permite que múltiplas threads executem bytecode Python em paralelo real.\", \"Uma ferramenta de otimização de código.\"]', 0, 365),
('O que é \"Tree Shaking\" no contexto de build (ex: Webpack)?', 'Frontend', 'dificil', '2025-10-23 09:15:00', '[\"Um processo para otimizar a estrutura de pastas do projeto.\", \"Uma técnica de eliminação de código morto (dead code elimination) de JavaScript, removendo exportações não utilizadas.\", \"Um algoritmo para balancear árvores de componentes.\", \"Uma forma de depurar código em produção.\"]', 1, 366),
('O que é um \"Deadlock\" e quais são as quatro condições necessárias (Condições de Coffman)?', 'Sistemas Operacionais', 'dificil', '2025-10-23 09:15:00', '[\"Um erro de compilação; (1) Sem condições.\", \"Uma falha de hardware; (1) Hardware defeituoso.\", \"Dois processos esperando indefinidamente um pelo outro; (1) Mutex, (2) Hold and Wait, (3) No Preemption, (4) Circular Wait.\", \"Um processo muito rápido; (1) Alta CPU, (2) Baixa RAM.\"]', 2, 367),
('O que é \"WebAssembly\" (Wasm)?', 'Frontend', 'dificil', '2025-10-23 09:15:00', '[\"Um formato de bytecode binário de baixo nível que permite executar código (C, C++, Rust) no navegador.\", \"Uma nova linguagem de programação para substituir o JavaScript.\", \"Uma API do navegador para desenhar gráficos 3D.\", \"Um framework JavaScript para criar SPAs.\"]', 0, 368),
('O que significa \"ACID\" em transações SQL?', 'SQL', 'dificil', '2025-10-23 09:15:00', '[\"Um padrão de design para APIs de banco de dados.\", \"Um conjunto de propriedades (Atomicidade, Consistência, Isolamento, Durabilidade) que garante a confiabilidade das transações.\", \"Um tipo de query SQL otimizada.\", \"Um protocolo de segurança de rede.\"]', 1, 369),
('O que é \"Event Sourcing\"?', 'Arquitetura', 'dificil', '2025-10-23 09:15:00', '[\"Uma arquitetura onde todas as mudanças no estado da aplicação são armazenadas como uma sequência de eventos imutáveis.\", \"Um sistema que apenas processa eventos em tempo real.\", \"Um padrão para criar logs de sistema.\", \"Uma forma de carregar eventos do frontend.\"]', 0, 370),
('Qual a diferença entre \"Autenticação\" e \"Autorização\"?', 'Segurança', 'dificil', '2025-10-23 09:15:00', '[\"São a mesma coisa.\", \"Autenticação é verificar quem você é; Autorização é verificar o que você tem permissão para fazer.\", \"Autorização é verificar quem você é; Autenticação é verificar o que você pode fazer.\", \"Autenticação é para usuários, Autorização é para sistemas.\"]', 1, 371),
('O que é \"Injeção de SQL\" (SQL Injection)?', 'Segurança', 'dificil', '2025-10-23 09:15:00', '[\"Um tipo de ataque onde código SQL malicioso é inserido em entradas de dados para manipular o banco de dados.\", \"Uma técnica para otimizar queries SQL.\", \"Um método para adicionar dados ao banco de dados rapidamente.\", \"Um driver de banco de dados.\"]', 0, 372),
('O que é um \"Semáforo\" em programação concorrente?', 'Sistemas Operacionais', 'dificil', '2025-10-23 09:15:00', '[\"Um tipo de Mutex que só permite uma thread.\", \"Uma variável que conta o número de threads ativas.\", \"Um mecanismo de sincronização que controla o acesso a um recurso permitindo um número limitado de threads simultaneamente.\", \"Um sinalizador de erro de concorrência.\"]', 2, 373),
('O que é \"Big O Notation\" (Notação Big O)?', 'Algoritmos', 'dificil', '2025-10-23 09:15:00', '[\"Uma notação para o tamanho exato dos dados.\", \"Uma forma de descrever a complexidade (tempo ou espaço) de um algoritmo em relação ao tamanho da entrada, focando no pior caso.\", \"Um padrão de design de algoritmos.\", \"Uma linguagem de programação para algoritmos.\"]', 1, 374),
('O que é \"Prototypal Inheritance\" (Herança Prototípica) em JavaScript?', 'JavaScript', 'dificil', '2025-10-23 09:15:00', '[\"Um mecanismo onde objetos herdam propriedades e métodos diretamente de outros objetos (protótipos), em vez de classes.\", \"Uma forma de criar classes em JavaScript.\", \"Uma biblioteca externa para herança.\", \"Um tipo de herança múltipla.\"]', 0, 375),
('O que é \"Backpressure\" em sistemas reativos/streams?', 'Arquitetura', 'dificil', '2025-10-23 09:15:00', '[\"Um tipo de ataque de negação de serviço.\", \"A pressão de retorno em um sistema hidráulico.\", \"Um erro de rede que causa perda de pacotes.\", \"Um mecanismo onde o consumidor de dados pode sinalizar ao produtor para diminuir a velocidade de envio de dados, evitando sobrecarga.\"]', 3, 376),
('O que é \"Infrastructure as Code\" (IaC)?', 'DevOps', 'dificil', '2025-10-23 09:15:00', '[\"Escrever o código da aplicação em linguagem de infraestrutura.\", \"O gerenciamento e provisionamento de infraestrutura (servidores, redes) através de arquivos de definição legíveis por máquina (código).\", \"Documentar a infraestrutura manualmente.\", \"Um firmware para hardware de rede.\"]', 1, 377),
('O que é \"Paging\" (Paginação) em Sistemas Operacionais?', 'Sistemas Operacionais', 'dificil', '2025-10-23 09:15:00', '[\"Um método de troca de processos entre CPUs.\", \"Uma forma de exibir resultados em múltiplas páginas em uma API.\", \"Um esquema de gerenciamento de memória que permite que o espaço de endereço físico de um processo não seja contíguo.\", \"Um sistema de arquivos para discos lentos.\"]', 2, 378),
('O que é o padrão \"CQRS\" (Command Query Responsibility Segregation)?', 'Arquitetura', 'dificil', '2025-10-23 09:15:00', '[\"Um tipo de banco de dados NoSQL.\", \"Um padrão que combina todas as operações em uma única API.\", \"Um protocolo de segurança para queries.\", \"Um padrão que separa os modelos de dados para operações de escrita (Commands) e operações de leitura (Queries).\"]', 3, 379),
('O que é \"Consistent Hashing\"?', 'Algoritmos', 'dificil', '2025-10-23 09:15:00', '[\"Uma técnica de hashing que minimiza a reorganização dos dados quando nós são adicionados ou removidos.\", \"Um tipo de hash que sempre produz o mesmo resultado.\", \"Um algoritmo de criptografia.\", \"Uma forma de verificar a integridade dos dados.\"]', 0, 380),
('O que são \"Window Functions\" em SQL?', 'SQL', 'dificil', '2025-10-23 09:15:00', '[\"Funções que abrem uma nova janela de resultados.\", \"Funções que operam em um conjunto de linhas (janela) relacionadas à linha atual, sem agrupar (ex: ROW_NUMBER(), LEAD(), LAG()).\", \"Funções para filtrar dados (WHERE).\", \"Funções para criar tabelas temporárias.\"]', 1, 381),
('O que é \"HTTP/3\" e qual protocolo ele usa?', 'Redes', 'dificil', '2025-10-23 09:15:00', '[\"Uma versão incremental do HTTP/2 que usa TCP.\", \"Uma nova versão do HTTP que usa o protocolo QUIC (baseado em UDP) para resolver o head-of-line blocking do TCP.\", \"Um protocolo de segurança que substitui o HTTPS.\", \"Um protocolo para streaming de vídeo em baixa latência.\"]', 1, 382),
('O que é \"Sidecar Pattern\" em microserviços/containers?', 'Arquitetura', 'dificil', '2025-10-23 09:15:00', '[\"Um padrão de design para UIs.\", \"Um padrão onde a aplicação principal é dividida em dois containers.\", \"Um container que só funciona ao lado de um banco de dados.\", \"Anexar um container auxiliar (sidecar) a um container principal para adicionar funcionalidades (logging, monitoring, proxy).\"]', 3, 383),
('Em Python, o que faz o método format() em strings?', 'Python', 'medio', '2025-10-23 13:55:00', '[\"Substitui placeholders por valores\", \"Converte string para formato JSON\", \"Formata números apenas\", \"Cria strings multilinha\"]', 0, 384),
('Qual evento em JavaScript é acionado quando um formulário é submetido?', 'JavaScript', 'facil', '2025-10-23 13:55:00', '[\"onsubmit\", \"onchange\", \"onload\", \"oninput\"]', 0, 385),
('Qual propriedade CSS controla o fluxo de conteúdo em colunas (multi-column)?', 'Frontend', 'medio', '2025-10-23 13:55:00', '[\"flex-direction\", \"grid-template-columns\", \"columns-flow\", \"column-count\"]', 3, 386),
('Em SQL, qual comando é usado para adicionar uma nova coluna a uma tabela?', 'SQL', 'facil', '2025-10-23 13:55:00', '[\"ADD COLUMN\", \"INSERT COLUMN\", \"ALTER TABLE ADD\", \"CREATE COLUMN\"]', 2, 387),
('Qual comando é usado para aplicar um commit local no Git?', 'DevOps', 'facil', '2025-10-23 13:55:00', '[\"git add .\", \"git push origin main\", \"git commit -m \\\"mensagem\\\"\", \"git merge\"]', 2, 388),
('O que é uma máscara de sub-rede /24 em notação CIDR?', 'Redes', 'medio', '2025-10-23 13:55:00', '[\"255.255.255.255\", \"255.255.0.0\", \"255.0.0.0\", \"255.255.255.0\"]', 3, 389),
('Qual prática ajuda a prevenir SQL Injection?', 'Segurança', 'medio', '2025-10-23 13:55:00', '[\"Usar queries parametrizadas/prepared statements\", \"Aumentar timeout do DB\", \"Usar comentários em queries\", \"Habilitar indexação completa\"]', 0, 390),
('O que descreve melhor o padrão \"Circuit Breaker\" em arquitetura de software?', 'Arquitetura', 'dificil', '2025-10-23 13:55:00', '[\"Balancear cargas entre múltiplos serviços\", \"Interromper chamadas para um serviço falho temporariamente\", \"Monitorar logs de aplicações\", \"Criptografar comunicação entre serviços\"]', 1, 391),
('Qual a complexidade de tempo média do Merge Sort?', 'Algoritmos', 'dificil', '2025-10-23 13:55:00', '[\"O(n log n)\", \"O(n)\", \"O(n²)\", \"O(log n)\"]', 0, 392),
('Em APIs REST, qual código HTTP é normalmente retornado para criação bem-sucedida de recurso?', 'Backend', 'facil', '2025-10-23 13:55:00', '[\"200 OK\", \"201 Created\", \"204 No Content\", \"400 Bad Request\"]', 1, 393),
('Qual método em Python remove espaços em branco do início e fim de uma string?', 'Python', 'facil', '2025-10-23 14:00:00', '[\"trim()\", \"strip()\", \"clean()\", \"remove()\"]', 1, 394),
('Em Python, qual a diferença entre list e tuple?', 'Python', 'medio', '2025-10-23 14:05:00', '[\"list é mutável, tuple é imutável\", \"tuple é mais rápido que list\", \"list só aceita números\", \"Não há diferença\"]', 0, 395),
('O que são decorators em Python?', 'Python', 'dificil', '2025-10-23 14:10:00', '[\"Método de classe\", \"Comentários especiais\", \"Tipo de variável\", \"Funções que modificam o comportamento de outras funções\"]', 3, 396),
('Qual método JavaScript converte todos os caracteres de uma string para minúsculas?', 'JavaScript', 'facil', '2025-10-23 14:15:00', '[\"lower()\", \"toLowerCase()\", \"toSmall()\", \"minify()\"]', 1, 397),
('O que é o Event Loop em JavaScript?', 'JavaScript', 'medio', '2025-10-23 14:20:00', '[\"Sistema de eventos do navegador\", \"Um tipo de loop for\", \"Mecanismo que gerencia execução assíncrona e callbacks\", \"Framework de animação\"]', 2, 398),
('O que são Symbols em JavaScript ES6?', 'JavaScript', 'dificil', '2025-10-23 14:25:00', '[\"Tipo de string especial\", \"Ícones de interface\", \"Variáveis matemáticas\", \"Tipo de dado primitivo único e imutável\"]', 3, 399),
('Qual tag HTML é usada para criar uma lista não ordenada?', 'Frontend', 'facil', '2025-10-23 14:30:00', '[\"ul\", \"ol\", \"list\", \"items\"]', 0, 400),
('O que é o Virtual DOM em frameworks como React?', 'Frontend', 'medio', '2025-10-23 14:35:00', '[\"DOM falso para testes\", \"Representação em memória da estrutura DOM real para otimização\", \"Cópia do DOM no servidor\", \"Cache do navegador\"]', 1, 401),
('O que é Critical CSS?', 'Frontend', 'dificil', '2025-10-23 14:40:00', '[\"Estilos importantes apenas\", \"CSS que causa erros\", \"CSS mínimo necessário para renderizar conteúdo above-the-fold\", \"CSS inline obrigatório\"]', 2, 402),
('Qual comando SQL retorna apenas registros únicos?', 'SQL', 'facil', '2025-10-23 14:45:00', '[\"DIFFERENT\", \"UNIQUE\", \"SINGLE\", \"DISTINCT\"]', 3, 403),
('O que é uma transação em SQL?', 'SQL', 'medio', '2025-10-23 14:50:00', '[\"Sequência de operações tratadas como unidade única\", \"Operação de compra\", \"Tipo de query\", \"Função agregada\"]', 0, 404),
('O que são índices clusterizados em SQL?', 'SQL', 'dificil', '2025-10-23 14:55:00', '[\"Índices que determinam a ordem física dos dados na tabela\", \"Índices agrupados por categoria\", \"Múltiplos índices juntos\", \"Índices distribuídos\"]', 0, 405),
('O que significa CI/CD?', 'DevOps', 'facil', '2025-10-23 15:00:00', '[\"Container Integration/Container Deploy\", \"Code Integration/Code Delivery\", \"Computer Installation/Computer Development\", \"Continuous Integration/Continuous Deployment\"]', 3, 406),
('O que é um container Docker?', 'DevOps', 'medio', '2025-10-23 15:05:00', '[\"Máquina virtual completa\", \"Ambiente isolado que empacota aplicação com suas dependências\", \"Servidor físico\", \"Tipo de banco de dados\"]', 1, 407),
('O que é Kubernetes?', 'DevOps', 'dificil', '2025-10-23 15:10:00', '[\"Sistema operacional\", \"Linguagem de programação\", \"Plataforma de orquestração de containers\", \"Banco de dados distribuído\"]', 2, 408),
('Qual é a porta padrão do protocolo HTTP?', 'Redes', 'facil', '2025-10-23 15:15:00', '[\"3000\", \"443\", \"8080\", \"80\"]', 3, 409),
('O que é CDN (Content Delivery Network)?', 'Redes', 'medio', '2025-10-23 15:20:00', '[\"Rede distribuída de servidores que entrega conteúdo baseado na localização\", \"Tipo de firewall\", \"Protocolo de rede\", \"Sistema de backup\"]', 0, 410),
('O que é o protocolo WebSocket?', 'Redes', 'dificil', '2025-10-23 15:25:00', '[\"Versão segura do HTTP\", \"Protocolo de comunicação full-duplex sobre TCP\", \"Sistema de sockets Unix\", \"API do navegador\"]', 1, 411),
('O que é HTTPS?', 'Segurança', 'facil', '2025-10-23 15:30:00', '[\"Protocolo de email\", \"Versão mais rápida do HTTP\", \"HTTP com criptografia SSL/TLS\", \"Sistema de autenticação\"]', 2, 412),
('O que é autenticação de múltiplos fatores (MFA)?', 'Segurança', 'medio', '2025-10-23 15:35:00', '[\"Backup de autenticação\", \"Senha com múltiplos caracteres\", \"Login em várias contas\", \"Verificação de identidade usando múltiplos métodos\"]', 3, 413),
('O que é Rainbow Table attack?', 'Segurança', 'dificil', '2025-10-23 15:40:00', '[\"Ataque colorido de interface\", \"Ataque usando tabela pré-computada de hashes para quebrar senhas\", \"Vírus que muda cores\", \"Tipo de phishing\"]', 1, 414),
('O que é uma arquitetura monolítica?', 'Arquitetura', 'facil', '2025-10-23 15:45:00', '[\"Aplicação única com componentes fortemente acoplados\", \"Sistema de um único servidor\", \"Banco de dados centralizado\", \"Interface única\"]', 0, 415),
('O que é o padrão Observer?', 'Arquitetura', 'medio', '2025-10-23 15:50:00', '[\"Tipo de teste\", \"Sistema de monitoramento\", \"Padrão de segurança\", \"Padrão onde objetos observam mudanças em outros objetos\"]', 3, 416),
('O que é eventual consistency em sistemas distribuídos?', 'Arquitetura', 'dificil', '2025-10-23 15:55:00', '[\"Consistência que às vezes falha\", \"Sistema onde dados eventualmente convergem para estado consistente\", \"Tipo de backup\", \"Sincronização imediata\"]', 1, 417),
('O que é um algoritmo de ordenação?', 'Algoritmos', 'facil', '2025-10-23 16:00:00', '[\"Algoritmo de criptografia\", \"Algoritmo de busca\", \"Algoritmo que organiza elementos em ordem específica\", \"Algoritmo matemático\"]', 2, 418),
('Qual a complexidade de tempo da busca linear?', 'Algoritmos', 'medio', '2025-10-23 16:05:00', '[\"O(1)\", \"O(log n)\", \"O(n²)\", \"O(n)\"]', 3, 419),
('O que é o algoritmo de Dijkstra?', 'Algoritmos', 'dificil', '2025-10-23 16:10:00', '[\"Algoritmo para encontrar menor caminho em grafos ponderados\", \"Algoritmo de ordenação\", \"Algoritmo de criptografia\", \"Algoritmo de compressão\"]', 0, 420),
('O que é uma API?', 'Backend', 'facil', '2025-10-23 16:15:00', '[\"Tipo de banco de dados\", \"Interface para comunicação entre sistemas\", \"Framework backend\", \"Linguagem de programação\"]', 1, 421),
('O que é middleware em aplicações backend?', 'Backend', 'medio', '2025-10-23 16:20:00', '[\"Servidor de cache\", \"Banco de dados intermediário\", \"Software que intercepta e processa requisições/respostas\", \"Sistema de logs\"]', 2, 422),
('O que é rate limiting em APIs?', 'Backend', 'dificil', '2025-10-23 16:25:00', '[\"Tempo de timeout\", \"Velocidade de resposta da API\", \"Tamanho máximo de dados\", \"Controle da quantidade de requisições por período de tempo\"]', 3, 423),
('O que é um objeto em POO?', 'POO', 'facil', '2025-10-23 16:30:00', '[\"Instância de uma classe\", \"Tipo de variável\", \"Função especial\", \"Arquivo de código\"]', 0, 424),
('O que é método estático em POO?', 'POO', 'medio', '2025-10-23 16:35:00', '[\"Método que pertence à classe, não à instância\", \"Método que nunca muda\", \"Método privado\", \"Método sem retorno\"]', 0, 425),
('O que é coesão em design de classes?', 'POO', 'dificil', '2025-10-23 16:40:00', '[\"Encapsulamento forte\", \"Relação entre classes\", \"Herança múltipla\", \"Grau em que elementos de uma classe estão relacionados\"]', 3, 426),
('O que é um array?', 'Estrutura de Dados', 'facil', '2025-10-23 16:45:00', '[\"Tipo de variável\", \"Coleção de elementos em sequência\", \"Função de ordenação\", \"Sistema de arquivos\"]', 1, 427),
('O que é uma lista duplamente encadeada?', 'Estrutura de Dados', 'medio', '2025-10-23 16:50:00', '[\"Lista com dois tipos de dados\", \"Duas listas juntas\", \"Lista onde cada nó tem referência para próximo e anterior\", \"Lista circular\"]', 2, 428),
('O que é um grafo bipartido?', 'Estrutura de Dados', 'dificil', '2025-10-23 16:55:00', '[\"Grafo com duas arestas\", \"Grafo com dois ciclos\", \"Dois grafos conectados\", \"Grafo cujos vértices podem ser divididos em dois conjuntos disjuntos\"]', 3, 429),
('O que é um sistema operacional?', 'Sistemas Operacionais', 'facil', '2025-10-23 17:00:00', '[\"Software que gerencia hardware e recursos do computador\", \"Aplicativo de produtividade\", \"Tipo de processador\", \"Linguagem de programação\"]', 0, 430),
('O que é escalonamento de processos?', 'Sistemas Operacionais', 'medio', '2025-10-23 17:05:00', '[\"Organização de arquivos\", \"Decisão de qual processo executar a seguir\", \"Sistema de backup\", \"Tipo de memória\"]', 1, 431),
('O que é um mutex?', 'Sistemas Operacionais', 'dificil', '2025-10-23 17:10:00', '[\"Sistema de arquivos\", \"Tipo de processo\", \"Mecanismo de exclusão mútua para sincronização\", \"Protocolo de rede\"]', 2, 432),
('O que significa DRY?', 'Boas Práticas', 'facil', '2025-10-23 17:15:00', '[\"Dynamic Runtime Yield\", \"Do Repeat Yourself\", \"Data Ready Yield\", \"Don\'t Repeat Yourself\"]', 3, 433),
('O que é refatoração?', 'Boas Práticas', 'medio', '2025-10-23 17:20:00', '[\"Corrigir bugs\", \"Melhorar código sem alterar comportamento\", \"Adicionar funcionalidades\", \"Deletar código antigo\"]', 1, 434),
('O que é o princípio de responsabilidade única (SRP)?', 'Boas Práticas', 'dificil', '2025-10-23 17:25:00', '[\"Cada classe deve ter apenas uma razão para mudar\", \"Cada função deve ter um único parâmetro\", \"Cada arquivo deve ter uma classe\", \"Cada módulo deve ter um desenvolvedor\"]', 0, 435),
('O que é uma variável?', 'Lógica de Programação', 'facil', '2025-10-23 17:30:00', '[\"Operador lógico\", \"Tipo de loop\", \"Função especial\", \"Espaço na memória para armazenar dados\"]', 3, 436),
('O que é um operador ternário?', 'Lógica de Programação', 'medio', '2025-10-23 17:35:00', '[\"Operador com três valores\", \"Expressão condicional compacta com três partes\", \"Três condições em sequência\", \"Operador matemático\"]', 1, 437),
('O que é avaliação de curto-circuito?', 'Lógica de Programação', 'dificil', '2025-10-23 17:40:00', '[\"Pular trechos de código\", \"Executar código mais rápido\", \"Avaliar apenas o necessário para determinar resultado lógico\", \"Otimização de compilador\"]', 2, 438),
('Em Python, qual módulo é usado para expressões regulares?', 'Python', 'medio', '2025-10-23 17:45:00', '[\"pattern\", \"regex\", \"regexp\", \"re\"]', 3, 439),
('Qual método JavaScript verifica se todos elementos atendem a condição?', 'JavaScript', 'medio', '2025-10-23 17:50:00', '[\"every()\", \"all()\", \"check()\", \"validate()\"]', 0, 440),
('Qual propriedade CSS define sombra em elementos?', 'Frontend', 'facil', '2025-10-23 17:55:00', '[\"element-shadow\", \"box-shadow\", \"shadow\", \"drop-shadow\"]', 1, 441),
('Qual cláusula SQL agrupa resultados com condições?', 'SQL', 'medio', '2025-10-23 18:00:00', '[\"FILTER\", \"WHERE\", \"HAVING\", \"CONDITION\"]', 2, 442),
('O que é rollback em Git?', 'DevOps', 'medio', '2025-10-23 18:05:00', '[\"Sincronizar repositório\", \"Avançar commits\", \"Criar novo branch\", \"Reverter mudanças para estado anterior\"]', 3, 443),
('Qual função Python retorna o tipo de uma variável?', 'Python', 'facil', '2025-10-24 09:00:00', '[\"type()\", \"typeof()\", \"getType()\", \"varType()\"]', 0, 444),
('O que são list comprehensions em Python?', 'Python', 'medio', '2025-10-24 09:05:00', '[\"Forma concisa de criar listas usando iteração\", \"Documentação de listas\", \"Tipo especial de array\", \"Método de ordenação\"]', 0, 445),
('O que é o método __init__ em Python?', 'Python', 'medio', '2025-10-24 09:10:00', '[\"Função de importação\", \"Destrutor da classe\", \"Método de inicialização de módulo\", \"Construtor da classe\"]', 3, 446),
('O que são context managers em Python (with statement)?', 'Python', 'dificil', '2025-10-24 09:15:00', '[\"Gerenciadores de memória\", \"Objetos que gerenciam recursos garantindo limpeza adequada\", \"Sistema de contexto de execução\", \"Tipo de decorator\"]', 1, 447),
('Qual a diferença entre deep copy e shallow copy em Python?', 'Python', 'dificil', '2025-10-24 09:20:00', '[\"Deep copy usa menos memória\", \"Shallow copy é mais rápida sempre\", \"Deep copy copia recursivamente todos os objetos\", \"Não há diferença prática\"]', 2, 448),
('Qual palavra-chave cria uma variável imutável em JavaScript?', 'JavaScript', 'facil', '2025-10-24 09:25:00', '[\"final\", \"let\", \"var\", \"const\"]', 3, 449),
('O que é hoisting em JavaScript?', 'JavaScript', 'medio', '2025-10-24 09:30:00', '[\"Elevação de declarações para o topo do escopo\", \"Otimização de código\", \"Tipo de closure\", \"Sistema de imports\"]', 0, 450),
('O que são Promises em JavaScript?', 'JavaScript', 'medio', '2025-10-24 09:35:00', '[\"Tipo de callback\", \"Objetos que representam conclusão futura de operação assíncrona\", \"Sistema de eventos\", \"Função síncrona\"]', 1, 451),
('O que é destructuring em JavaScript?', 'JavaScript', 'medio', '2025-10-24 09:40:00', '[\"Remover propriedades\", \"Destruir objetos da memória\", \"Extrair valores de arrays ou objetos em variáveis distintas\", \"Tipo de loop\"]', 2, 452);
INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('O que são WeakMap e WeakSet em JavaScript?', 'JavaScript', 'dificil', '2025-10-24 09:45:00', '[\"Estruturas temporárias\", \"Versões lentas de Map e Set\", \"Maps e Sets sem métodos\", \"Coleções com referências fracas permitindo garbage collection\"]', 3, 453),
('Qual atributo HTML define texto alternativo para imagens?', 'Frontend', 'facil', '2025-10-24 09:50:00', '[\"title\", \"alt\", \"description\", \"text\"]', 1, 454),
('O que é Flexbox em CSS?', 'Frontend', 'medio', '2025-10-24 09:55:00', '[\"Sistema de layout unidimensional para distribuir espaço\", \"Framework CSS\", \"Tipo de grid\", \"Biblioteca JavaScript\"]', 0, 455),
('O que são media queries em CSS?', 'Frontend', 'medio', '2025-10-24 10:00:00', '[\"Sistema de animação\", \"Consultas ao banco de dados\", \"Tipo de seletor\", \"Regras CSS aplicadas baseadas em características do dispositivo\"]', 3, 456),
('O que é Progressive Web App (PWA)?', 'Frontend', 'dificil', '2025-10-24 10:05:00', '[\"Aplicativo progressivo de desktop\", \"Aplicação web que funciona como app nativo\", \"Framework JavaScript\", \"Tipo de SPA\"]', 1, 457),
('O que é Code Splitting em aplicações frontend?', 'Frontend', 'dificil', '2025-10-24 10:10:00', '[\"Dividir equipe de desenvolvimento\", \"Separar HTML de CSS\", \"Dividir código em chunks carregados sob demanda\", \"Tipo de minificação\"]', 2, 458),
('Qual comando SQL cria um novo banco de dados?', 'SQL', 'facil', '2025-10-24 10:15:00', '[\"BUILD DATABASE\", \"NEW DATABASE\", \"MAKE DATABASE\", \"CREATE DATABASE\"]', 3, 459),
('O que é uma chave estrangeira (Foreign Key)?', 'SQL', 'medio', '2025-10-24 10:20:00', '[\"Campo que referencia chave primária de outra tabela\", \"Chave de outro país\", \"Tipo de índice\", \"Chave secundária\"]', 0, 460),
('O que faz a cláusula UNION em SQL?', 'SQL', 'medio', '2025-10-24 10:25:00', '[\"Une tabelas relacionadas\", \"Combina resultados de múltiplas queries removendo duplicatas\", \"Cria nova tabela\", \"Ordena resultados\"]', 1, 461),
('O que são stored procedures em SQL?', 'SQL', 'dificil', '2025-10-24 10:30:00', '[\"Tipo de trigger\", \"Procedimento de backup\", \"Conjunto de comandos SQL salvos e executáveis\", \"Sistema de cache\"]', 2, 462),
('O que é normalização de banco de dados?', 'SQL', 'dificil', '2025-10-24 10:35:00', '[\"Backup de dados\", \"Converter dados para formato padrão\", \"Otimização de queries\", \"Processo de organizar dados para reduzir redundância\"]', 3, 463),
('O que é Jenkins?', 'DevOps', 'facil', '2025-10-24 10:40:00', '[\"Ferramenta de automação CI/CD\", \"Linguagem de programação\", \"Sistema operacional\", \"Banco de dados\"]', 0, 464),
('O que é um pipeline em DevOps?', 'DevOps', 'medio', '2025-10-24 10:45:00', '[\"Sequência automatizada de etapas do desenvolvimento ao deploy\", \"Tipo de servidor\", \"Sistema de versionamento\", \"Rede de computadores\"]', 0, 465),
('O que é Terraform?', 'DevOps', 'medio', '2025-10-24 10:50:00', '[\"Banco de dados\", \"Sistema de containers\", \"Linguagem de script\", \"Ferramenta de Infrastructure as Code\"]', 3, 466),
('O que são helm charts no Kubernetes?', 'DevOps', 'dificil', '2025-10-24 10:55:00', '[\"Gráficos de monitoramento\", \"Pacotes de recursos Kubernetes pré-configurados\", \"Tipo de pod\", \"Sistema de logs\"]', 1, 467),
('O que é GitOps?', 'DevOps', 'dificil', '2025-10-24 11:00:00', '[\"Sistema de backup\", \"Operações do Git\", \"Prática de usar Git como fonte única da verdade para infraestrutura\", \"Tipo de CI/CD\"]', 2, 468),
('O que é endereço IP?', 'Redes', 'facil', '2025-10-24 11:05:00', '[\"Sistema de segurança\", \"Protocolo de internet\", \"Tipo de servidor\", \"Identificador numérico de dispositivo na rede\"]', 3, 469),
('Qual a diferença entre IPv4 e IPv6?', 'Redes', 'medio', '2025-10-24 11:10:00', '[\"IPv6 tem espaço de endereçamento maior (128 bits vs 32 bits)\", \"IPv6 é mais lento\", \"IPv4 é mais seguro\", \"Não há diferença prática\"]', 0, 470),
('O que é load balancing?', 'Redes', 'medio', '2025-10-24 11:15:00', '[\"Balanceamento de energia\", \"Distribuição de tráfego entre múltiplos servidores\", \"Tipo de cache\", \"Sistema de backup\"]', 1, 471),
('O que é o protocolo SSL/TLS?', 'Redes', 'dificil', '2025-10-24 11:20:00', '[\"Tipo de firewall\", \"Sistema de DNS\", \"Protocolo de criptografia para comunicação segura\", \"Protocolo de roteamento\"]', 2, 472),
('O que é latência de rede e como é medida?', 'Redes', 'dificil', '2025-10-24 11:25:00', '[\"Capacidade do servidor\", \"Largura de banda disponível\", \"Velocidade de download\", \"Tempo de propagação de dados, medido em milissegundos\"]', 3, 473),
('O que é phishing?', 'Segurança', 'facil', '2025-10-24 11:30:00', '[\"Tipo de vírus\", \"Técnica de engenharia social para roubar informações\", \"Protocolo de segurança\", \"Sistema de firewall\"]', 1, 474),
('O que é token JWT?', 'Segurança', 'medio', '2025-10-24 11:35:00', '[\"JSON Web Token para autenticação stateless\", \"Tipo de senha\", \"Sistema de criptografia\", \"Protocolo de rede\"]', 0, 475),
('O que é OAuth?', 'Segurança', 'medio', '2025-10-24 11:40:00', '[\"Algoritmo de criptografia\", \"Sistema de autenticação\", \"Tipo de firewall\", \"Protocolo de autorização para acesso delegado\"]', 3, 476),
('O que é OWASP Top 10?', 'Segurança', 'dificil', '2025-10-24 11:45:00', '[\"Top 10 linguagens seguras\", \"Lista dos 10 riscos de segurança mais críticos em aplicações web\", \"Ranking de firewalls\", \"Lista de antivírus\"]', 1, 477),
('O que é Perfect Forward Secrecy (PFS)?', 'Segurança', 'dificil', '2025-10-24 11:50:00', '[\"Tipo de criptografia\", \"Sistema de backup\", \"Garante que chaves de sessão não sejam comprometidas se chave privada vazar\", \"Protocolo de rede\"]', 2, 478),
('O que é arquitetura de camadas (Layered Architecture)?', 'Arquitetura', 'facil', '2025-10-24 11:55:00', '[\"Framework de desenvolvimento\", \"Sistema de múltiplos servidores\", \"Tipo de banco de dados\", \"Organização do sistema em camadas com responsabilidades distintas\"]', 3, 479),
('O que é o padrão Singleton?', 'Arquitetura', 'medio', '2025-10-24 12:00:00', '[\"Garante que classe tenha apenas uma instância\", \"Padrão de herança única\", \"Tipo de interface\", \"Sistema de cache\"]', 0, 480),
('O que é o padrão Factory?', 'Arquitetura', 'medio', '2025-10-24 12:05:00', '[\"Fábrica de dados\", \"Cria objetos sem expor lógica de criação\", \"Sistema de produção\", \"Tipo de construtor\"]', 1, 481),
('O que é arquitetura serverless?', 'Arquitetura', 'dificil', '2025-10-24 12:10:00', '[\"Aplicação sem backend\", \"Servidor sem sistema operacional\", \"Execução de código sem gerenciar infraestrutura de servidores\", \"Rede sem servidores físicos\"]', 2, 482),
('O que é o padrão Repository?', 'Arquitetura', 'dificil', '2025-10-24 12:15:00', '[\"Tipo de banco de dados\", \"Repositório de código\", \"Sistema de versionamento\", \"Abstrai lógica de acesso a dados da lógica de negócio\"]', 3, 483),
('O que é complexidade de tempo?', 'Algoritmos', 'facil', '2025-10-24 12:20:00', '[\"Medida de tempo que algoritmo leva em relação ao tamanho da entrada\", \"Tempo de execução exato\", \"Dificuldade do algoritmo\", \"Tempo de desenvolvimento\"]', 0, 484),
('Qual a complexidade do Bubble Sort no pior caso?', 'Algoritmos', 'medio', '2025-10-24 12:25:00', '[\"O(n²)\", \"O(n log n)\", \"O(n)\", \"O(log n)\"]', 0, 485),
('O que é análise assintótica?', 'Algoritmos', 'medio', '2025-10-24 12:30:00', '[\"Sistema de debug\", \"Análise de sintaxe\", \"Tipo de teste\", \"Análise do comportamento de algoritmo para entradas grandes\"]', 3, 486),
('O que é algoritmo de Kruskal?', 'Algoritmos', 'dificil', '2025-10-24 12:35:00', '[\"Algoritmo de ordenação\", \"Encontra árvore geradora mínima em grafo\", \"Busca em grafos\", \"Criptografia de dados\"]', 1, 487),
('O que é programação gulosa (greedy)?', 'Algoritmos', 'dificil', '2025-10-24 12:40:00', '[\"Programação rápida\", \"Algoritmo que usa muita memória\", \"Faz escolha localmente ótima em cada etapa\", \"Tipo de recursão\"]', 2, 488),
('O que é um endpoint de API?', 'Backend', 'facil', '2025-10-24 12:45:00', '[\"Sistema de cache\", \"Ponto final de servidor\", \"Tipo de banco de dados\", \"URL que responde a requisições específicas\"]', 3, 489),
('O que é autenticação stateless?', 'Backend', 'medio', '2025-10-24 12:50:00', '[\"Autenticação sem armazenar estado no servidor\", \"Sistema sem estado\", \"Autenticação sem senha\", \"Tipo de cookie\"]', 0, 490),
('O que é ORM (Object-Relational Mapping)?', 'Backend', 'medio', '2025-10-24 12:55:00', '[\"Sistema de cache\", \"Técnica de mapear objetos para tabelas de banco de dados\", \"Tipo de API\", \"Protocolo de rede\"]', 1, 491),
('O que é API versioning?', 'Backend', 'dificil', '2025-10-24 13:00:00', '[\"Backup de API\", \"Sistema de controle de versão\", \"Manter múltiplas versões de API simultaneamente\", \"Tipo de documentação\"]', 2, 492),
('O que é database pooling?', 'Backend', 'dificil', '2025-10-24 13:05:00', '[\"Sistema de cache\", \"Backup de banco\", \"Tipo de índice\", \"Manter conjunto de conexões reutilizáveis com banco de dados\"]', 3, 493),
('O que é uma classe em POO?', 'POO', 'facil', '2025-10-24 13:10:00', '[\"Tipo de função\", \"Modelo para criar objetos\", \"Variável especial\", \"Sistema de arquivos\"]', 1, 494),
('O que é herança múltipla?', 'POO', 'medio', '2025-10-24 13:15:00', '[\"Classe herda de múltiplas classes pai\", \"Herança em vários níveis\", \"Múltiplas instâncias\", \"Vários construtores\"]', 0, 495),
('O que é um método abstrato?', 'POO', 'medio', '2025-10-24 13:20:00', '[\"Método obsoleto\", \"Método privado\", \"Método estático\", \"Método declarado mas não implementado na classe base\"]', 3, 496),
('O que é acoplamento em POO?', 'POO', 'dificil', '2025-10-24 13:25:00', '[\"Conexão de objetos\", \"Grau de dependência entre classes\", \"Herança entre classes\", \"Tipo de interface\"]', 1, 497),
('O que é injeção de dependência?', 'POO', 'dificil', '2025-10-24 13:30:00', '[\"Tipo de herança\", \"Inserir dados em objeto\", \"Fornecer dependências de fora ao invés de criar internamente\", \"Sistema de imports\"]', 2, 498),
('O que é uma pilha (Stack)?', 'Estrutura de Dados', 'facil', '2025-10-24 13:35:00', '[\"Sistema de memória\", \"Tipo de fila\", \"Array ordenado\", \"Estrutura LIFO (Last In First Out)\"]', 3, 499),
('O que é uma fila (Queue)?', 'Estrutura de Dados', 'facil', '2025-10-24 13:40:00', '[\"Estrutura FIFO (First In First Out)\", \"Tipo de pilha\", \"Lista circular\", \"Array dinâmico\"]', 0, 500),
('Qual dispositivo conecta vários computadores em uma rede local?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Hub\", \"Firewall\", \"Servidor\", \"Switch\"]', 3, 601),
('Qual cabo é amplamente utilizado em redes Ethernet?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Coaxial\", \"HDMI\", \"Cabo de Par Trançado\", \"USB\"]', 2, 602),
('Qual dispositivo permite conectar dispositivos sem fio à rede?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Switch\", \"Access Point\", \"Servidor\", \"Firewall\"]', 1, 603),
('Qual componente armazena dados permanentemente?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"SSD/HD\", \"RAM\", \"Fonte\", \"GPU\"]', 0, 604),
('Qual tecnologia permite conectar computadores através de ondas de rádio?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Wi-Fi\", \"Bluetooth\", \"Coaxial\", \"Ethernet\"]', 0, 605),
('Qual equipamento fornece energia para todos os componentes de um computador?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"HD\", \"Switch\", \"Processador\", \"Fonte de Alimentação\"]', 3, 606),
('Qual unidade mede a velocidade de transmissão de dados?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Watts\", \"Mbps\", \"Decibéis\", \"Hertz\"]', 1, 607),
('Qual protocolo traduz nomes de sites para IPs?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"DNS\", \"DHCP\", \"HTTP\", \"SMTP\"]', 0, 608),
('O que o DHCP faz em uma rede?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Bloqueia ataques\", \"Converte nomes em IPs\", \"Monitora pacotes\", \"Distribui endereços IP automaticamente\"]', 3, 609),
('Qual dispositivo conecta a rede local à internet?', 'Infraestrutura de Computadores', 'facil', '2025-11-07 16:11:13', '[\"Roteador\", \"Access Point\", \"Servidor DNS\", \"Switch\"]', 0, 610),
('Qual tecnologia permite priorizar certos tipos de tráfego em redes?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"DNS\", \"QoS\", \"HTTP\", \"SSH\"]', 1, 611),
('Qual função principal de um firewall?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"Armazenar arquivos\", \"Controlar tráfego de rede\", \"Criar IPs\", \"Aumentar a banda\"]', 1, 613),
('Qual tipo de endereço identifica exclusivamente um dispositivo em uma rede?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"Hostname\", \"Endereço MAC\", \"Porta\", \"Gateway\"]', 1, 614),
('Qual cabo oferece melhor imunidade a interferências?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"Fibra Óptica\", \"Par Trançado\", \"Coaxial\", \"HDMI\"]', 0, 615),
('Qual protocolo é responsável por atribuir IPs automaticamente?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"SSH\", \"DNS\", \"DHCP\", \"HTTP\"]', 2, 616),
('Qual camada do modelo OSI trata do roteamento?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"Transporte\", \"Enlace\", \"Aplicação\", \"Rede\"]', 3, 617),
('Qual comando verifica conectividade entre dispositivos?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"ipconfig\", \"ping\", \"dir\", \"nslookup\"]', 1, 618),
('Qual porta é usada pelo protocolo HTTPS?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"21\", \"53\", \"80\", \"443\"]', 3, 619),
('Qual dispositivo cria múltiplas redes virtuais independente da física?', 'Infraestrutura de Computadores', 'medio', '2025-11-07 16:11:24', '[\"VLAN\", \"VPN\", \"Proxy\", \"WAF\"]', 0, 620),
('O que significa RAID 5?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"Espelhamento completo\", \"Striping com paridade distribuída\", \"Striping simples\", \"Paridade dedicada\"]', 1, 621),
('Qual protocolo permite gerenciamento remoto seguro de dispositivos de rede?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"FTP\", \"HTTP\", \"SNMPv3\", \"Telnet\"]', 2, 622),
('Qual técnica permite usar vários caminhos simultâneos para redundância em links de rede?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"QoS\", \"LACP\", \"ARP\", \"Proxy ARP\"]', 1, 623),
('O que faz o NAT em uma rede?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"Converte IPs privados em públicos\", \"Atribui IP dinâmico\", \"Cria VLANs\", \"Bloqueia portas\"]', 0, 624),
('Qual método de balanceamento distribui tráfego baseado na carga atual dos servidores?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"Round Robin\", \"Least Connections\", \"IP Hash\", \"DNS Rotate\"]', 1, 625),
('Qual tecnologia permite criar redes isoladas na mesma infraestrutura física em datacenters?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"VLAN\", \"VXLAN\", \"PPPoE\", \"MPLS\"]', 1, 626),
('O que caracteriza o protocolo BGP?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"Protocolo interno de roteamento\", \"Protocolo externo usado entre AS\", \"Protocolo de camada física\", \"Protocolo de backup de rede\"]', 1, 627),
('Qual técnica garante disponibilidade contínua mesmo com falha completa de um servidor?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:40', '[\"QoS\", \"Load Balancing\", \"Failover\", \"Port Mirroring\"]', 2, 628),
('Qual conceito envolve segmentar a rede para aumentar segurança e desempenho?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:41', '[\"Pipelining\", \"Overclock\", \"Multithreading\", \"Subnetting\"]', 3, 629),
('Qual mecanismo evita loops em redes com múltiplos switches?', 'Infraestrutura de Computadores', 'dificil', '2025-11-07 16:11:41', '[\"OSPF\", \"RSTP\", \"ARP\", \"DHCP Snooping\"]', 1, 630),
('Qual documento descreve o que o software deve fazer?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Cronograma\", \"Plano de testes\", \"Wireframe\", \"Requisitos\"]', 3, 631),
('Qual modelo de desenvolvimento é representado por fases sequenciais?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Espiral\", \"Prototipação\", \"Incremental\", \"Cascata\"]', 3, 632),
('Qual artefato registra erros encontrados no software?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Backlog\", \"Log de Defeitos\", \"Diagrama de Classes\", \"DRE\"]', 1, 633),
('Qual técnica é usada para versionar código?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"HTTP\", \"Git\", \"SSH\", \"BIOS\"]', 1, 634),
('Qual papel no Scrum é responsável por remover impedimentos?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Scrum Master\", \"Product Owner\", \"Dev Team\", \"Sponsor\"]', 0, 635),
('Qual documento lista funcionalidades do sistema priorizadas?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Roadmap Técnico\", \"Sitemap\", \"Backlog do Produto\", \"Diagrama ER\"]', 2, 636),
('Qual é o objetivo dos testes de unidade?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Testar o sistema todo\", \"Testar desempenho\", \"Testar interface gráfica\", \"Validar pequenas partes isoladas\"]', 3, 637),
('Qual símbolo representa decisão em fluxogramas?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Retângulo\", \"Seta\", \"Losango\", \"Círculo\"]', 2, 638),
('Qual documento define o design visual e estrutural de telas?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Diagrama de Fluxo\", \"Storyboard\", \"Release Notes\", \"Wireframe\"]', 3, 639),
('Qual prática visa evitar bugs ao revisar código em equipe?', 'Engenharia de Software', 'facil', '2025-11-07 16:43:17', '[\"Code Review\", \"Debugging\", \"Profiling\", \"Logging\"]', 0, 640),
('Qual é o principal objetivo do modelo incremental?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Fases rígidas\", \"Entrega parcial e evolutiva\", \"Entrega tardia\", \"Especificação total\"]', 1, 641),
('Qual métrica avalia o acoplamento entre módulos?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Cyclomatic Complexity\", \"Fan-out / Fan-in\", \"Test Coverage\", \"MTBF\"]', 1, 642),
('Qual teste verifica se mudanças quebraram funcionalidades antigas?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Teste de Carga\", \"Teste de Regressão\", \"Teste de Usabilidade\", \"Teste de Estresse\"]', 1, 643),
('Qual símbolo UML representa um ator?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Boneco de Palito\", \"Quadrado\", \"Losango\", \"Raios\"]', 0, 644),
('Qual diagrama representa estrutura estática?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Diagrama de Sequência\", \"Diagrama de Classes\", \"Diagrama de Componentes\", \"Diagrama de Pacotes\"]', 1, 645),
('Qual técnica ágil estima esforço?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"PERT\", \"Planning Poker\", \"RUP\", \"Benchmarking\"]', 1, 646),
('Qual relacionamento UML usa diamante preenchido?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Associação\", \"Agregação\", \"Composição\", \"Dependência\"]', 2, 647),
('Qual técnica encontra cenários de falha?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Perfil de Desempenho\", \"Prototipação\", \"Teste de Estresse\", \"Análise de Risco\"]', 2, 648),
('Qual artefato define a arquitetura geral?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Release Plan\", \"Log de Erros\", \"SAD\", \"Diagrama de Teste\"]', 2, 649),
('Qual prática DevOps automatiza build, testes e deploy?', 'Engenharia de Software', 'medio', '2025-11-07 16:44:35', '[\"Kanban\", \"CI/CD\", \"Scrum\", \"Waterfall\"]', 1, 650),
('Qual métrica mede a complexidade lógica?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Code Smell\", \"Cyclomatic Complexity\", \"Throughput\", \"MTTR\"]', 1, 651),
('Qual padrão separa interface, lógica e dados?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"MVC\", \"SOA\", \"Microkernel\", \"Pipe and Filter\"]', 0, 652),
('Qual técnica define requisitos verificáveis e mensuráveis?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Ishikawa\", \"Pareto\", \"SMART\", \"MoSCoW\"]', 2, 653),
('Qual processo avalia artefatos formalmente?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Benchmarking\", \"Revisão Técnica Formal\", \"Daily Scrum\", \"Shadow IT\"]', 1, 654),
('Qual padrão GOF encapsula comportamentos variáveis?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Decorator\", \"Strategy\", \"Builder\", \"Observer\"]', 1, 655),
('Qual processo reduz variação e defeitos com estatística?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"SAFe\", \"Scrum\", \"RUP\", \"Six Sigma\"]', 3, 656),
('Qual técnica encontra dependências ocultas?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Hotfix\", \"Refactoring\", \"Análise de Impacto\", \"Mocking\"]', 2, 657),
('Qual modelo mede maturidade de processos?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Lean\", \"PMBOK\", \"CMMI\", \"BPM\"]', 2, 658),
('Qual prática reduz débito técnico continuamente?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Reengenharia\", \"Spike\", \"Refactoring\", \"Scrumban\"]', 2, 659),
('Qual padrão usa barramento para integrar subsistemas?', 'Engenharia de Software', 'dificil', '2025-11-07 16:45:15', '[\"Event Bus\", \"Layered\", \"Pipe and Filter\", \"Microservices\"]', 0, 660),
('O que significa idempotência em uma API REST?', 'Backend', 'medio', '2025-11-10 08:49:10', '[\"Garantia de alta disponibilidade\", \"Capacidade de repetir uma operação sem efeitos adicionais\", \"Criptografar requisições\", \"Limitar taxa de requisições\"]', 1, 661),
('O que é o padrão Circuit Breaker em aplicações distribuídas?', 'Backend', 'dificil', '2025-11-10 08:49:10', '[\"Uma forma de balanceamento de carga\",\"Mecanismo para isolar falhas e evitar cascatas em chamadas externas\",\"Cache distribuído\",\"Técnica de compressão de payloads\"]', 1, 662),
('Qual a vantagem do uso de cache distribuído no backend?', 'Backend', 'medio', '2025-11-10 08:49:10', '[\"Aumenta a latência\",\"Reduz a carga no banco e melhora tempo de resposta\",\"Garante consistência imediata sem trade-offs\",\"Substitui banco de dados\"]', 1, 663),
('O que é API Gateway em uma arquitetura de microserviços?', 'Backend', 'medio', '2025-11-10 08:49:10', '[\"Camada que expõe, agrega e gerencia rotas/segurança para microserviços\", \"Banco de dados central\", \"Servidor de arquivos estáticos\", \"Ferramenta de CI/CD\"]', 0, 664),
('O que é RAID e para que é usado?', 'Infraestrutura de Computadores', 'medio', '2025-11-10 08:49:10', '[\"Um protocolo de rede\",\"Conjunto de técnicas para redundância/performance de discos (ex.: RAID 0,1,5)\",\"Tipo de memória RAM\",\"Ferramenta de virtualização\"]', 1, 665),
('O que é um UPS e qual sua função em um data center?', 'Infraestrutura de Computadores', 'facil', '2025-11-10 08:49:10', '[\"Unidade para resfriamento\",\"Fonte de energia ininterrupta que fornece energia temporária em faltas\",\"Tipo de storage\",\"Switch gerenciável\"]', 1, 666),
('O que é MTU em redes e por que é importante?', 'Infraestrutura de Computadores', 'medio', '2025-11-10 08:49:10', '[\"Protocolo de roteamento\", \"Tamanho máximo da unidade de transmissão (Maximum Transmission Unit) que afeta fragmentação e desempenho\", \"Tipo de cabo de rede\", \"Modelo de segurança\"]', 1, 667),
('Qual a finalidade de um PDU (Power Distribution Unit) em racks?', 'Infraestrutura de Computadores', 'facil', '2025-11-10 08:49:10', '[\"Servir como firewall\", \"Gerenciar tráfego de rede\", \"Distribuir e medir energia para equipamentos de rack\", \"Backup de dados\"]', 2, 668),
('O que é BDD (Behavior Driven Development)?', 'Engenharia de Software', 'medio', '2025-11-10 08:49:10', '[\"Técnica de deploy contínuo\",\"Prática que especifica comportamento do sistema em linguagem executável colaborativa (ex.: Gherkin)\",\"Tipo de banco de dados\",\"Ferramenta de monitoração\"]', 1, 669),
('Qual a diferença entre verificação (verification) e validação (validation) de software?', 'Engenharia de Software', 'dificil', '2025-11-10 08:49:10', '[\"Verificação checa se o sistema está construído corretamente; Validação checa se o sistema certo foi construído\",\"São sinônimos\",\"Verificação é só teste manual; validação é só automatizada\",\"Verificação depende do usuário final apenas\"]', 0, 670),
('O que é refinement (grooming) do backlog?', 'Engenharia de Software', 'facil', '2025-11-10 08:49:10', '[\"Atividade de deploy de produção\", \"Processo de priorizar e detalhar itens do backlog para futuras sprints\", \"Teste de integração\", \"Reunião de retrospectiva\"]', 1, 671),
('O que é prototipagem de baixa fidelidade no processo de engenharia de software?', 'Engenharia de Software', 'facil', '2025-11-10 08:49:10', '[\"Desenho rápido (wireframe) que valida fluxo/ideia sem detalhes visuais\", \"Protótipo funcional completo\", \"Documento formal de requisitos\", \"Teste automatizado de interface\"]', 0, 672),
('Qual tag HTML5 é usada para definir um cabeçalho de seção?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"head\", \"header\", \"h1\", \"title\"]', 1, 673),
('Qual propriedade CSS define a cor de fundo?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"color\", \"bg-color\", \"background-color\", \"back-color\"]', 2, 674),
('Qual tag HTML cria um parágrafo?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"p\", \"text\", \"paragraph\", \"para\"]', 0, 675),
('Qual atributo HTML especifica o destino de um link?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"src\", \"link\", \"url\", \"href\"]', 3, 676),
('Qual propriedade CSS alinha texto horizontalmente?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"align-text\", \"text-align\", \"horizontal-align\", \"text-position\"]', 1, 677),
('Qual tag HTML5 é usada para vídeos?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"movie\", \"media\", \"video\", \"film\"]', 2, 678),
('Qual propriedade CSS define a largura de um elemento?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"size\", \"width\", \"length\", \"dimension\"]', 1, 679),
('Qual tag HTML cria uma lista ordenada?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"ol\", \"list\", \"ul\", \"ordered\"]', 0, 680),
('Qual propriedade CSS define o estilo da borda?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"border-type\", \"border-style\", \"border-design\", \"border-format\"]', 1, 681),
('Qual tag HTML5 define um rodapé?', 'Frontend', 'facil', '2025-11-11 13:49:35', '[\"bottom\", \"foot\", \"footer\", \"end\"]', 2, 682),
('O que é o modelo de caixa (Box Model) no CSS?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Ferramenta de design\", \"Sistema de grid\", \"Layout flexível\", \"Modelo que define content, padding, border e margin\"]', 3, 683),
('Qual propriedade CSS cria animações?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"animation\", \"@keyframes\", \"transition\", \"transform\"]', 0, 684),
('O que é semantic HTML?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"HTML com tags que descrevem seu significado\", \"HTML5 apenas\", \"HTML minificado\", \"HTML com JavaScript\"]', 0, 685),
('Qual propriedade CSS define a ordem dos itens flex?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"flex-order\", \"order\", \"flex-sequence\", \"position\"]', 1, 686),
('O que é viewport no contexto de design responsivo?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Tipo de layout\", \"Área visível da página no navegador\", \"Framework CSS\", \"Biblioteca JavaScript\"]', 1, 687),
('Qual meta tag define o viewport para responsividade?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"meta name=viewport\", \"meta viewport\", \"meta responsive\", \"meta screen\"]', 0, 688),
('O que é z-index no CSS?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Define zoom\", \"Cria índice de página\", \"Alinha elementos\", \"Controla a ordem de empilhamento de elementos\"]', 3, 689),
('Qual propriedade CSS cria gradientes?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"linear-gradient (via background)\", \"background-gradient\", \"gradient\", \"color-gradient\"]', 0, 690),
('O que é a propriedade position: sticky?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Elemento fixo sempre\", \"Híbrido entre relative e fixed baseado no scroll\", \"Posição absoluta\", \"Posição estática\"]', 1, 691),
('Qual atributo HTML5 torna um elemento editável?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"editable\", \"edit\", \"contenteditable\", \"writeable\"]', 2, 692),
('O que é CSS Grid?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Ferramenta de desenho\", \"Framework CSS\", \"Biblioteca de ícones\", \"Sistema de layout bidimensional\"]', 3, 693),
('Qual propriedade CSS define sombra em caixa?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"shadow\", \"box-shadow\", \"element-shadow\", \"border-shadow\"]', 1, 694),
('O que são pseudo-classes em CSS?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Seletores que definem estado especial (:hover, :active)\", \"Classes falsas\", \"Classes ocultas\", \"Classes temporárias\"]', 0, 695),
('Qual propriedade CSS controla a visibilidade sem ocupar espaço?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"visibility: hidden\", \"opacity: 0\", \"display: none\", \"hide: true\"]', 2, 696),
('O que é mobile-first design?', 'Frontend', 'medio', '2025-11-11 13:49:35', '[\"Desenvolver para desktop primeiro\", \"Criar apenas para mobile\", \"Desenvolver para mobile primeiro, depois adaptar para telas maiores\", \"Usar apenas apps nativos\"]', 2, 697),
('O que é Critical Rendering Path?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Rota de navegação\", \"Caminho de arquivos críticos\", \"Sequência de passos do navegador para renderizar página\", \"Sistema de cache\"]', 2, 698),
('O que é CSS-in-JS?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Biblioteca CSS\", \"Framework híbrido\", \"Técnica de escrever CSS dentro de JavaScript\", \"Preprocessador CSS\"]', 2, 699),
('O que é Reflow e Repaint no navegador?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Reflow recalcula layout; Repaint redesenha elementos\", \"Reflow é mais rápido\", \"Apenas design pattern\", \"Ambos são idênticos\"]', 0, 700),
('O que é Shadow DOM?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"DOM oculto\", \"DOM encapsulado para Web Components\", \"Backup do DOM\", \"DOM virtualizado\"]', 1, 701),
('O que é Layout Thrashing?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Erro de layout\", \"Tipo de animação\", \"Bug de CSS\", \"Forçar múltiplos reflows seguidos causando lentidão\"]', 3, 702),
('O que são Custom Properties (CSS Variables)?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Propriedades personalizadas de browser\", \"Atributos HTML customizados\", \"Variáveis reutilizáveis em CSS (--nome)\", \"Classes especiais\"]', 2, 703),
('O que é Intersection Observer API?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"API para detectar visibilidade de elementos no viewport\", \"Sistema de rotas\", \"Biblioteca de animação\", \"Ferramenta de debug\"]', 0, 704),
('O que é CSS Containment?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Técnica para isolar partes do DOM para otimização de renderização\", \"Tipo de grid\", \"Sistema de layout\", \"Container flexível\"]', 0, 705),
('O que é BEM (Block Element Modifier) em CSS?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Framework CSS\", \"Preprocessador\", \"Biblioteca JavaScript\", \"Metodologia de nomenclatura de classes CSS\"]', 3, 706),
('O que é Content Security Policy (CSP)?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Sistema de cache\", \"Política de cookies\", \"Header de segurança que previne XSS controlando recursos carregados\", \"Protocolo de rede\"]', 2, 707),
('O que são CSS Modules?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Framework CSS\", \"Biblioteca de componentes\", \"Sistema que cria escopo local para classes CSS\", \"Tipo de import\"]', 2, 708),
('O que é Lazy Loading de imagens?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Compressão de imagens\", \"Cache de imagens\", \"Formato de imagem\", \"Carregar imagens apenas quando próximas do viewport\"]', 3, 709),
('O que é CSS Grid Template Areas?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Definir áreas nomeadas no grid para layout visual\", \"Sistema de componentes\", \"Tipo de template\", \"Framework de grid\"]', 0, 710),
('O que é Accessibility Tree?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Árvore de componentes\", \"Sistema de navegação\", \"Estrutura de arquivos\", \"Representação da página para tecnologias assistivas\"]', 3, 711),
('O que é ARIA (Accessible Rich Internet Applications)?', 'Frontend', 'dificil', '2025-11-11 13:49:35', '[\"Framework JavaScript\", \"Biblioteca de UI\", \"Conjunto de atributos para melhorar acessibilidade\", \"Protocolo de rede\"]', 2, 712),
('O que é uma \"Common Table Expression\" (CTE) em SQL?', 'SQL', 'medio', '2025-11-13 17:00:00', '[\"Uma variável global usada em stored procedures.\", \"Um índice temporário criado para otimizar a consulta.\", \"Uma tabela física que armazena dados de log.\", \"Um conjunto de resultados temporário nomeado, usado dentro de uma única query.\"]', 3, 713),
('Qual cláusula SQL é usada para combinar os resultados de duas ou mais consultas SELECT, incluindo duplicatas?', 'SQL', 'facil', '2025-11-13 17:00:00', '[\"UNION\", \"UNION ALL\", \"JOIN ALL\", \"COMBINE\"]', 1, 714),
('Qual tipo de JOIN retorna todos os registros da tabela da *direita* e os registros correspondentes da tabela da *esquerda*?', 'SQL', 'medio', '2025-11-13 17:00:00', '[\"RIGHT JOIN\", \"LEFT JOIN\", \"INNER JOIN\", \"FULL OUTER JOIN\"]', 0, 715),
('O que é um \"Trigger\" (Gatilho) em um banco de dados SQL?', 'SQL', 'dificil', '2025-11-13 17:00:00', '[\"Um script de backup que roda agendado.\", \"Uma query que otimiza automaticamente a tabela.\", \"Uma constraint que valida dados antes de inserir.\", \"Um procedimento armazenado que é executado automaticamente em resposta a eventos (INSERT, UPDATE, DELETE).\"]', 3, 716),
('Qual função agregada SQL retorna o valor médio de uma coluna numérica?', 'SQL', 'facil', '2025-11-13 17:01:00', '[\"MEAN()\", \"AVG()\", \"SUM()\", \"COUNT()\"]', 1, 717),
('Qual comando é usado para remover todos os dados de uma tabela muito rapidamente, mas manter a estrutura da tabela?', 'SQL', 'medio', '2025-11-13 17:01:00', '[\"DELETE FROM nome_tabela\", \"TRUNCATE TABLE nome_tabela\", \"DROP TABLE nome_tabela\", \"CLEAR TABLE nome_tabela\"]', 1, 718),
('O que é uma \"View\" (Visão) em SQL?', 'SQL', 'medio', '2025-11-13 17:01:00', '[\"Uma cópia física de uma tabela.\", \"Um log de todas as transações.\", \"Uma tabela virtual baseada no resultado de uma consulta SELECT.\", \"Um tipo de índice para colunas de texto.\"]', 2, 719),
('Qual nível de isolamento de transação permite \"leituras sujas\" (dirty reads)?', 'SQL', 'dificil', '2025-11-13 17:01:00', '[\"READ UNCOMMITTED\", \"REPEATABLE READ\", \"READ COMMITTED\", \"SERIALIZABLE\"]', 0, 720),
('Qual comando SQL é usado para adicionar uma restrição (constraint) que garante que todos os valores em uma coluna sejam diferentes?', 'SQL', 'medio', '2025-11-13 17:02:00', '[\"ALTER TABLE ... ADD DISTINCT (coluna)\", \"ALTER TABLE ... ADD UNIQUE (coluna)\", \"ALTER TABLE ... ADD PRIMARY KEY (coluna)\", \"ALTER TABLE ... ADD CHECK (coluna)\"]', 1, 721),
('O que é uma subconsulta (subquery) correlacionada?', 'SQL', 'dificil', '2025-11-13 17:02:00', '[\"Uma subconsulta que não depende da consulta externa.\", \"Uma subconsulta que é executada uma vez para cada linha processada pela consulta externa.\", \"Uma consulta que une duas tabelas.\", \"Uma consulta que usa a cláusula WITH.\"]', 1, 722),
('Qual operador SQL é usado para pesquisar um padrão em uma coluna?', 'SQL', 'facil', '2025-11-13 17:02:00', '[\"SEARCH\", \"MATCH\", \"LIKE\", \"FIND\"]', 2, 723),
('Qual tipo de JOIN retorna todas as linhas de ambas as tabelas, preenchendo com NULL onde não há correspondência?', 'SQL', 'medio', '2025-11-13 17:02:00', '[\"INNER JOIN\", \"LEFT JOIN\", \"FULL OUTER JOIN\", \"CROSS JOIN\"]', 2, 724),
('O que faz a função `COALESCE` em SQL?', 'SQL', 'dificil', '2025-11-13 17:03:00', '[\"Retorna o primeiro valor não nulo em uma lista de argumentos.\", \"Converte um valor de um tipo para outro.\", \"Arredonda um número para a casa decimal especificada.\", \"Concatena duas ou mais strings.\"]', 0, 725),
('Qual comando SQL é usado para revogar (remover) permissões de um usuário?', 'SQL', 'facil', '2025-11-13 17:03:00', '[\"GRANT\", \"REVOKE\", \"DELETE\", \"DENY\"]', 1, 726),
('Qual restrição (constraint) SQL é usada para limitar o intervalo de valores que pode ser colocado em uma coluna?', 'SQL', 'medio', '2025-11-13 17:03:00', '[\"PRIMARY KEY\", \"FOREIGN KEY\", \"DEFAULT\", \"CHECK\"]', 3, 727),
('O que é CORS (Cross-Origin Resource Sharing)?', 'Backend', 'medio', '2025-11-13 17:05:00', '[\"Um padrão de autenticação de API.\", \"Um tipo de criptografia de dados em trânsito.\", \"Um mecanismo de segurança do navegador que restringe requisições HTTP de origem cruzada.\", \"Uma biblioteca de compressão de dados.\"]', 2, 728),
('Qual código de status HTTP indica um erro interno do servidor?', 'Backend', 'facil', '2025-11-13 17:05:00', '[\"404 Not Found\", \"500 Internal Server Error\", \"200 OK\", \"403 Forbidden\"]', 1, 729),
('Qual a principal finalidade de um \"Message Queue\" (como RabbitMQ ou Kafka)?', 'Backend', 'medio', '2025-11-13 17:05:00', '[\"Permitir a comunicação assíncrona e desacoplada entre serviços.\", \"Servir como banco de dados principal da aplicação.\", \"Armazenar dados de sessão do usuário.\", \"Fazer o cache de páginas web estáticas.\"]', 0, 730),
('O que caracteriza uma API \"stateless\" (sem estado)?', 'Backend', 'medio', '2025-11-13 17:05:00', '[\"Uma API que nunca armazena dados em banco.\", \"Uma API que só funciona com o protocolo UDP.\", \"Uma API que só retorna dados estáticos (JSON).\", \"Cada requisição contém toda a informação necessária, e o servidor não armazena estado do cliente entre requisições.\"]', 3, 731),
('Em Node.js, qual é o propósito do objeto `process.env`?', 'Backend', 'facil', '2025-11-13 17:06:00', '[\"Gerenciar processos filhos (child processes).\", \"Definir o ambiente de execução (produção, dev).\", \"Acessar variáveis de ambiente do sistema operacional.\", \"Armazenar o estado da aplicação.\"]', 2, 732),
('Qual é a principal vantagem do GraphQL sobre o REST tradicional?', 'Backend', 'medio', '2025-11-13 17:06:00', '[\"É mais rápido para todas as requisições.\", \"Permite ao cliente solicitar exatamente os dados que precisa, evitando over-fetching.\", \"É mais seguro por padrão.\", \"Substitui a necessidade de um banco de dados.\"]', 1, 733),
('Qual é a forma correta de armazenar senhas de usuários em um banco de dados?', 'Backend', 'facil', '2025-11-13 17:06:00', '[\"Em texto puro (plaintext).\", \"Criptografadas com uma chave reversível.\", \"Como um hash (ex: bcrypt, Argon2) com um salt.\", \"Em um arquivo .txt separado do banco.\"]', 2, 734),
('Qual a principal função de um ORM (Object-Relational Mapping)?', 'Backend', 'medio', '2025-11-13 17:07:00', '[\"Substituir o banco de dados por objetos em memória.\", \"Otimizar a renderização de objetos no frontend.\", \"Gerenciar as rotas de uma API REST.\", \"Mapear objetos da linguagem de programação para tabelas do banco de dados relacional.\"]', 3, 736),
('Qual código de status HTTP significa \"Not Found\"?', 'Backend', 'facil', '2025-11-13 17:07:00', '[\"204\", \"404\", \"400\", \"301\"]', 1, 737),
('Qual a diferença entre Autenticação e Autorização?', 'Backend', 'medio', '2025-11-13 17:07:00', '[\"São a mesma coisa.\", \"Autenticação é sobre login, Autorização é sobre permissões de admin.\", \"Autenticação é verificar *quem* você é; Autorização é verificar *o que* você pode fazer.\", \"Autenticação usa senhas, Autorização usa tokens JWT.\"]', 2, 738),
('O que é o \"Problema N+1\" no contexto de ORMs?', 'Backend', 'dificil', '2025-11-13 17:07:00', '[\"Um erro que ocorre ao tentar inserir N+1 registros simultaneamente.\", \"Um padrão de design para otimizar N+1 queries.\", \"Um problema de segurança onde N+1 usuários acessam o mesmo recurso.\", \"Um problema de performance onde uma query inicial dispara N queries adicionais para buscar dados relacionados.\"]', 3, 739),
('Qual é um caso de uso comum para o Redis em uma aplicação backend?', 'Backend', 'medio', '2025-11-13 17:08:00', '[\"Implementar cache rápido de dados (caching).\", \"Armazenar arquivos grandes (como vídeos e imagens).\", \"Servir como o banco de dados relacional principal.\", \"Executar lógica de negócios complexa.\"]', 0, 740),
('Qual o papel de um \"API Gateway\" em uma arquitetura de microserviços?', 'Backend', 'medio', '2025-11-13 17:08:00', '[\"Armazenar os logs de todos os microserviços.\", \"Atuar como ponto de entrada único, roteando requisições para os serviços corretos.\", \"Executar o balanceamento de carga do banco de dados.\", \"Substituir a necessidade de um frontend.\"]', 1, 741),
('Qual protocolo permite comunicação bidirecional em tempo real sobre uma única conexão TCP?', 'Backend', 'medio', '2025-11-13 17:08:00', '[\"HTTP/1.1\", \"SMTP\", \"WebSocket\", \"FTP\"]', 2, 742),
('O que significa a sigla UML?', 'Engenharia de Software', 'facil', '2025-11-13 17:10:00', '[\"Universal Markup Logic\", \"Universal Modeling Language\", \"Unified Markup Language\", \"Unified Modeling Language\"]', 3, 743),
('Qual diagrama UML é usado para modelar a estrutura estática do sistema, mostrando classes e seus relacionamentos?', 'Engenharia de Software', 'facil', '2025-11-13 17:10:00', '[\"Diagrama de Classes\", \"Diagrama de Sequência\", \"Diagrama de Casos de Uso\", \"Diagrama de Atividades\"]', 0, 744),
('Em um Diagrama de Casos de Uso, o que um \"Ator\" representa?', 'Engenharia de Software', 'facil', '2025-11-13 17:10:00', '[\"Uma entidade externa (usuário ou sistema) que interage com o sistema\", \"Um componente de hardware\", \"Uma classe principal do sistema\", \"Um banco de dados\"]', 0, 745),
('Qual diagrama UML é focado em mostrar a interação entre objetos ao longo do tempo (ordem cronológica)?', 'Engenharia de Software', 'medio', '2025-11-13 17:10:00', '[\"Diagrama de Atividades\", \"Diagrama de Classes\", \"Diagrama de Componentes\", \"Diagrama de Sequência\"]', 3, 746),
('Qual relacionamento UML representa a herança (\"é um\")?', 'Engenharia de Software', 'medio', '2025-11-13 17:11:00', '[\"Associação\", \"Generalização\", \"Agregação\", \"Dependência\"]', 1, 747),
('O que é um DFD (Diagrama de Fluxo de Dados)?', 'Engenharia de Software', 'medio', '2025-11-13 17:11:00', '[\"Mostra como os dados fluem através de processos, armazenamentos e entidades externas\", \"Modela a estrutura de classes\", \"Modela os estados de um objeto\", \"Mostra a sequência de chamadas de métodos\"]', 0, 748),
('Em um Diagrama de Classes, qual relacionamento (representado por um losango vazio) indica \"tem um\" (posse fraca)?', 'Engenharia de Software', 'medio', '2025-11-13 17:11:00', '[\"Composição\", \"Dependência\", \"Agregação\", \"Herança\"]', 2, 749),
('Qual diagrama é usado para modelar o fluxo de trabalho (workflow) de um processo de negócio ou a lógica de uma operação complexa?', 'Engenharia de Software', 'medio', '2025-11-13 17:11:00', '[\"Diagrama de Atividades\", \"Diagrama de Implantação\", \"Diagrama de Classes\", \"Diagrama de Sequência\"]', 0, 750),
('O que é um DER (Diagrama de Entidade-Relacionamento)?', 'Engenharia de Software', 'facil', '2025-11-13 17:12:00', '[\"Um diagrama de fluxo de processos\", \"Um modelo conceitual usado para projetar bancos de dados relacionais\", \"Um diagrama de componentes de hardware\", \"Um diagrama de interação de usuários\"]', 1, 751),
('Qual diagrama UML mostra a configuração física do hardware (nós) e como os componentes de software são distribuídos neles?', 'Engenharia de Software', 'medio', '2025-11-13 17:12:00', '[\"Diagrama de Implantação (Deployment)\", \"Diagrama de Componentes\", \"Diagrama de Pacotes\", \"Diagrama de Rede (não UML)\"]', 0, 752),
('No Diagrama de Casos de Uso, qual estereótipo indica que um caso de uso é *obrigatório* e sempre incluído?', 'Engenharia de Software', 'medio', '2025-11-13 17:12:00', '[\"«extend»\", \"«generalization»\", \"«include»\", \"«dependency»\"]', 2, 753),
('Qual diagrama UML modela o comportamento de um *único objeto*, detalhando como ele transita entre estados em resposta a eventos?', 'Engenharia de Software', 'dificil', '2025-11-13 17:12:00', '[\"Diagrama de Atividades\", \"Diagrama de Sequência\", \"Diagrama de Comunicação\", \"Diagrama de Máquina de Estados (State Machine)\"]', 3, 754),
('Qual é a principal diferença entre Agregação e Composição em um Diagrama de Classes?', 'Engenharia de Software', 'dificil', '2025-11-13 17:13:00', '[\"Na Composição (losango preenchido), o ciclo de vida da parte depende do todo; na Agregação (vazio), não.\", \"Agregação é herança, Composição é interface.\", \"Composição é para dados, Agregação é para métodos.\", \"Não há diferença funcional, apenas visual.\"]', 0, 755),
('No Diagrama de Casos de Uso, qual estereótipo indica funcionalidade *opcional* que pode estender um caso de uso base?', 'Engenharia de Software', 'medio', '2025-11-13 17:13:00', '[\"«extend»\", \"«include»\", \"«optional»\", \"«variant»\"]', 0, 756),
('O que uma \"lifeline\" (linha da vida) representa em um Diagrama de Sequência?', 'Engenharia de Software', 'facil', '2025-11-13 17:13:00', '[\"O tempo de execução total do programa.\", \"A conexão com o banco de dados.\", \"A participação de um objeto ou ator específico na interação ao longo do tempo.\", \"Um processo de sistema operacional.\"]', 2, 757),
('Uma linha tracejada com uma seta aberta em um Diagrama de Classes geralmente representa qual tipo de relacionamento?', 'Engenharia de Software', 'dificil', '2025-11-13 17:13:00', '[\"Herança\", \"Associação Direta\", \"Composição\", \"Dependência (Dependency)\"]', 3, 758),
('Qual diagrama UML mostra a organização estrutural do sistema em termos de grupos lógicos (namespaces)?', 'Engenharia de Software', 'medio', '2025-11-13 17:14:00', '[\"Diagrama de Estrutura Composta\", \"Diagrama de Componentes\", \"Diagrama de Classes\", \"Diagrama de Pacotes\"]', 3, 759),
('Qual diagrama é usado para modelar a arquitetura de software, mostrando como os componentes se conectam através de interfaces?', 'Engenharia de Software', 'medio', '2025-11-13 17:14:00', '[\"Diagrama de Componentes\", \"Diagrama de Atividades\", \"Diagrama de Casos de Uso\", \"Diagrama de Implantação\"]', 0, 760),
('O que é \"cardinalidade\" (ou multiplicidade) em um Diagrama de Classes ou DER?', 'Engenharia de Software', 'medio', '2025-11-13 17:14:00', '[\"A ordem de execução dos métodos.\", \"O nível de importância da classe.\", \"Quantos objetos de uma classe podem estar relacionados a um objeto de outra classe (ex: 1..*, 0..1).\", \"A velocidade da associação.\"]', 2, 761),
('Qual diagrama UML é semelhante ao Diagrama de Sequência, mas foca mais na *organização* dos objetos que interagem, em vez da *ordem* no tempo?', 'Engenharia de Software', 'dificil', '2025-11-13 17:14:00', '[\"Diagrama de Atividades\", \"Diagrama de Máquina de Estados\", \"Diagrama de Visão Geral da Interação\", \"Diagrama de Comunicação (ou Colaboração)\"]', 3, 762),
('Qual componente é considerado o \"cérebro\" do computador, executando a maioria dos cálculos?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:16:00', '[\"GPU (Unidade de Processamento Gráfico)\", \"RAM (Memória de Acesso Aleatório)\", \"SSD (Unidade de Estado Sólido)\", \"CPU (Unidade Central de Processamento)\"]', 3, 763),
('O que é \"RAM\" (Memória de Acesso Aleatório) e qual sua característica principal?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:16:00', '[\"Memória volátil usada para armazenamento temporário de dados em execução\", \"Armazenamento permanente, não volátil\", \"Unidade de processamento de rede\", \"Fonte de alimentação ininterrupta\"]', 0, 764),
('Qual a principal diferença entre um SSD (Solid State Drive) e um HDD (Hard Disk Drive)?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:16:00', '[\"SSD não possui partes móveis (usa flash), sendo mais rápido que o HDD (magnético, com discos)\", \"HDD usa portas USB, SSD usa SATA\", \"SSD é mais lento e mais barato\", \"HDD é usado para RAM, SSD para armazenamento fixo\"]', 0, 765),
('O que é a \"Placa-Mãe\" (Motherboard) em um computador?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:16:00', '[\"O principal dispositivo de resfriamento\", \"Um tipo de memória cache\", \"O processador gráfico principal\", \"A placa de circuito principal que conecta todos os componentes (CPU, RAM, HDs, etc.)\"]', 3, 766),
('Qual a função de um \"No-break\" (UPS) em um data center?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:17:00', '[\"Resfriar os servidores de alta densidade\", \"Fornecer energia temporária e proteção contra surtos durante uma queda de energia\", \"Gerenciar o tráfego de rede entre racks\", \"Fazer o backup lógico dos bancos de dados\"]', 1, 767);
INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('O que é \"redundância N+1\" em infraestrutura?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:17:00', '[\"Ter um componente de backup (energia, refrigeração, etc.) para cada N componentes necessários\", \"Usar N+1 servidores para N aplicações\", \"Um tipo de configuração de rede N+1\", \"Um modelo de segurança de N+1 camadas\"]', 0, 768),
('Qual a finalidade de um sistema de \"HVAC\" (Heating, Ventilation, and Air Conditioning) em um data center?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:17:00', '[\"Controlar a segurança de acesso físico\", \"Distribuir energia elétrica para os racks\", \"Controlar a temperatura e a umidade para manter os equipamentos operando com segurança\", \"Gerenciar a conectividade com a internet\"]', 2, 769),
('Qual tipo de armazenamento (Storage) é acessado em nível de bloco, geralmente via Fibre Channel ou iSCSI?', 'Infraestrutura de Computadores', 'dificil', '2025-11-13 17:17:00', '[\"SAN (Storage Area Network)\", \"NAS (Network-Attached Storage)\", \"Cloud Storage\", \"DAS (Direct-Attached Storage)\"]', 0, 770),
('O que é um \"Hot Swap\" (Troca a Quente) de hardware?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:18:00', '[\"Um componente que superaquece e precisa ser trocado\", \"A capacidade de substituir um componente (como um HD ou fonte) sem desligar o sistema\", \"Uma troca de hardware agendada com downtime\", \"Um tipo de ataque de hardware\"]', 1, 771),
('Qual tipo de memória é usada pela CPU para acesso ultra-rápido aos dados mais frequentes, sendo mais rápida que a RAM?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:18:00', '[\"Memória Cache (L1, L2, L3)\", \"SSD NVMe\", \"Memória ROM\", \"Memória Virtual (Swap)\"]', 0, 772),
('O que é \"virtualização\" no contexto de servidores?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:18:00', '[\"Usar apenas servidores físicos dedicados\", \"Um tipo de resfriamento a líquido\", \"Criar múltiplas máquinas virtuais (VMs) em um único servidor físico\", \"Converter um servidor físico em um switch de rede\"]', 2, 773),
('Qual tipo de armazenamento (Storage) é acessado em nível de arquivo, comumente via rede (ex: NFS, SMB)?', 'Infraestrutura de Computadores', 'dificil', '2025-11-13 17:18:00', '[\"SAN (Storage Area Network)\", \"DAS (Direct-Attached Storage)\", \"HD Externo USB\", \"NAS (Network-Attached Storage)\"]', 3, 774),
('Qual a função de um \"PDU\" (Power Distribution Unit) em um rack de servidor?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:19:00', '[\"Distribuir energia elétrica para os múltiplos equipamentos dentro do rack\", \"Monitorar a temperatura do rack\", \"Atuar como um switch de rede para os servidores\", \"Servir como a porta de entrada da internet para o rack\"]', 0, 775),
('O que significa o termo \"U\" (Unidade de Rack) em infraestrutura?', 'Infraestrutura de Computadores', 'facil', '2025-11-13 17:19:00', '[\"Uma unidade de medida de altura (1,75 polegadas) para equipamentos montados em rack\", \"A velocidade do processador do servidor\", \"A quantidade de memória RAM do servidor\", \"A unidade de armazenamento principal (HD)\"]', 0, 776),
('O que é um \"Blade Server\"?', 'Infraestrutura de Computadores', 'medio', '2025-11-13 17:19:00', '[\"Um servidor com foco em processamento gráfico (GPU)\", \"Um servidor de rede para firewalls\", \"Um servidor compacto e modular projetado para caber em um chassi blade, otimizando espaço e energia\", \"Um servidor de backup em fita (tape)\"]', 2, 777),
('O que é uma constante em programação?', 'Lógica de Programação', 'facil', '2025-11-13 18:00:00', '[\"Um valor que pode mudar durante a execução\", \"Um valor fixo que não pode ser alterado após sua definição\", \"Uma variável temporária\", \"Um tipo de loop\"]', 1, 778),
('Qual operador é usado para divisão inteira em muitas linguagens?', 'Lógica de Programação', 'facil', '2025-11-13 18:01:00', '[\"div\", \"/\", \"%\", \"//\"]', 3, 779),
('O que o operador módulo (%) retorna?', 'Lógica de Programação', 'facil', '2025-11-13 18:02:00', '[\"O resto da divisão\", \"O resultado da multiplicação\", \"O quociente da divisão\", \"O valor absoluto\"]', 0, 780),
('Qual estrutura permite executar código repetidamente até uma condição ser falsa?', 'Lógica de Programação', 'facil', '2025-11-13 18:03:00', '[\"if\", \"switch\", \"function\", \"while\"]', 3, 781),
('O que é um algoritmo?', 'Lógica de Programação', 'facil', '2025-11-13 18:04:00', '[\"Uma função matemática\", \"Um tipo de variável\", \"Uma sequência finita de passos para resolver um problema\", \"Um operador lógico\"]', 2, 782),
('Qual palavra-chave é usada para sair de um loop prematuramente?', 'Lógica de Programação', 'facil', '2025-11-13 18:05:00', '[\"exit\", \"break\", \"stop\", \"end\"]', 1, 783),
('O que significa incrementar uma variável?', 'Lógica de Programação', 'facil', '2025-11-13 18:06:00', '[\"Diminuir seu valor em 1\", \"Multiplicar por 2\", \"Aumentar seu valor (geralmente em 1)\", \"Resetar para zero\"]', 2, 784),
('Qual é o resultado de (5 > 3 AND 2 < 1)?', 'Lógica de Programação', 'facil', '2025-11-13 18:07:00', '[\"false\", \"1\", \"null\", \"true\"]', 0, 785),
('O que é um fluxograma?', 'Lógica de Programação', 'medio', '2025-11-13 18:08:00', '[\"Um framework de programação\", \"Um tipo de variável\", \"Uma estrutura de dados\", \"Representação gráfica de um algoritmo usando símbolos\"]', 3, 786),
('Qual operador tem maior precedência: multiplicação ou adição?', 'Lógica de Programação', 'medio', '2025-11-13 18:09:00', '[\"Adição\", \"Multiplicação\", \"Ambos têm a mesma\", \"Depende da linguagem\"]', 1, 787),
('O que é a negação lógica?', 'Lógica de Programação', 'medio', '2025-11-13 18:10:00', '[\"Somar valores negativos\", \"Inverter o valor booleano (true vira false e vice-versa)\", \"Dividir por -1\", \"Remover variáveis\"]', 2, 788),
('Qual é a diferença entre \"continue\" e \"break\" em um loop?', 'Lógica de Programação', 'medio', '2025-11-13 18:11:00', '[\"Continue para o loop, break reinicia\", \"Continue sai do programa, break do loop\", \"São sinônimos\", \"Continue pula para a próxima iteração, break sai do loop\"]', 3, 789),
('O que é uma expressão em programação?', 'Lógica de Programação', 'medio', '2025-11-13 18:12:00', '[\"Combinação de valores, variáveis e operadores que resulta em um valor\", \"Apenas um número\", \"Uma função sem retorno\", \"Um comentário no código\"]', 0, 790),
('Qual a diferença entre ++i e i++?', 'Lógica de Programação', 'medio', '2025-11-13 18:13:00', '[\"Não há diferença\", \"++i incrementa antes de usar, i++ incrementa depois\", \"i++ é mais rápido\", \"++i é obsoleto\"]', 1, 791),
('O que é a tabela verdade?', 'Lógica de Programação', 'medio', '2025-11-13 18:14:00', '[\"Tabela de variáveis do programa\", \"Representação de todas as possibilidades de valores lógicos\", \"Lista de funções verdadeiras\", \"Documentação de código\"]', 2, 792),
('Qual estrutura é mais eficiente para múltiplas condições do que vários if-else encadeados?', 'Lógica de Programação', 'medio', '2025-11-13 18:15:00', '[\"for\", \"while\", \"try-catch\", \"switch-case\"]', 3, 793),
('O que caracteriza um algoritmo eficiente?', 'Lógica de Programação', 'medio', '2025-11-13 18:16:00', '[\"Tem mais linhas de código\", \"Usa menos recursos (tempo/memória) para resolver o problema\", \"Usa apenas loops\", \"Não usa variáveis\"]', 1, 794),
('Qual a ordem de avaliação em (A OR B AND C)?', 'Lógica de Programação', 'medio', '2025-11-13 18:17:00', '[\"Esquerda para direita sempre\", \"AND tem precedência sobre OR\", \"OR tem precedência sobre AND\", \"Avalia tudo simultaneamente\"]', 1, 795),
('O que é um contador em programação?', 'Lógica de Programação', 'facil', '2025-11-13 18:18:00', '[\"Uma função de tempo\", \"Variável usada para contar iterações ou ocorrências\", \"Tipo de loop\", \"Operador matemático\"]', 2, 796),
('Qual é o valor de X após: X = 10; X += 5; X *= 2?', 'Lógica de Programação', 'medio', '2025-11-13 18:19:00', '[\"15\", \"20\", \"25\", \"30\"]', 3, 797),
('O que é pseudocódigo?', 'Lógica de Programação', 'facil', '2025-11-13 18:20:00', '[\"Linguagem de programação falsa\", \"Código com erros\", \"Descrição de algoritmo em linguagem próxima ao natural\", \"Comentário extenso\"]', 2, 798),
('Qual operador verifica igualdade de valor E tipo em JavaScript?', 'Lógica de Programação', 'medio', '2025-11-13 18:21:00', '[\"==\", \"===\", \"!=\", \"!==\"]', 1, 799),
('O que é um acumulador em lógica de programação?', 'Lógica de Programação', 'facil', '2025-11-13 18:22:00', '[\"Função recursiva\", \"Variável que soma/acumula valores ao longo de iterações\", \"Tipo de memória\", \"Operador especial\"]', 0, 800),
('Qual é o resultado de NOT(true OR false)?', 'Lógica de Programação', 'medio', '2025-11-13 18:23:00', '[\"true\", \"null\", \"undefined\", \"false\"]', 3, 801),
('O que define um bom nome de variável?', 'Lógica de Programação', 'facil', '2025-11-13 18:24:00', '[\"Com números\", \"Curto sempre\", \"Descritivo, claro e seguindo convenções da linguagem\", \"Em letras maiúsculas\"]', 2, 802),
('Qual estrutura é ideal para percorrer todos elementos de uma coleção?', 'Lógica de Programação', 'facil', '2025-11-13 18:25:00', '[\"if-else\", \"for ou foreach\", \"switch\", \"try-catch\"]', 1, 803),
('O que é indentação em programação?', 'Lógica de Programação', 'facil', '2025-11-13 18:26:00', '[\"Erro de sintaxe\", \"Recuo visual do código para melhorar legibilidade\", \"Tipo de comentário\", \"Operador especial\"]', 2, 804),
('Qual valor booleano representa \"falso\" em muitas linguagens?', 'Lógica de Programação', 'facil', '2025-11-13 18:27:00', '[\"false\", \"true\", \"yes\", \"1\"]', 0, 805),
('O que é uma flag (bandeira) em programação?', 'Lógica de Programação', 'medio', '2025-11-13 18:28:00', '[\"Operador lógico\", \"Símbolo de país\", \"Tipo de erro\", \"Variável booleana que indica um estado ou condição\"]', 3, 806),
('Qual a diferença entre atribuição (=) e comparação (==)?', 'Lógica de Programação', 'facil', '2025-11-13 18:29:00', '[\"São iguais\", \"= atribui valor, == compara valores\", \"= compara, == atribui\", \"Ambos comparam\"]', 1, 807),
('O que significa \"inicializar\" uma variável?', 'Lógica de Programação', 'facil', '2025-11-13 18:30:00', '[\"Deletá-la\", \"Atribuir um valor inicial a ela\", \"Declarar sem valor\", \"Torná-la constante\"]', 2, 808),
('Em um loop for(i=0; i<5; i++), quantas vezes o código executa?', 'Lógica de Programação', 'facil', '2025-11-13 18:31:00', '[\"4 vezes\", \"6 vezes\", \"Infinitas vezes\", \"5 vezes\"]', 3, 809),
('O que é um operador unário?', 'Lógica de Programação', 'dificil', '2025-11-13 18:32:00', '[\"Operador que trabalha com um único operando\", \"Operador com um resultado\", \"Operador que retorna 1\", \"Operador matemático básico\"]', 0, 810),
('Qual é o resultado de 10 / 3 em divisão inteira?', 'Lógica de Programação', 'facil', '2025-11-13 18:33:00', '[\"3.33\", \"3\", \"4\", \"10\"]', 1, 811),
('O que é curto-circuito em avaliação lógica?', 'Lógica de Programação', 'dificil', '2025-11-13 18:34:00', '[\"Erro de sintaxe\", \"Parar avaliação quando resultado já é conhecido\", \"Avaliar tudo sempre\", \"Tipo de loop infinito\"]', 2, 812),
('Qual estrutura permite executar código pelo menos uma vez?', 'Lógica de Programação', 'medio', '2025-11-13 18:35:00', '[\"for\", \"while\", \"if\", \"do-while\"]', 3, 813),
('O que é uma sentinela em programação?', 'Lógica de Programação', 'dificil', '2025-11-13 18:36:00', '[\"Tipo de loop\", \"Valor especial que indica fim de entrada de dados\", \"Operador lógico\", \"Função de segurança\"]', 1, 814),
('Qual operador lógico é verdadeiro apenas se ambos operandos forem verdadeiros?', 'Lógica de Programação', 'facil', '2025-11-13 18:37:00', '[\"OR\", \"AND\", \"NOT\", \"XOR\"]', 1, 815),
('O que é uma instrução composta?', 'Lógica de Programação', 'medio', '2025-11-13 18:38:00', '[\"Instrução complexa\", \"Bloco de múltiplas instruções agrupadas\", \"Função com parâmetros\", \"Loop infinito\"]', 2, 816),
('Qual é o operando em uma expressão \"x + 5\"?', 'Lógica de Programação', 'facil', '2025-11-13 18:39:00', '[\"Apenas +\", \"Apenas 5\", \"Apenas x\", \"x e 5\"]', 3, 817),
('O que caracteriza um loop infinito?', 'Lógica de Programação', 'facil', '2025-11-13 18:40:00', '[\"Loop com muitas iterações\", \"Loop muito rápido\", \"Loop que nunca atende sua condição de parada\", \"Loop sem variáveis\"]', 2, 818),
('Qual a diferença entre pré-incremento (++i) e pós-incremento (i++)?', 'Lógica de Programação', 'dificil', '2025-11-13 18:41:00', '[\"Nenhuma\", \"Ordem: pré incrementa antes de usar o valor, pós incrementa depois\", \"Velocidade de execução\", \"pós é mais moderno\"]', 1, 819),
('O que é um literal em programação?', 'Lógica de Programação', 'medio', '2025-11-13 18:42:00', '[\"Operador especial\", \"Valor fixo escrito diretamente no código\", \"Tipo de variável\", \"Função sem retorno\"]', 0, 820),
('Em lógica, o que é uma tautologia?', 'Lógica de Programação', 'dificil', '2025-11-13 18:43:00', '[\"Expressão sempre falsa\", \"Erro lógico\", \"Loop infinito\", \"Expressão sempre verdadeira\"]', 3, 821),
('O que significa \"declarar\" uma variável?', 'Lógica de Programação', 'facil', '2025-11-13 18:44:00', '[\"Deletar uma variável\", \"Atribuir um valor\", \"Informar ao programa que uma variável existe e seu tipo\", \"Usar uma variável\"]', 2, 822),
('Qual estrutura é mais apropriada quando não se sabe quantas iterações serão necessárias?', 'Lógica de Programação', 'medio', '2025-11-13 18:45:00', '[\"for com contador fixo\", \"while com condição\", \"switch-case\", \"if-else\"]', 1, 823),
('O que é escopo de variável?', 'Lógica de Programação', 'medio', '2025-11-13 18:46:00', '[\"Tamanho da variável\", \"Região do código onde a variável é acessível\", \"Tipo da variável\", \"Valor inicial\"]', 2, 824),
('Qual operador lógico XOR retorna true?', 'Lógica de Programação', 'dificil', '2025-11-13 18:47:00', '[\"Quando apenas um dos operandos é true\", \"Quando ambos são false\", \"Nunca\", \"Quando ambos são true\"]', 0, 825),
('O que é \"use strict\" em JavaScript?', 'JavaScript', 'medio', '2025-11-13 18:50:00', '[\"Método de string\", \"Comando para importar bibliotecas\", \"Função de validação\", \"Modo que ativa verificações mais rigorosas e previne práticas problemáticas\"]', 3, 826),
('Qual método adiciona elementos no início e retorna o novo tamanho do array?', 'JavaScript', 'facil', '2025-11-13 18:51:00', '[\"push()\", \"unshift()\", \"concat()\", \"splice()\"]', 1, 827),
('O que é \"this\" em JavaScript?', 'JavaScript', 'medio', '2025-11-13 18:52:00', '[\"Palavra reservada\", \"Referência ao objeto atual no contexto de execução\", \"Tipo de variável\", \"Operador especial\"]', 2, 828),
('Qual método retorna uma nova string com todas letras maiúsculas?', 'JavaScript', 'facil', '2025-11-13 18:53:00', '[\"upper()\", \"uppercase()\", \"toUpper()\", \"toUpperCase()\"]', 3, 829),
('O que faz o método Array.prototype.some()?', 'JavaScript', 'medio', '2025-11-13 18:54:00', '[\"Testa se pelo menos um elemento passa no teste\", \"Soma todos elementos\", \"Remove duplicatas\", \"Ordena o array\"]', 0, 830),
('Qual é a diferença entre null e undefined?', 'JavaScript', 'medio', '2025-11-13 18:55:00', '[\"São idênticos\", \"null é atribuído intencionalmente, undefined indica ausência de valor\", \"null é erro, undefined não\", \"undefined é mais moderno\"]', 1, 831),
('O que é \"closure\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 18:56:00', '[\"Tipo de loop\", \"Função que acessa variáveis de seu escopo externo\", \"Método de array\", \"Operador lógico\"]', 2, 832),
('Qual método remove o último elemento de um array?', 'JavaScript', 'facil', '2025-11-13 18:57:00', '[\"delete()\", \"remove()\", \"shift()\", \"pop()\"]', 3, 833),
('O que é \"callback\" em JavaScript?', 'JavaScript', 'medio', '2025-11-13 18:58:00', '[\"Tipo de loop\", \"Função passada como argumento para outra função\", \"Método de string\", \"Operador ternário\"]', 1, 834),
('Qual operador verifica se uma propriedade existe em um objeto?', 'JavaScript', 'medio', '2025-11-13 18:59:00', '[\"has\", \"in\", \"exists\", \"contains\"]', 1, 835),
('O que são arrow functions?', 'JavaScript', 'medio', '2025-11-13 19:00:00', '[\"Funções obsoletas\", \"Sintaxe concisa para escrever funções (=>)\", \"Tipo de loop\", \"Método de array\"]', 2, 836),
('Qual método divide uma string em um array?', 'JavaScript', 'facil', '2025-11-13 19:01:00', '[\"divide()\", \"separate()\", \"break()\", \"split()\"]', 3, 837),
('O que é \"NaN\" em JavaScript?', 'JavaScript', 'facil', '2025-11-13 19:02:00', '[\"Número negativo\", \"Tipo de null\", \"Not a Number - resultado de operação matemática inválida\", \"Erro de sintaxe\"]', 2, 838),
('Qual método retorna o índice da primeira ocorrência de um elemento?', 'JavaScript', 'facil', '2025-11-13 19:03:00', '[\"find()\", \"indexOf()\", \"search()\", \"locate()\"]', 1, 839),
('O que é \"debounce\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 19:04:00', '[\"Método de array\", \"Técnica para limitar taxa de execução de função\", \"Tipo de loop\", \"Operador lógico\"]', 0, 840),
('Qual método verifica se uma string termina com determinados caracteres?', 'JavaScript', 'medio', '2025-11-13 19:05:00', '[\"finish()\", \"endsWith()\", \"ends()\", \"terminates()\"]', 1, 841),
('O que é \"spread operator\" (...)?', 'JavaScript', 'medio', '2025-11-13 19:06:00', '[\"Tipo de loop\", \"Operador matemático\", \"Operador que expande elementos de arrays/objetos\", \"Método de string\"]', 2, 842),
('Qual método JavaScript cria uma cópia superficial de um array?', 'JavaScript', 'medio', '2025-11-13 19:07:00', '[\"copy()\", \"slice()\", \"duplicate()\", \"clone()\"]', 1, 843),
('O que é \"event bubbling\"?', 'JavaScript', 'dificil', '2025-11-13 19:08:00', '[\"Erro de evento\", \"Propagação de eventos do elemento filho para ancestrais\", \"Tipo de animação\", \"Método de DOM\"]', 2, 844),
('Qual método retorna uma string sem espaços no início e fim?', 'JavaScript', 'facil', '2025-11-13 19:09:00', '[\"trim()\", \"remove()\", \"strip()\", \"clean()\"]', 0, 845),
('O que é \"Promise.race()\"?', 'JavaScript', 'dificil', '2025-11-13 19:10:00', '[\"Ordena Promises por velocidade\", \"Executa Promises em paralelo\", \"Cancela todas Promises\", \"Retorna quando a primeira Promise resolver ou rejeitar\"]', 3, 846),
('Qual método inverte a ordem dos elementos de um array?', 'JavaScript', 'facil', '2025-11-13 19:11:00', '[\"invert()\", \"reverse()\", \"backward()\", \"flip()\"]', 1, 847),
('O que é \"async/await\"?', 'JavaScript', 'medio', '2025-11-13 19:12:00', '[\"Tipo de loop\", \"Sintaxe para trabalhar com código assíncrono de forma síncrona\", \"Método de array\", \"Operador lógico\"]', 2, 848),
('Qual método verifica se todos elementos passam em um teste?', 'JavaScript', 'medio', '2025-11-13 19:13:00', '[\"all()\", \"check()\", \"validate()\", \"every()\"]', 3, 849),
('O que é \"template literal\" em JavaScript?', 'JavaScript', 'facil', '2025-11-13 19:14:00', '[\"String com interpolação usando backticks (`)\", \"Tipo de array\", \"Método de string\", \"Operador especial\"]', 0, 850),
('Qual método retorna novo array com elementos únicos?', 'JavaScript', 'medio', '2025-11-13 19:15:00', '[\"unique() diretamente\", \"new Set([...array])\", \"distinct()\", \"filter()\"]', 1, 851),
('O que é \"Optional Chaining\" (?.)?', 'JavaScript', 'dificil', '2025-11-13 19:16:00', '[\"Operador de comparação\", \"Operador que acessa propriedades sem erro se undefined/null\", \"Tipo de loop\", \"Método de objeto\"]', 2, 852),
('Qual método JavaScript une elementos de array em string?', 'JavaScript', 'facil', '2025-11-13 19:17:00', '[\"merge()\", \"combine()\", \"concat()\", \"join()\"]', 3, 853),
('O que faz Object.keys()?', 'JavaScript', 'medio', '2025-11-13 19:18:00', '[\"Retorna valores do objeto\", \"Retorna array com todas as chaves do objeto\", \"Cria novo objeto\", \"Deleta propriedades\"]', 1, 854),
('Qual é a diferença entre \"==\" e \"===\"?', 'JavaScript', 'facil', '2025-11-13 19:19:00', '[\"Nenhuma\", \"=== compara valor e tipo, == só valor\", \"== é mais moderno\", \"=== é mais rápido\"]', 1, 855),
('O que é \"rest parameter\" (...args)?', 'JavaScript', 'medio', '2025-11-13 19:20:00', '[\"Parâmetro opcional\", \"Representa número indefinido de argumentos como array\", \"Parâmetro obrigatório\", \"Tipo de spread\"]', 2, 856),
('Qual método retorna caractere em posição específica?', 'JavaScript', 'facil', '2025-11-13 19:21:00', '[\"get()\", \"char()\", \"character()\", \"charAt()\"]', 3, 857),
('O que é \"IIFE\" (Immediately Invoked Function Expression)?', 'JavaScript', 'dificil', '2025-11-13 19:22:00', '[\"Método de array\", \"Tipo de loop\", \"Função executada imediatamente após definição\", \"Operador especial\"]', 2, 858),
('Qual método combina dois ou mais arrays?', 'JavaScript', 'facil', '2025-11-13 19:23:00', '[\"merge()\", \"concat()\", \"combine()\", \"join()\"]', 1, 859),
('O que é \"event delegation\"?', 'JavaScript', 'dificil', '2025-11-13 19:24:00', '[\"Tipo de propagação\", \"Técnica de anexar um listener no pai para capturar eventos dos filhos\", \"Erro de evento\", \"Método de DOM\"]', 0, 860),
('Qual método retorna substring entre dois índices?', 'JavaScript', 'medio', '2025-11-13 19:25:00', '[\"cut()\", \"slice()\", \"extract()\", \"substring()\"]', 3, 861),
('O que faz Array.from()?', 'JavaScript', 'medio', '2025-11-13 19:26:00', '[\"Ordena array\", \"Remove elementos\", \"Cria novo array a partir de objeto iterável\", \"Filtra elementos\"]', 2, 862),
('Qual método retorna novo array com resultados da função?', 'JavaScript', 'facil', '2025-11-13 19:27:00', '[\"forEach()\", \"map()\", \"filter()\", \"reduce()\"]', 1, 863),
('O que é \"Nullish Coalescing\" (??)?', 'JavaScript', 'dificil', '2025-11-13 19:28:00', '[\"Operador de atribuição\", \"Operador que retorna operando direito se esquerdo é null/undefined\", \"Tipo de comparação\", \"Método de objeto\"]', 2, 864),
('Qual método verifica se string contém substring?', 'JavaScript', 'facil', '2025-11-13 19:29:00', '[\"includes()\", \"contains()\", \"find()\", \"has()\"]', 0, 865),
('O que é \"Memoization\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 19:30:00', '[\"Operador especial\", \"Tipo de memória\", \"Método de array\", \"Técnica de cache de resultados de função para evitar recálculo\"]', 3, 866),
('Qual método retorna último índice de elemento?', 'JavaScript', 'medio', '2025-11-13 19:31:00', '[\"lastIndex()\", \"lastIndexOf()\", \"findLast()\", \"searchLast()\"]', 1, 867),
('O que é \"Proxy\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 19:32:00', '[\"Servidor intermediário\", \"Objeto que intercepta e customiza operações fundamentais\", \"Tipo de Promise\", \"Método de rede\"]', 2, 868),
('Qual método preenche array com valor estático?', 'JavaScript', 'medio', '2025-11-13 19:33:00', '[\"set()\", \"populate()\", \"write()\", \"fill()\"]', 3, 869),
('O que faz Object.freeze()?', 'JavaScript', 'medio', '2025-11-13 19:34:00', '[\"Torna objeto imutável (não pode adicionar/remover/modificar propriedades)\", \"Congela execução\", \"Para loop\", \"Desativa objeto\"]', 0, 870),
('Qual método retorna se array inclui elemento?', 'JavaScript', 'facil', '2025-11-13 19:35:00', '[\"has()\", \"includes()\", \"contains()\", \"exists()\"]', 1, 871),
('O que é \"Symbol\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 19:36:00', '[\"Ícone especial\", \"Tipo de dado primitivo único e imutável\", \"Tipo de string\", \"Operador lógico\"]', 2, 872),
('Qual método retorna parte de array sem modificá-lo?', 'JavaScript', 'facil', '2025-11-13 19:37:00', '[\"cut()\", \"extract()\", \"part()\", \"slice()\"]', 3, 873),
('O que é \"Currying\" em JavaScript?', 'JavaScript', 'dificil', '2025-11-13 19:38:00', '[\"Tipo de loop\", \"Transformar função com múltiplos argumentos em sequência de funções\", \"Método de array\", \"Operador especial\"]', 1, 874),
('Qual método retorna se string começa com caracteres específicos?', 'JavaScript', 'medio', '2025-11-13 19:39:00', '[\"begin()\", \"startsWith()\", \"starts()\", \"initiates()\"]', 1, 875),
('O que é PEP 8 em Python?', 'Python', 'medio', '2025-11-13 19:45:00', '[\"Framework web\", \"Versão do Python\", \"Biblioteca padrão\", \"Guia de estilo de código Python\"]', 3, 876),
('Qual método remove e retorna elemento de lista por índice?', 'Python', 'facil', '2025-11-13 19:46:00', '[\"remove()\", \"pop()\", \"delete()\", \"extract()\"]', 1, 877),
('O que são *args em Python?', 'Python', 'medio', '2025-11-13 19:47:00', '[\"Argumentos obrigatórios\", \"Permite passar número variável de argumentos posicionais\", \"Tipo de lista\", \"Decorador especial\"]', 2, 878),
('Qual função retorna o comprimento de uma sequência?', 'Python', 'facil', '2025-11-13 19:48:00', '[\"size()\", \"count()\", \"length()\", \"len()\"]', 3, 879),
('O que é \"duck typing\" em Python?', 'Python', 'dificil', '2025-11-13 19:49:00', '[\"Se parece e age como pato, é tratado como pato (tipo determinado por comportamento)\", \"Tipo de animal\", \"Erro de tipagem\", \"Método de depuração\"]', 0, 880),
('Qual método adiciona elemento ao final de lista?', 'Python', 'facil', '2025-11-13 19:50:00', '[\"add()\", \"append()\", \"insert()\", \"push()\"]', 1, 881),
('O que são **kwargs em Python?', 'Python', 'medio', '2025-11-13 19:51:00', '[\"Argumentos de palavra-chave\", \"Permite passar número variável de argumentos nomeados\", \"Tipo de dicionário\", \"Classe especial\"]', 2, 882),
('Qual função converte string em lista?', 'Python', 'facil', '2025-11-13 19:52:00', '[\"toList()\", \"array()\", \"convert()\", \"list()\"]', 3, 883),
('O que é \"generator\" em Python?', 'Python', 'dificil', '2025-11-13 19:53:00', '[\"Função que retorna iterador usando yield\", \"Tipo de loop\", \"Classe especial\", \"Método de lista\"]', 0, 884),
('Qual método remove elemento específico da lista?', 'Python', 'facil', '2025-11-13 19:54:00', '[\"delete()\", \"remove()\", \"pop()\", \"discard()\"]', 1, 885),
('O que é \"list slicing\" em Python?', 'Python', 'medio', '2025-11-13 19:55:00', '[\"Deletar listas\", \"Extrair porção de lista usando [inicio:fim:passo]\", \"Juntar listas\", \"Ordenar lista\"]', 2, 886),
('Qual método retorna menor valor de sequência?', 'Python', 'facil', '2025-11-13 19:56:00', '[\"lowest()\", \"smallest()\", \"minimum()\", \"min()\"]', 3, 887),
('O que é \"lambda\" em Python?', 'Python', 'medio', '2025-11-13 19:57:00', '[\"Classe especial\", \"Tipo de loop\", \"Função anônima de uma linha\", \"Método de string\"]', 2, 888),
('Qual método ordena lista in-place?', 'Python', 'facil', '2025-11-13 19:58:00', '[\"order()\", \"sort()\", \"arrange()\", \"organize()\"]', 1, 889),
('O que é \"enumerate\" em Python?', 'Python', 'medio', '2025-11-13 19:59:00', '[\"Método de contagem\", \"Retorna iterador com índice e valor\", \"Tipo de número\", \"Classe de lista\"]', 0, 890),
('Qual função retorna maior valor de sequência?', 'Python', 'facil', '2025-11-13 20:00:00', '[\"highest()\", \"biggest()\", \"maximum()\", \"max()\"]', 3, 891),
('O que faz o método dict.get()?', 'Python', 'medio', '2025-11-13 20:01:00', '[\"Adiciona chave\", \"Remove chave\", \"Retorna valor de chave, None se não existe (sem erro)\", \"Lista chaves\"]', 2, 892),
('O que a sigla \"LAN\" significa?', 'Redes', 'facil', '2025-11-14 12:00:00', '[\"Limited Access Network\", \"Large Area Network\", \"Logical Area Node\", \"Local Area Network\"]', 3, 893),
('Qual protocolo é usado para transferir arquivos de forma não segura (em texto plano)?', 'Redes', 'medio', '2025-11-14 12:01:00', '[\"HTTPS\", \"FTP\", \"SFTP\", \"SSH\"]', 1, 894),
('Qual camada do Modelo OSI é responsável pela formatação dos dados e criptografia?', 'Redes', 'medio', '2025-11-14 12:02:00', '[\"Camada de Apresentação\", \"Camada de Transporte\", \"Camada Física\", \"Camada de Sessão\"]', 0, 895),
('O que significa a sigla \"WAN\"?', 'Redes', 'facil', '2025-11-14 12:03:00', '[\"Wireless Area Network\", \"Wired Access Network\", \"World Access Node\", \"Wide Area Network\"]', 3, 896),
('Qual protocolo de roteamento interno (IGP) usa o algoritmo de \"Shortest Path First\" (Dijkstra)?', 'Redes', 'dificil', '2025-11-14 12:04:00', '[\"BGP\", \"OSPF\", \"RIP\", \"EIGRP\"]', 1, 897),
('O que é um \"VLAN\"?', 'Redes', 'medio', '2025-11-14 12:05:00', '[\"Uma rede física virtual\", \"Uma rede local virtual que segmenta o tráfego em um switch\", \"Um protocolo de vídeo\", \"Um tipo de VPN\"]', 1, 898),
('Qual dispositivo de rede opera na Camada 3 (Rede) e encaminha pacotes entre diferentes redes?', 'Redes', 'facil', '2025-11-14 12:06:00', '[\"Switch\", \"Hub\", \"Roteador\", \"Access Point\"]', 2, 899),
('O que é \"Spanning Tree Protocol\" (STP) e qual seu objetivo principal?', 'Redes', 'dificil', '2025-11-14 12:07:00', '[\"Evitar loops de rede em topologias com switches redundantes\", \"Um protocolo de segurança\", \"Um protocolo de roteamento rápido\", \"Criar árvores de rede\"]', 0, 900),
('Qual porta TCP é comumente usada para acesso remoto seguro via SSH?', 'Redes', 'medio', '2025-11-14 12:08:00', '[\"23\", \"22\", \"80\", \"21\"]', 1, 901),
('Qual dispositivo de rede opera na Camada 2 (Enlace) e usa endereços MAC para encaminhar quadros?', 'Redes', 'facil', '2025-11-14 12:09:00', '[\"Roteador\", \"Switch\", \"Hub\", \"Modem\"]', 1, 902),
('O que é uma \"instância\" em POO?', 'POO', 'facil', '2025-11-14 14:00:00', '[\"Um tipo de herança\", \"Um método estático\", \"Uma classe base\", \"Um objeto criado a partir de uma classe\"]', 3, 903),
('Qual o principal objetivo de uma \"interface\" em POO?', 'POO', 'medio', '2025-11-14 14:01:00', '[\"Definir um contrato (métodos) que uma classe deve implementar\", \"Instanciar objetos diretamente\", \"Armazenar dados privados\", \"Substituir a herança\"]', 0, 904),
('O que é \"sobrecarga de método\" (overloading)?', 'POO', 'medio', '2025-11-14 14:02:00', '[\"Ter múltiplos métodos com o mesmo nome, mas assinaturas (parâmetros) diferentes\", \"Substituir um método na classe filha\", \"Mudar o tipo de retorno do método\", \"Limitar o acesso ao método\"]', 0, 905),
('O que diz o \"Princípio de Substituição de Liskov\" (LSP) do SOLID?', 'POO', 'dificil', '2025-11-14 14:03:00', '[\"Classes devem ser abertas para extensão, fechadas para modificação\", \"Classes devem depender de abstrações\", \"Uma classe deve ter apenas um motivo para mudar\", \"Objetos de uma superclasse devem ser substituíveis por objetos de uma subclasse sem quebrar a aplicação\"]', 3, 906),
('O que significa o modificador de acesso \"private\" (privado)?', 'POO', 'facil', '2025-11-14 14:04:00', '[\"Que pode ser acessado por qualquer classe\", \"Que o atributo/método só pode ser acessado dentro da própria classe\", \"Que pode ser acessado por classes filhas\", \"Que é uma variável global\"]', 1, 907),
('O que é o \"Kernel\" de um Sistema Operacional?', 'Sistemas Operacionais', 'facil', '2025-11-14 14:05:00', '[\"O núcleo do SO, que gerencia hardware e processos\", \"A interface gráfica do usuário\", \"Um driver de dispositivo\", \"O gerenciador de arquivos\"]', 0, 908),
('O que é um \"processo\" em Sistemas Operacionais?', 'Sistemas Operacionais', 'medio', '2025-11-14 14:06:00', '[\"Um arquivo no disco\", \"Uma thread\", \"Um programa em execução\", \"Um driver de hardware\"]', 2, 909),
('O que é \"memória virtual\"?', 'Sistemas Operacionais', 'medio', '2025-11-14 14:07:00', '[\"Uma técnica que usa o disco (HD/SSD) para estender a RAM\", \"Memória cache da CPU\", \"Memória ROM\", \"Memória RAM física\"]', 0, 910),
('O que é um \"deadlock\" (impasse)?', 'Sistemas Operacionais', 'dificil', '2025-11-14 14:08:00', '[\"Um erro de falta de memória\", \"Uma situação em que dois ou mais processos se bloqueiam mutuamente, esperando por recursos\", \"Um processo que consome 100% da CPU\", \"Uma falha de segurança\"]', 1, 911),
('Qual a função de um \"Sistema de Arquivos\" (File System)?', 'Sistemas Operacionais', 'facil', '2025-11-14 14:09:00', '[\"Organizar e controlar como os dados são armazenados e recuperados no disco\", \"Gerenciar a CPU\", \"Conectar à internet\", \"Gerenciar a memória RAM\"]', 0, 912),
('Qual estrutura de dados utiliza o princípio LIFO (Last-In, First-Out)?', 'Estrutura de Dados', 'facil', '2025-11-14 14:10:00', '[\"Fila (Queue)\", \"Lista (List)\", \"Pilha (Stack)\", \"Árvore (Tree)\"]', 2, 913),
('Qual estrutura de dados utiliza o princípio FIFO (First-In, First-Out)?', 'Estrutura de Dados', 'facil', '2025-11-14 14:11:00', '[\"Pilha (Stack)\", \"Grafo (Graph)\", \"Array\", \"Fila (Queue)\"]', 3, 914),
('Para que uma \"Tabela Hash\" (Hash Table) é usada principalmente?', 'Estrutura de Dados', 'medio', '2025-11-14 14:12:00', '[\"Armazenamento e busca rápida de pares chave-valor\", \"Armazenamento ordenado LIFO\", \"Armazenamento hierárquico\", \"Representar redes\"]', 0, 915),
('O que é uma \"árvore binária\"?', 'Estrutura de Dados', 'medio', '2025-11-14 14:13:00', '[\"Uma árvore onde cada nó tem no máximo dois filhos\", \"Uma estrutura linear\", \"Uma árvore onde todos os nós estão no mesmo nível\", \"Uma estrutura FIFO\"]', 0, 916),
('Qual a vantagem de uma \"Árvore Binária de Busca\" (BST) sobre um array simples para busca?', 'Estrutura de Dados', 'dificil', '2025-11-14 14:14:00', '[\"Usa menos memória\", \"É mais fácil de implementar\", \"Permite busca, inserção e deleção em tempo O(log n) (em média)\", \"Garante busca em O(1)\"]', 2, 917),
('Qual comando SQL é usado para remover uma tabela inteira e todos os seus dados?', 'SQL', 'facil', '2025-11-14 15:00:00', '[\"DELETE FROM table\", \"TRUNCATE TABLE table\", \"REMOVE TABLE table\", \"DROP TABLE table\"]', 3, 918),
('Qual cláusula é usada com `GROUP BY` para filtrar grupos baseados em uma função agregada?', 'SQL', 'medio', '2025-11-14 15:01:00', '[\"GROUPFILTER\", \"WHERE\", \"FILTER\", \"HAVING\"]', 3, 919),
('O que a função `COUNT(*)` faz?', 'SQL', 'facil', '2025-11-14 15:02:00', '[\"Conta o número de linhas na tabela\", \"Conta o número de colunas\", \"Soma os valores da tabela\", \"Encontra o maior valor\"]', 0, 920),
('O que é uma \"Primary Key\" (Chave Primária)?', 'SQL', 'facil', '2025-11-14 15:03:00', '[\"Um índice para buscas rápidas\", \"Uma chave de acesso de outro país\", \"Um identificador único para cada linha da tabela\", \"Uma coluna que aceita valores nulos\"]', 2, 921),
('Qual expressão SQL permite lógica condicional (if/else) dentro de uma consulta?', 'SQL', 'medio', '2025-11-14 15:04:00', '[\"IF...THEN...\", \"SWITCH\", \"ELSE\", \"CASE...WHEN...END\"]', 3, 922),
('O que um \"Índice\" (Index) faz em um banco de dados?', 'SQL', 'medio', '2025-11-14 15:05:00', '[\"Substitui a chave primária\", \"Garante que os dados não sejam nulos\", \"Remove dados duplicados\", \"Acelera a velocidade das consultas de busca (SELECT)\"]', 3, 923),
('Qual comando finaliza uma transação e salva permanentemente as mudanças?', 'SQL', 'medio', '2025-11-14 15:06:00', '[\"COMMIT\", \"SAVE\", \"ROLLBACK\", \"END\"]', 0, 924),
('Qual comando desfaz as mudanças de uma transação que ainda não foi \"commitada\"?', 'SQL', 'medio', '2025-11-14 15:07:00', '[\"ROLLBACK\", \"REVERT\", \"UNDO\", \"CANCEL\"]', 0, 925),
('Qual é a principal diferença entre `UNION` e `UNION ALL`?', 'SQL', 'dificil', '2025-11-14 15:08:00', '[\"UNION não funciona no MySQL\", \"UNION ALL é mais lento\", \"Não há diferença\", \"UNION remove duplicatas, UNION ALL inclui todas as linhas\"]', 3, 926),
('O que faz a restrição \"FOREIGN KEY\" (Chave Estrangeira)?', 'SQL', 'medio', '2025-11-14 15:09:00', '[\"Define a chave primária da tabela\", \"Garante que o valor em uma coluna corresponda a um valor na chave primária de outra tabela\", \"Permite valores de texto únicos\", \"Impede a tabela de ser deletada\"]', 1, 927),
('O que significa o princípio \"YAGNI\" em desenvolvimento de software?', 'Boas Práticas', 'medio', '2025-11-14 16:00:00', '[\"Your Application Goes Network Independent\", \"You Always Get New Ideas\", \"You Aren\'t Gonna Need It\", \"Yet Another Good New Implementation\"]', 2, 928),
('Qual a importância de escrever testes unitários antes do código de produção?', 'Boas Práticas', 'medio', '2025-11-14 16:01:00', '[\"Apenas documentação\", \"Garante que o código atenda aos requisitos desde o início (TDD)\", \"Diminui a performance\", \"É uma prática obsoleta\"]', 1, 929),
('O que é \"code smell\" (cheiro de código)?', 'Boas Práticas', 'facil', '2025-11-14 16:02:00', '[\"Indicador de possível problema de design no código\", \"Erro de compilação\", \"Código com bugs graves\", \"Código comentado\"]', 0, 930),
('Qual o propósito do \"versionamento semântico\" (Semantic Versioning)?', 'Boas Práticas', 'medio', '2025-11-14 16:03:00', '[\"Versionar apenas o frontend\", \"Versionar apenas o backend\", \"Criar backups automáticos\", \"Comunicar mudanças no software através de números de versão (MAJOR.MINOR.PATCH)\"]', 3, 931),
('O que é \"continuous refactoring\"?', 'Boas Práticas', 'medio', '2025-11-14 16:04:00', '[\"Apenas corrigir bugs\", \"Reescrever todo código periodicamente\", \"Melhorar continuamente o código sem alterar funcionalidade\", \"Adicionar novos recursos constantemente\"]', 2, 932),
('Qual a vantagem de usar \"dependency injection\"?', 'Boas Práticas', 'dificil', '2025-11-14 16:05:00', '[\"Aumenta acoplamento\", \"Facilita testes e reduz dependências diretas\", \"Torna código mais lento\", \"Apenas para linguagens tipadas\"]', 1, 933),
('O que significa \"separation of concerns\"?', 'Boas Práticas', 'facil', '2025-11-14 16:06:00', '[\"Separar frontend de backend\", \"Usar múltiplos bancos de dados\", \"Dividir programa em seções com responsabilidades distintas\", \"Separar código por linguagem\"]', 2, 934),
('Qual o objetivo do \"continuous integration\" (CI)?', 'Boas Práticas', 'medio', '2025-11-14 16:07:00', '[\"Integrar mudanças de código frequentemente com testes automáticos\", \"Criar backups contínuos\", \"Documentar código automaticamente\", \"Apenas fazer deploy\"]', 0, 935),
('O que é \"technical debt\" (débito técnico)?', 'Boas Práticas', 'medio', '2025-11-14 16:08:00', '[\"Falta de documentação\", \"Dívida financeira do projeto\", \"Bugs acumulados\", \"Custo futuro de manutenção por escolhas rápidas no presente\"]', 3, 936),
('Qual a importância do \"code coverage\" em testes?', 'Boas Práticas', 'medio', '2025-11-14 16:09:00', '[\"Apenas estatística visual\", \"Medir porcentagem de código testado para identificar gaps\", \"Substituir testes manuais\", \"Garantir 100% de qualidade\"]', 1, 937),
('O que é \"peer programming\"?', 'Boas Práticas', 'facil', '2025-11-14 16:10:00', '[\"Programar sozinho\", \"Revisar código após conclusão\", \"Dois programadores trabalhando juntos no mesmo código\", \"Programar em equipes grandes\"]', 2, 938),
('Qual o propósito de usar \"design patterns\"?', 'Boas Práticas', 'medio', '2025-11-14 16:11:00', '[\"Apenas para documentação\", \"Decorar código\", \"Complicar a implementação\", \"Resolver problemas comuns com soluções testadas e reutilizáveis\"]', 3, 939),
('O que significa \"fail fast\" em programação?', 'Boas Práticas', 'medio', '2025-11-14 16:12:00', '[\"Detectar e reportar erros o mais cedo possível\", \"Programar rapidamente\", \"Desistir de funcionalidades difíceis\", \"Fazer deploy sem testes\"]', 0, 940),
('Qual a vantagem de usar \"configuration files\" separados?', 'Boas Práticas', 'facil', '2025-11-14 16:13:00', '[\"Deixar código mais lento\", \"Facilitar mudanças sem alterar código-fonte\", \"Apenas para projetos grandes\", \"Dificultar manutenção\"]', 1, 941),
('O que é \"defensive programming\"?', 'Boas Práticas', 'medio', '2025-11-14 16:14:00', '[\"Programar com firewall\", \"Usar apenas linguagens seguras\", \"Antecipar erros e validar todas as entradas\", \"Criptografar todo código\"]', 2, 942),
('Qual o objetivo de seguir convenções de nomenclatura?', 'Boas Práticas', 'facil', '2025-11-14 16:15:00', '[\"Apenas estética\", \"Aumentar tamanho do código\", \"Reduzir performance\", \"Melhorar legibilidade e manutenibilidade do código\"]', 3, 943),
('O que é \"boy scout rule\" em programação?', 'Boas Práticas', 'medio', '2025-11-14 16:16:00', '[\"Deixar código melhor do que encontrou\", \"Acampar enquanto programa\", \"Revisar código dos outros\", \"Fazer backup diário\"]', 0, 944),
('Qual a importância de escrever \"self-documenting code\"?', 'Boas Práticas', 'medio', '2025-11-14 16:17:00', '[\"Substituir comentários\", \"Código que explica sua intenção através de nomes claros\", \"Apenas para linguagens modernas\", \"Gerar documentação automática\"]', 1, 945),
('O que significa \"premature optimization\"?', 'Boas Práticas', 'dificil', '2025-11-14 16:18:00', '[\"Otimizar desde o início\", \"Nunca otimizar código\", \"Otimizar antes de identificar gargalos reais (pode ser prejudicial)\", \"Sempre usar cache\"]', 2, 946),
('Qual o benefício de usar \"immutable objects\"?', 'Boas Práticas', 'dificil', '2025-11-14 16:19:00', '[\"Usar menos memória\", \"Apenas para linguagens funcionais\", \"Tornar código mais lento\", \"Prevenir efeitos colaterais e facilitar concorrência\"]', 3, 947),
('O que significa \"IaaS\" em cloud computing?', 'Cloud Computing', 'facil', '2025-11-14 16:20:00', '[\"Integration as a Service\", \"Internet as a Service\", \"Infrastructure as a Service\", \"Information as a Service\"]', 2, 948),
('Qual é a diferença entre escalabilidade vertical e horizontal?', 'Cloud Computing', 'medio', '2025-11-14 16:21:00', '[\"Não há diferença\", \"Vertical adiciona recursos ao servidor; Horizontal adiciona mais servidores\", \"Vertical é mais barata\", \"Horizontal apenas para banco de dados\"]', 1, 949),
('O que é \"PaaS\" (Platform as a Service)?', 'Cloud Computing', 'facil', '2025-11-14 16:22:00', '[\"Plataforma que fornece ambiente para desenvolver e executar aplicações\", \"Apenas banco de dados\", \"Apenas hospedagem\", \"Apenas armazenamento\"]', 0, 950),
('Qual serviço AWS é usado para armazenamento de objetos?', 'Cloud Computing', 'facil', '2025-11-14 16:23:00', '[\"EC2\", \"RDS\", \"Lambda\", \"S3\"]', 3, 951),
('O que é \"serverless computing\"?', 'Cloud Computing', 'medio', '2025-11-14 16:24:00', '[\"Aplicação sem backend\", \"Servidores sem sistema operacional\", \"Modelo onde provedor gerencia servidores e executa código sob demanda\", \"Rede sem servidores\"]', 2, 952),
('Qual é o propósito do \"load balancer\" em cloud?', 'Cloud Computing', 'facil', '2025-11-14 16:25:00', '[\"Economizar energia\", \"Distribuir tráfego entre múltiplos servidores\", \"Fazer backup automático\", \"Criptografar dados\"]', 1, 953),
('O que é \"auto-scaling\"?', 'Cloud Computing', 'medio', '2025-11-14 16:26:00', '[\"Backup automático\", \"Atualização automática\", \"Ajustar automaticamente recursos baseado na demanda\", \"Deletar recursos não usados\"]', 2, 954),
('Qual serviço AWS executa código sem provisionar servidores?', 'Cloud Computing', 'medio', '2025-11-14 16:27:00', '[\"Lambda\", \"S3\", \"RDS\", \"EC2\"]', 0, 955),
('O que significa \"SaaS\"?', 'Cloud Computing', 'facil', '2025-11-14 16:28:00', '[\"Server as a Service\", \"Security as a Service\", \"Storage as a Service\", \"Software as a Service\"]', 3, 956),
('Qual é a vantagem de usar \"CDN\" (Content Delivery Network)?', 'Cloud Computing', 'medio', '2025-11-14 16:29:00', '[\"Apenas para vídeos\", \"Reduzir latência distribuindo conteúdo geograficamente\", \"Aumentar segurança apenas\", \"Substituir servidor web\"]', 1, 957),
('O que é \"container orchestration\"?', 'Cloud Computing', 'dificil', '2025-11-14 16:30:00', '[\"Criar containers\", \"Apenas para Docker\", \"Gerenciar deployment, scaling e operação de containers\", \"Tipo de virtualização\"]', 2, 958),
('Qual serviço é exemplo de banco de dados gerenciado na AWS?', 'Cloud Computing', 'facil', '2025-11-14 16:31:00', '[\"Lambda\", \"S3\", \"EC2\", \"RDS\"]', 3, 959),
('O que é \"multi-tenancy\" em cloud?', 'Cloud Computing', 'medio', '2025-11-14 16:32:00', '[\"Múltiplos clientes compartilham mesma infraestrutura mantendo isolamento\", \"Múltiplos servidores\", \"Múltiplos backups\", \"Múltiplos datacenters\"]', 0, 960),
('Qual é o modelo de precificação \"pay-as-you-go\"?', 'Cloud Computing', 'facil', '2025-11-14 16:33:00', '[\"Pagamento anual fixo\", \"Pagar apenas pelos recursos utilizados\", \"Pagamento mensal fixo\", \"Gratuito para sempre\"]', 1, 961),
('O que é \"elasticity\" em cloud computing?', 'Cloud Computing', 'medio', '2025-11-14 16:34:00', '[\"Backup elástico\", \"Rede flexível\", \"Capacidade de aumentar/diminuir recursos automaticamente\", \"Armazenamento expansível\"]', 2, 962),
('Qual serviço Azure é equivalente ao AWS Lambda?', 'Cloud Computing', 'medio', '2025-11-14 16:35:00', '[\"Azure VM\", \"Azure Storage\", \"Azure SQL\", \"Azure Functions\"]', 3, 963),
('O que é \"cloud bursting\"?', 'Cloud Computing', 'dificil', '2025-11-14 16:36:00', '[\"Usar cloud pública quando capacidade privada é excedida\", \"Ataque DDoS na cloud\", \"Falha de servidor\", \"Backup na nuvem\"]', 0, 964),
('Qual é a vantagem de usar \"managed services\"?', 'Cloud Computing', 'medio', '2025-11-14 16:37:00', '[\"São gratuitos\", \"Provedor gerencia manutenção, patches e backups\", \"Mais controle total\", \"Apenas para pequenas empresas\"]', 1, 965),
('O que é \"object storage\"?', 'Cloud Computing', 'medio', '2025-11-14 16:38:00', '[\"Armazenamento de objetos físicos\", \"Apenas para imagens\", \"Arquitetura que gerencia dados como objetos (não arquivos/blocos)\", \"Tipo de banco de dados\"]', 2, 966),
('Qual serviço Google Cloud é para armazenamento de objetos?', 'Cloud Computing', 'facil', '2025-11-14 16:39:00', '[\"Compute Engine\", \"BigQuery\", \"App Engine\", \"Cloud Storage\"]', 3, 967),
('O que é \"hybrid cloud\"?', 'Cloud Computing', 'medio', '2025-11-14 16:40:00', '[\"Cloud e servidor local separados\", \"Dois provedores cloud\", \"Combinação de cloud pública e privada/on-premise\", \"Apenas virtualização\"]', 2, 968),
('Qual é o propósito de \"IAM\" (Identity and Access Management)?', 'Cloud Computing', 'facil', '2025-11-14 16:41:00', '[\"Fazer backup\", \"Gerenciar permissões e acessos aos recursos\", \"Monitorar performance\", \"Escalar aplicações\"]', 1, 969),
('O que é \"cold storage\" em cloud?', 'Cloud Computing', 'medio', '2025-11-14 16:42:00', '[\"Armazenamento de baixo custo para dados acessados raramente\", \"Backup local\", \"Armazenamento refrigerado\", \"Armazenamento temporário\"]', 0, 970),
('Qual serviço AWS fornece monitoramento e observabilidade?', 'Cloud Computing', 'medio', '2025-11-14 16:43:00', '[\"S3\", \"Lambda\", \"EC2\", \"CloudWatch\"]', 3, 971),
('O que é \"egress cost\" em cloud?', 'Cloud Computing', 'dificil', '2025-11-14 16:44:00', '[\"Custo de armazenamento\", \"Custo de entrada de dados\", \"Custo de transferência de dados para fora da cloud\", \"Taxa de setup inicial\"]', 2, 972),
('Qual é a vantagem de usar \"spot instances\"?', 'Cloud Computing', 'medio', '2025-11-14 16:45:00', '[\"Maior confiabilidade\", \"Instâncias de computação com preço reduzido (não garantidas)\", \"Melhor performance\", \"Suporte prioritário\"]', 1, 973),
('O que é \"availability zone\"?', 'Cloud Computing', 'facil', '2025-11-14 16:46:00', '[\"Tipo de servidor\", \"Região geográfica\", \"Datacenter isolado dentro de uma região para alta disponibilidade\", \"Backup zone\"]', 2, 974),
('Qual padrão arquitetural é comum em aplicações cloud-native?', 'Cloud Computing', 'dificil', '2025-11-14 16:47:00', '[\"Microservices\", \"Cliente-servidor tradicional\", \"Mainframe\", \"Monolítico apenas\"]', 0, 975),
('O que é \"disaster recovery\" em cloud?', 'Cloud Computing', 'medio', '2025-11-14 16:48:00', '[\"Firewall avançado\", \"Apenas backup diário\", \"Antivírus na cloud\", \"Estratégia para recuperar sistemas após falha catastrófica\"]', 3, 976),
('Qual é o benefício de usar \"infrastructure as code\" em cloud?', 'Cloud Computing', 'dificil', '2025-11-14 16:49:00', '[\"Apenas documentação\", \"Provisionar e gerenciar infraestrutura através de código versionável\", \"Substituir DevOps\", \"Apenas para AWS\"]', 1, 977),
('O que é Machine Learning?', 'Machine Learning', 'facil', '2025-11-14 16:50:00', '[\"Máquinas que aprendem sozinhas\", \"Robôs inteligentes\", \"Subcampo da IA onde sistemas aprendem com dados\", \"Apenas redes neurais\"]', 2, 978),
('Qual a diferença entre supervised e unsupervised learning?', 'Machine Learning', 'medio', '2025-11-14 16:51:00', '[\"Não há diferença\", \"Supervised usa dados rotulados; Unsupervised descobre padrões sem rótulos\", \"Supervised é mais rápido\", \"Unsupervised é obsoleto\"]', 1, 979),
('O que é uma rede neural artificial?', 'Machine Learning', 'facil', '2025-11-14 16:52:00', '[\"Modelo computacional inspirado em neurônios biológicos\", \"Sistema biológico\", \"Rede de computadores\", \"Tipo de algoritmo de busca\"]', 0, 980),
('O que significa \"overfitting\" em ML?', 'Machine Learning', 'medio', '2025-11-14 16:53:00', '[\"Modelo muito simples\", \"Modelo aprende demais e não generaliza bem\", \"Erro de sintaxe\", \"Falta de dados\"]', 1, 981),
('Qual biblioteca Python é amplamente usada para ML?', 'Machine Learning', 'facil', '2025-11-14 16:54:00', '[\"Django\", \"scikit-learn\", \"Flask\", \"Pygame\"]', 1, 982),
('O que é \"dataset de treino\"?', 'Machine Learning', 'facil', '2025-11-14 16:55:00', '[\"Dados para documentação\", \"Backup de dados\", \"Conjunto de dados usado para ensinar o modelo\", \"Dados de produção\"]', 2, 983),
('O que é \"reinforcement learning\"?', 'Machine Learning', 'dificil', '2025-11-14 16:56:00', '[\"Treinar com reforço físico\", \"Apenas para jogos\", \"Aprendizado através de tentativa e erro com recompensas\", \"Tipo de supervised learning\"]', 2, 984),
('Qual é o propósito do \"dataset de validação\"?', 'Machine Learning', 'medio', '2025-11-14 16:57:00', '[\"Avaliar modelo durante treinamento e ajustar hiperparâmetros\", \"Fazer backup\", \"Produção final\", \"Substituir treino\"]', 0, 985);
INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('O que é \"deep learning\"?', 'Machine Learning', 'medio', '2025-11-14 16:58:00', '[\"Apenas para imagens\", \"Aprendizado profundo de filosofia\", \"ML mais lento\", \"Subcampo de ML com redes neurais de múltiplas camadas\"]', 3, 986),
('Qual framework é popular para deep learning?', 'Machine Learning', 'facil', '2025-11-14 16:59:00', '[\"React\", \"TensorFlow\", \"Angular\", \"jQuery\"]', 1, 987),
('O que é \"underfitting\"?', 'Machine Learning', 'medio', '2025-11-14 17:00:00', '[\"Modelo muito complexo\", \"Dados insuficientes\", \"Modelo muito simples que não captura padrões dos dados\", \"Erro de sintaxe\"]', 2, 988),
('O que significa \"feature\" em ML?', 'Machine Learning', 'facil', '2025-11-14 17:01:00', '[\"Bug do código\", \"Funcionalidade do software\", \"Framework especial\", \"Atributo ou característica dos dados usada para predição\"]', 3, 989),
('O que é \"classificação\" em ML?', 'Machine Learning', 'facil', '2025-11-14 17:02:00', '[\"Tarefa de prever categoria/classe de uma entrada\", \"Ordenar dados\", \"Tipo de rede neural\", \"Apenas para textos\"]', 0, 990),
('Qual é a diferença entre classificação e regressão?', 'Machine Learning', 'medio', '2025-11-14 17:03:00', '[\"Não há diferença\", \"Classificação prevê categorias; Regressão prevê valores contínuos\", \"Regressão é mais rápida\", \"Classificação é obsoleta\"]', 1, 991),
('O que é \"transfer learning\"?', 'Machine Learning', 'dificil', '2025-11-14 17:04:00', '[\"Transferir dados\", \"Mover modelo entre servidores\", \"Reutilizar modelo pré-treinado para nova tarefa similar\", \"Backup de modelo\"]', 2, 992),
('Qual biblioteca Python é usada para manipulação de dados em ML?', 'Machine Learning', 'facil', '2025-11-14 17:05:00', '[\"Flask\", \"Django\", \"Pygame\", \"Pandas\"]', 3, 993),
('O que é \"cross-validation\"?', 'Machine Learning', 'medio', '2025-11-14 17:06:00', '[\"Validar dados cruzados\", \"Técnica para avaliar modelo dividindo dados em múltiplos subconjuntos\", \"Tipo de rede neural\", \"Apenas para classificação\"]', 1, 994),
('O que é um \"hiperparâmetro\"?', 'Machine Learning', 'medio', '2025-11-14 17:07:00', '[\"Parâmetro muito grande\", \"Configuração definida antes do treinamento (não aprendida)\", \"Apenas para deep learning\", \"Tipo de feature\"]', 1, 995),
('O que é \"gradient descent\"?', 'Machine Learning', 'dificil', '2025-11-14 17:08:00', '[\"Descida de montanha\", \"Tipo de rede neural\", \"Algoritmo de otimização para minimizar erro do modelo\", \"Apenas para regressão\"]', 2, 996),
('Qual métrica avalia acurácia de classificação binária?', 'Machine Learning', 'medio', '2025-11-14 17:09:00', '[\"MSE\", \"R²\", \"RMSE\", \"Accuracy/Precision/Recall\"]', 3, 997),
('O que é \"data augmentation\"?', 'Machine Learning', 'medio', '2025-11-14 17:10:00', '[\"Adicionar mais features\", \"Aumentar tamanho do modelo\", \"Técnica para aumentar dataset através de transformações\", \"Backup de dados\"]', 2, 998),
('O que é \"dropout\" em redes neurais?', 'Machine Learning', 'dificil', '2025-11-14 17:11:00', '[\"Erro de conexão\", \"Técnica de regularização que desativa neurônios aleatoriamente\", \"Tipo de ativação\", \"Perda de dados\"]', 1, 999),
('O que é \"batch size\" no treinamento?', 'Machine Learning', 'medio', '2025-11-14 17:12:00', '[\"Número de exemplos processados antes de atualizar pesos\", \"Tamanho total do dataset\", \"Tamanho do modelo\", \"Número de camadas\"]', 0, 1000),
('Qual função de ativação é comum em camadas ocultas?', 'Machine Learning', 'medio', '2025-11-14 17:13:00', '[\"Linear\", \"Softmax\", \"Sigmoid\", \"ReLU\"]', 3, 1001),
('O que é \"ensemble learning\"?', 'Machine Learning', 'dificil', '2025-11-14 17:14:00', '[\"Apenas para classificação\", \"Treinar em conjunto\", \"Combinar múltiplos modelos para melhorar predições\", \"Tipo de deep learning\"]', 2, 1002),
('Qual linguagem é usada nativamente para desenvolvimento iOS?', 'Mobile', 'facil', '2025-11-14 17:15:00', '[\"C#\", \"Java\", \"Kotlin\", \"Swift\"]', 3, 1003),
('Qual framework permite desenvolver apps mobile multiplataforma com JavaScript?', 'Mobile', 'facil', '2025-11-14 17:16:00', '[\"React Native\", \"Django\", \"Laravel\", \"Spring\"]', 0, 1004),
('Qual linguagem é recomendada para desenvolvimento Android nativo?', 'Mobile', 'facil', '2025-11-14 17:17:00', '[\"Kotlin\", \"Python\", \"Swift\", \"Ruby\"]', 0, 1005),
('Qual framework Google usa para desenvolvimento multiplataforma?', 'Mobile', 'facil', '2025-11-14 17:18:00', '[\"React Native\", \"Xamarin\", \"Ionic\", \"Flutter\"]', 3, 1006),
('O que é APK em Android?', 'Mobile', 'facil', '2025-11-14 17:19:00', '[\"API Key\", \"Android Package Kit - formato de instalação de apps\", \"Application Protocol Kit\", \"Android Program Kernel\"]', 1, 1007),
('Qual IDE é oficial para desenvolvimento Android?', 'Mobile', 'facil', '2025-11-14 17:20:00', '[\"Android Studio\", \"Eclipse\", \"Visual Studio\", \"IntelliJ IDEA\"]', 0, 1008),
('O que é um \"Activity\" no Android?', 'Mobile', 'medio', '2025-11-14 17:21:00', '[\"Processo em background\", \"Banco de dados\", \"Tela/interface com a qual usuário interage\", \"Serviço de rede\"]', 2, 1009),
('Qual linguagem Flutter utiliza?', 'Mobile', 'facil', '2025-11-14 17:22:00', '[\"Dart\", \"Python\", \"Java\", \"JavaScript\"]', 0, 1010),
('O que é um \"Intent\" no Android?', 'Mobile', 'medio', '2025-11-14 17:23:00', '[\"Tipo de variável\", \"Objeto para comunicação entre componentes\", \"Layout XML\", \"Banco de dados\"]', 1, 1011),
('Qual arquivo define permissões em um app Android?', 'Mobile', 'medio', '2025-11-14 17:24:00', '[\"AndroidManifest.xml\", \"build.gradle\", \"strings.xml\", \"MainActivity.java\"]', 0, 1012),
('O que é \"ViewController\" no iOS?', 'Mobile', 'medio', '2025-11-14 17:25:00', '[\"Banco de dados\", \"Serviço de rede\", \"Objeto que gerencia uma tela/view\", \"Tipo de animação\"]', 2, 1013),
('Qual formato de arquivo é usado para apps iOS?', 'Mobile', 'facil', '2025-11-14 17:26:00', '[\"APK\", \"EXE\", \"DMG\", \"IPA\"]', 3, 1014),
('O que é \"Fragment\" no Android?', 'Mobile', 'medio', '2025-11-14 17:27:00', '[\"Porção reutilizável de interface dentro de Activity\", \"Tipo de animação\", \"Banco de dados\", \"Serviço de background\"]', 0, 1015),
('Qual linguagem usava-se originalmente para iOS antes do Swift?', 'Mobile', 'facil', '2025-11-14 17:28:00', '[\"Objective-C\", \"C++\", \"C#\", \"Java\"]', 0, 1016),
('O que é \"RecyclerView\" no Android?', 'Mobile', 'medio', '2025-11-14 17:29:00', '[\"Gerenciador de memória\", \"Sistema de navegação\", \"Componente para exibir listas eficientemente\", \"Tipo de banco de dados\"]', 2, 1017),
('Qual biblioteca é comum para gerenciamento de estado no React Native?', 'Mobile', 'medio', '2025-11-14 17:30:00', '[\"Spring\", \"Hibernate\", \"Laravel\", \"Redux\"]', 3, 1018),
('O que é \"Gradle\" no contexto Android?', 'Mobile', 'medio', '2025-11-14 17:31:00', '[\"Depurador\", \"Editor de layout\", \"Emulador\", \"Sistema de build e gerenciamento de dependências\"]', 3, 1019),
('Qual padrão arquitetural é recomendado para Android?', 'Mobile', 'dificil', '2025-11-14 17:32:00', '[\"MVVM (Model-View-ViewModel)\", \"MVC apenas\", \"Singleton\", \"Factory\"]', 0, 1020),
('O que é \"CocoaPods\" no iOS?', 'Mobile', 'medio', '2025-11-14 17:33:00', '[\"Framework de UI\", \"Emulador\", \"Gerenciador de dependências\", \"Linguagem de programação\"]', 2, 1021),
('Qual componente Flutter representa um elemento visual?', 'Mobile', 'facil', '2025-11-14 17:34:00', '[\"Activity\", \"Fragment\", \"ViewController\", \"Widget\"]', 3, 1022),
('O que é \"AsyncTask\" no Android?', 'Mobile', 'dificil', '2025-11-14 17:35:00', '[\"Banco de dados\", \"Tipo de Activity\", \"Layout manager\", \"Classe para executar operações em background (deprecated)\"]', 3, 1023),
('Qual arquivo contém strings localizadas no Android?', 'Mobile', 'facil', '2025-11-14 17:36:00', '[\"strings.xml\", \"MainActivity.java\", \"build.gradle\", \"AndroidManifest.xml\"]', 0, 1024),
('O que é \"Storyboard\" no iOS?', 'Mobile', 'medio', '2025-11-14 17:37:00', '[\"Interface visual para desenhar fluxo de telas\", \"Sistema de animação\", \"Banco de dados\", \"Gerenciador de dependências\"]', 0, 1025),
('Qual biblioteca é usada para hot reload no React Native?', 'Mobile', 'medio', '2025-11-14 17:38:00', '[\"Webpack\", \"Babel\", \"TypeScript\", \"Metro\"]', 3, 1026),
('O que é o algoritmo A* (A-Star)?', 'Algoritmos', 'dificil', '2025-11-18 10:00:00', '[\"Algoritmo de ordenação\", \"Algoritmo de busca de caminho que usa heurística\", \"Algoritmo de compressão\", \"Algoritmo de criptografia\"]', 1, 1027),
('Qual a complexidade de tempo do algoritmo de busca em largura (BFS)?', 'Algoritmos', 'medio', '2025-11-18 10:05:00', '[\"O(log n)\", \"O(n²)\", \"O(V + E) onde V é vértices e E é arestas\", \"O(1)\"]', 2, 1028),
('O que caracteriza um algoritmo de força bruta?', 'Algoritmos', 'facil', '2025-11-18 10:10:00', '[\"Usa heurísticas avançadas\", \"Testa todas as possibilidades sistematicamente\", \"Apenas para problemas matemáticos\", \"Sempre é o mais eficiente\"]', 1, 1029),
('O que é um ataque de replay?', 'Segurança', 'medio', '2025-11-18 10:15:00', '[\"Reproduzir transmissão válida maliciosamente\", \"Assistir vídeos repetidamente\", \"Fazer backup de dados\", \"Tipo de DDoS\"]', 0, 1030),
('O que significa RBAC (Role-Based Access Control)?', 'Segurança', 'medio', '2025-11-18 10:20:00', '[\"Controle baseado em regras\", \"Controle de acesso baseado em funções/papéis\", \"Sistema de backup\", \"Protocolo de rede\"]', 1, 1031),
('O que é sanitização de entrada?', 'Segurança', 'facil', '2025-11-18 10:25:00', '[\"Limpar hardware\", \"Deletar arquivos\", \"Validar e limpar dados de entrada para prevenir ataques\", \"Formatar disco\"]', 2, 1032),
('O que é uma honeypot em segurança?', 'Segurança', 'dificil', '2025-11-18 10:30:00', '[\"Backup de dados\", \"Sistema isca para atrair e estudar atacantes\", \"Tipo de firewall\", \"Antivírus específico\"]', 1, 1033),
('O que é arquitetura em camadas (N-tier)?', 'Arquitetura', 'facil', '2025-11-18 10:35:00', '[\"Apenas frontend e backend\", \"Organizar sistema em camadas lógicas separadas\", \"Sistema de um único servidor\", \"Tipo de banco de dados\"]', 1, 1034),
('O que caracteriza a arquitetura orientada a eventos?', 'Arquitetura', 'medio', '2025-11-18 10:40:00', '[\"Apenas polling\", \"Componentes comunicam-se através de eventos assíncronos\", \"Sistema síncrono apenas\", \"Arquitetura monolítica\"]', 1, 1035),
('O que é o padrão Adapter?', 'Arquitetura', 'medio', '2025-11-18 10:45:00', '[\"Converter interface de uma classe para outra esperada\", \"Conectar hardware\", \"Tipo de banco de dados\", \"Sistema de cache\"]', 0, 1036),
('O que é CQRS pattern?', 'Arquitetura', 'dificil', '2025-11-18 10:50:00', '[\"Tipo de banco de dados\", \"Separar operações de leitura e escrita em modelos diferentes\", \"Framework web\", \"Protocolo de rede\"]', 1, 1037),
('O que significa TTL (Time To Live)?', 'Redes', 'medio', '2025-11-18 10:58:00', '[\"Protocolo de segurança\", \"Velocidade de transmissão\", \"Tipo de roteador\", \"Tempo de vida do pacote na rede\"]', 3, 1039),
('O que é um proxy reverso?', 'Redes', 'medio', '2025-11-18 11:00:00', '[\"Servidor intermediário que encaminha requisições de clientes para servidores\", \"Cliente proxy\", \"Tipo de firewall\", \"Backup de rede\"]', 0, 1040),
('O que é ICMP?', 'Redes', 'medio', '2025-11-18 11:05:00', '[\"Protocolo de email\", \"Protocolo de controle de mensagens da Internet (usado pelo ping)\", \"Sistema de arquivos\", \"Tipo de switch\"]', 1, 1041),
('O que são decoradores em Python?', 'Python', 'medio', '2025-11-18 11:10:00', '[\"Tipo de variável\", \"Comentários especiais\", \"Funções que modificam comportamento de outras funções\", \"Biblioteca gráfica\"]', 2, 1042),
('Qual a diferença entre is e == em Python?', 'Python', 'medio', '2025-11-18 11:15:00', '[\"São idênticos\", \"is compara identidade de objeto, == compara valores\", \"== é mais rápido\", \"is é obsoleto\"]', 1, 1043),
('O que é o método __str__ em Python?', 'Python', 'facil', '2025-11-18 11:20:00', '[\"Define representação legível do objeto\", \"Converte para string\", \"Remove strings\", \"Compara strings\"]', 0, 1044),
('O que faz o módulo asyncio?', 'Python', 'dificil', '2025-11-18 11:25:00', '[\"Biblioteca de sincronização\", \"Suporta programação assíncrona com async/await\", \"Sistema de arquivos\", \"Apenas para web\"]', 1, 1045),
('O que é scheduler de CPU?', 'Sistemas Operacionais', 'medio', '2025-11-18 11:30:00', '[\"Driver de hardware\", \"Sistema de arquivos\", \"Gerenciador de memória\", \"Componente que decide qual processo executar na CPU\"]', 3, 1046),
('O que é thrashing?', 'Sistemas Operacionais', 'dificil', '2025-11-18 11:35:00', '[\"Erro de disco\", \"Sistema gasta mais tempo trocando páginas que executando\", \"Ataque cibernético\", \"Tipo de cache\"]', 1, 1047),
('O que são system calls?', 'Sistemas Operacionais', 'medio', '2025-11-18 11:40:00', '[\"Interface para programas requisitarem serviços do kernel\", \"Ligações telefônicas\", \"Tipo de processo\", \"Chamadas de rede\"]', 0, 1048),
('O que é um heap máximo?', 'Estrutura de Dados', 'medio', '2025-11-18 11:45:00', '[\"Array ordenado\", \"Pilha grande\", \"Tipo de fila\", \"Árvore onde cada nó pai é maior que seus filhos\"]', 3, 1049),
('Qual a complexidade de busca em hash table?', 'Estrutura de Dados', 'facil', '2025-11-18 11:50:00', '[\"O(n)\", \"O(1) em média\", \"O(log n)\", \"O(n²)\"]', 1, 1050),
('O que é um grafo acíclico direcionado (DAG)?', 'Estrutura de Dados', 'dificil', '2025-11-18 11:55:00', '[\"Grafo com ciclos\", \"Grafo direcionado sem ciclos\", \"Árvore binária\", \"Lista ligada\"]', 1, 1051),
('O que é RAID 1?', 'Infraestrutura de Computadores', 'medio', '2025-11-18 12:00:00', '[\"Paridade distribuída\", \"Striping apenas\", \"Espelhamento de discos para redundância\", \"Backup em nuvem\"]', 2, 1052),
('O que é um switch gerenciável?', 'Infraestrutura de Computadores', 'medio', '2025-11-18 12:05:00', '[\"Switch sem configuração\", \"Switch com recursos de configuração avançados (VLANs, QoS)\", \"Apenas para residências\", \"Switch obsoleto\"]', 1, 1053),
('O que é largura de banda?', 'Infraestrutura de Computadores', 'facil', '2025-11-18 12:10:00', '[\"Latência\", \"Quantidade máxima de dados transmitidos por unidade de tempo\", \"Tipo de cabo\", \"Distância máxima\"]', 1, 1054),
('O que é integração contínua (CI)?', 'Engenharia de Software', 'facil', '2025-11-18 12:15:00', '[\"Prática de integrar código frequentemente com testes automáticos\", \"Deploy manual\", \"Apenas para grandes empresas\", \"Backup contínuo\"]', 0, 1055),
('O que é sprint no Scrum?', 'Engenharia de Software', 'facil', '2025-11-18 12:20:00', '[\"Período de tempo fixo para desenvolver incremento do produto\", \"Corrida de velocidade\", \"Tipo de teste\", \"Framework\"]', 0, 1056),
('O que representa um caso de uso?', 'Engenharia de Software', 'facil', '2025-11-18 12:25:00', '[\"Diagrama de classes\", \"Interação entre ator e sistema para atingir objetivo\", \"Código de exemplo\", \"Teste unitário\"]', 1, 1057),
('O que é velocity no Scrum?', 'Engenharia de Software', 'medio', '2025-11-18 12:30:00', '[\"Métrica de CPU\", \"Velocidade da internet\", \"Medida de quanto trabalho a equipe pode completar em uma sprint\", \"Taxa de bugs\"]', 2, 1058),
('O que é late binding?', 'POO', 'dificil', '2025-11-18 12:35:00', '[\"Ligação antecipada\", \"Erro de compilação\", \"Tipo de herança\", \"Decisão de qual método chamar em tempo de execução (polimorfismo)\"]', 3, 1059),
('O que é uma classe abstrata?', 'POO', 'facil', '2025-11-18 12:40:00', '[\"Classe que não pode ser instanciada, serve como base\", \"Classe concreta\", \"Tipo de interface\", \"Classe privada\"]', 0, 1060),
('O que significa \"this\" em POO?', 'POO', 'facil', '2025-11-18 12:45:00', '[\"Variável global\", \"Classe pai\", \"Referência ao objeto atual\", \"Método estático\"]', 2, 1061),
('O que é Jetpack Compose?', 'Mobile', 'medio', '2025-11-18 12:50:00', '[\"Banco de dados\", \"Framework iOS\", \"Toolkit moderno para UI nativa Android com Kotlin\", \"Servidor backend\"]', 2, 1062),
('O que é SwiftUI?', 'Mobile', 'medio', '2025-11-18 12:55:00', '[\"Framework JavaScript\", \"Framework declarativo para construir UI em iOS\", \"Banco de dados\", \"Sistema de build\"]', 1, 1063),
('O que significa APK?', 'Mobile', 'facil', '2025-11-18 13:00:00', '[\"Android Package Kit\", \"Application Program Key\", \"Advanced Protocol Kit\", \"Android Plugin Kernel\"]', 0, 1064),
('O que é revisão de código?', 'Boas Práticas', 'facil', '2025-11-18 13:05:00', '[\"Processo onde desenvolvedores examinam código de colegas\", \"Teste automatizado\", \"Deploy\", \"Documentação\"]', 0, 1065),
('O que significa \"shift left\" em testes?', 'Boas Práticas', 'medio', '2025-11-18 13:10:00', '[\"Framework\", \"Testar apenas no final\", \"Tipo de teste\", \"Mover testes para fases mais iniciais do desenvolvimento\"]', 3, 1066),
('O que é documentação viva (living documentation)?', 'Boas Práticas', 'medio', '2025-11-18 13:15:00', '[\"Documentação manual\", \"Documentação gerada automaticamente do código/testes\", \"Vídeos tutoriais\", \"Wiki estática\"]', 1, 1067),
('Qual serviço da AWS é usado para armazenamento de objetos?', 'Cloud Computing', 'medio', '2025-11-18 16:01:41', '[\"RDS\", \"EBS\", \"S3\", \"Lambda\"]', 2, 1068),
('Qual é o principal objetivo do Kubernetes?', 'Infraestrutura de Computadores', 'dificil', '2025-11-18 16:01:41', '[\"Controlar firewalls\", \"Gerenciar usuários\", \"Criar APIs\", \"Orquestrar containers\"]', 3, 1069),
('O que caracteriza o aprendizado supervisionado?', 'Machine Learning', 'medio', '2025-11-18 16:01:41', '[\"Possui rótulos\", \"Não possui rótulos\", \"É sempre não-linear\", \"Só funciona com textos\"]', 0, 1070),
('Qual camada do modelo OSI é responsável pelo roteamento?', 'Redes', 'medio', '2025-11-18 16:01:41', '[\"Transporte\", \"Rede\", \"Aplicação\", \"Sessão\"]', 1, 1071),
('Qual é a função do Garbage Collector em linguagens modernas?', 'Engenharia de Software', 'facil', '2025-11-18 16:01:41', '[\"Criar logs\", \"Compilar código\", \"Liberar memória automaticamente\", \"Gerenciar threads\"]', 2, 1072),
('O que significa CDN?', 'Frontend', 'facil', '2025-11-18 16:01:41', '[\"Content Deployment Notation\", \"Central Development Node\", \"Cloud Data Network\", \"Content Delivery Network\"]', 3, 1073),
('Qual banco de dados é considerado NoSQL baseado em documentos?', 'Estrutura de Dados', 'medio', '2025-11-18 16:01:41', '[\"PostgreSQL\", \"MongoDB\", \"SQLite\", \"MariaDB\"]', 1, 1074),
('Qual instrução SQL retorna linhas distintas?', 'SQL', 'facil', '2025-11-18 16:01:41', '[\"SELECT FILTER\", \"SELECT UNIQUE\", \"SELECT ONLY\", \"SELECT DISTINCT\"]', 3, 1076),
('Qual operador em Python eleva um número à potência?', 'Python', 'facil', '2025-11-18 16:01:41', '[\"^\", \"**\", \"++\", \"//\"]', 1, 1077),
('Qual estrutura representa uma fila?', 'Algoritmos', 'medio', '2025-11-18 16:01:41', '[\"Árvore\", \"LIFO\", \"FIFO\", \"Grafo\"]', 2, 1078),
('Qual termo descreve a capacidade de uma classe herdar características de outra?', 'POO', 'facil', '2025-11-18 16:01:41', '[\"Abstração\", \"Polimorfismo\", \"Encapsulamento\", \"Herança\"]', 3, 1079),
('Qual verbo HTTP é utilizado para atualização parcial de recursos?', 'Backend', 'medio', '2025-11-18 16:01:41', '[\"PATCH\", \"PUT\", \"UPDATE\", \"REFRESH\"]', 0, 1080),
('Qual ferramenta é usada para criar máquinas virtuais no VirtualBox?', 'Infraestrutura de Computadores', 'facil', '2025-11-18 16:01:41', '[\"Firewall\", \"Hypervisor\", \"Proxy\", \"Broker\"]', 1, 1081),
('Qual componente é usado para treinar redes neurais profundas?', 'Machine Learning', 'dificil', '2025-11-18 16:01:41', '[\"Web Server\", \"HDD\", \"GPU\", \"BIOS\"]', 2, 1082),
('Qual técnica reduz overfitting?', 'Machine Learning', 'dificil', '2025-11-18 16:01:41', '[\"Remover validação\", \"Aumentar epochs\", \"Aumentar learning rate\", \"Regularização\"]', 3, 1083),
('O que é provisioning em Cloud?', 'Cloud Computing', 'medio', '2025-11-18 16:01:41', '[\"Alocação de recursos\", \"Compactação de dados\", \"Criação de logs\", \"Monitoramento de falhas\"]', 0, 1084),
('Qual é o objetivo do Scrum?', 'Engenharia de Software', 'facil', '2025-11-18 16:01:41', '[\"Gerenciar projetos ágeis\", \"Compilar código\", \"Criar diagramas UML\", \"Monitorar servidores\"]', 0, 1085),
('O que significa SSL?', 'Segurança', 'medio', '2025-11-18 16:01:41', '[\"Safe Socket Layer\", \"Secure Software License\", \"System Security Level\", \"Secure Sockets Layer\"]', 3, 1086),
('Qual é a principal função de um load balancer?', 'Infraestrutura de Computadores', 'medio', '2025-11-18 16:01:41', '[\"Armazenar dados\", \"Distribuir tráfego\", \"Gerenciar usuários\", \"Executar backups\"]', 1, 1087),
('Qual evento JavaScript é disparado ao perder o foco?', 'JavaScript', 'facil', '2025-11-18 16:01:41', '[\"click\", \"focus\", \"blur\", \"change\"]', 2, 1088),
('O que é debounce em JavaScript?', 'Frontend', 'dificil', '2025-11-18 16:01:41', '[\"Bloquear eventos\", \"Remover listeners\", \"Limpar cache\", \"Atrasar execuções repetidas\"]', 3, 1089),
('Qual comando verifica conectividade entre dois dispositivos?', 'Redes', 'facil', '2025-11-18 16:01:41', '[\"ping\", \"route\", \"arp\", \"dnslookup\"]', 0, 1090),
('O que caracteriza um firewall?', 'Segurança', 'facil', '2025-11-18 16:01:41', '[\"Criptografa discos\", \"Filtra tráfego\", \"Gerencia usuários\", \"Compacta arquivos\"]', 1, 1091),
('Qual tipo de escalonamento dá prioridade ao processo mais curto?', 'Sistemas Operacionais', 'medio', '2025-11-18 16:01:41', '[\"RR\", \"FIFO\", \"SJF\", \"EDF\"]', 2, 1092),
('Qual estrutura representa relações entre entidades?', 'Estrutura de Dados', 'medio', '2025-11-18 16:01:41', '[\"Fila\", \"Lista\", \"Pilha\", \"Grafo\"]', 3, 1093),
('Qual vantagem do microserviço?', 'Arquitetura', 'medio', '2025-11-18 16:01:41', '[\"Dependência forte\", \"Alta escalabilidade\", \"Deploy único\", \"Acoplamento alto\"]', 1, 1094),
('Qual termo representa uma falha de design que afeta a segurança?', 'Boas Práticas', 'dificil', '2025-11-18 16:01:41', '[\"Vulnerabilidade\", \"Loop infinito\", \"Baixa performance\", \"Warning\"]', 0, 1095),
('Qual padrão separa responsabilidades em Model, View e Controller?', 'Engenharia de Software', 'facil', '2025-11-18 16:01:41', '[\"DDD\", \"MVVM\", \"MVP\", \"MVC\"]', 3, 1096),
('O que é IaaS?', 'Cloud Computing', 'medio', '2025-11-18 16:01:41', '[\"Internet as a system\", \"Infraestrutura como serviço\", \"Integração automatizada\", \"Interface de API\"]', 1, 1097),
('Qual processo comprime dados antes da transmissão?', 'Infraestrutura de Computadores', 'medio', '2025-11-18 16:01:41', '[\"Filtragem\", \"Criptografia\", \"Compactação\", \"Load Balancing\"]', 2, 1098),
('Qual protocolo envia emails?', 'Redes', 'facil', '2025-11-18 16:01:41', '[\"HTTP\", \"DNS\", \"FTP\", \"SMTP\"]', 3, 1099),
('Qual elemento é usado para layouts responsivos no CSS moderno?', 'Frontend', 'medio', '2025-11-18 16:01:41', '[\"Flexbox\", \"Inline-block\", \"Tables\", \"Frames\"]', 0, 1100),
('O que representa o conceito de abstração em POO?', 'POO', 'medio', '2025-11-18 16:01:41', '[\"Reutilizar código\", \"Ocultar detalhes internos\", \"Criar múltiplas formas\", \"Herdar classes\"]', 1, 1101),
('O que é um dataset em Machine Learning?', 'Machine Learning', 'facil', '2025-11-18 16:01:41', '[\"Função de perda\", \"Modelo treinado\", \"Conjunto de dados\", \"Rede neural\"]', 2, 1102),
('Qual arquitetura usa camadas independentes como apresentação, domínio e dados?', 'Arquitetura', 'medio', '2025-11-18 16:01:41', '[\"Big Ball of Mud\", \"SOA\", \"Monolito\", \"Clean Architecture\"]', 3, 1103),
('Qual comando exibe diretórios no Linux?', 'Sistemas Operacionais', 'facil', '2025-11-18 16:01:41', '[\"ls\", \"cd\", \"pwd\", \"tree\"]', 0, 1104),
('Qual é o principal objetivo do DevOps?', 'DevOps', 'medio', '2025-11-18 16:01:41', '[\"Integrar desenvolvimento e operações\", \"Criar UIs\", \"Otimizar consultas SQL\", \"Criar APIs REST\"]', 0, 1105),
('Qual rede é usada para dispositivos móveis se comunicarem?', 'Mobile', 'facil', '2025-11-18 16:01:41', '[\"VLAN dedicada\", \"Ethernet\", \"Token Ring\", \"Rede celular\"]', 3, 1106),
('O que significa OTA em Mobile?', 'Mobile', 'medio', '2025-11-18 16:01:41', '[\"Organização técnica avançada\", \"Atualização pelo ar\", \"Over transistor action\", \"Open transport API\"]', 1, 1107),
('Qual linguagem é nativa para Android?', 'Mobile', 'medio', '2025-11-18 16:01:41', '[\"Ruby\", \"Swift\", \"Kotlin\", \"PHP\"]', 2, 1108),
('Qual é o principal benefício do armazenamento em nuvem?', 'Cloud Computing', 'facil', '2025-11-18 16:01:41', '[\"Hardware próprio\", \"Dependência local\", \"Alto custo fixo\", \"Escalabilidade\"]', 3, 1109),
('O que é um script de build?', 'DevOps', 'medio', '2025-11-18 16:01:41', '[\"Automação da compilação\", \"Arquivo de log\", \"Servidor web\", \"Driver do sistema\"]', 0, 1110),
('Qual estrutura permite buscas eficientes em grandes volumes?', 'Estrutura de Dados', 'dificil', '2025-11-18 16:01:41', '[\"Fila\", \"Árvore B\", \"Pilha\", \"Lista encadeada\"]', 1, 1111),
('Qual é a principal vantagem do versionamento de código?', 'Boas Práticas', 'facil', '2025-11-18 16:01:41', '[\"Eliminar bugs\", \"Melhorar performance\", \"Controle de mudanças\", \"Criar APIs\"]', 2, 1112),
('Qual é o tipo de machine learning utilizado para agrupar itens similares?', 'Machine Learning', 'medio', '2025-11-18 16:01:41', '[\"Reforço\", \"Regressão\", \"Classificação\", \"Clustering\"]', 3, 1113),
('Qual recurso implementa alta disponibilidade em servidores?', 'Infraestrutura de Computadores', 'dificil', '2025-11-18 16:01:41', '[\"Throttle\", \"Failover\", \"Swap\", \"Defrag\"]', 1, 1114),
('Qual ferramenta compila código JavaScript moderno para versões mais antigas?', 'Frontend', 'medio', '2025-11-18 16:01:41', '[\"Parcel\", \"Webpack\", \"Gulp\", \"Babel\"]', 3, 1116),
('O que caracteriza a computação serverless?', 'Cloud Computing', 'medio', '2025-11-18 16:01:41', '[\"Ausência total de servidores\", \"Execução sem gerenciar servidores\", \"Computação offline\", \"Execução contínua\"]', 1, 1117),
('O que faz a cláusula LIMIT em SQL?', 'SQL', 'facil', '2025-11-19 10:00:00', '[\"Define o tempo máximo de execução\", \"Limita o tamanho das colunas\", \"Restringe o número de linhas retornadas\", \"Bloqueia alterações na tabela\"]', 2, 1118),
('Qual função SQL retorna a data e hora atual?', 'SQL', 'facil', '2025-11-19 10:05:00', '[\"CURRENT_TIME()\", \"NOW()\", \"GETDATE()\", \"TODAY()\"]', 1, 1119),
('Qual comando SQL adiciona uma nova coluna a uma tabela existente?', 'SQL', 'medio', '2025-11-19 10:15:00', '[\"INSERT COLUMN\", \"ADD COLUMN\", \"ALTER TABLE ... ADD\", \"MODIFY TABLE ... ADD\"]', 2, 1121),
('O que faz a função CONCAT em SQL?', 'SQL', 'facil', '2025-11-19 10:20:00', '[\"Conta registros\", \"Remove espaços\", \"Ordena strings\", \"Une duas ou mais strings\"]', 3, 1122),
('Qual constraint garante que todos os valores em uma coluna sejam únicos?', 'SQL', 'facil', '2025-11-19 10:25:00', '[\"NOT NULL\", \"PRIMARY KEY\", \"DISTINCT\", \"UNIQUE\"]', 3, 1123),
('O que é um LEFT JOIN?', 'SQL', 'medio', '2025-11-19 10:30:00', '[\"Retorna todos da esquerda e correspondentes da direita\", \"Retorna apenas registros correspondentes\", \"Retorna todos da direita\", \"Retorna produto cartesiano\"]', 0, 1124),
('Qual função SQL retorna o valor mínimo de uma coluna?', 'SQL', 'facil', '2025-11-19 10:35:00', '[\"MIN()\", \"SMALLEST()\", \"LOWEST()\", \"BOTTOM()\"]', 0, 1125),
('O que faz o comando TRUNCATE TABLE?', 'SQL', 'medio', '2025-11-19 10:40:00', '[\"Deleta a estrutura da tabela\", \"Remove linhas específicas\", \"Renomeia a tabela\", \"Remove todos os dados rapidamente mantendo a estrutura\"]', 3, 1126),
('Qual operador SQL é usado para buscar padrões em strings?', 'SQL', 'facil', '2025-11-19 10:45:00', '[\"MATCH\", \"LIKE\", \"FIND\", \"SEARCH\"]', 1, 1127),
('O que é um índice composto em SQL?', 'SQL', 'dificil', '2025-11-19 10:50:00', '[\"Índice criado em múltiplas colunas\", \"Índice em tabela composta\", \"Índice que combina PRIMARY e FOREIGN KEY\", \"Índice de dados compostos\"]', 0, 1128),
('Qual cláusula agrupa resultados com base em valores de colunas?', 'SQL', 'facil', '2025-11-19 10:55:00', '[\"CLUSTER BY\", \"SORT BY\", \"GROUP BY\", \"ARRANGE BY\"]', 2, 1129),
('O que faz a função LENGTH/LEN em SQL?', 'SQL', 'facil', '2025-11-19 11:00:00', '[\"Retorna comprimento de uma string\", \"Retorna número de linhas\", \"Retorna tamanho de tabela\", \"Retorna tipo da coluna\"]', 0, 1130),
('Qual comando SQL cria um backup de uma tabela?', 'SQL', 'medio', '2025-11-19 11:05:00', '[\"BACKUP TABLE\", \"CREATE TABLE nova AS SELECT * FROM antiga\", \"COPY TABLE\", \"SAVE TABLE AS\"]', 1, 1131),
('Qual função SQL arredonda um número para baixo?', 'SQL', 'medio', '2025-11-19 11:15:00', '[\"ROUND()\", \"CEIL()\", \"FLOOR()\", \"TRUNCATE()\"]', 2, 1133),
('O que faz o operador IN em SQL?', 'SQL', 'facil', '2025-11-19 11:20:00', '[\"Verifica intervalo\", \"Busca padrão\", \"Compara com NULL\", \"Verifica se valor está em conjunto de valores\"]', 3, 1134),
('Qual é a diferença entre DELETE e TRUNCATE?', 'SQL', 'dificil', '2025-11-19 11:25:00', '[\"DELETE pode usar WHERE, TRUNCATE remove tudo e é mais rápido\", \"TRUNCATE pode usar WHERE\", \"DELETE é mais rápido\", \"Não há diferença\"]', 0, 1135),
('O que faz a função UPPER em SQL?', 'SQL', 'facil', '2025-11-19 11:30:00', '[\"Converte para maiúsculas\", \"Ordena crescente\", \"Aumenta valores numéricos\", \"Eleva à potência\"]', 0, 1136),
('Qual constraint impede valores NULL em uma coluna?', 'SQL', 'facil', '2025-11-19 11:35:00', '[\"UNIQUE\", \"PRIMARY KEY\", \"NOT NULL\", \"CHECK\"]', 2, 1137),
('Qual método Python verifica se uma string contém apenas dígitos?', 'Python', 'facil', '2025-11-22 10:00:00', '[\"isint()\", \"isnumeric()\", \"isdigit()\", \"hasdigits()\"]', 2, 1138),
('O que faz o operador walrus (:=) introduzido no Python 3.8?', 'Python', 'dificil', '2025-11-22 10:05:00', '[\"Define tipo de variável\", \"Compara dois valores\", \"Cria uma tupla\", \"Atribui valor e retorna na mesma expressão\"]', 3, 1139),
('Qual módulo Python é usado para trabalhar com arquivos JSON?', 'Python', 'facil', '2025-11-22 10:10:00', '[\"json\", \"jsonlib\", \"pyjson\", \"jsonparser\"]', 0, 1140),
('O que é um namedtuple em Python?', 'Python', 'medio', '2025-11-22 10:15:00', '[\"Dicionário especial\", \"Tupla com campos nomeados acessíveis por atributo\", \"Lista com nomes\", \"Classe abstrata\"]', 1, 1141),
('Qual método retorna uma cópia superficial de um dicionário?', 'Python', 'medio', '2025-11-22 10:20:00', '[\"dict.duplicate()\", \"dict.clone()\", \"dict.copy()\", \"dict.shallow()\"]', 2, 1142),
('O que faz o método Array.prototype.flat()?', 'JavaScript', 'medio', '2025-11-22 10:25:00', '[\"Inverte ordem\", \"Ordena elementos\", \"Remove duplicatas\", \"Achata arrays aninhados\"]', 3, 1143),
('Qual é o resultado de typeof null em JavaScript?', 'JavaScript', 'medio', '2025-11-22 10:30:00', '[\"object\", \"null\", \"undefined\", \"boolean\"]', 0, 1144),
('O que são Tagged Template Literals em JavaScript?', 'JavaScript', 'dificil', '2025-11-22 10:35:00', '[\"Funções que processam template strings\", \"Templates com tags HTML\", \"Strings com metadados\", \"Comentários especiais\"]', 0, 1145),
('Qual método JavaScript cria um novo array com elementos que passam no teste?', 'JavaScript', 'facil', '2025-11-22 10:40:00', '[\"pick()\", \"select()\", \"where()\", \"filter()\"]', 3, 1146),
('O que é o método Object.assign()?', 'JavaScript', 'medio', '2025-11-22 10:45:00', '[\"Compara objetos\", \"Copia propriedades de objetos fonte para destino\", \"Deleta propriedades\", \"Congela objeto\"]', 1, 1147),
('Qual propriedade CSS define o espaçamento entre colunas em grid?', 'Frontend', 'medio', '2025-11-22 10:50:00', '[\"col-space\", \"grid-spacing\", \"column-gap\", \"grid-margin\"]', 2, 1148),
('O que é o atributo defer em uma tag script?', 'Frontend', 'medio', '2025-11-22 10:55:00', '[\"Executa script duas vezes\", \"Desabilita o script\", \"Atrasa execução por 1 segundo\", \"Carrega script após parsing do HTML\"]', 3, 1149),
('Qual pseudo-elemento CSS permite estilizar a primeira letra?', 'Frontend', 'facil', '2025-11-22 11:00:00', '[\"::first-letter\", \"::initial\", \"::start-letter\", \"::begin\"]', 0, 1150),
('O que é Hydration em frameworks como React/Next.js?', 'Frontend', 'dificil', '2025-11-22 11:05:00', '[\"Cachear componentes\", \"Anexar event handlers ao HTML renderizado no servidor\", \"Comprimir CSS\", \"Minificar JavaScript\"]', 1, 1151),
('Qual unidade CSS é relativa à largura da viewport?', 'Frontend', 'facil', '2025-11-22 11:10:00', '[\"wv\", \"pw\", \"vw\", \"vp\"]', 2, 1152),
('O que faz a função COALESCE em SQL?', 'SQL', 'medio', '2025-11-22 11:15:00', '[\"Converte tipos\", \"Conta valores\", \"Une strings\", \"Retorna primeiro valor não nulo\"]', 3, 1153),
('Qual comando SQL remove um índice?', 'SQL', 'medio', '2025-11-22 11:20:00', '[\"DELETE INDEX\", \"DROP INDEX\", \"REMOVE INDEX\", \"CLEAR INDEX\"]', 1, 1154),
('O que é uma CTE (Common Table Expression) recursiva?', 'SQL', 'dificil', '2025-11-22 11:25:00', '[\"CTE que referencia a si mesma para consultas hierárquicas\", \"CTE que executa múltiplas vezes\", \"CTE com loops\", \"CTE para backup\"]', 0, 1155),
('Qual função SQL extrai parte de uma data?', 'SQL', 'facil', '2025-11-22 11:30:00', '[\"PULLDATE()\", \"GETPART()\", \"DATEGET()\", \"EXTRACT() ou DATEPART()\"]', 3, 1156),
('O que é um deadlock em banco de dados?', 'SQL', 'dificil', '2025-11-22 11:35:00', '[\"Erro de conexão\", \"Duas transações bloqueando recursos mutuamente\", \"Tabela corrompida\", \"Índice duplicado\"]', 1, 1157),
('Qual comando Docker lista todos os containers em execução?', 'DevOps', 'facil', '2025-11-22 11:40:00', '[\"docker containers\", \"docker list\", \"docker ps\", \"docker running\"]', 2, 1158),
('O que é um Dockerfile?', 'DevOps', 'facil', '2025-11-22 11:45:00', '[\"Volume de dados\", \"Container em execução\", \"Rede Docker\", \"Arquivo que define como construir uma imagem Docker\"]', 3, 1159),
('Qual comando Git mostra as alterações não commitadas?', 'DevOps', 'facil', '2025-11-22 11:50:00', '[\"git diff\", \"git changes\", \"git show\", \"git modified\"]', 0, 1160),
('O que é um Pod no Kubernetes?', 'DevOps', 'medio', '2025-11-22 11:55:00', '[\"Cluster inteiro\", \"Menor unidade deployável contendo um ou mais containers\", \"Serviço de rede\", \"Volume de armazenamento\"]', 1, 1161),
('O que faz o comando git stash?', 'DevOps', 'medio', '2025-11-22 12:00:00', '[\"Cria tag\", \"Deleta branch\", \"Salva alterações temporariamente sem commit\", \"Mescla branches\"]', 2, 1162),
('O que é o princípio Open/Closed do SOLID?', 'POO', 'dificil', '2025-11-22 12:05:00', '[\"Herança obrigatória\", \"Código aberto ao público\", \"Métodos podem ser abertos ou fechados\", \"Classes devem ser abertas para extensão, fechadas para modificação\"]', 3, 1163),
('O que é agregação em POO?', 'POO', 'medio', '2025-11-22 12:10:00', '[\"Relação onde objeto contém outro, mas podem existir independentemente\", \"Herança múltipla\", \"Tipo de polimorfismo\", \"Método estático\"]', 0, 1164),
('Qual a diferença entre método estático e de instância?', 'POO', 'facil', '2025-11-22 12:15:00', '[\"Estático pertence à classe, instância ao objeto\", \"Não há diferença\", \"Estático é mais rápido\", \"Instância é privado\"]', 0, 1165),
('O que é o padrão Dependency Injection?', 'POO', 'dificil', '2025-11-22 12:20:00', '[\"Herdar de várias classes\", \"Injetar código malicioso\", \"Criar múltiplas instâncias\", \"Fornecer dependências externamente ao invés de criar internamente\"]', 3, 1166),
('O que significa coesão alta em uma classe?', 'POO', 'medio', '2025-11-22 12:25:00', '[\"Classe com muitos métodos\", \"Classe focada em uma única responsabilidade\", \"Classe que herda muito\", \"Classe com muitos atributos\"]', 1, 1167),
('Qual porta padrão é usada pelo protocolo FTP para transferência de dados?', 'Redes', 'medio', '2025-11-22 12:30:00', '[\"22\", \"21\", \"20\", \"23\"]', 2, 1168),
('O que é o protocolo ARP?', 'Redes', 'medio', '2025-11-22 12:35:00', '[\"Comprime arquivos\", \"Roteia pacotes\", \"Criptografa dados\", \"Mapeia endereços IP para endereços MAC\"]', 3, 1169),
('Qual camada do modelo TCP/IP é equivalente às camadas 5, 6 e 7 do OSI?', 'Redes', 'dificil', '2025-11-22 12:40:00', '[\"Aplicação\", \"Transporte\", \"Internet\", \"Acesso à Rede\"]', 0, 1170),
('O que significa broadcast em redes?', 'Redes', 'facil', '2025-11-22 12:45:00', '[\"Enviar para um único destino\", \"Enviar dados para todos os dispositivos da rede\", \"Receber dados\", \"Bloquear tráfego\"]', 1, 1171),
('Qual é a função do protocolo ICMP?', 'Redes', 'medio', '2025-11-22 12:50:00', '[\"Resolver nomes\", \"Transferir arquivos\", \"Enviar mensagens de controle e erro (usado pelo ping)\", \"Atribuir IPs\"]', 2, 1172),
('O que é um ataque de engenharia social?', 'Segurança', 'facil', '2025-11-22 12:55:00', '[\"Derrubar redes\", \"Atacar servidores\", \"Explorar vulnerabilidades de código\", \"Manipular pessoas para obter informações confidenciais\"]', 3, 1173),
('O que significa o princípio de Defense in Depth?', 'Segurança', 'medio', '2025-11-22 13:00:00', '[\"Uma única defesa forte\", \"Múltiplas camadas de segurança\", \"Backup profundo\", \"Criptografia dupla\"]', 1, 1174),
('O que é um WAF (Web Application Firewall)?', 'Segurança', 'medio', '2025-11-22 13:05:00', '[\"Firewall específico para proteger aplicações web\", \"Antivírus web\", \"Servidor proxy\", \"Sistema de backup\"]', 0, 1175),
('O que é privilege escalation?', 'Segurança', 'dificil', '2025-11-22 13:10:00', '[\"Backup privilegiado\", \"Aumentar velocidade do sistema\", \"Escalar servidores\", \"Obter privilégios maiores do que os autorizados\"]', 3, 1176),
('Qual a função de um IDS (Intrusion Detection System)?', 'Segurança', 'medio', '2025-11-22 13:15:00', '[\"Bloquear todo tráfego\", \"Detectar atividades suspeitas ou maliciosas\", \"Criptografar dados\", \"Fazer backup\"]', 1, 1177),
('Qual é a complexidade de tempo do algoritmo de busca linear?', 'Algoritmos', 'facil', '2025-11-22 13:20:00', '[\"O(1)\", \"O(log n)\", \"O(n)\", \"O(n²)\"]', 2, 1178),
('O que caracteriza o algoritmo Merge Sort?', 'Algoritmos', 'medio', '2025-11-22 13:25:00', '[\"Algoritmo guloso\", \"Busca binária\", \"Força bruta O(n²)\", \"Divide e conquista com complexidade O(n log n)\"]', 3, 1179),
('O que é um algoritmo estável de ordenação?', 'Algoritmos', 'dificil', '2025-11-22 13:30:00', '[\"Mantém ordem relativa de elementos iguais\", \"Nunca falha\", \"Sempre O(n)\", \"Usa pouca memória\"]', 0, 1180),
('Qual estrutura de dados o BFS (Busca em Largura) utiliza?', 'Algoritmos', 'medio', '2025-11-22 13:35:00', '[\"Pilha (Stack)\", \"Fila (Queue)\", \"Heap\", \"Árvore\"]', 1, 1181),
('O que é o problema do caixeiro viajante?', 'Algoritmos', 'dificil', '2025-11-22 13:40:00', '[\"Buscar cidade mais próxima\", \"Ordenar cidades\", \"Encontrar menor rota visitando todas as cidades uma vez\", \"Calcular distância total\"]', 2, 1182),
('O que é uma lista circular?', 'Estrutura de Dados', 'medio', '2025-11-22 13:45:00', '[\"Lista duplicada\", \"Lista ordenada\", \"Lista de círculos\", \"Lista onde o último elemento aponta para o primeiro\"]', 3, 1183),
('Qual a complexidade de inserção no início de um array?', 'Estrutura de Dados', 'medio', '2025-11-22 13:50:00', '[\"O(n)\", \"O(1)\", \"O(log n)\", \"O(n²)\"]', 0, 1184),
('O que é uma árvore AVL?', 'Estrutura de Dados', 'dificil', '2025-11-22 13:55:00', '[\"Árvore binária de busca auto-balanceada\", \"Árvore com 3 filhos\", \"Árvore não ordenada\", \"Árvore sem raiz\"]', 0, 1185),
('Qual estrutura é ideal para implementar undo/redo?', 'Estrutura de Dados', 'facil', '2025-11-22 14:00:00', '[\"Grafo\", \"Fila (Queue)\", \"Array\", \"Pilha (Stack)\"]', 3, 1186),
('O que é uma Skip List?', 'Estrutura de Dados', 'dificil', '2025-11-22 14:05:00', '[\"Lista que pula elementos\", \"Lista ligada com múltiplos níveis para busca rápida\", \"Lista sem ordenação\", \"Lista circular especial\"]', 1, 1187),
('O que é um processo zumbi?', 'Sistemas Operacionais', 'medio', '2025-11-22 14:10:00', '[\"Processo malicioso\", \"Processo muito lento\", \"Processo terminado mas ainda na tabela de processos\", \"Processo em loop\"]', 2, 1188),
('Qual algoritmo de escalonamento usa quantum de tempo?', 'Sistemas Operacionais', 'medio', '2025-11-22 14:15:00', '[\"Priority\", \"FIFO\", \"SJF\", \"Round Robin\"]', 3, 1189),
('O que é fragmentação externa de memória?', 'Sistemas Operacionais', 'dificil', '2025-11-22 14:20:00', '[\"Memória livre dividida em blocos não contíguos\", \"Arquivos fragmentados no disco\", \"Erro de alocação\", \"Memória corrompida\"]', 0, 1190),
('Qual comando Linux mostra uso de memória?', 'Sistemas Operacionais', 'facil', '2025-11-22 14:25:00', '[\"mem\", \"free\", \"memory\", \"ram\"]', 1, 1191),
('O que é um semáforo binário?', 'Sistemas Operacionais', 'dificil', '2025-11-22 14:30:00', '[\"Tipo de arquivo\", \"Semáforo com dois processos\", \"Semáforo com valores 0 ou 1 (similar a mutex)\", \"Driver de hardware\"]', 2, 1192),
('O que é CORS?', 'Backend', 'medio', '2025-11-22 14:35:00', '[\"Sistema de logs\", \"Tipo de cache\", \"Protocolo de segurança\", \"Mecanismo que permite requisições entre domínios diferentes\"]', 3, 1193),
('Qual código HTTP indica recurso não encontrado?', 'Backend', 'facil', '2025-11-22 14:40:00', '[\"500\", \"404\", \"403\", \"401\"]', 1, 1194),
('O que significa REST?', 'Backend', 'facil', '2025-11-22 14:50:00', '[\"Resource State Type\", \"Remote Execution Service Transfer\", \"Request State Transaction\", \"Representational State Transfer\"]', 3, 1196),
('O que é o padrão Saga em microserviços?', 'Arquitetura', 'dificil', '2025-11-22 15:00:00', '[\"Sistema de cache\", \"Tipo de logging\", \"Gerencia transações distribuídas com compensações\", \"Padrão de UI\"]', 2, 1198),
('O que caracteriza arquitetura monolítica?', 'Arquitetura', 'facil', '2025-11-22 15:05:00', '[\"Sistema distribuído\", \"Múltiplos serviços\", \"Apenas frontend\", \"Aplicação única com todos componentes integrados\"]', 3, 1199),
('O que é o padrão Strangler Fig?', 'Arquitetura', 'dificil', '2025-11-22 15:10:00', '[\"Migração gradual de sistema legado\", \"Padrão de cache\", \"Tipo de logging\", \"Sistema de backup\"]', 0, 1200),
('O que caracteriza arquitetura orientada a eventos?', 'Arquitetura', 'medio', '2025-11-22 15:20:00', '[\"Sistema monolítico\", \"Apenas requisições síncronas\", \"Componentes comunicam-se através de eventos assíncronos\", \"Arquitetura em camadas apenas\"]', 2, 1202),
('O que é um operador bit a bit (bitwise)?', 'Lógica de Programação', 'medio', '2025-11-22 15:25:00', '[\"Operador de comparação\", \"Operador matemático\", \"Operador de string\", \"Operador que manipula bits individuais\"]', 3, 1203),
('Qual é o resultado de 5 XOR 3?', 'Lógica de Programação', 'dificil', '2025-11-22 15:30:00', '[\"6\", \"8\", \"2\", \"15\"]', 0, 1204),
('O que significa escopo léxico?', 'Lógica de Programação', 'dificil', '2025-11-22 15:35:00', '[\"Escopo determinado pela posição no código fonte\", \"Escopo global\", \"Escopo de função apenas\", \"Escopo dinâmico\"]', 0, 1205),
('Qual estrutura executa código baseado em múltiplos valores?', 'Lógica de Programação', 'facil', '2025-11-22 15:40:00', '[\"while\", \"if-else apenas\", \"for\", \"switch-case\"]', 3, 1206),
('O que é uma função pura?', 'Lógica de Programação', 'medio', '2025-11-22 15:45:00', '[\"Função sem parâmetros\", \"Função sem efeitos colaterais que retorna mesmo resultado para mesmos inputs\", \"Função privada\", \"Função estática\"]', 1, 1207),
('O que é Definition of Done (DoD) no Scrum?', 'Engenharia de Software', 'facil', '2025-11-22 15:50:00', '[\"Plano de testes\", \"Documento de requisitos\", \"Critérios que definem quando item está completo\", \"Contrato de projeto\"]', 2, 1208),
('O que representa um diagrama de sequência?', 'Engenharia de Software', 'medio', '2025-11-22 15:55:00', '[\"Hierarquia de herança\", \"Estrutura de classes\", \"Fluxo de dados\", \"Interação entre objetos ao longo do tempo\"]', 3, 1209),
('O que é Kanban?', 'Engenharia de Software', 'facil', '2025-11-22 16:00:00', '[\"Método visual para gerenciar fluxo de trabalho\", \"Linguagem de programação\", \"Framework de testes\", \"Banco de dados\"]', 0, 1210),
('O que significa WIP limit no Kanban?', 'Engenharia de Software', 'medio', '2025-11-22 16:05:00', '[\"Velocidade máxima\", \"Limite de trabalho em progresso simultâneo\", \"Número de sprints\", \"Tamanho do time\"]', 1, 1211),
('O que é um spike no desenvolvimento ágil?', 'Engenharia de Software', 'dificil', '2025-11-22 16:10:00', '[\"Feature prioritária\", \"Bug crítico\", \"Investigação técnica para reduzir incertezas\", \"Tipo de teste\"]', 2, 1212),
('O que é virtualização de hardware?', 'Infraestrutura de Computadores', 'medio', '2025-11-22 16:15:00', '[\"Rede virtual\", \"Backup de hardware\", \"Upgrade de componentes\", \"Criar múltiplas máquinas virtuais em um servidor físico\"]', 3, 1213),
('O que significa IOPS?', 'Infraestrutura de Computadores', 'medio', '2025-11-22 16:20:00', '[\"Internet Protocol Service\", \"Input/Output Operations Per Second\", \"Internal Operating System\", \"Integrated Processing\"]', 1, 1214),
('O que é um hypervisor?', 'Infraestrutura de Computadores', 'medio', '2025-11-22 16:25:00', '[\"Software que gerencia máquinas virtuais\", \"Tipo de processador\", \"Sistema de arquivos\", \"Protocolo de rede\"]', 0, 1215),
('Qual a diferença entre hypervisor tipo 1 e tipo 2?', 'Infraestrutura de Computadores', 'dificil', '2025-11-22 16:30:00', '[\"Não há diferença\", \"Tipo 1 é mais lento\", \"Tipo 2 é mais seguro\", \"Tipo 1 roda no hardware, tipo 2 sobre um SO\"]', 3, 1216),
('O que é um NIC (Network Interface Card)?', 'Infraestrutura de Computadores', 'facil', '2025-11-22 16:35:00', '[\"Tipo de memória\", \"Placa de rede que conecta computador à rede\", \"Processador de rede\", \"Sistema de arquivos\"]', 1, 1217),
('O que é AWS EC2?', 'Cloud Computing', 'facil', '2025-11-22 16:40:00', '[\"Armazenamento de objetos\", \"Banco de dados\", \"Serviço de computação em nuvem (máquinas virtuais)\", \"Sistema de filas\"]', 2, 1218),
('O que significa SLA em cloud?', 'Cloud Computing', 'medio', '2025-11-22 16:45:00', '[\"Security Layer Agreement\", \"System Load Average\", \"Storage Location Access\", \"Service Level Agreement - acordo de nível de serviço\"]', 3, 1219),
('O que é multi-region deployment?', 'Cloud Computing', 'medio', '2025-11-22 16:50:00', '[\"Implantar aplicação em múltiplas regiões geográficas\", \"Múltiplos servidores locais\", \"Backup regional\", \"Tipo de VPN\"]', 0, 1220),
('O que é AWS CloudFormation?', 'Cloud Computing', 'dificil', '2025-11-22 16:55:00', '[\"Sistema de logs\", \"Serviço de Infrastructure as Code da AWS\", \"Banco de dados\", \"CDN\"]', 1, 1221),
('O que significa Reserved Instance na AWS?', 'Cloud Computing', 'medio', '2025-11-22 17:00:00', '[\"Instância compartilhada\", \"Instância gratuita\", \"Instância com desconto por compromisso de uso\", \"Backup de instância\"]', 2, 1222),
('O que é uma matriz de confusão?', 'Machine Learning', 'medio', '2025-11-22 17:05:00', '[\"Método de normalização\", \"Tipo de rede neural\", \"Algoritmo de clustering\", \"Tabela que mostra acertos e erros de classificação\"]', 3, 1223),
('O que significa F1-Score?', 'Machine Learning', 'dificil', '2025-11-22 17:10:00', '[\"Média harmônica entre precision e recall\", \"Primeira feature\", \"Tipo de função de ativação\", \"Taxa de erro\"]', 0, 1224),
('O que é normalização de dados?', 'Machine Learning', 'facil', '2025-11-22 17:15:00', '[\"Escalar dados para um intervalo padrão\", \"Remover outliers\", \"Ordenar dados\", \"Duplicar dados\"]', 0, 1225),
('O que é k-fold cross-validation?', 'Machine Learning', 'dificil', '2025-11-22 17:20:00', '[\"Classificar em k classes\", \"Treinar k modelos diferentes\", \"Usar k features\", \"Dividir dados em k partes para validação cruzada\"]', 3, 1226),
('O que é feature engineering?', 'Machine Learning', 'medio', '2025-11-22 17:25:00', '[\"Engenharia de software\", \"Processo de criar e selecionar variáveis para o modelo\", \"Tipo de rede neural\", \"Algoritmo de treino\"]', 1, 1227),
('O que é push notification?', 'Mobile', 'facil', '2025-11-22 17:30:00', '[\"Sistema de cache\", \"Tipo de animação\", \"Mensagem enviada do servidor para o dispositivo\", \"Banco de dados local\"]', 2, 1228),
('O que é deep linking em apps mobile?', 'Mobile', 'medio', '2025-11-22 17:35:00', '[\"Tipo de cache\", \"Link para download\", \"Conexão de banco de dados\", \"Link que abre diretamente uma tela específica do app\"]', 3, 1229),
('O que é o ciclo de vida de uma Activity no Android?', 'Mobile', 'medio', '2025-11-22 17:40:00', '[\"Estados pelos quais Activity passa (onCreate, onStart, etc)\", \"Tempo de execução\", \"Memória utilizada\", \"Número de usuários\"]', 0, 1230),
('O que é ProGuard no Android?', 'Mobile', 'dificil', '2025-11-22 17:45:00', '[\"Sistema de segurança\", \"Ferramenta de ofuscação e otimização de código\", \"Biblioteca de UI\", \"Framework de testes\"]', 1, 1231),
('O que significa responsive design em mobile?', 'Mobile', 'facil', '2025-11-22 17:50:00', '[\"Design com animações\", \"Design rápido\", \"Design que se adapta a diferentes tamanhos de tela\", \"Design minimalista\"]', 2, 1232),
('O que significa o princípio Single Responsibility do SOLID?', 'Boas Práticas', 'medio', '2025-11-22 17:55:00', '[\"Arquivo único\", \"Classe única no projeto\", \"Método único por classe\", \"Cada classe deve ter apenas uma razão para mudar\"]', 3, 1233),
('O que é Feature Toggle/Flag?', 'Boas Práticas', 'medio', '2025-11-22 18:00:00', '[\"Tipo de branch\", \"Habilitar/desabilitar funcionalidades sem deploy\", \"Sistema de logs\", \"Teste automatizado\"]', 1, 1234);
INSERT INTO `pergunta_quiz` (`enunciado`, `categoria`, `dificuldade`, `criado_em`, `opcoes`, `resposta_index`, `id`) VALUES
('Qual a diferença entre shallow copy e deep copy em Python?', 'Python', 'dificil', '2025-11-25 10:00:00', '[\"Não há diferença\", \"Shallow copia referências, deep copia objetos recursivamente\", \"Deep é mais rápido\", \"Shallow é obsoleto\"]', 1, 1235),
('O que faz o método zip() em Python?', 'Python', 'medio', '2025-11-25 10:05:00', '[\"Compacta arquivos\", \"Combina múltiplos iteráveis em tuplas\", \"Remove duplicatas\", \"Ordena listas\"]', 1, 1236),
('O que são property decorators em Python?', 'Python', 'dificil', '2025-11-25 10:10:00', '[\"Decoradores para métodos que se comportam como atributos\", \"Tipos de variáveis\", \"Funções estáticas\", \"Comentários especiais\"]', 0, 1237),
('Qual a diferença entre append() e extend() em listas?', 'Python', 'facil', '2025-11-25 10:15:00', '[\"São idênticos\", \"Append adiciona um elemento, extend adiciona múltiplos\", \"Extend é mais lento\", \"Append é obsoleto\"]', 1, 1238),
('O que faz o operador * ao desempacotar listas?', 'Python', 'medio', '2025-11-25 10:20:00', '[\"Multiplica valores\", \"Captura elementos restantes em uma lista\", \"Remove elementos\", \"Inverte a lista\"]', 1, 1239),
('O que é event bubbling em JavaScript?', 'JavaScript', 'medio', '2025-11-25 10:25:00', '[\"Propagação de eventos do filho para ancestrais\", \"Erro de evento\", \"Tipo de animação\", \"Sistema de cache\"]', 0, 1240),
('Qual a diferença entre map() e forEach()?', 'JavaScript', 'facil', '2025-11-25 10:30:00', '[\"map() retorna novo array, forEach() não retorna nada\", \"São idênticos\", \"forEach é mais rápido\", \"map é obsoleto\"]', 0, 1241),
('O que faz o método Object.freeze()?', 'JavaScript', 'medio', '2025-11-25 10:35:00', '[\"Congela execução\", \"Para o programa\", \"Torna objeto imutável\", \"Salva objeto em cache\"]', 2, 1242),
('O que são WeakMap e WeakSet?', 'JavaScript', 'dificil', '2025-11-25 10:40:00', '[\"Versões lentas\", \"Maps e Sets sem métodos\", \"Estruturas temporárias\", \"Coleções com referências fracas permitindo garbage collection\"]', 3, 1243),
('Qual a diferença entre null e undefined?', 'JavaScript', 'facil', '2025-11-25 10:45:00', '[\"São idênticos\", \"null é atribuído intencionalmente, undefined indica ausência\", \"null é erro\", \"undefined é mais moderno\"]', 1, 1244),
('O que é CSS Grid?', 'Frontend', 'medio', '2025-11-25 10:50:00', '[\"Sistema de layout bidimensional\", \"Framework CSS\", \"Biblioteca JavaScript\", \"Ferramenta de design\"]', 0, 1245),
('Qual a diferença entre display: none e visibility: hidden?', 'Frontend', 'facil', '2025-11-25 10:55:00', '[\"São idênticos\", \"none remove do layout, hidden apenas oculta\", \"hidden é mais rápido\", \"none é obsoleto\"]', 1, 1246),
('O que são media queries?', 'Frontend', 'facil', '2025-11-25 11:00:00', '[\"Consultas ao banco\", \"Sistema de animação\", \"Regras CSS aplicadas baseadas em características do dispositivo\", \"Tipo de seletor\"]', 2, 1247),
('O que é Progressive Enhancement?', 'Frontend', 'dificil', '2025-11-25 11:05:00', '[\"Estratégia de construir funcionalidade básica primeiro e adicionar recursos avançados\", \"Tipo de animação\", \"Framework JavaScript\", \"Sistema de cache\"]', 0, 1248),
('Qual a função do atributo data-* em HTML?', 'Frontend', 'medio', '2025-11-25 11:10:00', '[\"Define tipo de dado\", \"Armazena dados customizados em elementos\", \"Cria banco de dados\", \"Sistema de backup\"]', 1, 1249),
('O que faz a cláusula HAVING?', 'SQL', 'medio', '2025-11-25 11:15:00', '[\"Filtra grupos após GROUP BY\", \"Ordena resultados\", \"Une tabelas\", \"Remove duplicatas\"]', 0, 1250),
('Qual a diferença entre INNER JOIN e OUTER JOIN?', 'SQL', 'medio', '2025-11-25 11:20:00', '[\"Não há diferença\", \"INNER retorna apenas correspondências, OUTER inclui não correspondentes\", \"OUTER é mais rápido\", \"INNER é obsoleto\"]', 1, 1251),
('O que são transações ACID?', 'SQL', 'dificil', '2025-11-25 11:25:00', '[\"Tipo de índice\", \"Propriedades que garantem confiabilidade (Atomicidade, Consistência, Isolamento, Durabilidade)\", \"Sistema de backup\", \"Protocolo de rede\"]', 1, 1252),
('O que faz o comando EXPLAIN?', 'SQL', 'medio', '2025-11-25 11:30:00', '[\"Documenta tabela\", \"Remove dados\", \"Mostra plano de execução da query\", \"Cria índice\"]', 2, 1253),
('O que é normalização de banco de dados?', 'SQL', 'dificil', '2025-11-25 11:35:00', '[\"Processo de organizar dados para reduzir redundância\", \"Backup de dados\", \"Conversão de formatos\", \"Sistema de cache\"]', 0, 1254),
('O que é CI/CD?', 'DevOps', 'facil', '2025-11-25 11:40:00', '[\"Continuous Integration/Continuous Deployment\", \"Code Integration/Code Deploy\", \"Container Install/Container Delete\", \"Cloud Integration/Cloud Deploy\"]', 0, 1255),
('O que faz o comando docker-compose?', 'DevOps', 'medio', '2025-11-25 11:45:00', '[\"Cria imagens\", \"Gerencia múltiplos containers\", \"Remove volumes\", \"Lista networks\"]', 1, 1256),
('O que é Blue-Green Deployment?', 'DevOps', 'dificil', '2025-11-25 11:50:00', '[\"Estratégia com dois ambientes idênticos para deploy sem downtime\", \"Teste A/B de cores\", \"Tipo de container\", \"Sistema de backup\"]', 0, 1257),
('Qual a função do Terraform?', 'DevOps', 'medio', '2025-11-25 11:55:00', '[\"Ferramenta de Infrastructure as Code\", \"Banco de dados\", \"Sistema de monitoramento\", \"Linguagem de programação\"]', 0, 1258),
('O que é um pipeline em CI/CD?', 'DevOps', 'facil', '2025-11-25 12:00:00', '[\"Sequência automatizada de build, teste e deploy\", \"Tipo de servidor\", \"Sistema de versionamento\", \"Rede de computadores\"]', 0, 1259),
('O que é latência de rede?', 'Redes', 'facil', '2025-11-25 12:05:00', '[\"Tempo de propagação de dados\", \"Largura de banda\", \"Velocidade de download\", \"Taxa de transferência\"]', 0, 1260),
('Qual a função do protocolo TCP?', 'Redes', 'medio', '2025-11-25 12:10:00', '[\"Traduzir nomes\", \"Garantir entrega confiável de dados\", \"Atribuir IPs\", \"Enviar emails\"]', 1, 1261),
('O que é um endereço MAC?', 'Redes', 'facil', '2025-11-25 12:15:00', '[\"IP privado\", \"Identificador físico único de interface de rede\", \"Protocolo de rede\", \"Sistema operacional\"]', 1, 1262),
('Qual a diferença entre hub e switch?', 'Redes', 'medio', '2025-11-25 12:20:00', '[\"Não há diferença\", \"Switch é inteligente e encaminha para destino específico, hub transmite para todos\", \"Hub é mais rápido\", \"Switch é obsoleto\"]', 1, 1263),
('O que é DNS round-robin?', 'Redes', 'dificil', '2025-11-25 12:25:00', '[\"Técnica de balanceamento de carga retornando IPs alternados\", \"Tipo de firewall\", \"Protocolo de segurança\", \"Sistema de cache\"]', 0, 1264),
('O que é autenticação de dois fatores?', 'Segurança', 'facil', '2025-11-25 12:30:00', '[\"Senha dupla\", \"Dois usuários\", \"Verificação em duas etapas diferentes\", \"Dois servidores\"]', 2, 1265),
('O que é um ataque DDoS?', 'Segurança', 'medio', '2025-11-25 12:35:00', '[\"Vírus de computador\", \"Ataque que sobrecarrega sistema com tráfego de múltiplas fontes\", \"Erro de servidor\", \"Falha de DNS\"]', 1, 1266),
('O que é criptografia de ponta a ponta?', 'Segurança', 'medio', '2025-11-25 12:40:00', '[\"Dados criptografados apenas em trânsito do remetente ao destinatário\", \"Criptografia de arquivos\", \"Sistema de backup\", \"Protocolo de rede\"]', 0, 1267),
('O que significa CVE?', 'Segurança', 'dificil', '2025-11-25 12:45:00', '[\"Central Virus Engine\", \"Computer Verification Error\", \"Common Vulnerabilities and Exposures\", \"Cyber Validation Entity\"]', 2, 1268),
('O que é penetration testing?', 'Segurança', 'medio', '2025-11-25 12:50:00', '[\"Teste de performance\", \"Auditoria de código\", \"Teste de segurança simulando ataques reais\", \"Backup de dados\"]', 2, 1269),
('O que é o padrão Repository?', 'Arquitetura', 'medio', '2025-11-25 12:55:00', '[\"Abstrai lógica de acesso a dados\", \"Tipo de banco\", \"Sistema de versionamento\", \"Padrão de UI\"]', 0, 1270),
('O que caracteriza arquitetura serverless?', 'Arquitetura', 'medio', '2025-11-25 13:00:00', '[\"Sem backend\", \"Execução de código sem gerenciar servidores\", \"Rede sem servidores\", \"Aplicação offline\"]', 1, 1271),
('O que é o padrão Facade?', 'Arquitetura', 'dificil', '2025-11-25 13:05:00', '[\"Interface simplificada para sistema complexo\", \"Tipo de herança\", \"Sistema de cache\", \"Protocolo de rede\"]', 0, 1272),
('O que significa loose coupling?', 'Arquitetura', 'medio', '2025-11-25 13:10:00', '[\"Baixo acoplamento entre componentes\", \"Sistema lento\", \"Arquitetura monolítica\", \"Código desorganizado\"]', 0, 1273),
('Qual algoritmo usa estratégia dividir e conquistar?', 'Algoritmos', 'medio', '2025-11-25 13:15:00', '[\"Merge Sort\", \"Bubble Sort\", \"Selection Sort\", \"Insertion Sort\"]', 0, 1274),
('O que é complexidade espacial?', 'Algoritmos', 'medio', '2025-11-25 13:20:00', '[\"Tamanho do código\", \"Quantidade de memória usada pelo algoritmo\", \"Velocidade de execução\", \"Número de linhas\"]', 1, 1275),
('O que caracteriza um algoritmo in-place?', 'Algoritmos', 'dificil', '2025-11-25 13:25:00', '[\"Usa pouca ou nenhuma memória adicional\", \"Executa rapidamente\", \"Sempre recursivo\", \"Apenas para arrays\"]', 0, 1276),
('O que é polimorfismo?', 'POO', 'facil', '2025-11-25 13:30:00', '[\"Herança múltipla\", \"Capacidade de objeto assumir múltiplas formas\", \"Classe abstrata\", \"Método privado\"]', 1, 1277),
('O que significa coesão em POO?', 'POO', 'medio', '2025-11-25 13:35:00', '[\"Grau de relação entre elementos de uma classe\", \"Número de métodos\", \"Tipo de herança\", \"Sistema de interface\"]', 0, 1278),
('O que é um método getter?', 'POO', 'facil', '2025-11-25 13:40:00', '[\"Método que retorna valor de atributo privado\", \"Método estático\", \"Construtor\", \"Destrutor\"]', 0, 1279),
('O que é um middleware?', 'Backend', 'medio', '2025-11-25 13:45:00', '[\"Software que intercepta requisições/respostas\", \"Tipo de banco de dados\", \"Framework frontend\", \"Sistema de cache\"]', 0, 1280),
('O que significa stateless em APIs?', 'Backend', 'medio', '2025-11-25 13:50:00', '[\"API sem estado persistente entre requisições\", \"API sem banco de dados\", \"API offline\", \"API lenta\"]', 0, 1281),
('O que é uma fila de prioridade?', 'Estrutura de Dados', 'medio', '2025-11-25 13:55:00', '[\"Fila onde elementos são processados por prioridade\", \"Fila mais rápida\", \"Pilha invertida\", \"Lista ordenada\"]', 0, 1282),
('Qual a diferença entre array e lista ligada?', 'Estrutura de Dados', 'facil', '2025-11-25 14:00:00', '[\"Não há diferença\", \"Array tem tamanho fixo e acesso direto, lista ligada é dinâmica\", \"Lista é mais rápida\", \"Array é obsoleto\"]', 1, 1283),
('O que é elasticidade em cloud?', 'Cloud Computing', 'medio', '2025-11-25 14:05:00', '[\"Capacidade de escalar recursos automaticamente\", \"Backup elástico\", \"Rede flexível\", \"Armazenamento expansível\"]', 0, 1284);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quiz_resultados`
--

CREATE TABLE `quiz_resultados` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `acertos` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tempo_gasto` int(11) DEFAULT NULL,
  `dificuldade` enum('facil','medio','dificil') DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quiz_resultados`
--

INSERT INTO `quiz_resultados` (`id`, `usuario_id`, `acertos`, `total`, `tempo_gasto`, `dificuldade`, `criado_em`, `categoria`) VALUES
(19, 14, 3, 3, 12, NULL, '2025-08-21 01:34:43', 'SQL'),
(20, 14, 4, 5, 18, 'facil', '2025-08-23 01:24:46', 'Python'),
(21, 14, 1, 7, 13, NULL, '2025-08-23 01:35:35', 'SQL'),
(22, 14, 3, 10, 43, NULL, '2025-08-27 01:40:29', NULL),
(23, 14, 1, 3, 35, NULL, '2025-08-27 01:59:21', NULL),
(24, 14, 2, 5, 33, NULL, '2025-08-27 02:02:03', 'Frontend'),
(25, 14, 3, 5, 48, 'facil', '2025-09-02 04:09:36', 'SQL'),
(26, 14, 0, 2, 71, NULL, '2025-09-02 04:24:45', NULL),
(27, 14, 0, 1, 3, NULL, '2025-09-02 04:26:20', NULL),
(28, 14, 1, 1, 4, NULL, '2025-09-02 04:26:54', NULL),
(29, 14, 2, 3, 25, 'medio', '2025-09-04 02:06:29', NULL),
(30, 14, 1, 5, 50, 'dificil', '2025-09-04 02:20:29', NULL),
(31, 14, 3, 5, 62, 'dificil', '2025-09-04 02:21:45', NULL),
(32, 14, 3, 5, 40, NULL, '2025-09-10 02:18:44', 'SQL'),
(33, 14, 2, 5, 29, NULL, '2025-09-18 02:13:13', NULL),
(34, 14, 5, 5, 33, NULL, '2025-09-18 02:22:45', 'Python'),
(35, 14, 4, 5, 23, NULL, '2025-10-10 02:29:47', 'SQL'),
(36, 14, 4, 8, 41, NULL, '2025-10-11 05:06:04', 'SQL'),
(37, 16, 2, 5, 69, NULL, '2025-10-14 19:07:43', 'Python'),
(39, 14, 0, 2, 8, NULL, '2025-10-14 19:52:47', 'Algoritmos'),
(40, 14, 1, 2, 19, NULL, '2025-10-14 20:37:56', 'Frontend'),
(41, 15, 0, 1, 12, NULL, '2025-10-15 02:32:14', 'Lógica'),
(42, 14, 4, 9, 77, NULL, '2025-10-17 15:19:23', 'Boas Práticas'),
(43, 14, 2, 10, 21, NULL, '2025-10-21 02:10:09', 'POO'),
(44, 14, 4, 5, 37, 'facil', '2025-10-22 03:16:28', 'Frontend'),
(45, 14, 2, 2, 13, NULL, '2025-10-22 03:17:19', 'Lógica de Programação'),
(46, 15, 2, 5, 77, NULL, '2025-10-23 15:12:04', 'SQL'),
(47, 14, 7, 10, 139, NULL, '2025-10-23 19:52:15', 'Python'),
(48, 14, 6, 10, 125, NULL, '2025-10-23 20:02:32', 'Frontend'),
(49, 14, 8, 10, 103, NULL, '2025-10-23 20:04:32', 'SQL'),
(50, 14, 1, 10, 70, NULL, '2025-10-23 20:20:51', 'Frontend'),
(51, 14, 13, 15, 81, NULL, '2025-11-04 16:29:45', 'SQL'),
(52, 14, 3, 5, 78, NULL, '2025-11-05 22:16:57', NULL),
(53, 14, 5, 10, 126, NULL, '2025-11-06 19:47:36', 'Lógica de Programação'),
(54, 14, 5, 10, 152, NULL, '2025-11-07 21:21:00', 'SQL'),
(55, 14, 4, 8, 166, 'dificil', '2025-11-07 21:24:22', 'Frontend'),
(56, 14, 0, 2, 21, 'medio', '2025-11-07 21:25:29', 'DevOps'),
(57, 14, 1, 4, 76, 'dificil', '2025-11-07 21:27:02', 'Sistemas Operacionais'),
(58, 14, 4, 5, 17, 'facil', '2025-11-07 21:47:19', NULL),
(59, 14, 5, 10, 94, NULL, '2025-11-07 22:15:12', 'Infraestrutura de Computadores'),
(60, 14, 6, 10, 163, 'facil', '2025-11-07 22:21:16', 'Infraestrutura de Computadores'),
(61, 14, 6, 10, 121, 'medio', '2025-11-07 22:23:42', 'Infraestrutura de Computadores'),
(62, 14, 2, 5, 121, NULL, '2025-11-07 22:26:20', 'Infraestrutura de Computadores'),
(63, 14, 5, 10, 24, NULL, '2025-11-07 22:35:57', 'Algoritmos'),
(64, 14, 7, 10, 51, NULL, '2025-11-07 22:46:23', 'Engenharia de Software'),
(65, 14, 3, 5, 23, NULL, '2025-11-08 16:34:57', NULL),
(66, 14, 10, 10, 46, NULL, '2025-11-08 16:47:20', 'SQL'),
(67, 15, 3, 5, 61, NULL, '2025-11-08 16:57:11', 'Infraestrutura de Computadores'),
(68, 15, 2, 5, 34, NULL, '2025-11-08 16:58:08', 'Engenharia de Software'),
(69, 15, 4, 5, 18, NULL, '2025-11-08 16:59:04', 'Segurança'),
(70, 14, 3, 5, 24, NULL, '2025-11-10 14:22:04', NULL),
(71, 14, 1, 3, 57, NULL, '2025-11-10 20:01:53', 'Engenharia de Software'),
(72, 14, 9, 10, 52, 'facil', '2025-11-13 01:32:22', 'SQL'),
(73, 14, 8, 10, 59, 'facil', '2025-11-13 01:44:21', 'Frontend'),
(74, 14, 9, 10, 45, 'facil', '2025-11-13 01:59:09', 'Frontend'),
(75, 14, 4, 10, 115, NULL, '2025-11-13 21:10:37', 'Engenharia de Software'),
(76, 14, 2, 2, 11, NULL, '2025-11-17 14:01:15', 'SQL'),
(77, 14, 4, 5, 40, 'medio', '2025-11-17 14:07:58', 'SQL'),
(78, 14, 3, 5, 33, 'medio', '2025-11-17 15:38:15', 'Frontend'),
(79, 14, 3, 5, 23, 'medio', '2025-11-17 16:12:07', NULL),
(80, 14, 8, 10, 53, 'medio', '2025-11-19 14:22:39', 'SQL'),
(81, 14, 3, 5, 28, 'facil', '2025-11-19 14:23:45', 'JavaScript'),
(82, 14, 8, 10, 34, 'facil', '2025-11-21 20:43:00', NULL),
(83, 14, 3, 5, 20, 'medio', '2025-11-21 20:43:49', NULL),
(84, 14, 9, 10, 36, 'facil', '2025-11-23 04:58:59', 'SQL'),
(85, 14, 7, 15, 107, 'medio', '2025-11-25 22:17:42', 'Engenharia de Software');

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas`
--

CREATE TABLE `respostas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `pergunta_id` int(11) NOT NULL,
  `conteudo` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `respostas`
--

INSERT INTO `respostas` (`id`, `usuario_id`, `pergunta_id`, `conteudo`, `criado_em`, `atualizado_em`) VALUES
(37, 11, 23, 'Variáveis são como \"caixas\" ou \"contêineres\" nomeados na memória do computador, usados para armazenar valores de dados. Elas permitem que você guarde informações (números, textos, etc.) que podem ser alteradas e referenciadas ao longo da execução de um programa.', '2025-06-12 02:05:30', '2025-06-12 02:05:30'),
(38, 11, 24, 'if/else é usado para executar blocos de código condicionalmente com base em expressões booleanas. É flexível para múltiplos critérios e intervalos. Ex: if idade > 18: ... else: ....\r\nswitch (em linguagens como C++, Java, JavaScript) ou match/case (em Python 3.10+) é usado para selecionar um bloco de código a ser executado com base no valor exato de uma única variável ou expressão. É mais limpo para múltiplas comparações de igualdade. Ex: switch(diaDaSemana): case 1: ....', '2025-06-12 02:08:17', '2025-06-12 02:08:17'),
(39, 2, 25, 'Em Python, um array é geralmente chamado de lista. É uma coleção ordenada e mutável de itens. Diferente de arrays em algumas linguagens, uma lista Python pode conter itens de diferentes tipos de dados.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(40, 2, 26, 'O Virtual DOM é uma cópia leve do DOM real. Quando o estado de um componente React muda, o React cria um novo Virtual DOM, compara-o com o anterior e atualiza eficientemente apenas as partes do DOM real que foram alteradas.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(41, 2, 27, 'Fila (Queue) é uma estrutura FIFO (First-In, First-Out), onde o primeiro elemento a entrar é o primeiro a sair. Pilha (Stack) é uma estrutura LIFO (Last-In, First-Out), onde o último elemento a entrar é o primeiro a sair.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(42, 2, 28, 'SQL (relacionais) usam tabelas com esquemas fixos e linguagem SQL, ótimos para dados estruturados. NoSQL (não relacionais) têm esquemas flexíveis e são melhores para grandes volumes de dados não estruturados ou semi-estruturados.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(43, 2, 29, 'Injeção de Dependência (DI) é um padrão de design onde as dependências de um objeto são fornecidas externamente, em vez de serem criadas internamente. Isso promove acoplamento fraco e facilita testes e manutenção.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(44, 3, 30, 'Otimizar queries SQL envolve criar índices, evitar SELECT *, usar JOINs eficientes, analisar o plano de execução da query e otimizar o esquema do banco de dados.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(45, 3, 31, 'TDD é uma metodologia de desenvolvimento de software onde os testes são escritos antes do código de produção. O ciclo é: escrever um teste que falha, escrever o código mínimo para o teste passar, e refatorar o código.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(46, 3, 32, 'O método `map()` cria um novo array populado com os resultados da chamada de uma função fornecida em cada elemento do array de chamada. Ele não modifica o array original.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(47, 3, 33, 'Encapsulamento é o conceito de agrupar dados (atributos) e os métodos que operam nesses dados dentro de uma única unidade (classe), e de restringir o acesso direto a alguns dos componentes do objeto.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(48, 3, 34, 'Em Python, usa-se `try` para o código que pode gerar erro, `except` para lidar com tipos específicos de erro e `finally` para código que sempre será executado, independentemente de ocorrer um erro.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(49, 7, 35, 'Git é um sistema de controle de versão distribuído que rastreia mudanças no código-fonte durante o desenvolvimento de software, permitindo colaboração, reversão de alterações e gerenciamento de diferentes versões.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(50, 7, 36, 'Processos são programas em execução com seus próprios espaços de memória independentes. Threads são unidades de execução dentro de um processo que compartilham o mesmo espaço de memória, permitindo maior paralelismo.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(51, 7, 37, 'Um ORM é uma ferramenta que permite interagir com um banco de dados relacional usando objetos da linguagem de programação, eliminando a necessidade de escrever SQL diretamente e mapeando objetos para tabelas do banco.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(52, 7, 38, 'GraphQL é uma linguagem de consulta e um runtime para APIs que permite aos clientes especificar exatamente os dados que precisam, de uma única requisição. Diferente de REST, que pode exigir múltiplas requisições.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(53, 7, 39, 'Depurar em Python pode ser feito usando `print()` para inspeção, o módulo `pdb` (debugger interativo), ou IDEs como VS Code com seus recursos de depuração, que permitem definir breakpoints e inspecionar variáveis.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(54, 8, 40, 'Um servidor web é um programa que armazena arquivos de sites (HTML, CSS, JS, imagens) e os entrega aos navegadores dos usuários quando solicitado via HTTP.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(55, 8, 41, 'Programação assíncrona permite que um programa execute tarefas em paralelo ou sem bloquear a thread principal, tornando-o mais responsivo, especialmente em operações de E/S como requisições de rede.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(56, 8, 42, 'Flexbox é para layouts unidimensionais (linha ou coluna), ótimo para alinhar itens. CSS Grid é para layouts bidimensionais (linhas e colunas simultaneamente), ideal para estruturas de página complexas.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(57, 8, 43, 'Teste de Integração verifica se diferentes módulos ou serviços de um sistema funcionam corretamente quando combinados, identificando falhas na interface ou comunicação entre eles.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(58, 8, 44, 'Docker é uma plataforma que permite empacotar aplicações e suas dependências em contêineres, garantindo que o software funcione de forma consistente em diferentes ambientes, desde o desenvolvimento até a produção.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(59, 10, 45, 'Algoritmos de ordenação são sequências de passos para organizar elementos em uma coleção (lista, array) em uma ordem específica (crescente ou decrescente). Exemplos incluem Bubble Sort, Merge Sort e Quick Sort.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(60, 10, 46, 'Um bom design de banco de dados garante integridade dos dados, reduz redundância, melhora a performance das consultas, facilita a manutenção e a escalabilidade do sistema.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(61, 10, 47, 'SPA é uma aplicação web que carrega uma única página HTML e atualiza o conteúdo dinamicamente à medida que o usuário interage, sem recarregar a página inteira, proporcionando uma experiência de usuário mais fluida.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(62, 10, 48, 'Clean Code é um estilo de escrita de código que é legível, compreensível, fácil de manter e de estender. Envolve usar nomes claros, funções pequenas, evitar duplicação e escrever testes.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(63, 10, 49, 'OAuth 2.0 é um framework de autorização que permite a uma aplicação obter acesso limitado à conta de um usuário em um serviço HTTP, sem que o usuário precise compartilhar suas credenciais diretamente com a aplicação.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(64, 2, 50, 'DRY (Don\'t Repeat Yourself) é um princípio que visa reduzir a repetição de padrões de software, substituindo-os por abstrações ou normalizações para evitar redundância de código e facilitar a manutenção.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(65, 2, 51, 'Decorators em Python são funções que permitem modificar ou estender o comportamento de outras funções ou classes sem modificar seu código-fonte diretamente. São usados para logging, cache, autenticação, etc.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(66, 2, 52, 'Na comunicação cliente-servidor, o cliente (ex: navegador) envia uma requisição a um servidor (ex: servidor web), que processa a requisição e envia uma resposta de volta ao cliente. É a base da internet.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(67, 3, 53, 'Chave primária identifica unicamente cada registro em uma tabela. Chave estrangeira é uma coluna em uma tabela que se refere à chave primária de outra tabela, estabelecendo um relacionamento entre elas.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(68, 3, 54, 'Um callback é uma função passada como argumento para outra função, que será executada posteriormente. É comum em operações assíncronas para lidar com resultados quando a operação é concluída.', '2025-06-11 23:14:50', '2025-06-11 23:14:50'),
(75, 2, 56, 'Uma chave estrangeira é uma coluna ou conjunto de colunas em uma tabela que faz referência à chave primária de outra tabela. Ela estabelece e mantém a integridade referencial entre tabelas relacionadas, garantindo que os dados sejam consistentes e que não existam referências órfãs no banco de dados.', '2025-08-27 02:15:00', '2025-08-27 02:15:00'),
(76, 3, 57, 'Programação Orientada a Objetos (POO) é um paradigma de programação baseado no conceito de objetos, que contêm dados (atributos) e código (métodos). Os quatro pilares da POO são: Encapsulamento (ocultar detalhes internos), Herança (reutilizar código de classes pai), Polimorfismo (objetos diferentes respondem de forma distinta ao mesmo método) e Abstração (representar conceitos do mundo real de forma simplificada).', '2025-08-27 02:15:00', '2025-08-27 02:15:00'),
(77, 7, 58, 'Variáveis locais são declaradas dentro de uma função ou bloco específico e só podem ser acessadas dentro desse escopo. Elas são criadas quando a função é chamada e destruídas quando a função termina. Variáveis globais são declaradas fora de qualquer função e podem ser acessadas de qualquer parte do programa. As variáveis locais têm precedência sobre as globais quando há conflito de nomes.', '2025-08-27 02:15:00', '2025-08-27 02:15:00'),
(78, 8, 59, 'Recursão é uma técnica de programação onde uma função chama a si mesma para resolver um problema. Toda função recursiva deve ter: um caso base (condição de parada) e um caso recursivo (chamada da própria função com parâmetros modificados). É útil para problemas que podem ser divididos em subproblemas similares, como cálculo de fatorial, sequência de Fibonacci ou travessia de árvores.', '2025-08-27 02:15:00', '2025-08-27 02:15:00'),
(79, 10, 60, 'Normalização é o processo de organizar dados em um banco relacional para minimizar redundância e dependências. Os objetivos incluem: eliminar dados duplicados, reduzir anomalias de inserção/atualização/exclusão e garantir integridade dos dados. As formas normais principais são: 1FN (eliminar grupos repetidos), 2FN (eliminar dependências parciais) e 3FN (eliminar dependências transitivas). Isso resulta em um banco mais eficiente e consistente.', '2025-08-27 02:15:00', '2025-08-27 02:15:00'),
(80, 14, 61, 'Um índice é uma estrutura de dados que melhora a velocidade das operações de consulta em uma tabela de banco de dados. Funciona como um índice de livro, criando um mapeamento ordenado dos valores de uma ou mais colunas para suas localizações físicas. Embora acelere consultas SELECT, WHERE e JOIN, os índices ocupam espaço adicional e podem tornar mais lentas as operações de INSERT, UPDATE e DELETE.', '2025-08-27 02:50:00', '2025-08-27 02:50:00'),
(81, 14, 62, 'Promises são objetos JavaScript que representam a eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante. Uma Promise pode estar em três estados: pending (pendente), fulfilled (resolvida) ou rejected (rejeitada). Elas permitem escrever código assíncrono mais limpo e evitar callback hell, usando métodos como .then(), .catch() e .finally().', '2025-08-27 02:50:00', '2025-08-27 02:50:00'),
(82, 14, 63, 'REST (Representational State Transfer) é um estilo arquitetural para APIs web que usa métodos HTTP padrão. Principais características: recursos identificados por URLs, operações através de métodos HTTP (GET, POST, PUT, DELETE), stateless (sem estado entre requisições), uso de códigos de status HTTP para indicar resultados. Uma API REST bem projetada é intuitiva, escalável e fácil de manter.', '2025-08-27 02:50:00', '2025-08-27 02:50:00'),
(83, 14, 64, 'Recursão é quando uma função chama a si mesma para resolver um problema dividindo-o em casos menores. Vantagens: código elegante e conciso para problemas naturalmente recursivos. Desvantagens: pode consumir muita memória (stack overflow) e ser menos eficiente que iteração. Use quando: o problema pode ser dividido em subproblemas similares (árvores, fractais, algoritmos divide-and-conquer) e a solução iterativa seria muito complexa.', '2025-08-27 02:50:00', '2025-08-27 02:50:00'),
(84, 14, 65, 'Responsividade é a capacidade de um site se adaptar automaticamente a diferentes tamanhos de tela e dispositivos (desktop, tablet, mobile). Técnicas incluem: CSS Media Queries, layouts flexíveis (Flexbox, Grid), unidades relativas (%, em, rem, vh/vw), imagens responsivas e design mobile-first. O objetivo é proporcionar uma experiência de usuário otimizada em qualquer dispositivo.', '2025-08-27 02:50:00', '2025-08-27 02:50:00'),
(85, 2, 66, 'Middleware são funções que executam durante o ciclo de vida de uma requisição HTTP, entre a requisição inicial e a resposta final. Eles podem modificar objetos de requisição/resposta, encerrar o ciclo req-res ou chamar o próximo middleware. Exemplos: autenticação, logging, parsing de dados, tratamento de erros, CORS. Em Express.js: app.use(middleware), em Django: MIDDLEWARE setting.', '2025-09-01 21:05:00', '2025-09-01 21:05:00'),
(86, 3, 67, 'Cache armazena temporariamente dados frequentemente acessados para melhorar performance. Tipos: Browser cache (armazena recursos estáticos), CDN cache (distribui conteúdo geograficamente), Server cache (Redis/Memcached para dados da aplicação), Database cache (query results). Estratégias: Cache-aside, Write-through, Write-behind. Headers HTTP como Cache-Control e ETag controlam comportamento do cache.', '2025-09-01 21:10:00', '2025-09-01 21:10:00'),
(87, 7, 68, 'WebSockets estabelecem uma conexão persistente e bidirecional entre cliente e servidor, permitindo comunicação em tempo real. Diferente do HTTP (request-response), WebSockets mantêm a conexão aberta. Use para: chat em tempo real, jogos online, atualizações ao vivo, colaboração em tempo real. Para dados simples ou atualizações ocasionais, HTTP com polling pode ser mais apropriado.', '2025-09-01 21:15:00', '2025-09-01 21:15:00'),
(88, 8, 69, 'Testes Unitários verificam componentes isolados (funções, classes) de forma rápida e independente. Testes de Integração verificam interação entre módulos/serviços. Testes E2E (End-to-End) simulam cenários completos do usuário real. Pirâmide de testes: muitos unitários (base), alguns de integração (meio), poucos E2E (topo). Cada tipo tem propósito específico no ciclo de qualidade.', '2025-09-01 21:20:00', '2025-09-01 21:20:00'),
(89, 10, 70, 'JWT (JSON Web Token) é um padrão para autenticação stateless. Fluxo: 1) Cliente envia credenciais, 2) Servidor valida e gera JWT assinado, 3) Cliente inclui JWT no header Authorization (Bearer token), 4) Servidor valida assinatura e extrai dados. Para renovação: usar refresh tokens ou reemitir antes do expiry. Importante: usar HTTPS, armazenar secret seguro, definir tempo de expiração adequado.', '2025-09-01 21:25:00', '2025-09-01 21:25:00'),
(90, 14, 71, 'Programação reativa é um paradigma que trabalha com fluxos de dados assíncronos e propagação de mudanças. Conceitos fundamentais: Observables (fluxos de dados), Observers (assinantes), Operators (transformações). Vantagens: facilita programação assíncrona, composição de operações complexas, gerenciamento de eventos. Exemplos: RxJS para JavaScript, RxJava para Java, Spring WebFlux. Ideal para UIs dinâmicas e sistemas de tempo real.', '2025-09-01 21:30:00', '2025-09-01 21:30:00'),
(91, 2, 72, 'Estratégias para NoSQL variam por tipo: MongoDB - criar índices adequados, usar aggregation pipeline, evitar $lookup excessivo, denormalizar quando necessário. Cassandra - modelar dados baseado em queries, usar partition keys eficientes, evitar hot spots. Redis - usar estruturas de dados apropriadas, pipeline para múltiplas operações, expiração para limpeza automática. Geral: monitorar performance, usar bulk operations, cache quando possível.', '2025-09-01 21:35:00', '2025-09-01 21:35:00'),
(92, 3, 73, 'PWAs são aplicações web que usam tecnologias modernas para oferecer experiência similar a apps nativos. Características principais: Service Workers (cache e offline), Web App Manifest (instalação), responsividade, HTTPS obrigatório, Progressive Enhancement. Benefícios: funcionam offline, são instaláveis, enviam push notifications, carregamento rápido. Diferem de apps web tradicionais por oferecerem funcionalidades nativas e melhor performance.', '2025-09-01 21:40:00', '2025-09-01 21:40:00'),
(93, 7, 74, 'Garbage Collection (GC) em Java automaticamente libera memória de objetos não referenciados. Áreas da memória: Young Generation (Eden, Survivor), Old Generation, Metaspace. Algoritmos: Serial GC, Parallel GC, G1GC, ZGC. Processo: marca objetos alcançáveis, remove não alcançáveis, compacta memória. Otimização: ajustar heap size (-Xmx), escolher GC adequado, minimizar criação de objetos desnecessários, usar profilers para monitoramento.', '2025-09-01 21:45:00', '2025-09-01 21:45:00'),
(94, 8, 75, 'CI/CD significa Continuous Integration/Continuous Deployment. CI: integrar código frequentemente, executar testes automatizados, build automático. CD: deploy automático após validações. Ferramentas: Jenkins, GitLab CI, GitHub Actions, Azure DevOps. Implementação: 1) Configurar pipeline, 2) Testes automatizados, 3) Build e packaging, 4) Deploy para staging, 5) Testes de aceitação, 6) Deploy para produção. Benefícios: detecção precoce de bugs, releases mais rápidos e confiáveis.', '2025-09-01 21:50:00', '2025-09-01 21:50:00'),
(95, 10, 76, 'SQL é a linguagem padrão para bancos relacionais que opera diretamente em tabelas e colunas. HQL (Hibernate Query Language) é orientado a objetos e opera em entidades e propriedades Java. Diferenças: HQL usa nomes de classes/propriedades vs nomes de tabelas/colunas em SQL, HQL é independente de SGBD vs SQL pode ter variações por SGBD, HQL oferece navegação por associações automática. HQL é traduzido para SQL pelo Hibernate.', '2025-09-01 21:55:00', '2025-09-01 21:55:00'),
(96, 14, 77, 'Estratégias de paginação: 1) Offset-based: LIMIT/OFFSET, simples mas lento em grandes datasets. 2) Cursor-based: usa ID ou timestamp como cursor, mais eficiente para grandes volumes. 3) Keyset pagination: ordenação por chave única. Implementação: parâmetros page/size ou cursor, retornar metadata (total, hasNext), usar índices adequados. Para APIs REST: headers Link com next/prev, resposta consistente com dados + paginação info.', '2025-09-01 22:00:00', '2025-09-01 22:00:00'),
(97, 2, 78, 'Closure é quando uma função interna tem acesso às variáveis da função externa, mesmo após a função externa ter terminado. A função interna \"fecha\" sobre o escopo da externa. Exemplo: function externa() { let x = 10; return function() { return x; }; }. Usos práticos: factory functions, módulos, callbacks com estado privado, debounce/throttle. Closures criam um escopo léxico persistente.', '2025-09-01 22:05:00', '2025-09-01 22:05:00'),
(98, 3, 79, 'Virtual DOM é uma representação em memória do DOM real usada por frameworks como React para otimizar atualizações através de diff algorithms. Shadow DOM é uma API nativa do browser que encapsula DOM/CSS de componentes, criando escopo isolado. Virtual DOM: performance optimization, usado por frameworks. Shadow DOM: encapsulamento real, parte dos Web Components. Podem ser usados juntos em aplicações modernas.', '2025-09-01 22:10:00', '2025-09-01 22:10:00'),
(99, 7, 80, 'Load balancing distribui requisições entre múltiplos servidores para melhorar performance e disponibilidade. Algoritmos: Round Robin (rotativo), Least Connections (menor número de conexões), Weighted (pesos diferentes), IP Hash (baseado no IP do cliente). Tipos: Layer 4 (transporte) vs Layer 7 (aplicação), hardware vs software. Ferramentas: Nginx, HAProxy, AWS ALB, Cloudflare. Benefícios: alta disponibilidade, escalabilidade horizontal.', '2025-09-01 22:15:00', '2025-09-01 22:15:00'),
(100, 8, 81, 'Busca full-text permite pesquisa em conteúdo textual com ranking de relevância. PostgreSQL: usar tsvector/tsquery, criar índices GIN/GiST. MySQL: usar FULLTEXT indexes com MATCH AGAINST. Elasticsearch: engine dedicado com análise avançada de texto, tokenização, stemming. Técnicas: indexação de palavras-chave, ranking por relevância, filtros de stopwords, suporte a sinônimos. Para aplicações complexas, considere soluções especializadas como Elasticsearch ou Solr.', '2025-09-01 22:20:00', '2025-09-01 22:20:00'),
(101, 10, 82, 'Design patterns são soluções reutilizáveis para problemas comuns no desenvolvimento de software. Categorias: Criacionais (Singleton, Factory, Builder), Estruturais (Adapter, Decorator, Facade), Comportamentais (Observer, Strategy, Command). Mais usados: Singleton (instância única), Factory (criação de objetos), Observer (notificação de mudanças), MVC (separação de responsabilidades), Dependency Injection (inversão de controle).', '2025-09-01 22:25:00', '2025-09-01 22:25:00'),
(102, 14, 83, 'Tipagem estática verifica tipos em tempo de compilação (Java, C#, TypeScript), detectando erros antes da execução. Tipagem dinâmica verifica em tempo de execução (Python, JavaScript, Ruby). Vantagens estática: detecção precoce de erros, melhor performance, documentação implícita, melhor IDE support. Vantagens dinâmica: flexibilidade, desenvolvimento mais rápido, menos código boilerplate. TypeScript oferece o melhor dos dois mundos: tipagem estática opcional sobre JavaScript.', '2025-09-01 22:30:00', '2025-09-01 22:30:00'),
(103, 2, 84, 'Microserviços é uma arquitetura que estrutura aplicação como conjunto de serviços pequenos e independentes. Benefícios: escalabilidade independente, tecnologias diversas, deploys isolados, times autônomos. Desafios: complexidade de rede, consistência de dados, monitoramento distribuído. Use quando: aplicação complexa, equipes grandes, necessidade de escalar componentes independentemente. Para aplicações pequenas, monolito pode ser mais adequado.', '2025-09-01 22:35:00', '2025-09-01 22:35:00'),
(104, 3, 85, 'Rate limiting controla número de requisições por usuário/IP para prevenir abuso. Estratégias: Token Bucket (tokens regeneram constantemente), Fixed Window (limite por janela fixa), Sliding Window (janela deslizante). Implementação: middleware na aplicação, reverse proxy (Nginx), API Gateway (AWS, Kong). Armazenamento: Redis para contadores distribuídos. Resposta: HTTP 429 Too Many Requests com headers Retry-After.', '2025-09-01 22:40:00', '2025-09-01 22:40:00'),
(105, 7, 86, 'Arquitetura orientada a eventos usa eventos para comunicação entre componentes desacoplados. Componentes: Event Producers (geram eventos), Event Router/Broker (distribui eventos), Event Consumers (processam eventos). Padrões: Pub/Sub, Event Sourcing, CQRS. Vantagens: desacoplamento, escalabilidade, resilência. Casos de uso: sistemas distribuídos, microserviços, processamento de streams. Ferramentas: Apache Kafka, RabbitMQ, AWS EventBridge.', '2025-09-01 22:45:00', '2025-09-01 22:45:00'),
(106, 8, 87, 'Otimização de imagens melhora velocidade de carregamento. Técnicas: escolher formato adequado (WebP para fotos, SVG para ícones, PNG para transparência), comprimir imagens, usar dimensões corretas, lazy loading, responsive images com srcset. Ferramentas: TinyPNG, ImageOptim, squoosh.app. CSS: object-fit para redimensionamento. HTML: loading=\"lazy\", picture element para diferentes formatos. CDNs como Cloudinary oferecem otimização automática.', '2025-09-01 22:50:00', '2025-09-01 22:50:00'),
(107, 10, 88, 'Sharding é a fragmentação horizontal de dados, distribuindo registros de uma tabela entre múltiplos servidores (shards). Estratégias: Range-based (por faixa de valores), Hash-based (função hash da chave), Directory-based (tabela de mapeamento). Benefícios: escalabilidade horizontal, melhora performance. Desafios: complexidade de queries cross-shard, rebalanceamento, transações distribuídas. Use quando: dados excedem capacidade de um servidor, necessidade de alta performance.', '2025-09-01 22:55:00', '2025-09-01 22:55:00'),
(108, 14, 89, 'HTTP/2 melhora performance sobre HTTP/1.1. Principais recursos: multiplexing (múltiplas requisições simultâneas numa conexão), compressão de headers (HPACK), server push (servidor envia recursos antecipadamente), stream prioritization, formato binário. Benefícios: reduz latência, elimina head-of-line blocking, usa menos conexões TCP. Requer HTTPS para browsers. Compatível com APIs HTTP existentes, mudanças são transparentes para aplicações.', '2025-09-01 23:00:00', '2025-09-01 23:00:00');

--
-- Acionadores `respostas`
--
DELIMITER $$
CREATE TRIGGER `trg_after_resposta_insert` AFTER INSERT ON `respostas` FOR EACH ROW BEGIN
    INSERT INTO log_respostas (resposta_id, usuario_id, acao)
    VALUES (NEW.id, NEW.usuario_id, 'Resposta adicionada');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bio` varchar(255) DEFAULT NULL,
  `total_conquistas` int(11) DEFAULT 0,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `capa_perfil` varchar(255) DEFAULT NULL,
  `total_perguntas` int(11) DEFAULT 0,
  `total_respostas` int(11) DEFAULT 0,
  `pontuacao_total` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `criado_em`, `atualizado_em`, `bio`, `total_conquistas`, `foto_perfil`, `capa_perfil`, `total_perguntas`, `total_respostas`, `pontuacao_total`) VALUES
(2, 'Douglas Oliveira', 'douglinhas_ousado@hotmail.com', 'scrypt:32768:8:1$obilBPdFBYoXLnZ1$9c0dbb14c356fe54b5e3fc8528f002a4e7a1792ce4462b1ad4597ee8bf68f043f5c50a33c52816c86690aab93b74d3339d43f7034ebe006f9000fd36705c18b5', '2025-06-05 01:55:21', '2025-10-12 00:08:35', NULL, 0, NULL, NULL, 16, 13, 0),
(3, 'Leandro', 'stampini@gmail.com', 'scrypt:32768:8:1$k1UnSaQcFeF4Fcbn$96e3555794c8c7c9d96efe2fe682e941219513ed5d54e62cb7a6aea874a0e3232d6ce9d396fe72df1e1209da92f2aceca3d75b90d2711e9f5f88579f96e66178', '2025-06-05 02:22:39', '2025-10-12 00:08:35', NULL, 0, NULL, NULL, 15, 12, 0),
(7, 'Igor Lopes', 'igorflopes@gmail.com', 'scrypt:32768:8:1$85IaCVK0ZXtur3Yx$01e82f885a4e44e5f8b183bd32744d9b7391b492cffbf27f33d19ff5ad4ea8772d6f5cc641a1f9951ade4a8cab79a7e2be531e999c20d01fbf5e5e293f8e2ba6', '2025-06-05 02:26:41', '2025-10-12 00:08:35', NULL, 0, NULL, NULL, 13, 10, 0),
(8, 'Gabriel', 'gabrielrosarenero@gmail.com', 'scrypt:32768:8:1$JcVTAstOmTEoHP0F$21f842a7dd1763b14a4d2f40f52ae8d99d313f392a9bc7694581e10baf166817bcd85d9958c0ff62e08f001b0d975123ef7a6061abb76781f3ea205100efc764', '2025-06-05 02:29:30', '2025-10-15 03:26:59', 'String', 0, 'perfil_8_1760488019.png', NULL, 13, 10, 0),
(10, 'usuario_teste', 'usuario@gmail.com', 'scrypt:32768:8:1$Uo94UTwICUJv6Z7q$66ac055ee32d3bf0d137b65f29f405724d8da8bc5294927b7f2a94d9644f5f35d94a6b09daffd7066196f0c11d2b473bc99ec861664ac368e75311bc7c5bef90', '2025-06-05 02:38:09', '2025-10-12 00:08:35', NULL, 0, NULL, NULL, 12, 10, 0),
(11, 'usuario_teste2', 'usuario_teste2@hotmail.com', 'scrypt:32768:8:1$TAnPmEpKZg53MOJ5$64d87cb18ff3b488311cbd8898e3833c535ef1664a87e4ef4f591c86e7302876589dd13a0e4426785121ad0b7956eaa9f2e3e74759624c47773d2fc28a79cb47', '2025-06-12 01:58:40', '2025-10-12 00:08:35', NULL, 0, NULL, NULL, 2, 2, 0),
(13, 'usuario_teste3', 'usuario3@gmail.com', 'scrypt:32768:8:1$v4GN8CRqYzi0B4zA$dd920538500ba087289bb91c404411a80c1bdb2b6691b6e82dab9e7e62eb207e6a4c80dbb1f7de6fc94f66e55a2f67d36f57ec73980f0eb0ea944fdd7a8319bf', '2025-06-12 02:22:57', '2025-06-12 03:54:36', NULL, 0, NULL, NULL, 0, 0, 0),
(14, 'Felipe Falcão', 'fesouza18032005@gmail.com', 'scrypt:32768:8:1$3Pl93JbYgKjxIMcC$00601fd285807eedcda1e45fd03844c8499680c0a6238135cbade60ffbe0a424d12c3323e9729b65811f59c0bbd88b8180c05e9712cb6d84bf030e2762f073fd', '2025-06-12 03:55:35', '2025-11-25 22:17:46', 'Aluno do 6 ADS - Noite - Fatec Garça.', 17, 'perfil_14_1760228707.jpg', 'capa_14_1763751358.jpg', 12, 9, 1170),
(15, 'Gleydson Campos', 'gleydsoncampos25@gmail.com', 'scrypt:32768:8:1$8YBQjpWDFUpT0047$0cdc8fe2c9d2477afccbfbc3f4b469074e5b273e21d5d234d660c46901e6149c6d051874331a1e239135b7ddeb2cb9dd2371bc37a2f5778c4381aaf5b5aae109', '2025-10-14 15:43:51', '2025-11-21 22:14:15', 'Hardzera, Nintendista e Ciclista', 5, 'perfil_15_1761088858.png', 'capa_15_1763752455.jpg', 0, 0, 100),
(16, 'Miguel Fernandes', 'mf3805908@gmail.com', 'scrypt:32768:8:1$Sx1YRkYa4rLBCvSq$1f0beaea57807c90d552bd0d0657d237235752587e20a4be70cdfe3925ab4351d2e13ca688015e7a26291eb4fceb44f8b41a7a421029bdd2e957eab5c67eefc4', '2025-10-14 19:05:43', '2025-10-14 19:05:43', NULL, 0, NULL, NULL, 0, 0, 0),
(17, 'Teste 02', 'teste02@gmail.com', 'scrypt:32768:8:1$BVCasTYZrV3Z1nzd$e36b5c4208d2dfe18a3b88e5924521e343c47450648a1d39eb0c7965118442fbc06d46f961562a01f088b89f0d3f367fd5a927af5552ca72acecab74206c7e98', '2025-11-22 02:21:23', '2025-11-22 02:21:23', NULL, 0, NULL, NULL, 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Índices de tabela `conquistas`
--
ALTER TABLE `conquistas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_conquista_usuario_titulo` (`usuario_id`,`titulo`);

--
-- Índices de tabela `log_perguntas`
--
ALTER TABLE `log_perguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_perguntas_pergunta` (`pergunta_id`),
  ADD KEY `idx_log_perguntas_usuario` (`usuario_id`);

--
-- Índices de tabela `log_respostas`
--
ALTER TABLE `log_respostas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_log_respostas_resposta` (`resposta_id`);

--
-- Índices de tabela `metas_semanal`
--
ALTER TABLE `metas_semanal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_perguntas_categoria` (`categoria`),
  ADD KEY `idx_perguntas_usuario` (`usuario_id`);

--
-- Índices de tabela `perguntas_arquivadas`
--
ALTER TABLE `perguntas_arquivadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_perguntas_categoria` (`categoria`),
  ADD KEY `idx_perguntas_usuario` (`usuario_id`);

--
-- Índices de tabela `pergunta_quiz`
--
ALTER TABLE `pergunta_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `quiz_resultados`
--
ALTER TABLE `quiz_resultados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_respostas_pergunta` (`pergunta_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_usuarios_email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conquistas`
--
ALTER TABLE `conquistas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `log_perguntas`
--
ALTER TABLE `log_perguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `log_respostas`
--
ALTER TABLE `log_respostas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de tabela `metas_semanal`
--
ALTER TABLE `metas_semanal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de tabela `perguntas_arquivadas`
--
ALTER TABLE `perguntas_arquivadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pergunta_quiz`
--
ALTER TABLE `pergunta_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1285;

--
-- AUTO_INCREMENT de tabela `quiz_resultados`
--
ALTER TABLE `quiz_resultados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `conquistas`
--
ALTER TABLE `conquistas`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `log_perguntas`
--
ALTER TABLE `log_perguntas`
  ADD CONSTRAINT `fk_log_perguntas_pergunta` FOREIGN KEY (`pergunta_id`) REFERENCES `perguntas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_log_perguntas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `log_respostas`
--
ALTER TABLE `log_respostas`
  ADD CONSTRAINT `log_respostas_ibfk_1` FOREIGN KEY (`resposta_id`) REFERENCES `respostas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_respostas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metas_semanal`
--
ALTER TABLE `metas_semanal`
  ADD CONSTRAINT `metas_semanal_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `quiz_resultados`
--
ALTER TABLE `quiz_resultados`
  ADD CONSTRAINT `quiz_resultados_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respostas_ibfk_2` FOREIGN KEY (`pergunta_id`) REFERENCES `perguntas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
