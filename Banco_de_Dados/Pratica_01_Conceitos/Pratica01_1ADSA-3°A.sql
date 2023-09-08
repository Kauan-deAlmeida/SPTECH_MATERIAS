-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha 
-- (int, representando a quantidade de medalhas que o atleta possui)
-- • Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade

create table Atleta
	(idAtleta int primary key,
	nome varchar(40),
	modalidade varchar(40),
	qtdMedalha int);	

insert into Atleta values
	(1, 'Vivian', 'Natação', 4),
	(2, 'Caio', 'Luta', 5),
	(3, 'Marcelo', 'Volei', 6),
	(4, 'Monica', 'Bicicleta', 2),
	(5, 'Eduardo', 'Futeboll', 3),
	(6, 'Thiago', 'Basquete', 9),
	(7, 'Kaline', 'Corrida', 5),
	(8, 'Fernando', 'Tenis_de_mesa', 7),
	(9, 'Julia', 'Handebol', 1),
	(10, 'Henrique', 'Esgrima', 3);

-- Exibir todos os dados da tabela.
select * from Atleta;

-- • Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from Atleta;

-- • Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from Atleta where qtdMedalha = 5;

-- • Exibir os dados da tabela ordenados pela modalidade.
select * from Atleta order by modalidade;

-- • Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
select * from Atleta order by qtdMedalha desc;

-- • Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from Atleta where nome like 's';

-- • Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from Atleta where nome like 'v%';

-- • Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from Atleta where nome like '%o';

-- • Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from Atleta where nome like '%r_';

-- • Eliminar a tabela.
-- DROP table Atleta;

-- Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.

create table Musica
	(idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40));
    
insert into Musica values
	(1, 'Viva_la_vida', 'Coldplay', 'Pop'),
	(2, 'Photograpy', 'Edsheeran', 'Pop'),
	(3, 'Thunder', 'Imagine_Dragons', 'Pop_Rock'),
	(4, 'Ela_vai_voltar', 'Charlie_Brown', 'MPB'),
	(5, 'Mercy', 'Shawn_Mendes', 'Pop'),
	(6, 'As_it_was', 'Harry_Styles', 'Pop');
    
select * from Musica;

insert into Musica values
(7, 'Senhor_do_tempo', 'Charlie_Brown', 'MPB'),
(8, 'Birds', 'Imagine_Dragons', 'MPB');

update Musica set genero = 'Pop_Rock' where idMusica = 8;

-- Exibir todos os dados da tabela.
select * from Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.
select titulo, artista from Musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
select * from Musica where genero = 'MPB';

-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from Musica where artista = 'Imagine_dragons';

-- e) Exibir os dados da tabela ordenados pelo título da música.
select * from Musica order by titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
select * from Musica order by titulo desc;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from Musica where titulo like 'E%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from Musica where artista like '%s';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from Musica where genero like '_o%';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from Musica where titulo like '%d_';

-- k) Elimine a tabela.
-- drop table Musica;
	
    
-- Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.

create table Filme
	(idFilme int primary key,
	titulo varchar(50),
	genero varchar(40),
	diretor varchar(40));

insert into Filme values
	(1, 'Gente_grande', 'Comedia', 'Viviam'),
	(2, 'Esqueceram_de_mim', 'Comedia', 'Vivivam'),
	(3, 'IT', 'Terror', 'Caio'),
	(4, 'Sombração_do_mal', 'Terror', 'Caio'),
	(5, 'Gato_de_botas', 'Desenho', 'Eduardo'),
	(6, 'Carros_3', 'Desenho', 'Fernando'),
	(7, 'A_culpa_é_das_estrelas', 'Romance', 'Marcelo');

-- Exibir todos os dados da tabela.
select * from Filme;

-- • Exibir apenas os títulos e os diretores dos filmes.
select titulo, diretor from Filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.
select * from Filme where genero = 'Comedia';

-- • Exibir apenas os dados dos filmes de um determinado diretor.
select * from Filme where diretor = 'Viviam';

