use sprint2;

-- 1. No MySQL Workbench: Crie um banco de dados chamado Sprint2; Use o banco de dados Sprint2; Escreva e execute os comandos para:

-- • Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), 
-- qtdMedalha (int, representando a quantidade de medalhas que o atleta possui)
create table Atleta
	(idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int);

-- • Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade e pelo menos 5 atletas.
insert into Atleta values
	(1, 'Alex', 'Natação', 5),
    (2, 'Bob', 'Corrida', 2),
    (3, 'Maria', 'Futebol', 3),
    (4, 'Ana', 'Volei', 9),
    (5, 'Bianca', 'Natação', 3),
	(6, 'Luiz', 'Volei', 6);

-- • Criar uma tabela chamada País para conter os dados: idPais (int e chave primária da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
create table Pais 
	(idPais int primary key,
    nome varchar(30),
    capital varchar(40));

-- • Inserir pelo menos 4 países na tabela país.
insert into Pais values
	(1, 'Brasil', 'Brasilia'),
    (2, 'França', 'Paris'),
    (3, 'Portugal', 'Lisboa'),
    (4, 'Alemanha', 'Berlim');

-- Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 país tem 1 ou muitos atletas;
-- • 1 atleta é de 1 e somente 1 país;


-- Escreva e execute os comandos para:
-- • Criar a chave estrangeira na tabela correspondente conforme modelagem;
alter table atleta add column fkIdPais int, add constraint fkPais foreign key (fkIdPais) references pais (idPais);

-- • Atualizar o país de todos os atletas;
update atleta set fkIdPais = 1 where idAtleta = 1;
update atleta set fkIdPais = 2 where idAtleta = 2;
update atleta set fkIdPais = 3 where idAtleta = 3;
update atleta set fkIdPais = 4 where idAtleta = 4;
update atleta set fkIdPais = 1 where idAtleta = 5;
update atleta set fkIdPais = 2 where idAtleta = 6;

-- • Exibir os atletas e seu respectivo país;
select * from atleta join pais on  idPais = fkIdPais;

-- • Exibir apenas o nome do atleta e o nome do respectivo país;
select atleta.nome, pais.nome from atleta join pais on idPais = fkIdPais; 

-- • Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
select * from atleta join pais on idPais = fkIdPais where capital like 'Brasilia';

-- 2. No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
-- • Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista (tamanho 40), 
-- genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
create table Musica 
	(idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40));

-- • Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma música, e um artista, que tenha mais de uma música cadastrada. 
-- Procure inserir pelo menos umas 3 músicas.
insert into Musica values
	(1, 'Yellow', 'ColdPlay', 'Pop'),
    (2, 'Photograp', 'EdShare', 'Pop'),
    (3, 'Ela vai voltar', 'Charlie Brown', 'MPB'),
    (4, 'Belive', 'Imagine dragons', 'Pop-rock'),
    (5, 'Birds', 'Imagine dragons', 'Pop-rock'),
    (6, 'Flor e o beija-flor', 'Marilia Mendonça', 'Sertanejo');

-- • Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital ou físico) e dtLancamento (DATE).
create table Album 
	(idAlbum int primary key,
    nome varchar(40),
    tipo char(7),
    constraint tipoMusica check (tipo in('digital', 'fisico')));

-- • Inserir pelo menos 2 albuns;
insert into Album values
	(1, 'The orange Room', 'digital'),
    (2, 'Live in Buenos Aires', 'fisico'),
    (3, 'Preço Curto', 'fisico'),
    (4, 'Origins', 'digital');

-- • Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 album pode ter 1 ou muitas músicas;
-- • 1 música é de 1 e somente 1 album;

use sprint2;
-- Execute os comandos para:
-- a) Exibir todos os dados das tabelas separadamente;
select * from musica join album;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
alter table musica add column fkIdAlbum int, add constraint fkAlbum foreign key (fkIdAlbum) references album(idAlbum); 

-- c) Atualizar os álbuns de cada música;
update musica set fkIdAlbum = 1 where idMusica = 1;
update musica set fkIdAlbum = 2 where idMusica = 2;
update musica set fkIdAlbum = 3 where idMusica = 3;
update musica set fkIdAlbum = 4 where idMusica = 4;
update musica set fkIdAlbum = 4 where idMusica = 5;
update musica set fkIdAlbum = 1 where idMusica = 6;

-- d) Exibir as músicas e seus respectivos álbuns;
select * from musica join album on idAlbum = fkIdAlbum;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
select musica.titulo, album.nome from musica join album on idAlbum = fkIdAlbum;

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo
select * from musica join album on fkIdAlbum = idAlbum where tipo like 'digital';
