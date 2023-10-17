create database AlunoProjeto;

use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem.

create table projeto(
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45));
    
create table aluno(
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    telefone char(14),
    fkProjeto int,
    constraint fkIdProjeto foreign key (fkProjeto) references projeto(idProjeto),
    representante int,
    constraint rep foreign key (representante) references aluno(ra));
    
create table acompanhante(
	idAcompanhante int auto_increment,
    nome varchar(45),
    relacao varchar(45),
    fkAluno int,
    constraint fkIdAluno foreign key (fkAluno) references aluno(ra),
    primary key (idAcompanhante, fkAluno));

-- Inserir dados nas tabelas.
insert into projeto (nome, descricao)values
	('Vinum', 'Controle de temperatura e umidade'),
    ('Jogos FPS', 'equipe de jogo csgo'),
    ('SOS', 'Ajuda alunos com dificuldade nas matérias'),
    ('Transporte', 'Ajdua alunos com dificuldade nos transportes'),
    ('Notebook', 'Ajuda alunos que não tem notebook');

insert into aluno (nomeAluno, telefone, fkProjeto) values
	('Kauan Almeida', '(11)98084-3122', 1),
    ('Bruna Duran', '(11)96235-1425', 2),
    ('Elvis Bizerra', '(11)98084-3122', 3),
    ('Cristina Costa', '(11)92365-2045', 4),
    ('Luis Guilherme', '(11)99852-4679', 5);
	
insert into aluno (nomeAluno, telefone, fkProjeto, representante) values
    ('Nicolas Kleyton', '(11)90325-5497', 1, 1),
    ('Simone Aparecida', '(11)91126-3259', 1, 1),
    ('Marcela de Paula', '(11)20463-1285', 2, 2),
    ('Endi Lorrayne', '(11)95749-1206', 3, 3),
    ('Caio Eduardo', '(11)95297-2069', 4, 4),
    ('Bruno Eduardo', '(11)95264-1526', 5, 5);
    
insert into acompanhante (nome, relacao, fkAluno) values
	('Mateus Costa', 'irmão', 2),
    ('Cleyton Almeida', 'irmão', 1),
    ('Emerson', 'irmão', 3),
    ('Edmeia Costa', 'mãe', 4),
    ('Andrea de Azevedo', 'mãe', 1),
    ('Simone Aparecida', 'tia', 9),
    ('Bryan de Paula', 'filho', 8);
    
    
-- Exibir todos os dados de cada tabela criada, separadamente.
select * from projeto;
select * from aluno;
select * from acompanhante;

-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.
-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from aluno as aluno
join projeto as projeto
on projeto.idProjeto = aluno.fkProjeto; 

-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from aluno as aluno
join acompanhante as acom
on aluno.ra = acom.fkAluno;

-- Exibir os dados dos alunos e dos seus representantes.
select * from aluno as aluno
join aluno as rep
on aluno.representante = rep.ra;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
select * from aluno as aluno 
join projeto as proj
on aluno.ra = proj.idProjeto
where proj.nome like 'Vinum';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select * from aluno as aluno
join aluno as rep
on aluno.representante = rep.ra
join projeto as projeto
on projeto.idProjeto = aluno.fkProjeto; 



-- 2. Fazer a modelagem lógica de um sistema para cadastrar as campanhas de doações que surgiram devido ao Covid-19 e os organizadores dessas campanhas
-- Cada organizador organiza mais de uma campanha de doação.
-- Cada campanha de doação é organizada por apenas um organizador.
-- a) Criar um banco de dados chamado Campanha.

create database Campanh;
    
-- b) Selecionar esse banco de dados.
use Campanh;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table organizador(
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    rua varchar(50),
    bairro varchar(45),
	email varchar(45),	
    fkOrgEx  int,
    constraint fkIdOrg foreign key (fkOrgEx) references organizador(idOrganizador))
    auto_increment = 30;
    
create table campanha(
	idCamp int auto_increment,
    categoria varchar(45),
    instituicao varchar(45),
	dataFinal date,
    fkOrganizador int,
    constraint fkIdOrga foreign key (fkOrganizador) references organizador(idOrganizador),
    primary key (idCamp, fkOrganizador));

-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente.
insert into organizador (nome, rua, bairro, email) values
	('Bruna Duran', 'Juracy', 'Helida', 'bruna.duran@gmail.com'),
    ('Kauan de Alemida', 'Tibetania', 'Capuava', 'kauan.almeida@gmail.com'),
    ('Luis Guilherme', 'Rosa' ,'São Mateus' ,'luis.guilherme@gmail.com');

insert into organizador (nome, rua, bairro, email, fkOrgEx) values
	('Nicolas Kleyton', 'Meninos', 'Jão pessoa', 'nicolas.kleyton@gmail.com', 30),
    ('Elvis Bezerra', 'Juracy', 'Helida', 'elvis.bezerra@gmail.com', 31),
    ('Caique Guilherme', 'Rosa' ,'São Mateus' ,'caique.guilherme@gmail.com', 32);

insert into campanha (categoria, instituicao, dataFinal, fkOrganizador)values
	('Limpeza', 'Bombril', '2023-11-11', 31),
    ('Saúde', 'Santa Casa', '2023-12-23', 32),
    ('Moveis', 'Nova Casa', '2023-12-15', 33),
    ('Carros', 'BMW', '2024-01-13', 34);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from organizador;
select * from campanha;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select * from organizador 
join campanha on idOrganizador = fkOrganizador; 

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
select * from organizador 
join campanha on idOrganizador = fkOrganizador
where idOrganizador = 31; 

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
select * from organizador as organizador
join organizador as experiente
on organizador.fkOrgEx = experiente.idOrganizador;

-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
select * from organizador as organizador
join organizador as experiente
on organizador.fkOrgEx = experiente.idOrganizador
where organizador.idOrganizador = 34;

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
select * from organizador as organizador
join campanha as camp
on organizador.idOrganizador = camp.fkOrganizador
join organizador as experientes
on organizador.fkOrgEx = experientes.idOrganizador;

-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador.
select * from organizador as organizador
join campanha as camp
on organizador.idOrganizador = camp.fkOrganizador
join organizador as experientes
on organizador.fkOrgEx = experientes.idOrganizador
where organizador.idOrganizador = 34;



