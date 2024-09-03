-- Criação da tabela Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criação da tabela Produto
CREATE TABLE Produto (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Criação da tabela Colaborador
CREATE TABLE Colaborador (
    colaborador_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    pedido_id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    cliente_id INT REFERENCES Cliente(cliente_id),
    colaborador_id INT REFERENCES Colaborador(colaborador_id)
);

-- Criação da tabela Item de Pedido
CREATE TABLE Item_Pedido (
    item_pedido_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES Pedido(pedido_id) ON DELETE CASCADE,
    produto_id INT REFERENCES Produto(produto_id),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

-- Criação da tabela Pagamento
CREATE TABLE Pagamento (
    pagamento_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES Pedido(pedido_id) ON DELETE CASCADE,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL
);


