CREATE DATABASE banco_vn;
-- Comando usado para criar a base dados. É possível verificar se foi criado verificando Output abaixo e os Schemas.
-- Tentamos criar novamente e deu erro (Code 1007 - Cant create database "banco_vn", database exists)

DROP DATABASE banco_vn;
-- Comando usado para deletar o base de dados, é possível verificar se foi deletado verificando o Output e os Schemas.
-- Tentamos eliminar a base de dados após ela já estar deletada e não foi possivel pois a data base não existe. Apareceu o erro no Output informando que a data base não existe.

DROP DATABASE IF EXISTS banco_vn;
-- Ao tentar deletar a base de dados que não existe, o sistema informa um aviso que não para o sistema, apenas avisa.

USE banco_vn;

CREATE TABLE funcionario (
	id INT NOT NULL PRIMARY KEY
    ,cpf VARCHAR(255) NOT NULL UNIQUE
    ,nome VARCHAR(255) NOT NULL
    ,endereco VARCHAR(255) NOT NULL
	,data_nascimento VARCHAR(255) NOT NULL
    ,login VARCHAR(255) NOT NULL UNIQUE
    ,senha INT NOT NULL 
);

CREATE TABLE cidade (
	id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE estado (
	id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(255) NOT NULL UNIQUE
    ,sigla CHAR(2) NOT NULL UNIQUE
    ,ativo CHAR DEFAULT 'A' NOT NULL
    ,CHECK (STATUS IN ('A','I'))
);

CREATE TABLE telefone (
	id INT NOT NULL PRIMARY KEY
	,telefone VARCHAR(255) NOT NULL UNIQUE
    ,telefone2 VARCHAR(255) NOT NULL UNIQUE
    ,telefone3 VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE honorario (
	id INT NOT NULL PRIMARY KEY
    ,valor DECIMAL NOT NULL
    ,descricao_servicos VARCHAR(255) NOT NULL
);

CREATE TABLE pagamento (
	id INT NOT NULL PRIMARY KEY
    ,status_p BOOLEAN NOT NULL UNIQUE
    ,total_final DECIMAL NOT NULL
    ,cobrancas_adicionais DECIMAL NOT NULL
    ,descontos DECIMAL NOT NULL
    ,juros DECIMAL NOT NULL
    ,valor DECIMAL NOT NULL
	,numero_parcela INT NOT NULL UNIQUE
);

CREATE TABLE cliente (
	id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(255) NOT NULL
    ,endereco VARCHAR(255) NOT NULL
	,data_nascimento VARCHAR(255) NOT NULL
    ,CNPJ VARCHAR(255) NOT NULL UNIQUE
    ,razao_social VARCHAR(255) NOT NULL UNIQUE
    ,nome_fantasia VARCHAR(255) NOT NULL
    
);

CREATE TABLE cidade_c (
	id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE estado_c (
	id INT NOT NULL PRIMARY KEY
    ,nome VARCHAR(255) NOT NULL UNIQUE
    ,sigla CHAR(2) NOT NULL UNIQUE
    ,ativo CHAR DEFAULT 'A' NOT NULL
    ,CHECK (STATUS IN ('A','I'))
);

CREATE TABLE telefone_c (
	id INT NOT NULL PRIMARY KEY
    ,telefone VARCHAR(255) NOT NULL UNIQUE
    ,telefone2 VARCHAR(255) NOT NULL UNIQUE
    ,telefone3 VARCHAR(255) NOT NULL UNIQUE
);
