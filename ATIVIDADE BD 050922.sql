DROP DATABASE IF EXISTS banco_aula;

CREATE DATABASE banco_aula;

USE banco_aula;


CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S','N'))
);

INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO DO SUL','MS'), ('MINAS GERAIS','MG'), ('PARANÁ','PR');

SELECT * FROM estado;

CREATE TABLE cidade (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE(nome,estado_id)

);

INSERT INTO cidade (nome,estado_id) VALUES ('PARANAVAÍ',1), ('PARAÍSO DO NORTE',1), ('TAMBOARA',1);

SELECT * FROM cidade;

CREATE TABLE funcionario(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,cpf VARCHAR(255) NOT NULL UNIQUE
    ,nome VARCHAR(255) NOT NULL
    ,endereco VARCHAR(255) NOT NULL
    ,data_nascimento VARCHAR(255) NOT NULL
    ,login VARCHAR(10) NOT NULL 
    ,senha INT NOT NULL
	,cidade_id INT NOT NULL
    ,ativo CHAR(1) NOT NULL DEFAULT 'S'
    ,CONSTRAINT funcionario_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
	,CONSTRAINT cidade_id FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);

INSERT INTO funcionario (cpf, nome, endereco, data_nascimento, login, senha, cidade_id) VALUES ('123.456.789-10', 'Keren Apuque', 'Rua Cruzeiro do Sul', '22/10/2010', 'KEREN_A', '123456',1), ('113.456.744-10', 'Aline Yuka', 'Rua Paranavaí', '22/10/2000', 'YUKA_A', '123456',3), ('116.745.789-44', 'Vinícius Margonar', 'Rua Tamboara', '16/10/2000', 'VINIC_M', '123456',2);

SELECT * FROM funcionario;

CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,cpf VARCHAR(255) NOT NULL UNIQUE
    ,cnpj VARCHAR(255) NOT NULL UNIQUE
    ,nome_fantasia VARCHAR(255) NOT NULL
    ,razao_social VARCHAR(255) NOT NULL
	,cidade_id INT NOT NULL
    ,ativo CHAR(1) NOT NULL DEFAULT 'S'
    ,CONSTRAINT cliente_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
	,CONSTRAINT cidade_id2 FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);

INSERT INTO cliente (cpf,cnpj,nome_fantasia,razao_social,cidade_id) VALUES ('123.456.789-10','123.456.789/0001-1','LOJAS E VAREJOS','COMERCIO DE BEBIDAS LTDA.',1),('123.456.559-10','155.456.789/0001-1','GÁS DO ZÉ','COMERCIO DE GÁS LTDA.',2),('123.466.789-10','123.466.789/0001-1','MERCADINHA DA MARCIA','COMERCIO DE ALIMENTOS LTDA.',2);

SELECT * FROM cliente;

CREATE TABLE telefonef (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,funcionario_id INT NOT NULL
,telefone VARCHAR(255) NOT NULL UNIQUE
,telefone2 VARCHAR(255) UNIQUE
,telefone3 VARCHAR(255) UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,CONSTRAINT telefone_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
,CONSTRAINT funcionario_id FOREIGN KEY (funcionario_id) REFERENCES funcionario (id)

);

INSERT INTO telefonef (funcionario_id, telefone, telefone2, telefone3) VALUES (1, '998306822', '898556822','41250456'), (2, '96649922', '898399822','412505226'),(3, '998374822', '42046822','412630456');

SELECT * FROM telefonef;

CREATE TABLE telefonec(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,cliente_id INT NOT NULL
,telefone VARCHAR(255) NOT NULL UNIQUE
,telefone2 VARCHAR(255) UNIQUE
,telefone3 VARCHAR(255) UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CHECK (ativo IN('S','N'))
,CONSTRAINT telefone_ativo_deve_ser_S_ou_N CHECK (ativo IN('S', 'N'))
,CONSTRAINT cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente (id)

);

INSERT INTO telefonec (cliente_id, telefone, telefone2, telefone3) VALUES (1, '998306822', '898556822','41250456'), (2, '96649922', '898399822','412505226'),(3, '998374822', '42046822','412630456');





