CREATE user Bruno identified by "1234";

CREATE DATABASE uvv;

grant all on uvv.* to 'Bruno';

mysql -u Bruno -p
1234
use uvv;

CREATE TABLE `dependente` (
  `cpf_funcionario` char(11) NOT NULL COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.',
  `nome_dependente` varchar(15) NOT NULL COMMENT 'Nome do dependente. Faz parte da PK desta tabela.',
  `sexo` char(1) DEFAULT NULL COMMENT 'Sexo do dependente.',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do dependente.',
  `parentesco` varchar(15) DEFAULT NULL COMMENT 'Descrição do parentesco do dependente com o funcionário.',
  PRIMARY KEY (`cpf_funcionario`,`nome_dependente`)
);

CREATE TABLE `funcionario` (
     `cpf` char(11) NOT NULL COMMENT 'CPF do funcionário. Será a PK da tabela.',
     `primeiro_nome` varchar(15) NOT NULL COMMENT 'Primeiro nome do funcionário.',
     `nome_meio` char(1) DEFAULT NULL COMMENT 'Inicial do nome do meio.',
     `ultimo_nome` varchar(15) NOT NULL COMMENT 'Sobrenome do funcionário.',
     `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do funcionário.',
     `endereco` varchar(30) DEFAULT NULL COMMENT 'Endereço do funcionário.',
      `sexo` char(1) DEFAULT NULL COMMENT 'Sexo do funcionário.',
      `salario` decimal(10,2) DEFAULT NULL COMMENT 'Salário do funcionário.',
      `cpf_supervisor` char(11) NOT NULL COMMENT 'CPF do supervisor. Será uma FK para a própria tabela (um auto-relacionamento).',
      `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento do funcionário.',
      PRIMARY KEY (`cpf`)
     );
     
CREATE TABLE `localizacoes_departamento` (
  `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento. Faz parta da PK desta tabela e também é uma FK para a tabela departamento.',
  `local` varchar(15) NOT NULL COMMENT 'Localização do departamento. Faz parte da PK desta tabela.',
  PRIMARY KEY (`numero_departamento`,`local`)
) ;

CREATE TABLE `projeto` (
  `numero_projeto` int(11) NOT NULL COMMENT 'Número do projeto. É a PK desta tabela',
  `nome_projeto` varchar(15) NOT NULL COMMENT 'Nome do projeto. Deve ser único',
  `local_projeto` varchar(15) DEFAULT NULL COMMENT 'Localização do projeto.',
  `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento. É uma FK para a tabela departamento.',
  PRIMARY KEY (`numero_projeto`),
  UNIQUE KEY `projeto_idx` (`nome_projeto`)
);

CREATE TABLE `trabalha_em` (
  `cpf_funcionario` char(11) NOT NULL COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.',
  `numero_projeto` int(11) NOT NULL COMMENT 'Número do projeto. Faz parte da PK desta tabela e é uma FK para a tabela projeto.',
  `hora` decimal(3,1) NOT NULL COMMENT 'Horas trabalhadas pelo funcionário neste projeto.',
  PRIMARY KEY (`cpf_funcionario`,`numero_projeto`)
);

