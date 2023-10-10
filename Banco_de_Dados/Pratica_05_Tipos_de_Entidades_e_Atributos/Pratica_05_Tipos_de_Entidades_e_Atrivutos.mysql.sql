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
select pet.*,cliente.nomeCliente as 'Nome responsasvel' from pet join cliente on fkIdCliente = idCliente where nomeCliente like'Kauan%';

-- Excluir algum pet.
delete from pet where idPet = 102;

-- Exibir os dados dos pets para verificar se excluiu.
select * from pet;

-- Excluir as tabelas.
-- drop table pet;
-- drop table cliente;


-- 2. Fazer a modelagem lógica (DER) de um sistema para armazenar os gastos
-- individuais das pessoas de sua família.
-- Crie uma entidade Pessoa, com atributos idPessoa, nome, data de nascimento, profissão.
create table pessoa (
	idPessoa int primary key auto_increment,
	nome varchar(45),
	dataNasc date,
	profisssao varchar(45));

-- Crie uma outra entidade Gasto, com atributos idGasto, data, valor, descrição.
create table gastos(
	idGasto int primary key auto_increment,
	dataDoGasto date,
	valor decimal(10, 2),
	descricao varchar(45),
    fkIdPessoa int,
    constraint fkPessoa foreign key (fkIdPessoa) references pessoa(idPessoa));

-- • Insira dados nas tabelas.
insert into pessoa values
	(null, 'Bruna Duran', '2003-10-01', 'Logistica'),
	(null, 'Kauan Almeida', '2003-04-23', 'Programação'),
	(null, 'Alessandro Corol', '1998-07-11', 'Analista de preço'),
	(null, 'Elvis Bezerra', '1980-07-12', 'Produção'),
	(null, 'Nicolas Kleyton', '2005-10-01', 'Engenharia de Software'),
	(null, 'Luis Guilherme', '2003-05-27', 'Militar');

insert into gastos values
	(null, '2023-02-10', 200, 'Conta de Luz', 1),
	(null, '2023-05-25', 150, 'Conta de Agua', 2),
	(null, '2023-02-10', 80, 'Conta de Luz', 3),
	(null, '2023-03-12', 126, 'Cinema', 4),
	(null, '2023-06-16', 184, 'Conta de Luz', 5),
	(null, '2023-02-10', 122, 'Conta de Celular', 6);

-- • Exiba os dados de cada tabela individualmente.
select * from pessoa;
select * from gastos;

-- • Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from pessoa where idPessoa = 4;
select * from gastos where descricao like'%z';

-- • Exiba os dados das pessoas e dos seus gastos correspondentes.
select * from pessoa join gastos on idPessoa = fkIdPessoa;

-- • Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
select * from pessoa join gastos on idPessoa = fkIdPessoa where idPessoa = 2;

-- • Atualize valores já inseridos na tabela.
update pessoa set dataNasc = '1998-07-12' where idPessoa = 3;

-- • Exclua um ou mais registros de alguma tabela.
delete from gastos where idGasto = 3;

-- 3. Fazer a modelagem lógica no MySQL Workbench de um sistema para cadastrar os setores de uma empresa, os funcionários desses setores e os acompanhantes desses funcionários para uma festa que a empresa está organizando para celebrar o fim da pandemia.
--  Criar um banco de dados chamado PraticaFuncionario.
create database PraticaFuncionario;

--  Selecionar esse banco de dados.
use PraticaFuncionario;

--  Criar as tabelas correspondentes à sua modelagem.
create table setor(
	idSetor int primary key auto_increment,
	nomeSetor varchar(45),
	numeroAndar int);

create table funcionario(
	idFuncionario int primary key auto_increment,
	nomeFunc varchar(45),
	salario varchar(45),
	fkIdSetor int,
	constraint fkSetor foreign key (fkIdSetor) references setor(idSetor));

create table acompanhante(
	idAcom int auto_increment,
	nomeAcom varchar(45),
	relacao varchar(45),
	dataNasc date,
	fkIdFunc int,
	constraint fkFun foreign key (fkIdFunc) references funcionario(idFuncionario),
	primary key(idACom, fkIdFunc));

--  Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
insert into setor values
	(null, 'Roupas', '2'),
	(null, 'RH', '4'),
	(null, 'Logistica', '6');

insert into funcionario values
	(null, 'Bruna Duran', 2000, 2),
	(null, 'Kauan Almeida', 2100, 2),
	(null, 'Alessandro Corol', 1800, 3),
	(null, 'Nicolas Kleyton', 2000, 3),
	(null, 'Luis Guilherme', 1900, 1),
	(null, 'Elvis Bezerra', 2000, 1);

insert into acompanhante values
	(null, 'Lucas', 'Amigo', '2003-02-26', 2),
	(null, 'Giovana', 'Amigo', '2003-06-13', 1),
	(null, 'Luana', 'Namorada', '1998-05-15', 3),
	(null, 'Raiane', 'Namorada', '2006-03-05', 5),
	(null, 'Caique', 'Amigo', '2003-09-22', 4),
	(null, 'Cristina', 'Esposa', '1984-09-20', 6);

