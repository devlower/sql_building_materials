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
  `dat_venda` DATETIME NOT NULL,
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
  `dat_compra` DATETIME NOT NULL,
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