CREATE TABLE `departamento` (
  `numero_departamento` int(11) NOT NULL COMMENT 'Número do departamento. É a PK desta tabela.',
  `nome_departamento` varchar(15) NOT NULL COMMENT 'Nome do departamento. Deve ser único.',
  `cpf_gerente` char(11) NOT NULL COMMENT 'CPF do gerente do departamento. É uma FK para a tabela funcionários.',
  `data_inicio_gerente` date DEFAULT NULL COMMENT 'Data do início do gerente no departamento.',
  PRIMARY KEY (`numero_departamento`),
  UNIQUE KEY `departamento_idx` (`nome_departamento`)
);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"João","B", "Silva", 12345678966, 19650109,"Rua da Flor,751,São Paulo,SP", "M", 30.000, 33344555587, 5
);
INSERT INTO funcionario  (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Jennifer", "S", "Souza", 98765432168, 19410620, "Av Artur Lima,54,Sant André,SP", "F", 43.000, 88866555576, 4
);
INSERT INTO funcionario  (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Fernando", "T", "Wong", 33344555587, 19551208, "Rua da Lapa, 34, São Paulo, SP", "M", 40.000, 88866555576, 5
);
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
'André', 'V', 'Pereira', 98798798733, 19690329, 'Rua Timbira, 35, São Paulo, SP', 'M', 25.000, 98765432168, 4
);
INSERT INTO funcionario  (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Ronaldo", "K", "Lima", 66688444476, 19620915, "Rua Rebouças,65,Piracicaba,SP", "M", 38.000, 33344555587, 5
);
INSERT INTO funcionario  (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Joice", "A", "Leite", 45345345376, 19720731, "Av. Lucas Obes,74,São Paulo,SP", "F", 25.000, 33344555587, 5
);
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Jorge", "E", "Brito", 88866555576, 19371110, "Rua do Horto,35,São Paulo, SP", "M", 55.000," ", 1
);
INSERT INTO funcionario  (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES (
"Alice", "J", "Zelaya", 99988777767, 19680119, "Rua Souza Lima,35,São Paulo,SP", "F", 25.000, 98765432168, 4
);
INSERT INTO departamento (numero_departamento,nome_departamento, cpf_gerente, data_inicio_gerente) VALUES (
5, 'Pesquisa', 33344555587, 19880522
);
INSERT INTO departamento (numero_departamento,nome_departamento, cpf_gerente, data_inicio_gerente) VALUES (
4, "Administração", 98765432168, 19950101
);
INSERT INTO departamento (numero_departamento,nome_departamento, cpf_gerente, data_inicio_gerente) VALUES (
1, "Matriz", 88866555576, 19810619
);
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (
1, "São Paulo"
);
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (
4, "Mauá"
);
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (
5, "Santo André"
);
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (
5, "Itu"
);
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (
5, "São Paulo"
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"ProdutoX", 1, "Santo André", 5
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"ProdutoY", 2, "Itu", 5
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"ProdutoZ", 3, "São Paulo", 5
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"Informatização", 10, "Mauá", 4
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"Reorganização", 20, "São Paulo", 1
);
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES(
"Novosbenefícios", 30, "Mauá", 4
);
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
33344555587, "Alicia", "F", 19860405, "Filha"
);
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
33344555587, "Tiago", "M", 19831025, "Filho"
);
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
33344555587, "Janaina", "F", 19580503, "Esposa"
); 
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
98765432168, "Antonio", "M", 19420228, "Marido"
); 
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
12345678966, "Michael", "M", 19880104, "Filho"
); 
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
12345678966, "Alicia", "F", 19881230, "Filha"
); 
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES(
12345678966, "Elizabeth", "F", 19670505, "Esposa"
);
INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, hora) VALUES (
12345678966, 1, 32.5
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
12345678966, 2, 7.5
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
66688444476, 3, 40.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
45345345376, 1, 20.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
45345345376, 2, 20.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
33344555587, 2, 10.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
33344555587, 3, 10.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
33344555587, 10, 10.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
33344555587, 20, 10.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
99988777767, 30, 30.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
99988777767, 10, 10.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
98798798733, 10, 35.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
98798798733, 30, 5.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
98765432168, 30, 20.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
98765432168, 20, 15.0
);
INSERT INTO trabalha_em  (cpf_funcionario, numero_projeto, hora) VALUES (
88866555576, 20, "0"
);

alter table funcionario
add constraint check (sexo in('M', 'F'));

alter table 
add constraint dependente check (sexo in('M', 'F'));

alter table funcionario
add constraint CHECK (salario>=0);

alter table trabalha_em
add constraint CHECK (hora>=0);

alter table departamento
add constraint CHECK (numero_departamento>=0);

alter table projeto
add constraint CHECK (numero_projeto>=0);

alter table departamento add foreign key (cpf_gerente) references funcionario (cpf);

alter table projeto add foreign key (numero_departamento) references departamento (numero_departamento);

alter table localizacoes_departamento add foreign key (numero_departamento) references departamento (numero_departamento);

alter table trabalha_em add foreign key (cpf_funcionario) references funcionario (cpf);

alter table trabalha_em add foreign key (numero_projeto) references projeto (numero_projeto);

alter table dependente add foreign key (cpf_funcionario) references funcionario (cpf);

alter table funcionário add foreign key (numero_departamento) references departamento (numero_departamento);

alter table funcionario add foreign key (cpf_supervisor) references funcionario (cpf);


