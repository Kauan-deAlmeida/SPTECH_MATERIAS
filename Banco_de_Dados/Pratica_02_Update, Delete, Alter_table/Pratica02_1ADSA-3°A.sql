SELECT * FROM bd1ads.atleta;

-- EXERCICIO 1

-- Exibir todos os dados da tabela.
select * from atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
update atleta set qtdMedalha = 6 where idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
update atleta set qtdMedalha = 3 where idAtleta in (2, 3);

-- Atualizar o nome do atleta com o id=4;
update atleta set nome = 'Vivian' where idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas;
 update atleta set dtNasc = '1990-01-01' where idAtleta = 1;
 update atleta set dtNasc = '1980-02-10' where idAtleta = 2;
 update atleta set dtNasc = '1997-04-13' where idAtleta = 3;
 update atleta set dtNasc = '1996-01-30' where idAtleta = 4;
 update atleta set dtNasc = '1992-10-24' where idAtleta = 5;
 update atleta set dtNasc = '1988-05-15' where idAtleta = 6;
 update atleta set dtNasc = '1999-07-16' where idAtleta = 7;
 update atleta set dtNasc = '1993-08-20' where idAtleta = 8;
 update atleta set dtNasc = '1990-01-18' where idAtleta = 9;
 update atleta set dtNasc = '1995-05-02' where idAtleta = 10;

-- Excluir o atleta com o id=5;
delete from atleta where idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
select nome from atleta where modalidade <> 'Natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select nome from atleta where qtdMedalha >=3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify column modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
desc atleta;

-- Limpar os dados da tabela; 
-- truncate table atleta;

-- EXERCICIO 2


-- Exibir todos os dados da tabela.
select * from musica;

-- Adicionar o campo curtidas do tipo int na tabela;
alter table musica add column curtidas int;

-- Atualizar o campo curtidas de todas as músicas inseridas;
update musica set curtidas = 2 where idMusica = 1;
update musica set curtidas = 50 where idMusica = 2;
update musica set curtidas = 20 where idMusica = 3;
update musica set curtidas = 60 where idMusica = 4;
update musica set curtidas = 30 where idMusica = 5;
update musica set curtidas = 22 where idMusica = 6;
update musica set curtidas = 69 where idMusica = 7;
update musica set curtidas = 53 where idMusica = 8;

-- Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table musica modify column artista varchar(80);

-- Atualizar a quantidade de curtidas da música com id=1;
update musica set curtidas = 99 where idMusica = 1;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update musica set curtidas = 95 where idMusica in(2,3);

-- Atualizar o nome da música com o id=5;
update musica set titulo = 'Stitches' where idMusica = 5; 

-- Excluir a música com o id=4;
delete from musica where idMusica = 4;

-- Exibir as músicas onde o gênero é diferente de funk;
select genero from musica where genero <> 'Funk';

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select genero from musica where curtidas >=20;

-- Descrever os campos da tabela mostrando a atualização do campo artista;
desc musica;

-- Limpar os dados da tabela;
-- truncate table musica;

-- Exercicio 03


-- Exibir todos os dados da tabela.
select * from filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update filme set protagonista = 'Adam' where idFilme = 1;
update filme set protagonista = 'Macaulay' where idFilme = 2;
update filme set protagonista = 'Bill' where idFilme = 3;
update filme set protagonista = 'Lorraine' where idFilme = 4;
update filme set protagonista = 'Gato' where idFilme = 5;
update filme set protagonista = 'Marquim' where idFilme = 6;
update filme set protagonista = 'Hazel' where idFilme = 7;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table filme modify column diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
update filme set diretor = 'Marcelo' where idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update filme set diretor = 'Caio' where idFilme in(2, 7);

-- Atualizar o título do filme com o id=6;
update filme set titulo = 'Carros_1' where idFilme = 6;

-- Excluir o filme com o id=3;
delete from filme where idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
select genero from filme where genero <> 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select genero from filme where genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista ediretor;
desc filme;

-- Limpar os dados da tabela;
-- truncate table filme;

-- Exercicio 04


-- Exibir todos os dados da tabela.
select * from professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,‘assistente’ ou ‘titular’;
alter table professor add column funcao varchar(50) ;
alter table professor add constraint funcao_esp check(funcao in('monitor','assistente','titular')); 

-- Atualizar os professores inseridos e suas respectivas funções;
update professor set funcao = 'monitor' where idProfessor = 1;
update professor set funcao = 'monitor' where idProfessor = 2;
update professor set funcao = 'titular' where idProfessor = 3;
update professor set funcao = 'titular' where idProfessor = 4;
update professor set funcao = 'titular' where idProfessor = 5;
update professor set funcao = 'assistente' where idProfessor = 6;
update professor set funcao = 'assistente' where idProfessor = 7;


-- Inserir um novo professor;
insert into professor values
	(8, 'Henrique', 'Algoritmo', '2002-01-01', 'monitor');

-- Excluir o professor onde o idProfessor é igual a 5;
delete from professor where idProfessor = 5;

-- Exibir apenas os nomes dos professores titulares;
select nome from professor where funcao = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select nome from professor where funcao = 'monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3;
update professor set dtNasc = '1990-02-15' where idProfessor = 3;

-- Limpar a tabela Professor;
-- truncate table professor;


-- Exercicio 05


-- Exibir todos os dados da tabela.
select * from curso;

-- Exibir apenas os coordenadores dos cursos.
select coordenador from curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla like 'a%';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from curso order by nome desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where nome like 's%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where nome like '%a';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where nome like '_n%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from curso where nome like '%m_';

-- Elimine a tabela.
-- drop table curso;

-- Exercicio 06

-- Exibir todos os dados da tabela.
select * from revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update revista set categoria = 'curiosidades' where idRevista = 1;
update revista set categoria = 'domestico' where idRevista = 2;
update revista set categoria = 'lazer' where idRevista = 3;
update revista set categoria = 'carros' where idRevista = 4;
select * from revista;
-- Insira mais 3 registros completos.
insert into revista value
(5, 'nova_revista', 'empresa', ''),
(6, 'programação', 'ads', ''),
(7, 'faculdade_sptech', 'faculdade','');

-- Exibir novamente os dados da tabela.
select * from revista;

-- Exibir a descrição da estrutura da tabela.
desc revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
desc revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revista add column periodicidade varchar(15);

-- Exibir os dados da tabela.
select * from revista;

-- Excluir a coluna periodicidade da tabela.
-- drop table revista;