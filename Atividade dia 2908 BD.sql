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

);

INSERT INTO estado (id, nome, sigla, ativo) VALUES (NULL, 'PARANÁ','PR','S');
-- Melhor se usar este modelo.

INSERT INTO estado VALUES (NULL, 'SÃO PAULO','SP','S');
-- Não precisa reescrever as colunas, mas deve se manter a ordem dos dados.

INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO','MT');
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

SELECT id,nome,estado_id,ativo FROM cidade;

/*

CRIAR TABELA
PRODUTO(ID,NOME,PRECO_CUSTO,PRECO_VENDA,ATIVO)
3 INSERCOES E VERIFIQUE

*/

CREATE TABLE produto (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL 
,preco_custo DECIMAL(8,2) NOT NULL
,preco_venda DECIMAL(8,2) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
);

INSERT INTO produto (id,nome,preco_custo,preco_venda,ativo) VALUES (NULL,'BOLACHA',2.99,3.99,'S');

INSERT INTO produto (nome,preco_custo,preco_venda) VALUES ('SUCO TANG',1.00,1.50);

INSERT INTO produto VALUES (NULL,'BRIGADEIRO','2.00','2.50','S');

SELECT id,nome,preco_custo,preco_venda,ativo FROM produto;