-- • Exibir os dados da tabela ordenados pelo título do filme.
select * from Filme order by titulo;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
select * from Filme order by titulo desc;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
select * from Filme where titulo like 'g%';

-- • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
select * from Filme where diretor like '%o';

-- • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
select * from Filme where genero like '_e%';

-- • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
select * from Filme where titulo like '%a_';

-- • Elimine a tabela.
-- drop table Filme;


-- Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50), especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da tabela.

create table Professor
	(idProfessor int primary key,
	nome varchar(50),
	especialidade varchar(40),
	dtNasc date);

insert into Professor values
	(1, 'Viviam', 'Banco_de_dados', '1983-10-13'),
	(2, 'Caio', 'Algoritmo', '1980-06-20'),
	(3, 'Eduardo', 'Arquitetura_computacional', '1960-02-15'),
	(4, 'Viviam', 'MySql', '1983-10-13'),
	(5, 'Fernando', 'Pesquisa_Inovação', '1950-06-06'),
	(6, 'Monica', 'Tecnologia_da_informação', '1980-09-18'),
	(7, 'Caio', 'Html', '1980-06-20');

-- a) Exibir todos os dados da tabela.
select * from Professor;

-- b) Exibir apenas as especialidades dos professores.
select especialidade from Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
select * from Professor where especialidade = 'algoritmo';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
select * from Professor order by nome;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
select * from Professor order by dtNasc;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
select * from Professor where nome like 'C%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
select * from Professor where nome like '%o';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
select * from Professor where nome like '_i%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
select * from Professor where nome like '%d_';

-- j) Elimine a tabel
-- drop table Professor;

-- Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.

create table Curso
	(idCurso int primary key,
	nome varchar(50),
	sigla char(3),
	coordenador varchar(50));

insert into Curso values
	(1, 'Analise_desenvolvimento_sistema', 'ADS', 'Gerson'),
	(2, 'Ciencia_da_computação', 'CCO', 'Vivian'),
	(3, 'Sistema_da_informação', 'SIS', 'Caio'),
	(4, 'Engenharia', 'ENG', 'Gerson'),
	(5, 'Arquitetura', 'ARQ', 'Caio'),
	(6, 'Direito', 'DRT', 'Fernando'),
	(7, 'Medicina', 'MDC', 'Eduardo');

-- a)Exibir todos os dados da tabela.
select * from Curso;

-- b) Exibir apenas os coordenadores dos cursos.
 select coordenador from Curso;
 
-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from Curso where sigla = 'ADS';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from Curso order by nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from Curso order by nome desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from Curso where nome like 'a%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from Curso where nome like '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from Curso where nome like '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from Curso where nome like '%a_';

-- j) Elimine a tabela.
-- drop table Curso;


-- Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é, Epoca, Quatro Rodas, Claudia, etc).
-- Escreva e execute os comandos para:
-- • Criar a tabela chamada Revista para conter os campos: idRevista (int e chave primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30).
-- Os valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente pelo sistema.
-- • Inserir 4 registros na tabela, mas sem informar a categoria.

create table Revista
	(idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30));

insert into Revista values
	(NULL, 'Glogo', NULL),
	(NULL, 'Record', NULL),
	(NULL, 'Band', NULL);
    
-- Exibir todos os dados da tabela.
select * from Revista;

-- • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update Revista set categoria = 'jornal' where idRevista = 1;
update Revista set categoria = 'jornal' where idRevista = 2;
update Revista set categoria = 'jornal' where idRevista = 3;
select * from Revista;

-- • Insira mais 3 registros completos.
insert into Revista values
	(null, 'Jornal_de_são_paulo', null),
	(null, 'Cartoom', null),
	(null, 'Historia_em_quadrinho', null);

-- • Exibir novamente os dados da tabela.
select * from Revista;

-- • Exibir a descrição da estrutura da tabela.
describe Revista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table Revista modify column categoria varchar(40);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe Revista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table Revista add column periodicidade varchar(15);

-- • Exibir os dados da tabela.
select * from Revista;

-- • Excluir a coluna periodicidade da tabela.
-- alter table Revista drop column periodicidade;


