CREATE DATABASE gestao_investimentos;
USE gestao_investimentos;

CREATE TABLE proprietario(
	n_codprop TINYINT NOT NULL AUTO_INCREMENT,
    c_nomprop VARCHAR(20),
    PRIMARY KEY(n_codprop));
    
CREATE TABLE corretora(
	n_codcorre TINYINT NOT NULL AUTO_INCREMENT,
    c_nomcorre VARCHAR(40),
    PRIMARY KEY (n_codcorre));
    
CREATE TABLE emissor(
	n_codemis SMALLINT NOT NULL AUTO_INCREMENT,
    c_nomemis VARCHAR(40),
    PRIMARY KEY (n_codemis));
    
CREATE TABLE emis_corre(		/* tabela associativa */
	n_codemis SMALLINT NOT NULL,
    n_codcorre TINYINT NOT NULL,
    PRIMARY KEY (n_codemis, n_codcorre),
    CONSTRAINT fk_emis_corre_codemis FOREIGN KEY (n_codemis) REFERENCES emissor (n_codemis),
    CONSTRAINT fk_emis_corre_codcorre FOREIGN KEY (n_codcorre) REFERENCES corretora (n_codcorre));

CREATE TABLE prop_corre(		/* tabela associativa */
	n_codprop TINYINT NOT NULL,
    n_codcorre TINYINT NOT NULL,
    PRIMARY KEY (n_codprop, n_codcorre),
    CONSTRAINT fk_prop_corre_codprop FOREIGN KEY (n_codprop) REFERENCES proprietario (n_codprop),
    CONSTRAINT fk_prop_corre_codcorre FOREIGN KEY (n_codcorre) REFERENCES corretora (n_codcorre));
    
CREATE TABLE tipo_indexador(
	n_codidx TINYINT PRIMARY KEY AUTO_INCREMENT,
    c_nomidx VARCHAR(5));
    
CREATE TABLE tipo_investimento(
	n_codtipinv TINYINT PRIMARY KEY AUTO_INCREMENT,
    c_nomtipinv VARCHAR(5),
    n_codidx TINYINT NOT NULL,
    n_ir TINYINT NOT NULL,
    CONSTRAINT fk_tiponv_tipidx FOREIGN KEY (n_codidx) REFERENCES tipo_indexador (n_codidx));
    
