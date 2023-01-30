-- João Marcelo Danza Gandini
-- João Vitor Apolinário
-- Tiago Zardetto Hourneaux
-- Tuanne Assenço Pessoa

-- ----------------------------------------------
-- CRIAÇÃO DO BANCO DE DADOS
-- ----------------------------------------------

-- -----------------------------------------------------
-- Schema mat_construcao
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mat_construcao` ;
CREATE SCHEMA IF NOT EXISTS `mat_construcao` DEFAULT CHARACTER SET utf8 ;
USE `mat_construcao`;

-- -----------------------------------------------------
-- Table `mat_construcao`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`fornecedor` (
  `cnpj_fornecedor` VARCHAR(11) NOT NULL,
  `nom_fornecedor` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `complemento` VARCHAR(20) NULL,
  `bairro` VARCHAR(30) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`cnpj_fornecedor`),
  UNIQUE INDEX `id_fornecedor_UNIQUE` (`cnpj_fornecedor` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mat_construcao`.`tipo_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`tipo_telefone` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`tipo_telefone` (
  `cod_tipo_telefone` INT NOT NULL,
  `desc_tipo_telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_tipo_telefone`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mat_construcao`.`fornec_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`fornec_telefone` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`fornec_telefone` (
  `tipo_telefone_cod_tipo_telefone` INT NOT NULL,
  `fornecedor_cnpj_fornecedor` VARCHAR(11) NOT NULL,
  `tel_fornecedor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`tipo_telefone_cod_tipo_telefone`),
  INDEX `fk_fornec_telefone_fornecedor1_idx` (`fornecedor_cnpj_fornecedor` ASC) VISIBLE,
  INDEX `fk_fornec_telefone_tipo_telefone1_idx` (`tipo_telefone_cod_tipo_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_fornec_telefone_fornecedor1`
    FOREIGN KEY (`fornecedor_cnpj_fornecedor`)
    REFERENCES `mat_construcao`.`fornecedor` (`cnpj_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornec_telefone_tipo_telefone1`
    FOREIGN KEY (`tipo_telefone_cod_tipo_telefone`)
    REFERENCES `mat_construcao`.`tipo_telefone` (`cod_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mat_construcao`.`categoria_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`categoria_produto` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`categoria_produto` (
  `cod_categoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `desc_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_categoria`),
  UNIQUE INDEX `cod_categoria_UNIQUE` (`cod_categoria` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mat_construcao`.`tipo_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`tipo_produto` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`tipo_produto` (
  `cod_tipo_produto` VARCHAR(10) NOT NULL,
  `desc_tipo_produto` VARCHAR(45) NOT NULL,
  `cod_categoria` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `id_tipo_produto_UNIQUE` (`cod_tipo_produto` ASC) VISIBLE,
  PRIMARY KEY (`cod_tipo_produto`, `cod_categoria`),
  INDEX `fk_tipo_produto_categoria_produto1_idx` (`cod_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_produto_categoria_produto1`
    FOREIGN KEY (`cod_categoria`)
    REFERENCES `mat_construcao`.`categoria_produto` (`cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`produto` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`produto` (
  `cod_produto` VARCHAR(20) NOT NULL,
  `desc_produto` VARCHAR(250) NOT NULL,
  `unid_medida` VARCHAR(5) NOT NULL,
  `cod_tipo_produto` VARCHAR(10) NOT NULL,
  `cod_categoria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_produto`, `cod_tipo_produto`, `cod_categoria`),
  UNIQUE INDEX `id_produto_UNIQUE` (`cod_produto` ASC) VISIBLE,
  INDEX `fk_produto_tipo_produto1_idx` (`cod_tipo_produto` ASC, `cod_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_produto_tipo_produto1`
    FOREIGN KEY (`cod_tipo_produto` , `cod_categoria`)
    REFERENCES `mat_construcao`.`tipo_produto` (`cod_tipo_produto` , `cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`cliente` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`cliente` (
  `cpf_cliente` VARCHAR(11) NOT NULL,
  `nom_cliente` VARCHAR(45) NOT NULL,
  `nom_rua` VARCHAR(45) NOT NULL,
  `num_residencia` VARCHAR(5) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(30) NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  `sexo` VARCHAR(10) NOT NULL,
  `dat_nasc` DATE NOT NULL,
  `dat_cadastro` DATE NOT NULL,
  PRIMARY KEY (`cpf_cliente`),
  UNIQUE INDEX `cpf_cliente_UNIQUE` (`cpf_cliente` ASC) VISIBLE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`funcionario` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`funcionario` (
  `cpf_func` VARCHAR(11) NOT NULL,
  `nom_func` VARCHAR(45) NOT NULL,
  `nom_rua` VARCHAR(45) NOT NULL,
  `num_residencia` VARCHAR(5) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(30) NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  `sexo` VARCHAR(10) NOT NULL,
  `dat_nasc` DATE NOT NULL,
  `dat_admissao` DATE NOT NULL,
  `login` VARCHAR(15) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf_func`),
  UNIQUE INDEX `cpf_cliente_UNIQUE` (`cpf_func` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mat_construcao`.`forma_pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`forma_pagamento` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`forma_pagamento` (
  `cod_forma_pagamento` INT NOT NULL AUTO_INCREMENT,
  `desc_forma_pagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_forma_pagamento`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`venda` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`venda` (
  `cod_venda` INT NOT NULL AUTO_INCREMENT,
  `cpf_cliente` VARCHAR(11) NOT NULL,
  `cpf_func` VARCHAR(11) NOT NULL,
  `dat_venda` DATE NOT NULL,
  `vlr_bruto_venda` DECIMAL(8,2) NOT NULL,
  `vlr_desconto` DECIMAL(8,2) NULL,
  `vlr_liquido_venda` DECIMAL(8,2) NOT NULL,
  `forma_pagamento_cod_forma_pagamento` INT NOT NULL,
  PRIMARY KEY (`cod_venda`),
  UNIQUE INDEX `id_venda_UNIQUE` (`cod_venda` ASC) VISIBLE,
  INDEX `fk_venda_cliente1_idx` (`cpf_cliente` ASC) VISIBLE,
  INDEX `fk_venda_funcionario1_idx` (`cpf_func` ASC) VISIBLE,
  INDEX `fk_venda_forma_pagamento1_idx` (`forma_pagamento_cod_forma_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `mat_construcao`.`cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_funcionario1`
    FOREIGN KEY (`cpf_func`)
    REFERENCES `mat_construcao`.`funcionario` (`cpf_func`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_forma_pagamento1`
    FOREIGN KEY (`forma_pagamento_cod_forma_pagamento`)
    REFERENCES `mat_construcao`.`forma_pagamento` (`cod_forma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`compra` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`compra` (
  `cod_compra` INT NOT NULL AUTO_INCREMENT,
  `cpf_func` VARCHAR(11) NOT NULL,
  `cnpj_fornecedor` VARCHAR(11) NOT NULL,
  `dat_compra` DATE NOT NULL,
  `vlr_total_compra` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`cod_compra`),
  UNIQUE INDEX `id_venda_UNIQUE` (`cod_compra` ASC) VISIBLE,
  INDEX `fk_compra_funcionario1_idx` (`cpf_func` ASC) VISIBLE,
  INDEX `fk_compra_fornecedor1_idx` (`cnpj_fornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_compra_funcionario1`
    FOREIGN KEY (`cpf_func`)
    REFERENCES `mat_construcao`.`funcionario` (`cpf_func`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_fornecedor1`
    FOREIGN KEY (`cnpj_fornecedor`)
    REFERENCES `mat_construcao`.`fornecedor` (`cnpj_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`cliente_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`cliente_telefone` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`cliente_telefone` (
  `tipo_telefone_cod_tipo_telefone` INT NOT NULL,
  `cpf_cliente` VARCHAR(11) NOT NULL,
  `tel_cliente` VARCHAR(11) NOT NULL,
  INDEX `fk_clente_telefone_cliente1_idx` (`cpf_cliente` ASC) VISIBLE,
  PRIMARY KEY (`tel_cliente`),
  INDEX `fk_cliente_telefone_tipo_telefone1_idx` (`tipo_telefone_cod_tipo_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_clente_telefone_cliente1`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `mat_construcao`.`cliente` (`cpf_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_telefone_tipo_telefone1`
    FOREIGN KEY (`tipo_telefone_cod_tipo_telefone`)
    REFERENCES `mat_construcao`.`tipo_telefone` (`cod_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`func_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`func_telefone` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`func_telefone` (
  `tipo_telefone_cod_tipo_telefone` INT NOT NULL,
  `funcionario_cpf_func` VARCHAR(11) NOT NULL,
  `tel_funcionario` VARCHAR(11) NOT NULL,
  INDEX `fk_func_telefone_funcionario1_idx` (`funcionario_cpf_func` ASC) VISIBLE,
  PRIMARY KEY (`tel_funcionario`),
  INDEX `fk_func_telefone_tipo_telefone1_idx` (`tipo_telefone_cod_tipo_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_func_telefone_funcionario1`
    FOREIGN KEY (`funcionario_cpf_func`)
    REFERENCES `mat_construcao`.`funcionario` (`cpf_func`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_func_telefone_tipo_telefone1`
    FOREIGN KEY (`tipo_telefone_cod_tipo_telefone`)
    REFERENCES `mat_construcao`.`tipo_telefone` (`cod_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`compra_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`compra_produto` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`compra_produto` (
  `compra_cod_compra` INT NOT NULL,
  `produto_cod_produto` VARCHAR(30) NOT NULL,
  `produto_cod_tipo_produto` VARCHAR(10) NOT NULL,
  `produto_cod_categoria` INT UNSIGNED NOT NULL,
  `vlr_custo_unit_produto` DECIMAL(7,2) NOT NULL,
  `qtd_produto` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`compra_cod_compra`, `produto_cod_produto`, `produto_cod_tipo_produto`, `produto_cod_categoria`),
  INDEX `fk_compra_has_produto_produto1_idx` (`produto_cod_produto` ASC, `produto_cod_tipo_produto` ASC, `produto_cod_categoria` ASC) VISIBLE,
  INDEX `fk_compra_has_produto_compra1_idx` (`compra_cod_compra` ASC) VISIBLE,
  CONSTRAINT `fk_compra_has_produto_compra1`
    FOREIGN KEY (`compra_cod_compra`)
    REFERENCES `mat_construcao`.`compra` (`cod_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_produto_produto1`
    FOREIGN KEY (`produto_cod_produto` , `produto_cod_tipo_produto` , `produto_cod_categoria`)
    REFERENCES `mat_construcao`.`produto` (`cod_produto` , `cod_tipo_produto` , `cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mat_construcao`.`venda_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mat_construcao`.`venda_produto` ;

CREATE TABLE IF NOT EXISTS `mat_construcao`.`venda_produto` (
  `venda_cod_venda` INT NOT NULL,
  `produto_cod_produto` VARCHAR(30) NOT NULL,
  `produto_cod_tipo_produto` VARCHAR(10) NOT NULL,
  `produto_cod_categoria` INT UNSIGNED NOT NULL,
  `vlr_unit_produto` DECIMAL(5,2) NULL,
  `qtd_produto` DECIMAL(5,2) NULL,
  PRIMARY KEY (`venda_cod_venda`, `produto_cod_produto`, `produto_cod_tipo_produto`, `produto_cod_categoria`),
  INDEX `fk_venda_has_produto_produto1_idx` (`produto_cod_produto` ASC, `produto_cod_tipo_produto` ASC, `produto_cod_categoria` ASC) VISIBLE,
  INDEX `fk_venda_has_produto_venda1_idx` (`venda_cod_venda` ASC) VISIBLE,
  CONSTRAINT `fk_venda_has_produto_venda1`
    FOREIGN KEY (`venda_cod_venda`)
    REFERENCES `mat_construcao`.`venda` (`cod_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_has_produto_produto1`
    FOREIGN KEY (`produto_cod_produto` , `produto_cod_tipo_produto` , `produto_cod_categoria`)
    REFERENCES `mat_construcao`.`produto` (`cod_produto` , `cod_tipo_produto` , `cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- ----------------------------------------------
-- CARGA DE DADOS
-- ----------------------------------------------

SELECT * FROM fornecedor;
INSERT INTO fornecedor
(cnpj_fornecedor,nom_fornecedor,rua,numero,complemento,bairro,cep,cidade,estado,email)
VALUES  ('1586721201', 'Joao', 'Rua Sao Paulo', '035','24-BlocoB', 'Aparecida','24532100','São Paulo','SP','joao@gmail.com'),
	    ('4567821302', 'Aline', 'Av.Brasil', '20','10-BlocoA', 'Jardins','10538915','São Paulo', 'SP', 'aline@gmail.com'),
		('2389364803', 'Carlos', 'Rua Paraguai', '310','02-BlocoC', 'Centro','36147899','Vila Velha','ES','carlos@gmail.com'),
		('7525128404', 'Vitor', 'Rua Princesa Isabel', '41','não há', 'Vila Nova','49035132','Betim','MG','vitor@gmail.com'),                  
		('6291430505', 'Cecília', 'Rua Sete de Setembro', '56','20-BlocoB', 'Boa Vista','74241055','Vitória','ES', 'cecilia@gmail.com'),
		('8912034506', 'Thiago', 'Rua Tiradentes', '169','não há', 'Planalto','90901103','Poços de Caldas','MG','thiago@gmail.com'),
		('3415319507', 'Kauan', 'Rua Amazonas', '70','200', 'Gávea','11040110','Rio de Janeiro','RJ','kauan@gmail.com'),
		('5588111308', 'Maria', 'Av.Marechal', '682','90-BlocoB', 'Vila Belmiro','30201801','Santos','SP','maria@gmail.com'),
		('9911232309', 'Bruno', 'Rua Assis Figueiredo', '91','100', 'Anchieta','12378933','Porto Alegre', 'RS','bruno@gmail.com'),
        ('7812346700', 'Pedro', 'Rua Leão', '101','não há', 'Pacatá','68690012','Porto Seguro','BA','pedro@gmail.com');


SELECT * FROM	tipo_telefone;
INSERT INTO tipo_telefone
(cod_tipo_telefone, desc_tipo_telefone)
VALUES 	('01','Telefone Fixo'),
		('02','Celular');
        
SELECT * FROM  categoria_produto;
INSERT INTO categoria_produto
(cod_categoria, desc_categoria)
VALUES 	('04','Vedações Internas e Externas'),
	    ('15','Sistemas Hidráulicos e Mecânicos'),
       	('16','Sistemas Elétricos e de Comunicação');
       
SELECT * FROM tipo_produto;
INSERT INTO   tipo_produto
(cod_tipo_produto, desc_tipo_produto, cod_categoria)
VALUES 		('04211','Alvenaria de peças de barro/cerâmica-vedação','04'),
		    ('04221','Alvenaria de peças de concreto','04'),
		    ('04270','Alvenaria de peças de vidro','04'),
        	('15142','Tubos/conexões de PVC soldável-água fria','15'),
       		('15152','Tubos/conexões de PVC-esgoto série normal','15'),
        	('15410','Aparelhos sanitários','15'),
        	('16132','Eletrodutos de PVC e conexões','16'),
        	('16141','Disjuntores','16'),
        	('16143','Interruptores e tomadas','16');

SELECT * FROM	produto;
INSERT INTO 	produto
(cod_produto, desc_produto, unid_medida, cod_tipo_produto, cod_categoria)
VALUES 	
		    ('04211.3.1.1', 'Bloco cerâmico vazado de vedação - bloco inteiro 9 x 19 x 39 (comprimento: 390 mm / largura: 90 mm / altura: 190 mm)',	'un', '04211', '04'),
		('04211.3.1.2', 'Bloco cerâmico vazado de vedação - bloco inteiro 14 x 19 x 39 (comprimento: 390 mm / largura: 140 mm / altura: 190 mm)', 'un','04211', '04'),
		('04211.3.1.3', 'Bloco cerâmico vazado de vedação - bloco inteiro 19 x 19 x 39 (comprimento: 390 mm / largura: 190 mm / altura: 190 mm)', 'un','04211', '04'),
		('04211.3.2.1', 'Tijolo cerâmico furado de vedação 9 x 19 x 19 (comprimento: 190 mm / largura: 90 mm / altura: 190 mm)', 'un','04211', '04'),
		('04211.3.3.2', 'Tijolo cerâmico laminado de vedação 5,5 x 11 x 23,5 (comprimento: 235 mm / largura: 55 mm / altura: 110 mm)', 'un','04211', '04'),
		('04211.3.4.1', 'Tijolo comum maciço 5,7 x 9 x 19 (comprimento: 190,00 mm / largura: 90,00 mm / altura: 57,00 mm)', 'un','04211', '04'),
		('04221.3.1.1', 'Bloco de concreto aparente - bloco inteiro 9 x 19 x 39 (comprimento: 390 mm / largura: 90 mm / altura: 190 mm','un', '04221', '04'),
		('04221.3.1.2', 'Bloco de concreto aparente - bloco inteiro 14 x 19 x 39 (comprimento: 390 mm / largura: 140 mm / altura: 190 mm)', 'un', '04221', '04'),
		('04221.3.1.3', 'Bloco de concreto aparente - bloco inteiro 19 x 19 x 39 (comprimento: 390 mm / largura: 190 mm / altura: 190 mm)', 'un', '04221', '04'),
		('04221.3.2.1', 'Bloco de concreto de vedação - bloco inteiro 6,7 x 19 x 39 (comprimento: 390 mm / largura: 67 mm / altura: 190 mm)', 'un', '04221', '04'),
		('04221.3.2.2', 'Bloco de concreto de vedação - bloco inteiro 9 x 19 x 39 (comprimento: 390 mm / largura: 90 mm / altura: 190 mm)', 'un', '04221', '04'),
		('04221.3.2.3', 'Bloco de concreto de vedação - bloco inteiro 11,5 x 19 x 39 (comprimento: 390 mm / largura: 190 mm / altura: 115 mm)', 'un', '04221', '04'),
		('04221.3.2.4', 'Bloco de concreto de vedação - bloco inteiro 14 x 19 x 39 (comprimento: 390 mm / largura: 140 mm / altura: 190 mm)', 'un', '04221', '04'),
		('04221.3.2.5', 'Bloco de concreto de vedação - bloco inteiro 19 x 19 x 39 (comprimento: 390 mm / largura: 190 mm / altura: 190 mm)', 'un', '04221', '04'), 
		('04221.3.3.10', 'Bloco de concreto celular autoclavado de vedação 17,5 x 30 x 60 (comprimento: 600 mm / largura: 175 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.11', 'Bloco de concreto celular autoclavado de vedação 15 x 30 x 60 (comprimento: 600 mm / largura: 150 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.12', 'Bloco de concreto celular autoclavado de vedação 20 x 30 x 60 (comprimento: 600 mm / largura: 200 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.13', 'Bloco de concreto celular autoclavado de vedação 25 x 30 x 60 (comprimento: 600 mm / largura: 250 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.14', 'Bloco de concreto celular autoclavado de vedação 30 x 30 x 60 (comprimento: 600 mm / largura: 300 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.8', 'Bloco de concreto celular autoclavado de vedação 10 x 30 x 60 (comprimento: 600 mm / largura: 100 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04221.3.3.9', 'Bloco de concreto celular autoclavado de vedação 12,5 x 30 x 60 (comprimento: 600 mm / largura: 125 mm / altura: 300 mm)', 'm²', '04221', '04'),
		('04270.3.1.1', 'Placa de vidro quadriculado (comprimento: 200 mm / largura: 60 mm / altura: 200 mm)','un', '04270', '04'),
		('04270.3.2.1', 'Elemento vazado de vidro (comprimento: 100 mm / largura: 200 mm / altura: 80 mm)','un', '04270', '04'),
		('04270.3.2.2', 'Elemento vazado de vidro (comprimento: 100 mm / largura: 200 mm / altura: 100 mm)','un', '04270', '04'),
		('15142.3.23.1','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 20,00 mm)','m', '15142', '15'),
		('15142.3.23.2','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 25,00 mm)','m', '15142', '15'),
		('15142.3.23.3','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 32,00 mm)','m', '15142', '15'),
		('15142.3.23.4','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 40,00 mm)','m', '15142', '15'),
		('15142.3.23.5','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 50,00 mm)','m', '15142', '15'),
		('15142.3.23.6','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 60,00 mm)','m', '15142', '15'),
		('15142.3.23.7','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 75,00 mm)','m', '15142', '15'),
		('15142.3.23.8','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 85,00 mm)','m', '15142', '15'),
		('15142.3.23.9','Tubo soldável de PVC marrom para água fria (diâmetro da seção: 110,00 mm)','m', '15142', '15'),
		('15152.3.10.1','Joelho 45 PB soldável de PVC branco para esgoto serie normal (diâmetro da seção: 40,00 mm)','un', '15152', '15'),
		('15152.3.11.1','Joelho 45 PBV de PVC branco para esgoto serie normal (diâmetro da seção: 50,00 mm)','un', '15152', '15'),
		('15152.3.11.2','Joelho 45 PBV de PVC branco para esgoto serie normal (diâmetro da seção: 75,00 mm)','un', '15152', '15'),
		('15152.3.11.3','Joelho 45 PBV de PVC branco para esgoto serie normal (diâmetro da seção: 100,00 mm)','un', '15152', '15'),
		('15152.3.28.1','Tubo PB soldável de PVC branco para esgoto serie normal (diâmetro da seção: 40,00 mm)','m', '15152', '15'),
		('15152.3.29.1','Tubo PBV de PVC branco para esgoto serie normal (diâmetro da seção: 50,00 mm)','m', '15152', '15'),
		('15152.3.29.2','Tubo PBV de PVC branco para esgoto serie normal (diâmetro da seção: 100,00 mm)','m', '15152', '15'),
		('15152.3.29.3','Tubo PBV de PVC branco para esgoto serie normal (diâmetro da seção: 75,00 mm)','m', '15152', '15'),
		('15152.3.29.4','Tubo PBV de PVC branco para esgoto serie normal (diâmetro da seção: 150,00 mm)','m', '15152', '15'),
		('15152.3.19.1','Luva simples PB soldável de PVC branco para esgoto para esgoto serie normal (diâmetro da seção: 40,00 mm)','un', '15152', '15'),
        ('15410.3.14.1','Lavatório de louça para coluna - padrao popular','un', '15410', '15'),
		('15410.3.14.2','Lavatório de louça de embutir (cuba) - padrao popular','un', '15410', '15'),
		('15410.3.14.3','Lavatório de louça suspenso - padrao popular','un', '15410', '15'),
		('15410.3.24.2','Tanque de aço inoxidável simples (comprimento: 0,60 m / largura: 0,55 m / altura: 0,23 m / volume: 30,00 l)', 'un', '15410', '15'),
		('15410.3.29.1','Torneira de pressão para lavatório de mesa - padrão médio','un', '15410', '15'),
		('15410.3.3.9','Bacia de louça para caixa acoplada - padrao popular','un', '15410', '15'),
		('15410.3.30.1','Torneira de pressão para pia longa de parede - padrão popular','un', '15410', '15'),
		('15410.3.31.1','Torneira de pressão para uso geral de parede','un', '15410', '15'),
		('15410.3.49.1','Misturador para pia de mesa - padrão popular','un', '15410', '15'),
		('15410.3.49.2','Misturador para pia de parede - padrão popular','un', '15410', '15'),
        ('16132.3.3.1','Eletroduto de PVC rígido roscável (diâmetro da seção: 1/2 ")','m', '16132', '16'),
		('16132.3.3.2','Eletroduto de PVC rígido roscável (diâmetro da seção: 3/4 ")','m', '16132', '16'),
        ('16132.3.3.3','Eletroduto de PVC rígido roscável (diâmetro da seção: 1 ")','m', '16132', '16'),
		('16132.3.3.4','Eletroduto de PVC rígido roscável (diâmetro da seção: 1 1/4 ")','m', '16132', '16'),
		('16132.3.3.5','Eletroduto de PVC rígido roscável (diâmetro da seção: 1 1/2 ")','m', '16132', '16'),
		('16132.3.4.1','Luva de PVC rígido roscável para eletroduto (diâmetro da seção: 1/2 ")','un', '16132', '16'),
		('16132.3.4.2','Luva de PVC rígido roscável para eletroduto (diâmetro da seção: 3/4 ")','un', '16132', '16'),
		('16132.3.4.3','Luva de PVC rígido roscável para eletroduto (diâmetro da seção: 1 ")','un', '16132', '16'),
		('16132.3.4.4','Luva de PVC rígido roscável para eletroduto (diâmetro da seção: 1 1/4 ")','un', '16132', '16'),
		('16132.3.4.5','Luva de PVC rígido roscável para eletroduto (diâmetro da seção: 1 1/2 ")','un', '16132', '16'),
		('16141.3.1.12','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 1,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.13','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 2,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.14','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 4,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.15','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 6,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.16','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 10,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.17','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 16,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.18','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 20,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.19','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 25,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.20','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 32,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
		('16141.3.1.21','Disjuntor para sistemas prediais e comerciais padrão europeu- bipolar (corrente elétrica: 40,00 A / tipo de curva característica: C / ICC baixa tensão NBR IEC 60898: 4,0 kA / ICC alta tensão NBR IEC 60898: 3,0 kA)','un', '16141', '16'),
        ('16143.3.1.2','Placa (espelho) para caixa 4x2 - 3 postos','un', '16143', '16'),
        ('16143.3.1.3','Placa (espelho) para caixa 4x4 - 2 postos + 2 postos','un', '16143', '16'),
		('16143.3.2.18','Interruptor de embutir 1 tecla simples (tensão: 250 V / corrente elétrica: 10 A)','un', '16143', '16'),
		('16143.3.2.19','Interruptor de embutir 1 tecla paralelo (tensão: 250 V / corrente elétrica: 10 A)','un', '16143', '16'),
		('16143.3.2.20','Interruptor de embutir 2 teclas simples (tensão: 250 V / corrente elétrica: 10 A)','un', '16143', '16'),
		('16143.3.2.21','Interruptor de embutir 1 tecla simples e 1 paralelo (tensão: 250 V / corrente elétrica: 10 A)','un', '16143', '16'),
		('16143.3.4.1','Tomada de embutir 2 pólos+terra (tensão: 250,00 V / corrente elétrica: 20 A)','un', '16143', '16'),
		('16143.3.4.12','Tomada de embutir de telefone 4 pólos (padrão: TELEBRÁS)','un', '16143', '16'),
		('16143.3.4.13','Tomada de embutir para pino Jack 1/4','un', '16143', '16'),
		('16143.3.4.2','Tomada de embutir universal 2 pólos redonda (tensão: 250,00 V / corrente elétrica: 10,00 A)','un', '16143', '16'); 
        
SELECT * FROM cliente;
INSERT INTO   cliente
(cpf_cliente, nom_cliente, nom_rua, num_residencia, bairro, complemento, cidade, estado, cep, RG, sexo, dat_nasc, dat_cadastro)
VALUES  ('12345678901','Carlos', 'Rua dois', '1', 'Jardim dos Estados', 'bloco 1 apto 12', 'Poços de Caldas', 'MG', '34550981','10.234.123', 'Masculino','1990-02-04','2021-12-01'),
		('11235698702','Douglas', 'Rua Minas Gerais', '5', 'Jardim Primavera', 'bloco 2 apto 03', 'Belo Horizonte', 'MG', '36889076','12.789.234', 'Masculino','1991-04-10','2021-12-02'),
		('04578633512','Amanda', 'Rua sete', '45', 'Centro', 'bloco 3 apto 30', 'São Paulo', 'SP', '97671021', '13.776.324', 'Feminino','1995-05-12','2021-12-03'),
		('21377499734','Marcela', 'Rua Quinze de Novembro', '23', 'Laranjeiras', 'bloco 4 apto 32', 'Rio de Janeiro', 'RJ','74345677', '16.446.087', 'Feminino','1986-07-25','2021-12-04'),
		('09233190614','Marcos', 'Rua Rio Grande do Sul', '70', 'Centro', 'bloco 8 apto 20', 'Porto Alegre', 'RS', '37609912', '01.901.876', 'Masculino','1989-11-17','2021-12-05'),
		('76520287410','Jorge', 'Rua cinco', '16', 'Centro', 'bloco 7 apto 10', 'Varginha', 'MG', '10224577', '20.432.778', 'Masculino','1996-06-07','2021-12-06'),
        ('12594322316','Fernanda', 'Rua Sete de Setembro', '85', 'Vila Industrial', 'bloco 12 apto 56', 'Campinas', 'SP', '38996543','21.321.665', 'Feminino','1997-12-02','2021-12-07'),
        ('20910254275','Laura', 'Rua vinte', '14', 'Vila Nova', 'bloco 8 apto 32', 'Santos', 'SP', '21334509', '13.446.112', 'Feminino','1975-08-29','2021-12-10'),
        ('08430466321','Lucas', 'Rua quinze', '70', 'Jardim Europa', 'bloco 11 apto 17', 'Pouso Alegre', 'MG', '38990762', '19.966.032', 'Masculino','1982-03-21','2021-12-09'),
		('20991255205','Mateus', 'Rua oito', '40', 'Alvorada', 'bloco 14 apto 56', 'Manaus', 'AM', '37809122', '43.753.223', 'Masculino','1998-09-18','2021-12-13');

SELECT * FROM funcionario;
INSERT INTO   funcionario
(cpf_func, nom_func, nom_rua, num_residencia, bairro, complemento, cidade, estado, cep, RG, sexo, dat_nasc, dat_admissao, login, senha, cargo)        
VALUES  ('03456722202', 'Caio', 'Rua Abílio Narcizo Pereira', '10', 'Jardim São Paulo', 'bloco 1 apto 5', 'Poços de Caldas', 'MG', '37704652', '48.332.098', 'Masculino', '1992-02-02', '2021-04-01', '001', 'caio123', 'vendedor'),
        ('03400998730', 'Roberto', 'Rua um', '19', 'Centro', 'bloco 4 apto 30', 'Belo Horizonte', 'MG', '12778001', '28.347.088', 'Masculino', '1990-07-14', '2021-05-03', '002', 'roberto123', 'repositor de estoque'),
        ('06650128844', 'Fernando', 'Rua nove', '55', 'Inconfidentes', 'bloco 5 apto 34', 'Contagem', 'MG', '20784642', '38.312.068', 'Masculino', '1980-07-12', '2021-06-05', '003', 'fernando123', 'Consultor de vendas'),
        ('02423111105', 'Maria', 'Rua dois', '30', 'Vila Augusta', 'bloco 3 apto 42', 'Guarulhos', 'SP', '16234032', '22.119.030', 'Feminino', '1989-11-23', '2015-10-21', '004', 'maria123', 'coordenadora de vendas'),
        ('11122233344', 'Jessica', 'Rua vinte', '74', 'Jardim Social', 'bloco 8 apto 65', 'Curitiba', 'PR', '10223044', '25.322.048', 'Feminino', '1983-12-13', '2014-02-16', '005', 'jessica123', 'Supervisor de vendas'),
        ('01433477788', 'Claudio', 'Rua sete', '21', 'Bom Retiro', 'bloco 1 apto 27', 'Betim', 'MG', '04856221', '68.322.408', 'Masculino', '1978-02-02', '2010-10-01', '006', 'claudio123', 'Gerente de vendas'),
        ('20901133322', 'Otavio', 'Rua cinquenta', '36', 'Aldeota', 'bloco 8 apto 49', 'Fortaleza', 'CE', '31123045', '99.244.001', 'Masculino', '1974-02-02', '2011-09-20', '007', 'otavio123', 'Gestor de marketing'),
        ('19855526660', 'Leticia', 'Rua doze', '33', 'Boa Vista', 'bloco 9 apto 62', 'Juiz de Fora', 'MG', '37302555', '75.189.099', 'Feminino', '2000-07-10', '2019-10-20', '008', 'leticia123', 'Auxiliar administrativo'),
        ('44520987780', 'Bruno', 'Rua principal', '84', 'Bangu', 'bloco 10 apto 90', 'Rio de Janeiro', 'RJ', '56712302', '08.432.011', 'Masculino', '1981-05-16', '2018-06-05', '009', 'bruno123', 'Suporte em vendas'),
        ('21733014570', 'Maicon', 'Rua seis', '72', 'Jardim Azaléias', 'bloco 6 apto 16', 'Cabo Verde', 'MG', '27884231', '10.442.038', 'Masculino', '1990-06-15', '2020-08-17', '010', 'maicon123', 'vendedor externo');

SELECT * FROM forma_pagamento;
INSERT INTO   forma_pagamento
(cod_forma_pagamento, desc_forma_pagamento)
VALUES ('01', 'Dinheiro'),
        ('02', 'Cartão de Crédito'),
        ('03', 'Boleto Bancário'),
        ('04', 'PIX'),
        ('05', 'Cartão de Débito'),
        ('06', 'Transferência bancária via TED'),
        ('07', 'Transferência bancária via DOC');

SELECT * FROM venda;
INSERT INTO venda
(cod_venda,cpf_cliente,cpf_func,dat_venda,vlr_bruto_venda,vlr_desconto, vlr_liquido_venda,forma_pagamento_cod_forma_pagamento)
    VALUES ('01','12345678901','03456722202','2021-12-02','22.05','0','22.05','02'),
		   ('02','12345678901','03400998730','2021-10-04','2029.25','202.93','1826.33','01'),
           ('03','04578633512','06650128844','2021-06-01','25009.77','3751.47','21258.30','03'),
           ('04','21377499734','02423111105','2021-03-23','866.16','0','866.16','02'),
           ('05','09233190614','02423111105','2021-06-19','4206.79','210.34','3996.45','06'),
           ('06','76520287410','01433477788','2021-07-20','7952.54','397.63','7554.91','01'),
           ('07','12594322316','20901133322','2021-08-22','7702.68','385.13','7317.55','02'),
           ('08','20910254275','19855526660','2021-11-29','17256.12','1725.61','15530.51','04'),
           ('09','76520287410','19855526660','2021-10-21','8284.14','414.21','7869.93','03'),
           ('10','20991255205','21733014570','2021-05-14','8425.57','421.28','8004.20','07');

SELECT * FROM compra;
INSERT INTO   compra
(cod_compra, cpf_func, cnpj_fornecedor, dat_compra, vlr_total_compra)
VALUES  ('01','03456722202','1586721201','2021-02-12','686.20'),
		('02','03400998730','1586721201','2021-04-21','4463.65'),
        ('03','06650128844','1586721201','2021-06-01','31876.90'),
        ('04','02423111105','7525128404','2021-03-23','6089.00'),
        ('05','02423111105','7525128404','2021-06-19','4297.00'),
        ('06','01433477788','7525128404','2021-07-20','105014.20'),
        ('07','20901133322','3415319507','2021-08-22','60433.00'),
        ('08','19855526660','5588111308','2021-11-29','1519.65'),
        ('09','19855526660','9911232309','2021-10-11','25460.85'),
        ('10','21733014570','7812346700','2021-05-14','8079.60');

SELECT * FROM cliente_telefone;
INSERT INTO   cliente_telefone
(tipo_telefone_cod_tipo_telefone, cpf_cliente, tel_cliente)
VALUES  ('02', '12345678901', '35999100223'),
        ('02', '11235698702', '35998312064'),
        ('01', '04578633512', '3537122024'),
        ('02', '04578633512', '35998562254'),
        ('01', '21377499734', '3537145678'),
        ('02', '09233190614', '35988216904'),
        ('02', '76520287410', '35922010704'),
        ('02', '12594322316', '35981218607'),
        ('02', '20910254275', '35970206512'),
        ('01', '08430466321', '3535904217'),
        ('01', '20991255205', '3533503204');

SELECT * FROM func_telefone;
INSERT INTO   func_telefone
(tipo_telefone_cod_tipo_telefone, funcionario_cpf_func, tel_funcionario)
VALUES  ('02', '03456722202', '35981106720'),
        ('02', '03400998730', '35997345783'),
        ('01', '06650128844', '3537441039'),
        ('01', '02423111105', '3532001877'),
        ('02', '11122233344', '35985318054'),
        ('02', '01433477788', '35918211803'),
        ('02', '20901133322', '35987303810'),
        ('02', '19855526660', '35972346690'),
        ('01', '44520987780', '35371702367'),
        ('01', '21733014570', '3538942032');

SELECT * FROM compra_produto;
INSERT INTO compra_produto
(compra_cod_compra, produto_cod_produto, produto_cod_tipo_produto, produto_cod_categoria, vlr_custo_unit_produto, qtd_produto)
VALUES  ('01','04211.3.1.1','04211','04','0.86','25'),
		('01','04211.3.1.2','04211','04','1.32','55'),
        ('01','04211.3.1.3','04211','04','1.68','55'),
       	('01','04211.3.2.1','04211','04','0.39','100'),
       	('01','04211.3.3.2','04211','04','1.27','250'),
        ('01','04211.3.4.1','04211','04','0.27','75'),
        ('01','04221.3.1.1','04221','04','1.36','50'),
        ('01','04221.3.1.2','04221','04','1.57','35'),
        ('02','04221.3.1.3','04221','04','2.30','100'),
        ('02','04221.3.2.1','04221','04','1.22','55'),
        ('02','04221.3.2.2','04221','04','1.40','15'),
        ('02','04221.3.2.3','04221','04','1.68','35'),
		('02','04221.3.2.4','04221','04','1.32','45'),
        ('02','04221.3.2.5','04221','04','1.68','85'),
		('02','04221.3.3.10','04221','04','55.99','45'),
        ('02','04221.3.3.11','04221','04','54.60','25'),
        ('03','04221.3.3.12','04221','04','85.10','45'),
        ('03','04221.3.3.13','04221','04','90.00','55'),
        ('03','04221.3.3.14','04221','04','92.30','100'),
        ('03','04221.3.3.8','04221','04','38.07','185'),
        ('03','04221.3.3.9','04221','04','44.23','45'),
        ('03','04270.3.1.1','04270','04','54.90','25'),
        ('03','04270.3.2.1','04270','04','12.75','100'),
        ('03','04270.3.2.2','04270','04', '15.08','145'),
        ('04','15142.3.23.1','15142','15','1.56','155'),
        ('04','15142.3.23.2','15142','15','1.87','255'),
        ('04','15142.3.23.3','15142','15','4.87','145'),
        ('04','15142.3.23.4','15142','15','7.22','100'),
        ('04','15142.3.23.5','15142','15','6.76','155'),
        ('04','15142.3.23.6','15142','15','14.28','145'),
        ('04','15142.3.23.7','15142','15','21.20','15'),
        ('04','15142.3.23.8','15142','15','25.29','20'),
        ('05','15142.3.23.9','15142','15','40.89','45'),
        ('05','15152.3.10.1','15152','15','8.79','55'),
       	('05','15152.3.11.1','15152','15','1.79','35'),
        ('05','15152.3.11.2','15152','15','3.71','40'),
       	('05','15152.3.11.3','15152','15','4.40','100'),
		('05','15152.3.28.1','15152','15','2.69','115'),
        ('05','15152.3.29.1','15152','15','5.18','85'),
        ('05','15152.3.29.2','15152','15','7.16','80'),
        ('06','15152.3.29.3','15152','15','6.08','40'),
        ('06','15152.3.29.4','15152','15','18.14','55'),
        ('06','15152.3.19.1','15152','15','3.93','45'),
      	('06','15410.3.14.1','15410','15','51.92','25'),
        ('06','15410.3.14.2','15410','15','43.70','15'),
        ('06','15410.3.14.3','15410','15','33.03','10'),
        ('06','15410.3.24.2','15410','15','239.50','415'),
        ('06','15410.3.29.1','15410','15','128.01','15'),
        ('07','15410.3.3.9','15410','15','107.47','25'),
        ('07','15410.3.30.1','15410','15','233.15','45'),
        ('07','15410.3.31.1','15410','15','59.32','55'),
        ('07','15410.3.49.1','15410','15','380.62','85'),
        ('07','15410.3.49.2','15410','15','365.30','30'),
        ('07','16132.3.3.1','16132','16', '6.23','35'),
        ('07','16132.3.3.2','16132','16', '6.90','15'),
        ('07','16132.3.3.3','16132','16', '7.97','45'),
        ('08','16132.3.3.4','16132','16', '11.20','30'),
        ('08','16132.3.3.5','16132','16', '12.32','80'),
        ('08','16132.3.4.1','16132','16', '0.97','10'),
		('08','16132.3.4.2','16132','16','1.25','15'),
		('08','16132.3.4.3','16132','16','1.58','20'),
        ('08','16132.3.4.4','16132','16','2.22','25'),
        ('08','16132.3.4.5','16132','16','2.75','30'),
        ('09','16141.3.1.12','16141','16','85.20','35'),
        ('09','16141.3.1.13','16141','16','83.55','40'),
        ('09','16141.3.1.14','16141','16','85.20','45'),
        ('09','16141.3.1.15','16141','16','85.20','50'),
        ('09','16141.3.1.16','16141','16','45.72','55'),
        ('09','16141.3.1.17','16141','16','45.84','60'),
        ('09','16141.3.1.18','16141','16','46.01','65'),
        ('09','16141.3.1.19','16141','16','34.84','80'),
        ('10','16141.3.1.20','16141','16','44.87','85'),
        ('10','16141.3.1.21','16141','16','46.11','10'),
        ('10','16143.3.1.2','16143','16','2.33','15'),
        ('10','16143.3.1.3','16143','16','4.66','20'),
        ('10','16143.3.2.18','16143','16','4.17','25'),
        ('10','16143.3.2.19','16143','16','5.86','30'),
       	('10','16143.3.2.20','16143','16','7.70','35'),
		('10','16143.3.2.21','16143','16','10.20','40'),
		('10','16143.3.4.1','16143','16','12.03','45'),
		('10','16143.3.4.12','16143','16','7.86','50'),
       	('10','16143.3.4.13','16143','16','5.87','100'),
        ('10','16143.3.4.2','16143','16','4.79','250');

SELECT * FROM venda_produto;
INSERT INTO venda_produto
(venda_cod_venda, produto_cod_produto, produto_cod_tipo_produto, produto_cod_categoria, vlr_unit_produto, qtd_produto)
VALUES  ('01','04211.3.1.1','04211','04','1.03','3'),
		('01','04211.3.1.2','04211','04','1.58','12'),
        ('02','04211.3.1.3','04211','04','2.02','20'),
       	('02','04211.3.2.1','04211','04','0.47','40'),
       	('02','04211.3.3.2','04211','04','1.52','32'),
        ('02','04211.3.4.1','04211','04','0.32','41'),
        ('02','04221.3.1.1','04221','04','1.63','10'),
        ('02','04221.3.1.2','04221','04','1.88','14'),
        ('02','04221.3.1.3','04221','04','2.76','20'),
        ('02','04221.3.2.1','04221','04','1.46','15'),
        ('02','04221.3.2.2','04221','04','1.68','3'),
        ('02','04221.3.2.3','04221','04','2.02','12'),
		('02','04221.3.2.4','04221','04','1.58','20'),
        ('02','04221.3.2.5','04221','04','2.02','32'),
		('02','04221.3.3.10','04221','04','67.19','15'),
        ('02','04221.3.3.11','04221','04','65.52','10'),
        ('03','04221.3.3.12','04221','04','102.12','23'),
        ('03','04221.3.3.13','04221','04','108.00','42'),
        ('03','04221.3.3.14','04221','04','110.76','84'),
        ('03','04221.3.3.8','04221','04','45.68','112'),
        ('03','04221.3.3.9','04221','04','53.08','20'),
        ('03','04270.3.1.1','04270','04','65.88','12'),
        ('03','04270.3.2.1','04270','04','15.03','45'),
        ('03','04270.3.2.2','04270','04', '18.10','65'),
        ('04','15142.3.23.1','15142','15','1.87','63'),
        ('04','15142.3.23.2','15142','15','2.24','120'),
        ('04','15142.3.23.3','15142','15','5.84','45'),
        ('04','15142.3.23.4','15142','15','8.67','25'),
        ('05','15142.3.23.5','15142','15','8.11','22'),
        ('05','15142.3.23.6','15142','15','17.14','120'),
        ('05','15142.3.23.7','15142','15','25.44','13'),
        ('05','15142.3.23.8','15142','15','30.35','13'),
        ('05','15142.3.23.9','15142','15','49.07','12'),
        ('05','15152.3.10.1','15152','15','10.55','25'),
       	('05','15152.3.11.1','15152','15','2.15','13'),
        ('05','15152.3.11.2','15152','15','4.45','2'),
       	('05','15152.3.11.3','15152','15','5.28','25'),
		('05','15152.3.28.1','15152','15','3.23','30'),
        ('05','15152.3.29.1','15152','15','6.22','4'),
        ('05','15152.3.29.2','15152','15','8.59','12'),
        ('06','15152.3.29.3','15152','15','7.30','8'),
        ('06','15152.3.29.4','15152','15','21.77','16'),
        ('06','15152.3.19.1','15152','15','4.72','20'),
      	('06','15410.3.14.1','15410','15','62.30','6'),
        ('06','15410.3.14.2','15410','15','52.44','4'),
        ('06','15410.3.14.3','15410','15','39.64','5'),
        ('06','15410.3.24.2','15410','15','287.40','20'),
        ('06','15410.3.29.1','15410','15','153.61','6'),
        ('07','15410.3.3.9','15410','15','128.96','12'),
        ('07','15410.3.30.1','15410','15','279.78','22'),
        ('08','15410.3.31.1','15410','15','71.18','30'),
        ('08','15410.3.49.1','15410','15','456.64','20'),
        ('08','15410.3.49.2','15410','15','438.36','12'),
        ('08','16132.3.3.1','16132','16', '7.48','3'),
        ('08','16132.3.3.2','16132','16', '8.28','5'),
        ('08','16132.3.3.3','16132','16', '9.56','12'),
        ('08','16132.3.3.4','16132','16', '13.44','15'),
        ('08','16132.3.3.5','16132','16', '14.78','20'),
        ('08','16132.3.4.1','16132','16', '1.16','2'),
		('08','16132.3.4.2','16132','16','1.50','3'),
		('08','16132.3.4.3','16132','16','1.90','10'),
        ('08','16132.3.4.4','16132','16','2.66','5'),
        ('08','16132.3.4.5','16132','16','3.18','4'),
        ('09','16141.3.1.12','16141','16','102.24','20'),
        ('09','16141.3.1.13','16141','16','100.26','15'),
        ('09','16141.3.1.14','16141','16','102.24','23'),
        ('09','16141.3.1.15','16141','16','102.24','4'),
        ('09','16141.3.1.16','16141','16','54.86','36'),
        ('10','16141.3.1.17','16141','16','55.01','45'),
        ('10','16141.3.1.18','16141','16','55.21','31'),
        ('10','16141.3.1.19','16141','16','41.68','35'),
        ('10','16141.3.1.20','16141','16','53.84','28'),
        ('10','16141.3.1.21','16141','16','55.33','3'),
        ('10','16143.3.1.2','16143','16','2.80','6'),
        ('10','16143.3.1.3','16143','16','5.59','13'),
        ('10','16143.3.2.18','16143','16','5.00','15'),
        ('10','16143.3.2.19','16143','16','7.03','8'),
       	('10','16143.3.2.20','16143','16','9.24','12'),
		('10','16143.3.2.21','16143','16','12.24','23'),
		('10','16143.3.4.1','16143','16','14.44','4'),
		('10','16143.3.4.12','16143','16','9.43','16'),
       	('10','16143.3.4.13','16143','16','7.04','20'),
        ('10','16143.3.4.2','16143','16','5.75','25');


USE mat_construcao;

-- ----------------------------------------------
-- CONSULTAS SIMPLES
-- ----------------------------------------------

-- Consultar ID, Nome e CNPJ de todos os FORNECEDORES
SELECT numero, nom_fornecedor, cnpj_fornecedor
	FROM fornecedor;

-- Consultar CPF, Nome e data de cadastro de todos os CLIENTES
SELECT cpf_cliente, nom_cliente, dat_cadastro 
	FROM cliente;

-- Consultar todos os dados de PRODUTOS da categoria 15
SELECT * 
	FROM produto
	WHERE cod_categoria = 15;

-- Consultar todos os dados dos FUNCIONÁRIOS do sexo feminino 
SELECT * 
	FROM funcionario
	WHERE sexo = 'Feminino';
  
 -- Consultar todas as compras com data a partir de 19/06/2021
SELECT * FROM compra
	WHERE dat_compra > '2021-06-19';
    

-- ----------------------------------------------
-- CONSULTAS COM JUNÇÕES INTERNAS (INNER JOIN)
-- ----------------------------------------------

-- Consulta que retorna a descrição do produto e sua unidade de medida filtrado pelo código de tipo de 
-- produto = 04211 (Alvenaria de peças de barro e cerâmica - vedação)
SELECT produto.desc_produto, produto.unid_medida
FROM produto
INNER JOIN tipo_produto
	ON produto.cod_tipo_produto = tipo_produto.cod_tipo_produto
		WHERE tipo_produto.cod_tipo_produto = '04211'
;


	-- Consulta que retorna todos os FUNCIONARIOS que possuem telefone fixo
SELECT *
FROM funcionario
INNER JOIN func_telefone
	ON funcionario.cpf_func = funcionario_cpf_func
		WHERE tipo_telefone_cod_tipo_telefone = '1'
;


-- Consulta que retorna todas as vendas que foram pagas com cartão de crédito
SELECT venda.cod_venda, venda.cpf_cliente, venda.cpf_func, venda.dat_venda, venda.vlr_liquido_venda, venda.forma_pagamento_cod_forma_pagamento, forma_pagamento.desc_forma_pagamento
FROM venda
INNER JOIN forma_pagamento
	ON forma_pagamento_cod_forma_pagamento = cod_forma_pagamento
		WHERE cod_forma_pagamento = '2'
;


-- Consulta que retorna o CNPJ, nome do fornecedor, código do produto, quantidade e custo unitário dos produtos
-- de compras onde havia mais de 30 unidades de qualquer tipo de produto
SELECT fornecedor.cnpj_fornecedor, fornecedor.nom_fornecedor, compra_produto.produto_cod_produto, qtd_produto, vlr_custo_unit_produto
FROM compra
	INNER JOIN fornecedor
		ON fornecedor.cnpj_fornecedor = compra.cnpj_fornecedor
	INNER JOIN compra_produto
		ON compra.cod_compra = compra_produto.compra_cod_compra
	WHERE qtd_produto >= '30'
 ;      
       
       
-- Consulta que retorna o nome e o CPF dos clientes que realizaram uma compra com valor superior a R$3.000,00 e pagaram em dinheiro
SELECT cliente.cpf_cliente, cliente.nom_cliente, venda.cod_venda, venda.dat_venda, venda.vlr_bruto_venda, venda.vlr_desconto, venda.vlr_liquido_venda, forma_pagamento.desc_forma_pagamento
	FROM venda
		INNER JOIN forma_pagamento
			ON venda.forma_pagamento_cod_forma_pagamento = cod_forma_pagamento
		INNER JOIN cliente
			ON venda.cpf_cliente = cliente.cpf_cliente
		WHERE vlr_liquido_venda > '3000,00' AND forma_pagamento_cod_forma_pagamento = '1'
;
    
-- ----------------------------------------------
-- CONSULTAS COM JUNÇÕES EXTERNAS (OUTER JOIN)
-- ----------------------------------------------
  
-- Consulta que retorna todos os fornecedores dos quais nenhuma compra foi realizada
  SELECT fornecedor.*, compra.cod_compra
	FROM fornecedor
		LEFT OUTER JOIN compra
			ON compra.cnpj_fornecedor = fornecedor.cnpj_fornecedor
	WHERE compra.cod_compra IS NULL
;

-- Consulta que retorna todos os clientes que nunca efetuaram nenhuma compra
  SELECT cliente.*, venda.cod_venda
	FROM cliente
		LEFT OUTER JOIN venda
			ON venda.cpf_cliente = cliente.cpf_cliente
	WHERE venda.cod_venda IS NULL
;

-- Consulta que retorna todos os funcionários que nunca efetuaram uma venda maior que R$7.000,00
  SELECT funcionario.cpf_func, funcionario.nom_func, venda.vlr_bruto_venda
	FROM venda
		RIGHT OUTER JOIN funcionario
			ON venda.cpf_func = funcionario.cpf_func
	WHERE venda.vlr_bruto_venda > '7000,00'
 ;           
	

-- Consulta que retorna todos os FUNCIONARIOS que não efetuarma nenhuma compra e nenhuma venda
	SELECT funcionario.cpf_func, funcionario.nom_func, venda.cod_venda, compra.cod_compra
		FROM funcionario
			LEFT JOIN compra
				ON funcionario.cpf_func = compra.cpf_func
			LEFT JOIN venda
				ON funcionario.cpf_func = venda.cpf_func
		WHERE compra.cod_compra IS NULL AND venda.cod_venda IS NULL
;
    
    
-- Consulta que retorna todos as formas de pagamento utilizadas pelos clientes
  SELECT forma_pagamento.*
	FROM venda
		LEFT OUTER JOIN forma_pagamento
			ON venda.forma_pagamento_cod_forma_pagamento = forma_pagamento.cod_forma_pagamento
	WHERE forma_pagamento.cod_forma_pagamento IS NOT NULL
    GROUP BY forma_pagamento.cod_forma_pagamento
 ;   

-- ----------------------------------------------
-- CONSULTAS COM SUBCONSULTAS
-- ----------------------------------------------

-- Consulta que retorna a maior compra realizada entre todos os fornecedores
    SELECT fornecedor.cnpj_fornecedor, fornecedor.nom_fornecedor, compra.vlr_total_compra
		FROM fornecedor
			LEFT JOIN compra
				ON fornecedor.cnpj_fornecedor = compra.cnpj_fornecedor
		WHERE vlr_total_compra = 
            (SELECT MAX(compra.vlr_total_compra)
				FROM compra)
;
                
-- Consulta que retorna a menor venda realizada entre todos os funcionários
	SELECT funcionario.cpf_func, funcionario.nom_func, venda.vlr_liquido_venda
		FROM funcionario
			LEFT JOIN venda
				ON funcionario.cpf_func = venda.cpf_func
			WHERE vlr_liquido_venda = 
            (SELECT MIN(venda.vlr_liquido_venda)
				FROM venda)
;
              
-- Consulta que retorna os produtos mais vendidos
	SELECT venda_produto.*
		FROM venda_produto
			LEFT JOIN venda
				ON venda_produto.venda_cod_venda = venda.cod_venda
			WHERE qtd_produto = 
            (SELECT MAX(qtd_produto)
				FROM venda_produto)
;              
              
-- Consulta que retorna quais vendas possuem valor acima da média dentre todas as vendas realizadas
	SELECT venda.*
		FROM venda
		WHERE vlr_liquido_venda > 
			(
			SELECT AVG(venda.vlr_liquido_venda)
				FROM venda
			)
 ;           

-- Consulta que retorna todos os produtos que não constam na compra com código 5
SELECT compra_produto.*, produto.desc_produto
	FROM compra_produto
		INNER JOIN produto
			ON produto.cod_produto = compra_produto.produto_cod_produto
		INNER JOIN compra
			ON compra.cod_compra = compra_produto.compra_cod_compra
    WHERE NOT EXISTS (
		SELECT *
			FROM compra
		WHERE compra_produto.compra_cod_compra = compra.cod_compra and compra.cod_compra = '5'
)
;
 
-- ----------------------------------------------
-- CONSULTAS COM AGRUPAMENTO
-- ----------------------------------------------

-- Consulta que retorna a soma de todos os descontos recebidos por cada cliente
	SELECT cliente.cpf_cliente, cliente.nom_cliente, SUM(vlr_desconto) AS soma_descontos
		FROM cliente
			INNER JOIN venda
				ON cliente.cpf_cliente = venda.cpf_cliente
		GROUP BY cliente.cpf_cliente
;
    

-- Consulta que retorna quais funcionários estão com o total de vendas menor que a média geral
	SELECT funcionario.cpf_func, funcionario.nom_func, SUM(vlr_liquido_venda) AS tot_venda
		FROM funcionario
			INNER JOIN venda
				ON funcionario.cpf_func = venda.cpf_func
		WHERE vlr_liquido_venda < 
			(
			SELECT AVG(venda.vlr_liquido_venda)
				FROM venda
			)
	   GROUP BY funcionario.cpf_func
;


-- Consulta que retorna a quantidade utilizada de cada forma de pagamento
	SELECT forma_pagamento.*, count(forma_pagamento_cod_forma_pagamento) as qtd_utilizada
		FROM venda
			left JOIN forma_pagamento
				ON venda.forma_pagamento_cod_forma_pagamento = forma_pagamento.cod_forma_pagamento
                    GROUP BY (forma_pagamento_cod_forma_pagamento)       
					ORDER BY (qtd_utilizada) DESC
;


-- Consulta que retorna o valor total de compras de produtos de cada funcionário
	SELECT funcionario.cpf_func, funcionario.nom_func, SUM(vlr_total_compra) AS soma_compra
		FROM funcionario
			INNER JOIN compra
				ON funcionario.cpf_func = compra.cpf_func
		GROUP BY funcionario.cpf_func
;


-- Consulta que retorna as funcionárias que participaram de alguma venda
	SELECT funcionario.*
		FROM funcionario
			INNER JOIN venda
				ON funcionario.cpf_func = venda.cpf_func and funcionario.sexo LIKE 'Feminino'
		GROUP BY funcionario.cpf_func
