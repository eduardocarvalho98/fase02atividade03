-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Tabela_produtor'
-- Representa o agricultor responsável por monitorar e gerenciar as culturas em sua propriedade utilizando sensores.
-- ---

DROP TABLE IF EXISTS `Tabela_produtor`;
		
CREATE TABLE `Tabela_produtor` (
  `id_produtor` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `email` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `telefone` VARCHAR NULL DEFAULT NULL,
  `localizacao` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id_produtor`)
) COMMENT 'Representa o agricultor responsável por monitorar e gerencia';

-- ---
-- Table 'tabela_cultura'
-- Representa as diferentes plantações geridas pelo produtor. Cada cultura é monitorada por sensores para otimizar a irrigação e a aplicação de nutrientes.
-- ---

DROP TABLE IF EXISTS `tabela_cultura`;
		
CREATE TABLE `tabela_cultura` (
  `id_cultura` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_cultura` VARCHAR NULL AUTO_INCREMENT DEFAULT NULL,
  `area` DECIMAL NULL DEFAULT NULL,
  `id_produtor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_cultura`)
) COMMENT 'Representa as diferentes plantações geridas pelo produtor. C';

-- ---
-- Table 'tabela_sensor'
-- Representa os sensores instalados nas plantações para monitorar a umidade, o pH do solo, e os níveis de nutrientes (NPK) na lavoura.
-- ---

DROP TABLE IF EXISTS `tabela_sensor`;
		
CREATE TABLE `tabela_sensor` (
  `id_sensor` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tipo_sensor` ENUM NULL AUTO_INCREMENT DEFAULT NULL,
  `modelo` VARCHAR NULL DEFAULT NULL,
  `fabricante` VARCHAR NULL DEFAULT NULL,
  `data_instalacao` DATE NULL DEFAULT NULL,
  `id_cultura` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_sensor`)
) COMMENT 'Representa os sensores instalados nas plantações para monito';

-- ---
-- Table 'leitura_sensor'
-- Representa os dados coletados pelos sensores instalados nas plantações. Cada leitura captura o valor registrado pelo sensor (umidade, pH ou NPK) em um determinado momento.
-- ---

DROP TABLE IF EXISTS `leitura_sensor`;
		
CREATE TABLE `leitura_sensor` (
  `id_leitura` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_hora_leitura` DATETIME NULL DEFAULT NULL,
  `valor_leitura` DECIMAL NULL DEFAULT NULL,
  `id_sensor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_leitura`)
) COMMENT 'Representa os dados coletados pelos sensores instalados nas ';

-- ---
-- Table 'ajuste_aplicacao'
-- Representa os ajustes feitos na quantidade de água ou nutrientes aplicados à cultura com base nos dados coletados pelos sensores.
-- ---

DROP TABLE IF EXISTS `ajuste_aplicacao`;
		
CREATE TABLE `ajuste_aplicacao` (
  `id_ajuste` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_hora_ajuste` DATETIME NULL DEFAULT NULL,
  `quantidade_agua` DECIMAL NULL DEFAULT NULL,
  `quantidade_nutrientes` DECIMAL NULL DEFAULT NULL,
  `tipo_nutriente` ENUM NULL DEFAULT NULL,
  `id_cultura` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id_ajuste`)
) COMMENT 'Representa os ajustes feitos na quantidade de água ou nutrie';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `tabela_cultura` ADD FOREIGN KEY (id_produtor) REFERENCES `Tabela_produtor` (`id_produtor`);
ALTER TABLE `tabela_sensor` ADD FOREIGN KEY (id_cultura) REFERENCES `tabela_cultura` (`id_cultura`);
ALTER TABLE `leitura_sensor` ADD FOREIGN KEY (id_sensor) REFERENCES `tabela_sensor` (`id_sensor`);
ALTER TABLE `ajuste_aplicacao` ADD FOREIGN KEY (id_cultura) REFERENCES `tabela_cultura` (`id_cultura`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Tabela_produtor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tabela_cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tabela_sensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `leitura_sensor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ajuste_aplicacao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Tabela_produtor` (`id_produtor`,`nome`,`email`,`telefone`,`localizacao`) VALUES
-- ('','','','','');
-- INSERT INTO `tabela_cultura` (`id_cultura`,`nome_cultura`,`area`,`id_produtor`) VALUES
-- ('','','','');
-- INSERT INTO `tabela_sensor` (`id_sensor`,`tipo_sensor`,`modelo`,`fabricante`,`data_instalacao`,`id_cultura`) VALUES
-- ('','','','','','');
-- INSERT INTO `leitura_sensor` (`id_leitura`,`data_hora_leitura`,`valor_leitura`,`id_sensor`) VALUES
-- ('','','','');
-- INSERT INTO `ajuste_aplicacao` (`id_ajuste`,`data_hora_ajuste`,`quantidade_agua`,`quantidade_nutrientes`,`tipo_nutriente`,`id_cultura`) VALUES
-- ('','','','','','');