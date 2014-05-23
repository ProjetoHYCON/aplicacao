CREATE DATABASE hycon_db;

USE hycon_db;

CREATE TABLE link(
cod_link INT PRIMARY KEY AUTO_INCREMENT,
nom_link VARCHAR(50) NOT NULL,
url_link TEXT NOT NULL);

CREATE TABLE parceiro(
cod_parceiro INT PRIMARY KEY AUTO_INCREMENT,
nom_parceiro VARCHAR(50) NOT NULL,
url_parceiro TEXT,
bin_logo BLOB);

CREATE TABLE categoria(
cod_categoria INT PRIMARY KEY AUTO_INCREMENT,
nom_categoria VARCHAR(50) NOT NULL,
dsc_categoria TEXT);

CREATE TABLE informativo(
cod_informativo INT PRIMARY KEY AUTO_INCREMENT,
nom_informativo VARCHAR(50) NOT NULL,
dsc_informativo LONGTEXT,
cod_categoria INT,
FOREIGN KEY (cod_categoria) REFERENCES categoria (cod_categoria));

CREATE TABLE tipo_documento(
cod_tipo_documento INT PRIMARY KEY AUTO_INCREMENT,
nom_tipo_documento VARCHAR(50) NOT NULL,
dsc_tipo_documento TEXT,
cod_categoria INT, 
FOREIGN KEY (cod_categoria) REFERENCES categoria (cod_categoria));

CREATE TABLE documento(
cod_documento INT PRIMARY KEY AUTO_INCREMENT,
nom_documento VARCHAR(50) NOT NULL,
bin_arquivo LONGBLOB NOT NULL,
cod_tipo_documento INT, 
FOREIGN KEY (cod_tipo_documento) REFERENCES tipo_documento (cod_tipo_documento));

CREATE TABLE cliente(
cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
nom_cliente VARCHAR(50) NOT NULL);

CREATE TABLE usuario(
cod_usuario INT PRIMARY KEY AUTO_INCREMENT,
nom_usuario VARCHAR(50) NOT NULL,
cod_cliente INT, 
FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente),
txt_login VARCHAR(50) NOT NULL UNIQUE,
txt_senha VARCHAR(100) NOT NULL);

CREATE TABLE cliente_categoria(
cod_cliente INT, 
FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente),
cod_categoria INT, 
FOREIGN KEY (cod_categoria) REFERENCES categoria (cod_categoria));

CREATE TABLE usuario_tipo_documento(
cod_tipo_documento INT, 
FOREIGN KEY (cod_tipo_documento) REFERENCES tipo_documento (cod_tipo_documento),
cod_usuario INT, 
FOREIGN KEY (cod_usuario) REFERENCES usuario (cod_usuario));