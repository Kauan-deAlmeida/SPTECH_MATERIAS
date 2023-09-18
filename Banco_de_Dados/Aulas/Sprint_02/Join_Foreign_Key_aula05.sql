-- Aula 5 - nosso primeiro join
-- conceito de chave estrangeira

CREATE DATABASE aulaJoin;

USE aulaJoin;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
) auto_increment = 1000;

INSERT INTO empresa VALUES
	(null, 'Accenture', 'Rafaela'),
    (null, 'C6Bank', 'Andresa');
    
SELECT * FROM empresa;

CREATE TABLE aluno (
	ra char(8) primary key,
	nome varchar(45),
	bairro varchar(45),
	fkEmpresa int, constraint fkEmp foreign key (fkEmpresa) references empresa(idEmpresa));

INSERT INTO aluno VALUES
	('01232999', 'Pedro', 'Consolação', 1000),
    ('01232998', 'Big Suzane', 'Paraíso', 1000),
    ('01232997', 'Hikari', 'Consolacion', 1001);
    
SELECT * FROM aluno;

-- NOSSO PRIMEIRO JOIN
SELECT * FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome, empresa.nome FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome AS NomeAluno,	empresa.nome AS NomeEmpresa FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome AS 'Nome Aluno', empresa.nome AS 'Nome Empresa' FROM empresa JOIN aluno ON idEmpresa = fkEmpresa;
    
SELECT a.nome AS 'Nome Aluno', e.nome AS NomeEmpresa FROM empresa as e JOIN aluno as a ON idEmpresa = fkEmpresa;
    
SELECT aluno.nome AS NomeAluno,	empresa.nome AS NomeEmpresa FROM empresa JOIN aluno ON idEmpresa = fkEmpresa WHERE empresa.nome = 'Accenture';
    
-- ALTER TABLE aluno ADD CONSTRAINT fkEmp FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa);