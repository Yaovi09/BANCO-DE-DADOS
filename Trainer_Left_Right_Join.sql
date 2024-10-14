CREATE DATABASE trainer_left_right_join;
USE trainer_left_right_join;

CREATE TABLE pai(
id_pai INT NOT NULL AUTO_INCREMENT,
nome_pai VARCHAR(45),
PRIMARY KEY ( id_pai)
);

CREATE TABLE filho(
id_filho INT NOT NULL AUTO_INCREMENT,
nome_filho VARCHAR(45),
PRIMARY KEY (id_filho)
);

ALTER TABLE pai
ADD  COLUMN filho_id INT,
ADD FOREIGN KEY (filho_id)
REFERENCES filho (id_filho);

INSERT INTO filho
(nome_filho)
VALUES
('Joaozinho'), ('Mariazinh'), ('Carlinha'), ('Aninha');

INSERT INTO pai
(nome_pai, filho_id)
VALUES
('Antonio', 4), ('Antonio', 3), ('Carlos', 2);

INSERT INTO pai
(nome_pai)
VALUES
('Mateus');

SELECT * FROM pai;
SELECT * FROM filho;

SELECT * FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

-- RIGHT JOIN
SELECT * FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;

-- LEFT JOIN
SELECT * FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho;

-- FULL JOIN
SELECT * FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho
UNION
SELECT * FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;