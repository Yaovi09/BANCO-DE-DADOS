CREATE DATABASE livraria_Constraint;
USE livraria_Constraint;

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(45) NOT NULL,
RG_cliente BIGINT(11),
rua VARCHAR(45),
numero INT,
CEP BIGINT(8),
bairro VARCHAR(45),
cidade VARCHAR(45),
pais VARCHAR(50) DEFAULT ('Brasil'),
PRIMARY KEY (id_cliente)
);
SELECT * FROM cliente;

CREATE TABLE financiador(
id_financiador INT NOT NULL AUTO_INCREMENT,
nome_finaciador VARCHAR(45) DEFAULT ('Financiador Publico'),
CNPJ_financiador BIGINT(14),
PRIMARY KEY (id_financiador)
);
SELECT * FROM financiador;

CREATE TABLE autor(
id_autor INT NOT NULL AUTO_INCREMENT,
nome_autor VARCHAR(45) NOT NULL,
RG_autor BIGINT(11),
PRIMARY KEY (id_autor)
);
SELECT * FROM autor;

CREATE TABLE telefone(
id_telefone INT NOT NULL AUTO_INCREMENT,
telefone BIGINT(11),
PRIMARY KEY (id_telefone)
);

CREATE TABLE pedido(
id_pedido INT NOT NULL AUTO_INCREMENT,
qtd_pedido INT,
CHECK ( qtd_pedido >= 0),
PRIMARY KEY (id_pedido)
);

CREATE TABLE livro(
id_livro INT NOT NULL AUTO_INCREMENT,
ISBN BIGINT(14),
titulo VARCHAR(45),
preco DECIMAL(8,2),
CHECK (preco >= 0),
categoria  ENUM ('Horror', 'Ficção', 'Romance', 'Ação'),
PRIMARY KEY  (id_livro)
);
SELECT * FROM livro;

CREATE TABLE editor(
id_editor INT NOT NULL AUTO_INCREMENT,
nome_fantasia  ENUM ('Editora A', 'Editora B', 'Editora C' ) ,
razao_social VARCHAR(45),
rua VARCHAR(45),
numero INT,
CEP BIGINT(8),
bairro VARCHAR(45),
cidade VARCHAR(45),
pais VARCHAR(50) DEFAULT ('Brasil'),
PRIMARY KEY (id_editor)
);
SELECT * FROM editor;

ALTER TABLE pedido
ADD COLUMN cliente_id INT,
ADD FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente);

ALTER TABLE pedido
ADD COLUMN livro_id INT,
ADD FOREIGN KEY (livro_id)
REFERENCES livro (id_livro);

ALTER TABLE livro
ADD COLUMN editor_id INT,
ADD FOREIGN KEY (editor_id)
REFERENCES editor (id_editor);

ALTER TABLE livro 
ADD COLUMN autor_id INT,
ADD FOREIGN KEY (autor_id)
REFERENCES autor (id_autor);

ALTER TABLE livro
ADD COLUMN financiador_id INT,
ADD FOREIGN KEY (financiador_id)
REFERENCES financiador (id_financiador);

ALTER TABLE telefone
ADD COLUMN editor_id INT,
ADD FOREIGN KEY (editor_id)
REFERENCES editor (id_editor);

INSERT INTO cliente
(nome_cliente, RG_cliente, rua, numero, CEP, bairro, cidade, pais)
VALUES
('KANGNIVI', 111111, 'Rua intendente jão Nunas', 1446, 0058100, 'Ingleses', 'Florianopolis', 'Brasil'),
('YAOVI', 222222, 'Rua da Felicidade', 90, 008965, 'Ingleses', 'Florianopolis', 'Brasil'),
('SOGBALI', 333333, 'Rua Maria Gomes', 1234, 0058158, 'Saco Grande', 'Florianopolis', 'Brasil');

INSERT INTO financiador
(nome_finaciador, CNPJ_financiador)
VALUES
('GABRIELA DE JESUS', 12345678),
('LUCIMARA FRANCISCO', 7896545468);

INSERT INTO financiador
( CNPJ_financiador)
VALUES
(345876981);

INSERT INTO editor
(nome_fantasia, razao_social, rua, numero, CEP, bairro, cidade, pais)
VALUES
('Editora A ', 'Saraiva e Siciliona S.A', 'Rua sariava ', 345, 0098765, 'Curtiba', 'PARANA', 'GANA'),
('Editora B', 'Livraria Cultura S.A', ' Rua livrairia cultural', 675, 0058543, 'Campo Grande', 'RIO DE JANEIRO', 'CANADA');


INSERT INTO editor
(nome_fantasia, razao_social, rua, numero, CEP, bairro, cidade)
VALUES
('Editora C', 'Livraria leitura Ltda', 'Rua leitura', 765, 0067427, 'Lagoa', 'RIO DE JANEIRO');

INSERT INTO autor
(nome_autor, RG_autor)
VALUES
('LEANDRO MONTEIRO', 3456798),
('GLAUBER OLIVEIRA', 6785432),
('HELIO FROSE', 5467598);

INSERT INTO telefone
(telefone, editor_id)
VALUES
(48998068902, 1), (48998675409, 2),
(11987658742, 1), (47997548765, 3),
(11987562396, 3), (48997548732, 3);
SELECT * FROM telefone;

INSERT INTO livro
(ISBN, titulo, preco, categoria, editor_id, autor_id, financiador_id)
VALUES
(9783161484100, 'O ALQUIMISTA', '100', 'Ficção', 1, 1, 1),
(9780201530826, 'SAPIENS', ' 250', 'Horror', 2, 2, 2),
(9781402894626, 'ORGULHO E PRECONCEITO', ' 450', 'Romance', 3, 3, 3);
SELECT * FROM livro;