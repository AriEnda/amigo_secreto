/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : amigo_secreto

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-18 17:19:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for desea
-- ----------------------------
DROP TABLE IF EXISTS `desea`;
CREATE TABLE `desea` (
`participante_id`  int(10) UNSIGNED NOT NULL ,
`regalo_id`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`participante_id`, `regalo_id`),
FOREIGN KEY (`participante_id`) REFERENCES `participa` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `desea_regalo_id_foreign` (`regalo_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci

;

-- ----------------------------
-- Records of desea
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for entregas
-- ----------------------------
DROP TABLE IF EXISTS `entregas`;
CREATE TABLE `entregas` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`entrega`  int(11) NOT NULL ,
`recibe`  int(11) NOT NULL ,
`grupo_id`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `entregas_grupo_id_foreign` (`grupo_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of entregas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for especializa
-- ----------------------------
DROP TABLE IF EXISTS `especializa`;
CREATE TABLE `especializa` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`tienda_id`  int(10) UNSIGNED NOT NULL ,
`gusto_id`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`gusto_id`) REFERENCES `gustos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `especializa_tienda_id_foreign` (`tienda_id`) USING BTREE ,
INDEX `especializa_gusto_id_foreign` (`gusto_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of especializa
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for existe
-- ----------------------------
DROP TABLE IF EXISTS `existe`;
CREATE TABLE `existe` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`tienda_id`  int(10) UNSIGNED NOT NULL ,
`regalo_id`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `existe_tienda_id_foreign` (`tienda_id`) USING BTREE ,
INDEX `existe_regalo_id_foreign` (`regalo_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of existe
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`tipo`  enum('mixto','masculino','femenino') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`numero_participantes`  int(11) NOT NULL ,
`max_precio`  int(11) NOT NULL ,
`min_precio`  int(11) NOT NULL ,
`fec_intercambio`  date NOT NULL ,
`fec_cierre`  date NOT NULL ,
`estado`  tinyint(1) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`),
INDEX `agrupar_por_estado` (`estado`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of grupos
-- ----------------------------
BEGIN;
INSERT INTO `grupos` VALUES ('1', 'Chocolatines', 'mixto', '5', '500', '200', '2017-12-20', '2017-12-18', '0'), ('2', 'Bebitox', 'masculino', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('3', 'xDxdxdxdxd', 'mixto', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('4', 'No se como llamar a mi grupo', 'masculino', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('5', 'Venezuela', 'mixto', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('6', 'Grupo 1', 'masculino', '2', '500', '200', '2017-11-08', '2017-11-07', '1'), ('7', 'Grupo 2', 'femenino', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('8', 'Grupo 3', 'masculino', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('9', 'Grupo 4', 'mixto', '5', '500', '200', '2017-11-08', '2017-11-07', '1'), ('10', 'Solo Mujeres', 'femenino', '5', '800', '100', '2017-12-24', '2017-12-20', '1');
COMMIT;

-- ----------------------------
-- Table structure for gustos
-- ----------------------------
DROP TABLE IF EXISTS `gustos`;
CREATE TABLE `gustos` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of gustos
-- ----------------------------
BEGIN;
INSERT INTO `gustos` VALUES ('1', 'Musica'), ('2', 'Arte'), ('3', 'Gastronomia'), ('4', 'Joyeria'), ('5', 'Libros'), ('6', 'Peliculas'), ('7', 'Bisuteria'), ('8', 'Viajes'), ('9', 'Peluches');
COMMIT;

-- ----------------------------
-- Table structure for participa
-- ----------------------------
DROP TABLE IF EXISTS `participa`;
CREATE TABLE `participa` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`admin`  tinyint(1) NOT NULL DEFAULT 0 ,
`user_id`  int(10) UNSIGNED NOT NULL ,
`grupo_id`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
UNIQUE INDEX `id_box_elements` (`user_id`, `grupo_id`) USING BTREE ,
INDEX `participa_user_id_foreign` (`user_id`) USING BTREE ,
INDEX `participa_grupo_id_foreign` (`grupo_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of participa
-- ----------------------------
BEGIN;
INSERT INTO `participa` VALUES ('1', '1', null, '1', '1'), ('2', '1', null, '3', '2'), ('3', '1', null, '1', '3'), ('4', '1', null, '5', '4'), ('5', '1', null, '6', '5'), ('6', '1', null, '6', '6'), ('7', '1', null, '7', '7'), ('8', '1', null, '12', '8'), ('9', '1', null, '12', '9'), ('10', '1', null, '13', '10'), ('11', '0', null, '9', '1'), ('12', '0', null, '2', '1'), ('13', '0', null, '8', '1'), ('14', '0', null, '7', '1'), ('15', '0', null, '3', '1'), ('16', '0', null, '6', '1'), ('17', '0', null, '4', '1'), ('18', '0', null, '10', '1'), ('19', '0', null, '11', '1'), ('20', '0', null, '5', '1'), ('21', '0', '0', '10', '2'), ('22', '0', '0', '12', '6');
COMMIT;

-- ----------------------------
-- Table structure for regalos
-- ----------------------------
DROP TABLE IF EXISTS `regalos`;
CREATE TABLE `regalos` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`precio`  int(11) NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of regalos
-- ----------------------------
BEGIN;
INSERT INTO `regalos` VALUES ('1', 'Cintillo', '250', null, null), ('2', 'Reloj', '780', null, null), ('3', 'Cartera', '475', null, null), ('4', 'Monedero', '300', null, null), ('5', 'Billetera', '300', null, null), ('6', 'Tacones', '570', null, null), ('7', 'Brillo Labial', '45', null, null), ('8', 'Lentes de sol', '455', null, null), ('9', 'Cholas', '52', null, null), ('10', 'Zarcillo', '562', null, null), ('11', 'Novela Romantica', '555', null, null), ('12', 'Pendrive', '160', null, null);
COMMIT;

-- ----------------------------
-- Table structure for tiendas
-- ----------------------------
DROP TABLE IF EXISTS `tiendas`;
CREATE TABLE `tiendas` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of tiendas
-- ----------------------------
BEGIN;
INSERT INTO `tiendas` VALUES ('1', 'Xic Xoc', null, null), ('2', 'Libreria Latina', null, null), ('3', 'Bissut', null, null), ('4', 'El rincon de Jorge', null, null), ('5', 'ConFerry', null, null), ('6', 'Block Buster', null, null);
COMMIT;

-- ----------------------------
-- Table structure for tiene
-- ----------------------------
DROP TABLE IF EXISTS `tiene`;
CREATE TABLE `tiene` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`user_id`  int(10) UNSIGNED NOT NULL ,
`gusto_id`  int(10) UNSIGNED NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`gusto_id`) REFERENCES `gustos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `tiene_user_id_foreign` (`user_id`) USING BTREE ,
INDEX `tiene_gusto_id_foreign` (`gusto_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=31

;

-- ----------------------------
-- Records of tiene
-- ----------------------------
BEGIN;
INSERT INTO `tiene` VALUES ('1', '1', '3', null, null), ('2', '1', '5', null, null), ('3', '2', '9', null, null), ('4', '1', '9', null, null), ('5', '2', '1', null, null), ('6', '2', '4', null, null), ('7', '3', '8', null, null), ('8', '3', '2', null, null), ('9', '3', '9', null, null), ('10', '10', '9', null, null), ('11', '11', '5', null, null), ('12', '12', '7', null, null), ('13', '10', '8', null, null), ('14', '15', '1', null, null), ('15', '12', '0', null, null), ('16', '8', '4', null, null), ('17', '8', '8', null, null), ('18', '7', '2', null, null), ('19', '8', '3', null, null), ('20', '4', '9', null, null), ('21', '9', '1', null, null), ('22', '6', '4', null, null), ('23', '7', '8', null, null), ('24', '12', '2', null, null), ('25', '4', '7', null, null), ('26', '4', '1', null, null), ('27', '5', '1', null, null), ('28', '5', '6', null, null), ('29', '6', '7', null, null), ('30', '6', '1', null, null);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`email`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`lastname`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`fec_nacimiento`  date NOT NULL ,
`sexo`  enum('F','M') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`password`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=23

;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'Ariadne', 'ariadne.vasquezg@gmail.com', 'Vasquez', '1997-01-15', 'F', '0', null, null), ('2', 'Rosa', 'rosabelle18.lgp@gmail.com', 'Guebara', '1996-01-03', 'F', '1234', null, null), ('3', 'Oscar', 'oscarecastilloq@gmail.com', 'Castillo', '1994-02-25', 'M', '5678', null, null), ('4', 'Hermelinda', 'eva_718@hotmail.com', 'Guzman', '1968-09-15', 'F', '9123', null, null), ('5', 'Jesus', 'jsvasquez@gmail.com', 'Vasquez', '1991-04-06', 'M', '4567', null, null), ('6', 'Gabriel', 'gabriel.vasquez1@gmail.com', 'Vasquez', '1992-04-18', 'M', '8912', null, null), ('7', 'Briadne', 'briadne@gmail.com', 'Basquez', '1999-02-16', 'F', '0', null, null), ('8', 'Criadne', 'criadne@gmail.com', 'Casquez', '1987-10-23', 'M', '0', null, null), ('9', 'Driadne', 'driadne@gmail.com', 'Dasquez', '1999-01-14', 'M', '0', null, null), ('10', 'Eriadne', 'eriadne@gmail.com', 'Easquez', '1997-02-19', 'M', '0', null, null), ('11', 'Friadne', 'friadne@gmail.com', 'Fasquez', '1991-01-28', 'F', '0', null, null), ('12', 'Griadne', 'griadne@gmail.com', 'Gasquez', '1997-01-06', 'M', '0', null, null), ('13', 'Hriadne', 'hriadne@gmail.com', 'Hasquez', '1998-02-22', 'F', '0', null, null), ('14', 'Iriadne', 'iriadne@gmail.com', 'Iasquez', '1997-01-30', 'M', '0', null, null), ('15', 'Jriadne', 'jriadne@gmail.com', 'Jasquez', '1991-11-19', 'F', '0', null, null), ('16', 'Kriadne', 'kriadne@gmail.com', 'Kasquez', '1987-01-21', 'F', '0', null, null), ('17', 'Lriadne', 'lriadne@gmail.com', 'Lasquez', '1997-10-25', 'F', '0', null, null), ('18', 'Mriadne', 'mriadne@gmail.com', 'Masquez', '1998-01-29', 'F', '0', null, null), ('19', 'Nriadne', 'nriadne@gmail.com', 'Nasquez', '1999-11-05', 'M', '0', null, null), ('20', 'Oriadne', 'oriadne@gmail.com', 'Oasquez', '1990-01-01', 'F', '0', null, null), ('21', 'Priadne', 'priadne@gmail.com', 'Pasquez', '1991-10-09', 'M', '0', null, null), ('22', 'Qriadne', 'qriadne@gmail.com', 'Qasquez', '1997-07-15', 'F', '0', null, null);
COMMIT;

-- ----------------------------
-- Procedure structure for emparejar
-- ----------------------------
DROP PROCEDURE IF EXISTS `emparejar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emparejar`(IN id_grupo INT)
BEGIN
  DECLARE participante1 INT;
  DECLARE participante2 INT;
  DECLARE cantidad INT;
  DECLARE i INT;

  CREATE TABLE IF NOT EXISTS temp (id INT AUTO_INCREMENT, 
                                    usuario INT,
                                    PRIMARY KEY (id));
  INSERT INTO temp (usuario) 
  SELECT user_id FROM participa 
  WHERE grupo_id = id_grupo
  ORDER BY RAND();

  SELECT COUNT(id) INTO cantidad 
  FROM temp;
                                    
  SELECT usuario INTO participante1 
  FROM temp 
  ORDER BY id DESC LIMIT 1;

  SELECT usuario INTO participante2 
  FROM temp 
  ORDER BY id LIMIT 1;

  INSERT INTO entregas (entrega, recibe, grupo_id) VALUES
  (participante1, participante2, id_grupo);

  SET i = 1;

  WHILE i <= (cantidad - 1) DO
    SELECT usuario INTO participante1 FROM temp WHERE id = i;
    SELECT usuario INTO participante2 FROM temp WHERE id = i + 1;
 
    INSERT INTO entregas (entrega, recibe, id_grupo)
    VALUES (participante1, participante2, id_grupo);
    
    SET i = i + 1;
  END WHILE;
    
  DROP TABLE temp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for EstadoGrupo
-- ----------------------------
DROP FUNCTION IF EXISTS `EstadoGrupo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EstadoGrupo`(id INT) RETURNS tinyint(4)
BEGIN
	DECLARE e TINYINT;
	SELECT estado INTO e 
	FROM grupos
	WHERE grupos.id = id;
	RETURN e;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for ActualizarEstadoGrupos
-- ----------------------------
DROP EVENT IF EXISTS `ActualizarEstadoGrupos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ActualizarEstadoGrupos` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE grupos SET grupos.estado = 0 WHERE grupos.fec_cierre = CURDATE()
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for entregas
-- ----------------------------
ALTER TABLE `entregas` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for especializa
-- ----------------------------
ALTER TABLE `especializa` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for existe
-- ----------------------------
ALTER TABLE `existe` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for grupos
-- ----------------------------
ALTER TABLE `grupos` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for gustos
-- ----------------------------
ALTER TABLE `gustos` AUTO_INCREMENT=10;
DROP TRIGGER IF EXISTS `GrupoCerrado`;
DELIMITER ;;
CREATE TRIGGER `GrupoCerrado` BEFORE INSERT ON `participa` FOR EACH ROW BEGIN
	DECLARE aux INTEGER;
	IF((SELECT EstadoGrupo(NEW.grupo_id))=0) THEN 
		signal SQLSTATE '45000';
	END IF;
	select count(*) into aux from participa where grupo_id = NEW.grupo_id;
	set aux = aux + 1;
	update grupos set numero_participantes = aux where id = NEW.grupo_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for participa
-- ----------------------------
ALTER TABLE `participa` AUTO_INCREMENT=23;

-- ----------------------------
-- Auto increment value for regalos
-- ----------------------------
ALTER TABLE `regalos` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for tiendas
-- ----------------------------
ALTER TABLE `tiendas` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for tiene
-- ----------------------------
ALTER TABLE `tiene` AUTO_INCREMENT=31;

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
ALTER TABLE `users` AUTO_INCREMENT=23;
SET FOREIGN_KEY_CHECKS=1;
