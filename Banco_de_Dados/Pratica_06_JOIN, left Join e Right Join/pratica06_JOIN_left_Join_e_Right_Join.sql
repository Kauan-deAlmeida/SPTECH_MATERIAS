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





