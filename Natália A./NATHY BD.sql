CREATE DATABASE nathy;

DROP DATABASE nathy;

DROP DATABASE IF EXISTS nathy;

CREATE TABLE funcionario (	
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(255) NOT NULL UNIQUE
,endereço VARCHAR(255) NOT NULL
,data_nascimento DATETIME NOT NULL

);

INSERT INTO funcionario 
VALUES(NULL,'nome','cpf','endereço','data_nascimento');

INSERT INTO funcionario
VALUES(NULL,'Natália','09586587456','rua Bahi','27/04/1997');

SELECT * FROM funcionario;

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

SELECT * FROM cidade;

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


SELECT * FROM estado;


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
,cidade_destino INT NOT NULL 
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT Cidade_origem FOREIGN KEY (cidade_origem) REFERENCES cidade (origem)
);

INSERT INTO viagem
VALUES(NULL,'cidade origem','cidade destino');

INSERT INTO viagem
VALUES(NULL,'Paranavai','Maringá');

SELECT * FROM viagem

CREATE TABLE prestação_de_contas (
		id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	,idViagem VARCHAR(255) NOT NULL PRIMARY KEY
    ,despesaViagem DECIMAL NOT NULL
    ,cobranças_adicionais DECIMAL NOT NULL
);

INSERT INTO prestação_de_contas
VALUES(NULL,'despesaViagem'

