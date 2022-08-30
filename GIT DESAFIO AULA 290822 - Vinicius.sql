DROP DATABASE IF EXISTS banco_aula;
-- sE EXISTIR ELE ELIMINA A BASE DE DADO

CREATE DATABASE banco_aula;

USE banco_aula;
-- Comando equivalente a clicar no banco de dados a esquerda.

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
);

INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PARANÁ','PR','S');
-- Melhor se usar este modelo.

INSERT INTO estado VALUES (NULL, 'MINAS GERAIS','MG','S');
-- Não precisa reescrever as colunas, mas deve se manter a ordem dos dados.

INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO DO SUL','MS');
-- Como ID e Ativo sao obrigatorios, não é preciso informar.

SELECT id,nome,sigla,ativo FROM estado;

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT 
,nome VARCHAR(255) NOT NULL
,estado_id INT NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,FOREIGN KEY (estado_id) REFERENCES estado (id)
-- CHECK é usado para limitar/escolher oque se deseja usar no ativo. Dependendo do banco, nao vale a pena usar muitas regras pois ocupa muito processamento.
);

INSERT INTO cidade (nome,estado_id) VALUES ('PARANAVAÍ',1);

INSERT INTO cidade (nome,estado_id) VALUES ('PARAÍSO DO NORTE',1);

INSERT INTO cidade (nome,estado_id) VALUES ('TAMBOARA',1);

SELECT id,nome,estado_id,ativo FROM cidade;

CREATE TABLE telefone(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,telefone VARCHAR(255) NOT NULL UNIQUE
,telefone2 VARCHAR(255) NOT NULL UNIQUE
,telefone3 VARCHAR(255) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
-- CHECK é usado para limitar/escolher oque se deseja usar no ativo. Dependendo do banco, nao vale a pena usar muitas regras pois ocupa muito processamento.
);

INSERT INTO telefone (telefone,telefone2,telefone3) VALUES ('998304521','998306822','998555822');

INSERT INTO telefone (telefone,telefone2,telefone3) VALUES ('978304521','998356822','998525822');

INSERT INTO telefone (telefone,telefone2,telefone3) VALUES ('958304521','998307722','998555982');

SELECT id,telefone,telefone2,telefone3,ativo FROM telefone;