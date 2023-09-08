CREATE DATABASE bd1ads;

USE bd1ads;

CREATE TABLE empresa(
id int primary key,
nome varchar(50),
responsavel varchar(40)
);

DESCRIBE empresa;

INSERT INTO empresa VALUES
	(1, 'STEFANINI', 'RAFAEL');
    
SELECT * FROM empresa;

INSERT INTO empresa VALUES
(2, 'ITAU', ''),
(3, 'SAFRA', 'GUSTAVO');

SELECT * FROM empresa;

SELECT responsavel FROM empresa;

SELECT id, nome FROM empresa;

SELECT nome FROM empresa WHERE responsavel = 'RAFAEL';
SELECT nome FROM empresa WHERE nome = 'SAFRA';
