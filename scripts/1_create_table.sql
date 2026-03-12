-- =====================
-- TABELAS DIMENSIONAIS
-- =====================

CREATE TABLE IF NOT EXISTS autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS editoras (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    id_categoria INT,
    ano_publicacao INT NOT NULL,
    numero_paginas INT NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    
    -- Definição das chaves estrangeiras
    CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    CONSTRAINT fk_editora FOREIGN KEY (id_editora) REFERENCES editoras(id_editora),
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS assinatura (
    id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    servico VARCHAR(50) NOT NULL, -- Ex: 'Kindle Unlimited'
    valor_mensal DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL
);

-- =====================
-- TABELAS FATO
-- =====================

CREATE TABLE IF NOT EXISTS leituras (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    valor_pago DECIMAL(10, 2), -- REAL no MySQL é melhor representado como DECIMAL para valores financeiros
    formato ENUM('físico', 'kindle') NOT NULL, -- ENUM é mais eficiente que CHECK para listas fixas no MySQL
    id_assinatura INT, 

    CONSTRAINT fk_livro FOREIGN KEY (id_livro) REFERENCES livros(id_livro),
    CONSTRAINT fk_assinatura FOREIGN KEY (id_assinatura) REFERENCES assinatura(id_assinatura)
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    id_leitura INT NOT NULL,
    nota DECIMAL(3, 1) NOT NULL,
    opiniao_texto TEXT, -- Aqui TEXT faz sentido por ser um comentário longo
    CONSTRAINT fk_leitura FOREIGN KEY (id_leitura) REFERENCES leituras(id_leitura),
    CONSTRAINT chk_nota CHECK (nota >= 1 AND nota <= 5)
);