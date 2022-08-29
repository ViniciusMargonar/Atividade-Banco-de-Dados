CREATE DATABASE banco_vn;
-- Comando usado para criar a base dados. É possível verificar se foi criado verificando Output abaixo e os Schemas.
-- Tentamos criar novamente e deu erro (Code 1007 - Cant create database "banco_vn", database exists)

DROP DATABASE banco_vn;
-- Comando usado para deletar o base de dados, é possível verificar se foi deletado verificando o Output e os Schemas.
-- Tentamos eliminar a base de dados após ela já estar deletada e não foi possivel pois a data base não existe. Apareceu o erro no Output informando que a data base não existe.

DROP DATABASE IF EXISTS banco_vn;
-- Ao tentar deletar a base de dados que não existe, o sistema informa um aviso que não para o sistema, apenas avisa.

USE banco_vc;

CREATE TABLE funcionario (
		id INT NOT NULL PRIMARY KEY
	,nome VARCHAR(45) NOT NULL
    ,cpf VARCHAR(45) NOT NULL UNIQUE
    ,endereço VARCHAR(45) NOT NULL
    ,data_nascimento VARCHAR(45) NOT NULL

);

CREATE TABLE cidade (
		id INT NOT NULL PRIMARY KEY
	,nome VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE estado (
		id INT NOT NULL PRIMARY KEY
	,nome VARCHAR(45) NOT NULL UNIQUE
    ,sigla CHAR(2) NOT NULL UNIQUE
);

CREATE TABLE telefone (
		id INT NOT NULL PRIMARY KEY
        ,ddd VARCHAR(45) NOT NULL 
        ,telefone VARCHAR(45) NOT NULL UNIQUE
        ,telefone2 VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE viagem (
		id INT NOT NULL PRIMARY KEY
	,cidade_destino VARCHAR(45) NOT NULL 
    ,cidade_origem VARCHAR(45) NOT NULL
);

CREATE TABLE prestação_de_contas (
		id INT NOT NULL PRIMARY KEY
	,idViagem VARCHAR NOT NULL PRIMARY KEY
    ,despesaViagem DECIMAL NOT NULL
    ,cobranças_adicionais DECIMAL NOT NULL 
    

    

		
    
        


	