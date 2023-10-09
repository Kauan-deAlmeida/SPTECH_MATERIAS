create database pet;

use pet;

-- Criar as tabelas equivalentes à modelagem.
create table cliente(
	idCliente int primary key auto_increment,
	nomeCliente varchar(45),
	telefone char(9),
	celular char(14),
	endereco varchar(80));

create table pet(
	idPet int primary key auto_increment,
	tipoDoAnimal varchar(45),
	nomePet varchar(45),
	raca varchar(45),
	dataNasc date,
	fkIdCliente int,
	constraint fkCliente foreign key (fkIdCliente) references cliente(idCliente))auto_increment = 101;

-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente, e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo menos 2 clientes diferentes que tenham o mesmo sobrenome.
insert into cliente values
	(null, 'Luis Guilherme', '0800-9999', '(11)98891-5599', 'Rua Rio de Janeiro N° 150'),
	(null, 'Nicolas kleyton', '0800-1299', '(11)92541-5491', 'Rua João Pessoa N° 260'),
	(null, 'Bruna Almeida', '0800-9925', '(11)92161-9458', 'Rua São Paulo N° 234'),
	(null, 'Joelma Ferreira', '0800-5948', '(11)90235-7584', 'Rua Bahia N° 265'),
	(null, 'Gustavo Santos', '0800-2516', '(11)92236-1891', 'Rua Amazonas N° 569'),
	(null, 'Alessandro Corol', '0800-4627', '(11)90269-4169', 'Rua Mexico N° 754'),
	(null, 'Kevin Peders', '0800-9152', '(11)96234-9856', 'Rua Irlanda N° 336'),
	(null, 'Gabriel Guedes', '0800-4779', '(11)97319-2648', 'Rua Portugal N° 395'),
	(null, 'Kauan Almeida', '0800-9325', '(11)90917-1649', 'Rua Canada N° 115');

insert into pet values
	(null, 'Cachorro', 'Alex', 'Vira Lata', '2010-10-25', 9),
	(null, 'Gato', 'Lucia', 'Korat', '2008-02-15', 2),
	(null, 'Gato', 'Marcia', 'Korat', '2006-05-30', 4),
	(null, 'Ramister', 'Billi', 'Sirio', '2009-11-22', 5),
	(null, 'Passaro', 'Nuvem', 'Melro', '2013-04-06', 6),
	(null, 'Cachorro', 'Meg', 'Shih Tzu', '2006-05-21', 3),
	(null, 'Peixe', 'Adamastor', 'Fan Tail', '2015-07-14', 7),
	(null, 'Cachorro', 'Montanha', 'Salsichinha', '2005-05-05', 8),
    (null, 'Gato', 'Bola', 'Egito', '2005-09-02', 5),
    (null, 'Cachorro', 'Lobo', 'Vira Lata', '2015-12-09', 9);


-- Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;
select * from pet;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- Altere o tamanho da coluna nome do cliente.
alter table cliente modify column nomeCliente varchar(50);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
select * from pet where tipoDoAnimal = 'Cachorro';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nomePet, dataNasc from pet; 

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from pet order by nomePet;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from cliente order by endereco desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select * from pet where nomePet like 'a%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select * from cliente where nomeCliente like '%Almeida';

-- Alterar o telefone de um determinado cliente.
update cliente set telefone = '0800-2635' where idCliente = 2;

-- Exibir os dados dos clientes para verificar se alterou.
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select * from pet join cliente on fkIdCliente = idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from pet join cliente on fkIdCliente = idCliente where nomeCliente like'Kauan%';

-- Excluir algum pet.
delete from pet where idPet = 102;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
-- drop table pet;
-- drop table cliente;








