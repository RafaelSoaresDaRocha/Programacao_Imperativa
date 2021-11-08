-- 1) Criação do banco de dados

CREATE DATABASE Gympass DEFAULT CHARACTER SET utf8;
USE Gympass;

-- 2) Criação das tabelas com chaves primárias e estrangeiras

CREATE TABLE academias 
(
IDacademia INT AUTO_INCREMENT PRIMARY KEY,
cnpj VARCHAR(14) NOT NULL,
razao_social VARCHAR(60) NOT NULL,
endereco VARCHAR(100) NOT NULL,	
telefone BIGINT NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE aulas_online
(
IDaula_online INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(70) NOT NULL,
duracao SMALLINT,
imagem MEDIUMBLOB,
video_url VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE empresas
(
IDempresa INT AUTO_INCREMENT PRIMARY KEY,
cnpj VARCHAR(14) NOT NULL,
razao_social VARCHAR(60) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone  BIGINT NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE funcionarios
(
IDfuncionario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
matricula BIGINT,
fk_IDempresa INT,
 FOREIGN KEY (fk_IDempresa) REFERENCES empresas (IDempresa)
);

CREATE TABLE empresas_academias
(
fk_IDempresa INT,
fk_IDacademias INT,
FOREIGN KEY (fk_IDempresa) REFERENCES empresas (IDempresa),
FOREIGN KEY (fk_IDacademias) REFERENCES academias (IDacademia)
);

ALTER TABLE empresas_academias ADD IDempresa_academia INT AUTO_INCREMENT PRIMARY KEY;

CREATE TABLE academias_funcionarios
(
IDacademias_funcionarios INT AUTO_INCREMENT PRIMARY KEY,
tipo VARCHAR(15),
preco DECIMAL(4,2),
fk_IDfuncionario INT,
fk_IDacademia INT,
fk_IDaula_online INT,
FOREIGN KEY (fk_IDfuncionario) REFERENCES funcionarios (IDfuncionario),
FOREIGN KEY (fk_IDacademia) REFERENCES academias (IDacademia),
FOREIGN KEY (fk_IDaula_online) REFERENCES aulas_online (IDaula_online)
);

-- 3) Inserção de dados em uma das tabelas

INSERT INTO empresas (cnpj, razao_social, endereco, telefone, email)
VALUES ('60746948000112', 'BANCO BRADESCO S.A', 'Cidade de Deus, s/nº Vila Yara Osasco', '1140020022', 'bancobradesco@bradesco.com.br'),
	   ('08902115000183', 'IFOOD AGENCIA DE SERVICOS DE RESTAURANTES LTDA', 'Rua Coronel Boaventura Mendes Pereira, 295 VILA BOAVENTURA', '1136343360', 'ifoodrestaurantes@ifood.com.br'),
       ('02879250001655', 'ATENTO BRASIL S/A', 'Avenida Antartica, 214 BARRA FUNDA', '1131888696', 'gerenciatributaria2@atento.com.br'),
	   ('60665981000118', 'UNIAO QUIMICA FARMACEUTICA NACIONAL S.A', 'Rua Cel Luiz Tenorio Brito, 90 CENTRO', '1135356699', 'uniaoquimica@uniaoquimica.com.br'),
       ('04154099000137', 'MARKETDATA SOLUTIONS BRASIL LTDA', 'Avenida das Nacoes Unidas, 12495 BROOKLIN PAULISTA', '1137998175', 'msilva@klalaw.com.br');
       
INSERT INTO academias (cnpj, razao_social, endereco, telefone, email)
VALUES ('22879252000175', 'ACADEMIA SMART FIT LTDA', 'Avenida Guarapari, S/N CAXIAS DO SUL', '2730791388', 'smartfitacademias@smartfit.com.br');     
       
 -- 4) Atualização de dados em uma das tabelas
 
 UPDATE empresas SET 	
 endereco = "Estrada de Itapecerica, 2611 VILA PREL"
 WHERE IDempresa = 1;
 
 UPDATE empresas SET 	
 email = "mktdt@marketdata.com.br"
 WHERE IDempresa = 5;
 
 UPDATE empresas SET
 razao_social = 'BATATA QUIMICA FARMACEUTICA NACIONAL S.A'
 WHERE IDempresa = 4;
 
 -- 5) Exclusão de dados em uma das tabelas.
 
 DELETE FROM academias
 WHERE IDacademia = 1;
 
 -- 6) Seleção de dados de uma das tabelas.

SELECT IDempresa, razao_social, telefone
FROM empresas
ORDER BY razao_social ASC;


-- Apresentacao Checkpoint II
TEXT ('Meu projeto é sobre a empresa Gympass, uma empresa que fornece um serviço de conexao entre empresas que querem investir
no bem-estar e saude de seus funcionarios e academias de ginasticas distribuidas em todo territorio nacional. Esse trabalho
mostra como é o banco de dados da empresa, onde temos as pricipais entidades empresas, academias e funcionarios, as empresas
tem uma ligacao de 1:N com funcionarios, e por ter uma conexao de 1:N com as academias e academias ter a mesma ligacao com as empresas
é criado uma tabela intermediaria chamada empresa_academias. temos tambem outra tabela intermediaria que liga funcionarios e academias
porque muitas academias podem ter varios funcionarios e muitos funcionarios podem ir a muitas academias, alem da tabela de aulas_online 
que podem ter muitas aulas para muitos funcionarios. O objetivo desse banco de dados é poder armazenar todos os dados importantes 
do negocio e assim gerar relatorios mais acertivos para as tomadas de decisão.')
 

 
 