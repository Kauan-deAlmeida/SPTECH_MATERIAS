create database apresentacao;

use apresentacao;

create table tema
	(idTema int primary key auto_increment,
	nomeTema varchar(45));

create table cargo
	(idCargo int primary key auto_increment,
	nomeCargo varchar(45),
	constraint chkCargo check(nomeCargo in('Full-Stack', 'Back-end', 'Arquivista', 'Front-end', 'Gestor','DBA')));


create table grupo
	(idGrupo int primary key auto_increment,
	numeroGrupo varchar(45),
    qtdMembros int,
    fkIdTema int not null,
    constraint idTema foreign key (fkidTema) references tema(idTema));


create table aluno
	(idAluno int primary key auto_increment,
    nomeAluno varchar(45),
    ra char(8) not null unique,
    fkIdGrupo int not null,
    constraint fkGrupo foreign key (fkIdGrupo) references grupo(idGrupo),
    fkIdCargo int not null,
    constraint fkCargo foreign key (fkIdCargo) references cargo(idCargo));

insert into tema values
	(null, 'Luminosidade'),
    (null, 'Temperatura'),
    (null, 'Umidade'),
    (null, 'Monitoramento'),
    (null, 'Calor');
    
insert into cargo values
	(null, 'Full-Stack'),
    (null, 'Back-end'),
    (null, 'Arquivista'),
    (null, 'Front-end'),
    (null, 'Gestor'),
    (null, 'DBA');

insert into grupo values
	(null, 'Grupo 1', 6, 1),
    (null, 'Grupo 2', 6, 2),
    (null, 'Grupo 3', 6, 3),
    (null, 'Grupo 4', 5, 4),
    (null, 'Grupo 5', 5, 5);

insert into aluno values
	(null, 'Kauan', 01232072, 1, 1),
    (null, 'Kevin', 01232022, 2, 2),
    (null, 'Gabriel.G', 01232153, 3, 3),
    (null, 'Gabriella', 01232451, 4, 4),
    (null, 'Aylle', 01232623, 5, 5),
    (null, 'Lucas', 01232951, 2, 6);

select * from aluno join grupo on idGrupo = fkIdGrupo;

select A.nomeAluno as 'Nome do aluno',
 G.numeroGrupo as 'Número do Grupo' 
 from aluno as A
 join grupo as G on idGrupo = fkIdGrupo; 


