--  Exibir todos os dados de cada tabela criada, separadamente.
select * from setor;
select * from funcionario;
select * from acompanhante;

--  Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
--  Exibir os dados dos setores e dos seus respectivos funcionários.
select * from setor join funcionario on idSetor = fkIdSetor;

--  Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select * from setor join funcionario on idSetor = fkIdSetor where nomeSetor = 'RH';

--  Exibir os dados dos funcionários e de seus acompanhantes.
select * from funcionario join acompanhante on idFuncionario = fkIdFunc;

--  Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from funcionario join acompanhante on idFuncionario = fkIdFunc where nomeFunc like 'Kauan Almeida';

--  Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from acompanhante join funcionario on fkIdFunc = idFuncionario join setor on idSetor = fkIdSetor;

-- 4. Fazer a modelagem lógica de um sistema para cadastrar os treinadores de nadadores, que participarão de vários campeonatos, representando o Brasil.
-- Escrever os comandos do MySQL para:
-- a) Criar um banco de dados chamado Treinador.
create database treinador;

-- b) Selecionar esse banco de dados.
use treinador;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table treinador(
	idTreinador int primary key auto_increment,
	nomeTreinador varchar(45),
	telefone char(14),
	emial varchar(50))auto_increment = 10;

create table nadador(
	idNadador int primary key auto_increment,
	nomeNadador varchar(45),
	estado char(2),
	dataNasc varchar(45),
	fkIdTreinador int,
	constraint fkTreinador foreign key(fkIdTreinador) references treinador (idTreinador))auto_increment = 100;

create table treinadorNovado(
	idTreinadorNovado int primary key auto_increment,
	nomeTreinadorNovado varchar(45),
    telefoneNovado char(14),
    emailNovado varchar(45),
    fkIdTrei int,
    constraint fkTrei foreign key (fkIdTrei) references treinador(idTreinador))auto_increment = 10;

-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.

insert into treinador values
	(null, 'Bruna', '(11)98051-2616', 'bruna.duran@gmail.com'),
	(null, 'Kauan', '(11)98084-3122', 'kauan.almeida@sptech.school'),
	(null, 'Nicolas', '(11)94511-2953', 'nicolas.kleyton@gmail.com'),
	(null, 'Guilherme', '(11)99141-0154', 'luis.guilherme@gmail.com');

insert into nadador values
	(null, 'Alessandro', 'SP', '1998-07-12', 10),
    (null, 'Giovana', 'SP', '2003-10-05', 10),
    (null, 'Vitor', 'SP', '2003-06-02', 11),
    (null, 'Gabriel', 'SP', '2004-05-26', 11),
    (null, 'Caique', 'PB', '2006-09-03', 12),
    (null, 'Zarbo', 'PB', '1999-07-30', 12),
    (null, 'Raiane', 'RJ', '2006-02-16', 13),
    (null, 'Souza', 'RJ', '2003-05-09', 13);

insert into treinadorNovado values
	(null, 'Caio', '(11)98051-2616', 'caio.eduardo@gmail.com', 10),
	(null, 'Bruno', '(11)95264-0215', 'bruno.eduardo@sptech.school', 11),
	(null, 'Diego', '(11)99264-4215', 'diego.oliveira@gmail.com', 12),
	(null, 'Bianca', '(11)93051-1568', 'bianca.almeida@gmail.com', 13);
    
-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from treinador;
select * from nadador;
select * from treinadorNovado;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select * from treinador join nadador on idTreinador = fkIdTreinador;

-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select * from treinador join nadador on idTreinador = fkIdTreinador where nomeTreinador = 'Kauan';

-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select * from treinadorNovado join treinador on fkIdTrei = idTreinador;

-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).
select * from treinadorNovado join treinador on fkIdTrei = idTreinador where nomeTreinadorNovado = 'Caio';

-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select * from treinadorNovado join treinador on fkIdTrei = idTreinador join nadador on idTreinador = fkIdTreinador;

-- m) Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.
select * from treinadorNovado join treinador on fkIdTrei = idTreinador join nadador on idTreinador = fkIdTreinador where nomeTreinadorNovado = 'caio';


-- 5. [DESAFIO] Fazer a modelagem lógica (DER) de um sistema para UMA clínica médica. Supor que a clínica tem vários médicos e vários pacientes, sendo que cada paciente pode ser atendido por mais de um médico da clínica. E cada médico, obviamente, pode atender mais de um paciente.
-- Sobre o paciente, o sistema guarda um identificador, o nome, o número do telefone (que pode ser mais de um) e o endereço.
-- Sobre o médico, o sistema guarda o número de CRM (Conselho Regional de Medicina), que é usado como identificador do médico, o nome do médico, a especialidade do médico (que pode ser mais de uma) e o número de telefone do médico (que pode ser mais de um).
-- É importante também guardar a informação da data e horário de cada consulta realizada.
-- Atenção: Não precisa ter a entidade clinica, porque não vamos armazenar dados de várias clínicas, apenas de uma!
-- Não precisa implementar no MySQL.