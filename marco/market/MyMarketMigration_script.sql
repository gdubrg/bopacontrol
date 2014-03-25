-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: oas
-- Source Schemata: oas
-- Created: Fri Jun 28 19:44:14 2013
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema oas
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `oas` ;
CREATE SCHEMA IF NOT EXISTS `oas` ;

-- ----------------------------------------------------------------------------
-- Table oas.asta
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `oas`.`asta` (
  `idasta` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `idprodotto` INT(11) UNSIGNED NOT NULL ,
  `prezzo_base` SMALLINT(5) UNSIGNED NOT NULL ,
  `scadenza` DATETIME NOT NULL ,
  PRIMARY KEY (`idasta`) ,
  INDEX `fk_asta_user_idx` (`username` ASC) ,
  INDEX `fk_asta_prod_idx` (`idprodotto` ASC) ,
  CONSTRAINT `fk_asta_prod`
    FOREIGN KEY (`idprodotto` )
    REFERENCES `oas2`.`prodotto` (`idprodotto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asta_user`
    FOREIGN KEY (`username` )
    REFERENCES `oas`.`user` (`username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table oas.prodotto
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `oas`.`prodotto` (
  `idprodotto` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `descrizione` VARCHAR(200) NOT NULL ,
  `invendita` BIT(1) NOT NULL DEFAULT b'0' ,
  PRIMARY KEY (`idprodotto`) ,
  INDEX `username_idx` (`username` ASC) ,
  CONSTRAINT `fk_prod_user`
    FOREIGN KEY (`username` )
    REFERENCES `oas2`.`user` (`username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 148
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table oas.user
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `oas`.`user` (
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `cognome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(256) NOT NULL ,
  PRIMARY KEY (`username`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table oas.offer
-- ----------------------------------------------------------------------------
CREATE  TABLE IF NOT EXISTS `oas`.`offer` (
  `idoffer` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `idasta` INT(10) UNSIGNED NOT NULL ,
  `offerta` SMALLINT(5) UNSIGNED NOT NULL ,
  `offerente` VARCHAR(45) NOT NULL ,
  `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`idoffer`) ,
  INDEX `fk_off_asta_idx` (`idasta` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 152
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;;
