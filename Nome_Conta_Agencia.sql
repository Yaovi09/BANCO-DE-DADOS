CREATE DATABASE dados_cliente;
USE dados_cliente;

CREATE TABLE categoria_cliente(
cod_categoria_cliente INT NOT NULL AUTO_INCREMENT,
nome_categoria_cliente VARCHAR(100),
PRIMARY KEY (cod_categoria_cliente)
);

CREATE TABLE cliente(
cod_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(100) NOT NULL,
num_CPF_CNPJ  BIGINT(14) NOT NULL,
celular VARCHAR(45) NOT NULL,
rua VARCHAR(45),
numero VARCHAR(45),
bairro VARCHAR(45),
CEP VARCHAR(10),
cidade VARCHAR(45),
estado VARCHAR(45),
PRIMARY KEY (cod_cliente)
);

CREATE TABLE agencia(
num_agencia INT NOT NULL AUTO_INCREMENT,
nome_agencia VARCHAR(100),
PRIMARY KEY (num_agencia)
);

CREATE TABLE conta(
num_conta INT NOT NULL AUTO_INCREMENT,
val_saldo DECIMAL(8,2),
PRIMARY KEY (num_conta)
);

CREATE TABLE tipo_conta(
cod_tipo_conta INT NOT NULL AUTO_INCREMENT,
des_tipo_conta VARCHAR(100),
PRIMARY KEY (cod_tipo_conta)
);

ALTER TABLE cliente
ADD COLUMN categoria_cliente_cod INT,
ADD FOREIGN KEY (categoria_cliente_cod)
REFERENCES categoria_cliente (cod_categoria_cliente);

ALTER TABLE conta
ADD COLUMN agencia_num INT,
ADD FOREIGN KEY (agencia_num)
REFERENCES agencia (num_agencia);

ALTER TABLE conta
ADD COLUMN cliente_cod INT,
ADD FOREIGN KEY (cliente_cod)
REFERENCES cliente (cod_cliente);

ALTER TABLE conta 
ADD COLUMN tipo_conta_cod INT,
ADD FOREIGN KEY (tipo_conta_cod)
REFERENCES tipo_conta (cod_tipo_conta);

ALTER TABLE cliente
RENAME COLUMN celular TO telefone;

ALTER TABLE categoria_cliente
ADD COLUMN observacao TEXT;

ALTER TABLE cliente
ADD COLUMN renda DECIMAL(8,2);

ALTER TABLE tipo_conta
MODIFY COLUMN des_tipo_conta TEXT;

ALTER TABLE agencia
MODIFY COLUMN nome_agencia VARCHAR(50);

ALTER TABLE cliente
DROP COLUMN estado;

INSERT INTO categoria_cliente
(nome_categoria_cliente, observacao)
VALUES
('Private', 'Cliente com renda acima de 1 milhao'),
 ('Exclusivo', 'cliente speial'),
 ('Gold', ' Cliente com renda a cima de 500 mil'),
 ('Basico', 'Cliente com renda abaixo de 100 mil');
 
 SELECT * FROM  categoria_cliente;
 
 INSERT INTO cliente
 (nome_cliente, num_CPF_CNPJ, telefone, rua, numero, bairro, CEP, cidade, renda, categoria_cliente_cod)
 VALUES
 ('YaoviTESTE2', 24277613896, 48998068902, 'Rua intendente jao', 1446, 'Inglesses', 00158100, 'Florianopolis', 300000.00, 1),
 ('Kangnivi', 35466786789, 48997567621, 'Servidao vieras familia', 90, 'Inglesses', 00158885, 'Florianopolis', 2000.00, 3),
 ('Sogbali', 44787665476, 49997654385, 'Jao vieras ', 202, 'Rio vermelhio', 00145664, 'Florianopolis', 5000.00, 4),
 ('Roger', 64577689742, 47996547625, 'Servidao guana', 45, 'Rio vermelhio', 00146876, 'Florianopolis', 300.00, 2);

SELECT * FROM cliente;

INSERT INTO agencia
(num_agencia, nome_agencia)
VALUES
(001, 'Campeche'),
(002, 'Ingleses'),
(003, 'Centro');

SELECT * FROM agencia;

INSERT INTO tipo_conta
(des_tipo_conta)
VALUES
('Poupanca'), ('Corrente');

SELECT * FROM tipo_conta;

INSERT INTO conta
(val_saldo, agencia_num, cliente_cod, tipo_conta_cod)
VALUES
(105000.00, 001, 1, 2);

SELECT * FROM conta;

DELETE FROM cliente 
WHERE cod_cliente = 5;

ALTER TABLE cliente
ADD COLUMN email VARCHAR(50);

INSERT INTO cliente
(nome_cliente, num_CPF_CNPJ, telefone, rua, numero, bairro, CEP, cidade, renda, categoria_cliente_cod, email)
VALUES
('Neymar', 65498709865, 1111111111, 'rua Neymar da Silva', 1010, 'Santinho', 0058653, 'Flamengo', 150000.00, 2, 'neymar@gmail.com'),
('Coutinho', 88763598763, 1111112222, 'Rua Coutinho', 340, 'Saco grande', 0078542, 'Florianopolis', 50000.000, 1, 'coutinho@gmail.com'),
('Casemiro', 79863709765, 1111113333, 'Rua Casemiro', 210, 'Ingleses', 0885100, 'Florianopolis', 134000.00, 3, 'casemiro@gmail.com'),
('Heber', 55645387698, 1111117777, 'Rua Heber', 330, 'Rio Vermelhio', 078654, 'Florianopolis', 650000.00, 1, 'heber@gmail.com');

SELECT * FROM cliente;

UPDATE cliente
SET cidade = 'Florianopolis'
WHERE cod_cliente = 6;

UPDATE cliente
SET nome_cliente = ' Neymar da Sivas'
WHERE cod_cliente = 6;

--- Exluir conta Exluisive
--- Verificar se tem algum cliente com  a categoria Excluisive 
--- se tem algum cliente nos devemos deletar o cliente ou mudar a categoria de cliente parar poder deletar a conta

UPDATE cliente
SET categoria_cliente_cod = 3
WHERE cod_cliente = 6;

 DELETE FROM categoria_cliente
 WHERE cod_categoria_cliente = 2;