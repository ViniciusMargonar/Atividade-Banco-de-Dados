DROP DATABASE IF EXISTS viagem_bd
-- Ao tentar deletar a base de dados que não existe, o sistema informa um aviso que não para o sistema, apenas avisa.

CREATE DATABASE viagem_bd
-- Comando usado para criar a base dados. É possível verificar se foi criado verificando Output abaixo e os Schemas.
-- Tentamos criar novamente e deu erro (Code 1007 - Cant create database "banco_vn", database exists)


DROP DATABASE viagem_bd
-- Comando usado para deletar o base de dados, é possível verificar se foi deletado verificando o Output e os Schemas.
-- Tentamos eliminar a base de dados após ela já estar deletada e não foi possivel pois a data base não existe. Apareceu o erro no Output informando que a data base não existe.

USE banco_vc;

CREATE TABLE funcionario (	
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(255) NOT NULL UNIQUE
,endereço VARCHAR(255) NOT NULL
,data_nascimento DATETIME NOT NULL

);

CREATE TABLE cidade (
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(255) NOT NULL UNIQUE
,estado_id VARCHAR(255) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK(ativo IN('S','N'))
);

INSERT INTO cidade (nome,estado_id)
VALUES (NULL, 'PARANAVAÍ');

INSERT INTO cidade (nome,estado_id)
VALUES (NULL,'MATO GROSSO');

INSERT INTO cidade (nome,estado_id)
VALUES (NULL,'BAHIA');


CREATE TABLE estado (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
);

INSERT INTO estado
VALUES(NULL, 'PARANAVAI', 'PR','S');

INSERT INTO estado
VALUES(NULL, 'MATO GROSSO', 'MT','S');

INSERT INTO estado
VALUES(NULL, 'BAHIA','BA','S');


CREATE TABLE telefone (
id INT NOT NULL PRIMARY KEY
,ddd VARCHAR(255) NOT NULL 
,telefone VARCHAR(255) NOT NULL UNIQUE
,telefone2 VARCHAR(255) NOT NULL UNIQUE
,telefone3 VARCHAR(255) NOT NULL UNIQUE
);
INSERT INTO ddd
VALUES(NULL,'44','65','77');

INSERT INTO telefone 
VALUES(NULL,'99755026','99587425','99857456');

CREATE TABLE viagem (
id INT NOT NULL PRIMARY KEY
,cidade_destino VARCHAR(255) NOT NULL 
,Cidade_origem VARCHAR(255) NOT NULL
);

CREATE TABLE prestação_de_contas (
		id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	,idViagem VARCHAR(255) NOT NULL PRIMARY KEY
    ,despesaViagem DECIMAL NOT NULL
    ,cobranças_adicionais DECIMAL NOT NULL

);
    
    
        


	