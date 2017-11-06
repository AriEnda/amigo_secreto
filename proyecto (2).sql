/*
Navicat MySQL Data Transfer

Source Server         : nuevo local
Source Server Version : 50638
Source Host           : 127.0.0.1:3306
Source Database       : proyectobd

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2017-11-05 20:14:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for desea
-- ----------------------------
DROP TABLE IF EXISTS `desea`;
CREATE TABLE `desea` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`user_id`  int(10) UNSIGNED NOT NULL ,
`regalo_id`  int(10) UNSIGNED NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `desea_user_id_foreign` (`user_id`) USING BTREE ,
INDEX `desea_regalo_id_foreign` (`regalo_id`) USING BTREE 
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

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
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `entregas_grupo_id_foreign` (`grupo_id`) USING BTREE 
)
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
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`gusto_id`) REFERENCES `gustos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `especializa_tienda_id_foreign` (`tienda_id`) USING BTREE ,
INDEX `especializa_gusto_id_foreign` (`gusto_id`) USING BTREE 
)
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
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `existe_tienda_id_foreign` (`tienda_id`) USING BTREE ,
INDEX `existe_regalo_id_foreign` (`regalo_id`) USING BTREE 
)
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
`estado`  tinyint(1) NOT NULL DEFAULT 0 ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of grupos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gustos
-- ----------------------------
DROP TABLE IF EXISTS `gustos`;
CREATE TABLE `gustos` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of gustos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`migration`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`batch`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2017_10_29_193035_create_grupos_table', '1'), ('4', '2017_10_29_193655_create_gustos_table', '1'), ('5', '2017_10_29_193801_create_regalos_table', '1'), ('6', '2017_10_29_193900_create_tiendas_table', '1'), ('7', '2017_10_30_142044_create_entregas_table', '1');
COMMIT;

-- ----------------------------
-- Table structure for participa
-- ----------------------------
DROP TABLE IF EXISTS `participa`;
CREATE TABLE `participa` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`admin`  tinyint(1) NOT NULL DEFAULT 0 ,
`asignado`  int(11) NOT NULL ,
`user_id`  int(10) UNSIGNED NOT NULL ,
`grupo_id`  int(10) UNSIGNED NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL ,
`updated_at`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `participa_user_id_foreign` (`user_id`) USING BTREE ,
INDEX `participa_grupo_id_foreign` (`grupo_id`) USING BTREE 
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of participa
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
`email`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`token`  varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ,
`created_at`  timestamp NULL DEFAULT NULL 
)
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci

;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
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
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of regalos
-- ----------------------------
BEGIN;
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
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of tiendas
-- ----------------------------
BEGIN;
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
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of tiene
-- ----------------------------
BEGIN;
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
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Procedure structure for reFormula
-- ----------------------------
DROP PROCEDURE IF EXISTS `reFormula`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reFormula`(id integer,cantidad integer)
begin
	declare rand1, rand2, iterator integer;
	declare ver1, ver2 integer; 
	set iterator = 0;
	while iterator<cantidad do
		
		SELECT FLOOR(RAND() * cantidad) into rand1;
		SELECT FLOOR(RAND() * cantidad) INTO rand2;
		SELECT COUNT(entrega) INTO ver1 FROM entrega WHERE grupo_id = id AND recibe = rand1;
		SELECT COUNT(entrega) INTO ver2 FROM entrega WHERE grupo_id = id AND entrega = rand2;
		if rand1<>rand2 and ver1=0 and ver2=0 then
			insert into entregas (entrega,recibe,grupo_id) values(rand2,rand1,id);
		end if;
	end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for buscarCantidad
-- ----------------------------
DROP FUNCTION IF EXISTS `buscarCantidad`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscarCantidad`(grupo int) RETURNS int(11)
BEGIN  
    DECLARE a int;
		select count(*) into a from participa where participa.grupo_id = grupo; 
	  return a;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for deleteEntregas
-- ----------------------------
DROP FUNCTION IF EXISTS `deleteEntregas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteEntregas`(id int) RETURNS int(11)
BEGIN
	declare cantidad integer;
	DELETE FROM entregas 
		WHERE
			entregas.grupo_id = id;

	select  COUNT(*)
		INTO cantidad FROM
			entregas e
		WHERE
			e.grupo_id = id;
		
	return cantidad;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for updatePrarticipante
-- ----------------------------
DROP FUNCTION IF EXISTS `updatePrarticipante`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updatePrarticipante`(id int, cantidad int ) RETURNS int(11)
BEGIN
	declare cantidad int;
	UPDATE grupos 
		SET 
			numero_participantes = cantidad
		WHERE
			id = id;
			
			SELECT 
			p.numero_participantes
		INTO cantidad FROM
			grupos AS p
		WHERE
			p.id = id;		
		return cantidad;
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for desea
-- ----------------------------
ALTER TABLE `desea` AUTO_INCREMENT=1;

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
ALTER TABLE `grupos` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for gustos
-- ----------------------------
ALTER TABLE `gustos` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for migrations
-- ----------------------------
ALTER TABLE `migrations` AUTO_INCREMENT=8;
DROP TRIGGER IF EXISTS `insertarParticipante`;
DELIMITER ;;
CREATE TRIGGER `insertarParticipante` BEFORE INSERT ON `participa` FOR EACH ROW BEGIN
	declare cantidad integer;
		select count(p.id) into cantidad
        from participa p
        where p.grupo_id = new.grupo_id;
    
	if(cantidad = 0) then
		set new.admin = true;
	END if;
    set new.asignado = cantidad + 1;
	set cantidad = deleteEntregas(NEW.grupo_id);
		select count(p.id) into cantidad
        from participa p
        where p.grupo_id = new.grupo_id;
	if(cantidad>1) then
		call reFormula(new.grupo_id,cantidad);
	end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for participa
-- ----------------------------
ALTER TABLE `participa` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for regalos
-- ----------------------------
ALTER TABLE `regalos` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for tiendas
-- ----------------------------
ALTER TABLE `tiendas` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for tiene
-- ----------------------------
ALTER TABLE `tiene` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
ALTER TABLE `users` AUTO_INCREMENT=1;
