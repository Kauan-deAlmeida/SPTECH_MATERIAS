-- Adicionar um campo COLUNA
alter table test_aluno add column dtNasc DATE;
alter table test_aluno add column nova_coluna varchar(50);

-- Renomear um campo COLUNA
alter table test_aluno rename column dtNasc to dtNascimento;
alter table test_aluno rename column nova_coluna to nova_coluna_db;

-- Motificando um campo COLUNA 
alter table test_aluno modify column nova_coluna_db varchar(120);

-- Excluindo um campo COLUNA
alter table test_aluno drop column dtNascimento;

-- Limpar uma tabela
truncate table test_aluno;

-- Crear tabela
create table test 
	(idTest int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30));

-- Adicinar conteudo
insert into test (idTest, nome) values
	(null, 'Veja')
;
insert into test (idTest, nome) values
	(null, 'Capricho')
;
insert into test (idTest, nome) values
	(null, 'Quatro Rodas')
;

-- Atualizar conteudo
update test set nome = 'veja02' where idTest = 1;
-- Atualizar mais de um conteudo de uma vez usando OR(OU)
update test set nome = 'NovaEra' where idTest = 2 or idTest = 3;

-- Tipagem numercas
-- inteiros INT
-- decimais 
-- Float 7 digitos 12345,67
-- decimal(5,2) 123,45
-- decimal(7,4) 123,4567
-- decimal(2,1) 1,2

-- Adicionando coluna preco com Float
alter table test add column preco float;

-- Atualizando conteudo da tabela com mais de um id
update revista set preco = 1.99 where idTest in(1,2);

-- Modificando o campo preco de float para decimal
alter table test modify column preco decimal (4,2);

-- Atualizando o preco para o formato (4,2) = 1099 (4 digitos) 
update test set preco = 10.99 where idTest = 3;

-- Constraint 
	-- RESTRIÇÃO/CONFIGURAÇÃO/REGRA
		-- PRIMARY KEY
        -- NOT NULL
        -- DEFAULT
        
CREATE TABLE prof(
id int primary key auto_increment,
nome varchar(50) not null,
especialidade varchar(40),
dtNasc date -- 'YYYY-MM-DD'
)auto_increment = 100;
		
insert into prof values
	(null, 'vivian', 'Banco de Dados', '1983-10-13'),
    (null, 'Petro', 'Estagio', '1983-10-13'),
    (null, 'Marcelo', 'O cara', '1983-10-13');

alter table prof add column funcao varchar(50), add constraint chkFuncao check(funcao in('monito', 'assistente', 'titular'));
select * from prof;
-- o proximo comando tem que dar erro 
update prof set funcao = 'aluno' where id = 101;
-- check constraint 'chkFuncao' is violated.alter
update prof set funcao = '' where id = 101;