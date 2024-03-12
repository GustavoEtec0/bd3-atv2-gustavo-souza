create database atv2_bd3_gustavo;

use atv2_bd3_gustavo;

create table tbl_turma(
	cod_turma int auto_increment primary key,
    sigla varchar(10),
    nome varchar(100),
	constraint sigla_UNIQUE unique (sigla)
);

create table tbl_alunos(
	cod_aluno int auto_increment primary key,
    cod_turma int,
    nome varchar(100),
    cpf varchar(11),
    rg varchar(9),
    telefone_aluno varchar(11),
    telefone_responsavel varchar(11),
    email varchar(100),
    data_nascimento timestamp(6),
    foreign key(cod_turma) references tbl_turma(cod_turma),
    constraint cpf_UNIQUE unique (cpf)
);

create table tbl_disciplina(
	cod_disciplina int auto_increment primary key,
    cod_turma int,
    sigla varchar(50),
	foreign key(cod_turma) references tbl_turma(cod_turma)
);

create table tbl_frequencia(
	cod_aluno int,
    cod_disciplina int,
    data_chamada timestamp(6),
    frequencia decimal(2,2),
	foreign key(cod_aluno) references tbl_alunos(cod_aluno),
	foreign key(cod_disciplina) references tbl_disciplina(cod_disciplina)
);

insert into tbl_turma(sigla, nome) value
('ds', 'desenvolvimento de sistemas'),
('adm', 'administração');

insert into tbl_alunos(cod_turma, nome, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) value
(1, 'Lorenzo Lucas Dias', '95462012438', '202689438', '27989884714', '2729090521', 'lorenzo_dias@marsans.com.br', '1970-03-12'),
(1, 'Mirella Kamilly da Costa', '54668735000', '389792652', '9137819668', '91995830771', 'mirella.kamilly.dacosta@a-qualitybrasil.com.br', '1990-05-22'),
(1, 'Antonella Marcela Luciana Almeida', '40712017895', '428868125', '67998831390', '6728230740', 'antonella.marcela.almeida@samsaraimoveis.com.br', '1982-08-29'),
(1, 'Kauê André Nascimento', '89200592414', '465187419', '6137954252', '61982280604', 'kaueandrenascimento@rafaelmarin.net', '1980-12-10'),
(1, 'Miguel Noah da Cruz', '37421439560', '224501719', '85984941306', '8527954935', 'miguelnoahdacruz@samsaraimoveis.com.br', '1999-10-26'),
(2, 'Heitor Kauê Moura', '17711425023', '336477739', '5127102981', '51987722592', 'heitor.kaue.moura@alvesbarcelos.com.br', '1995-07-13'),
(2, 'Gustavo Nicolas da Costa', '91720406022', '379672510', '85993665145', '8537450223', 'gustavo_dacosta@rcstechnology.com.br', '2004-08-08'),
(2, 'Sophia Sueli Bianca Corte Real', '19115199649', '148224210', '9138755303', '91998494578', 'sophia.sueli.cortereal@hotrmail.com', '2005-09-17'),
(2, 'Tereza Vera Ferreira', '73829921101', '225199932', '84995392812', '8427271157', 'terezaveraferreira@cognis.com', '1981-11-19'),
(2, 'Valentina Isis Vitória Sales', '01107454930', '338618636', '96985589366', '9629735301', 'valentina_sales@prifree.fr', '2010-01-25');

insert into tbl_disciplina(cod_turma, sigla) value
(1, 'bd'),
(1, 'pw'),
(1, 'dd'),
(1, 'pam'),
(2, 'gp'),
(2, 'ep'),
(2, 'con'),
(2, 'ers');
