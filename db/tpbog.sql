-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tpbasededatos
--

CREATE DATABASE IF NOT EXISTS tpbasededatos;
USE tpbasededatos;

--
-- Definition of table `tpbasededatos`.`blogs`
--

DROP TABLE IF EXISTS `tpbasededatos`.`blogs`;
CREATE TABLE  `tpbasededatos`.`blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `languaje_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_category_id` (`category_id`),
  KEY `blogs_languaje_id` (`languaje_id`),
  CONSTRAINT `blogs_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `blogs_languaje_id` FOREIGN KEY (`languaje_id`) REFERENCES `languajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tpbasededatos`.`blogs`
--

/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
LOCK TABLES `blogs` WRITE;
INSERT INTO `tpbasededatos`.`blogs` VALUES  (1,NULL,'El origen de la vida',NULL,NULL,9,3),
 (2,NULL,'Animales salvajes',NULL,NULL,9,3),
 (3,NULL,'Tercer Tiempo',NULL,NULL,2,3),
 (4,NULL,'Ironman Journal',NULL,NULL,2,1),
 (5,NULL,'La MicroEmpresa',NULL,NULL,10,3),
 (6,NULL,'Dinamica ciudadana',NULL,NULL,10,3),
 (7,NULL,'TechCrunch',NULL,NULL,1,1),
 (8,NULL,'The Next Web',NULL,NULL,1,1),
 (9,NULL,'Laughing Squid',NULL,NULL,8,1),
 (10,NULL,'Le blog de musique',NULL,NULL,13,8),
 (11,NULL,'Blog Cellulari',NULL,NULL,15,10),
 (12,NULL,'Casa dolce casa',NULL,NULL,4,10),
 (13,NULL,'Hostinato, a scanso di equivoci',NULL,NULL,1,10),
 (14,NULL,'Blog di Gigi Tagliapietra',NULL,NULL,5,10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;


--
-- Definition of table `tpbasededatos`.`categories`
--

DROP TABLE IF EXISTS `tpbasededatos`.`categories`;
CREATE TABLE  `tpbasededatos`.`categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_categories_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tpbasededatos`.`categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
LOCK TABLES `categories` WRITE;
INSERT INTO `tpbasededatos`.`categories` VALUES  (8,'Arte y Cultura'),
 (9,'Ciencias y Naturaleza'),
 (2,'Deportes'),
 (10,'Economía y Negocios'),
 (11,'Educación'),
 (4,'Espectaculos'),
 (15,'Informática'),
 (5,'Juegos'),
 (13,'Música'),
 (3,'Noticias'),
 (7,'Religión'),
 (12,'Salud y Medicina'),
 (1,'Tecnologia'),
 (14,'Viajes y Turismo');
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `tpbasededatos`.`languajes`
--

DROP TABLE IF EXISTS `tpbasededatos`.`languajes`;
CREATE TABLE  `tpbasededatos`.`languajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_languajes_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tpbasededatos`.`languajes`
--

/*!40000 ALTER TABLE `languajes` DISABLE KEYS */;
LOCK TABLES `languajes` WRITE;
INSERT INTO `tpbasededatos`.`languajes` VALUES  (9,'Alemán'),
 (6,'Árabe'),
 (2,'Chino'),
 (3,'Español'),
 (8,'Francés'),
 (1,'Inglés'),
 (10,'Italiano'),
 (7,'Japonés'),
 (4,'Portugués'),
 (5,'Ruso');
UNLOCK TABLES;
/*!40000 ALTER TABLE `languajes` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
