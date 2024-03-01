-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: EduManage
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_alumnos`
--

DROP TABLE IF EXISTS `tb_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alumnos` (
  `id_alumno` char(15) NOT NULL DEFAULT uuid(),
  `carnet_alumno` varchar(10) DEFAULT NULL,
  `nombre_alumno` varchar(50) DEFAULT NULL,
  `apellido_alumno` varchar(50) DEFAULT NULL,
  `edad_alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `carnet_alumno` (`carnet_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alumnos`
--

LOCK TABLES `tb_alumnos` WRITE;
/*!40000 ALTER TABLE `tb_alumnos` DISABLE KEYS */;
INSERT INTO `tb_alumnos` VALUES ('91907015-d691-1','202300001','Juan','Perez',18),('92a69c50-d691-1','202300002','Maria','Garcia',19),('aad65154-d691-1','202300003','Pedro','Lopez',20),('ac150990-d691-1','202300004','Ana','Martinez',21),('ad11b658-d691-1','202300005','Carlos','Rodriguez',22),('ae4a9cb2-d691-1','202300006','Laura','Sanchez',23),('af965814-d691-1','202300007','Diego','Hernandez',24),('b0cd9b23-d691-1','202300008','Sofia','Gomez',25),('b2828c9a-d691-1','202300009','Alejandro','Torres',26),('b5897b48-d691-1','202300010','Lucia','Diaz',27),('b9500da2-d691-1','202300011','Javier','Ruiz',28),('bad47c70-d691-1','202300012','Elena','Jimenez',29),('bc8fa926-d691-1','202300013','Manuel','Vargas',30),('bdc95b33-d691-1','202300014','Carmen','Navarro',31),('bf2a3491-d691-1','202300015','Raul','Molina',32);
/*!40000 ALTER TABLE `tb_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_calificaciones`
--

DROP TABLE IF EXISTS `tb_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_calificaciones` (
  `id_calificacion` char(15) NOT NULL DEFAULT uuid(),
  `id_inscripcion` char(15) DEFAULT NULL,
  `calificacion_final` decimal(5,2) DEFAULT NULL,
  `fecha_calificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `id_inscripcion` (`id_inscripcion`),
  CONSTRAINT `tb_calificaciones_ibfk_1` FOREIGN KEY (`id_inscripcion`) REFERENCES `tb_inscripciones` (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_calificaciones`
--

LOCK TABLES `tb_calificaciones` WRITE;
/*!40000 ALTER TABLE `tb_calificaciones` DISABLE KEYS */;
INSERT INTO `tb_calificaciones` VALUES ('001246e3-d692-1',NULL,73.25,'2024-02-28'),('01814976-d692-1',NULL,91.00,'2024-02-28'),('03293542-d692-1',NULL,82.50,'2024-02-28'),('04487727-d692-1',NULL,88.25,'2024-02-28'),('f25bbc6e-d691-1',NULL,85.50,'2024-02-28'),('f36066e5-d691-1',NULL,77.25,'2024-02-28'),('f487d622-d691-1',NULL,90.00,'2024-02-28'),('f5c3c5e2-d691-1',NULL,65.75,'2024-02-28'),('f6e5937f-d691-1',NULL,88.00,'2024-02-28'),('f86e7ac0-d691-1',NULL,79.50,'2024-02-28'),('f9d0257c-d691-1',NULL,92.75,'2024-02-28'),('fafe4ba5-d691-1',NULL,70.25,'2024-02-28'),('fc369265-d691-1',NULL,84.00,'2024-02-28'),('fd5b94df-d691-1',NULL,76.75,'2024-02-28'),('fe80022f-d691-1',NULL,89.50,'2024-02-28');
/*!40000 ALTER TABLE `tb_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inscripciones`
--

DROP TABLE IF EXISTS `tb_inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inscripciones` (
  `id_inscripcion` char(15) NOT NULL DEFAULT uuid(),
  `id_alumno` char(15) DEFAULT NULL,
  `id_materia` char(15) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `tb_inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `tb_alumnos` (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inscripciones`
--

LOCK TABLES `tb_inscripciones` WRITE;
/*!40000 ALTER TABLE `tb_inscripciones` DISABLE KEYS */;
INSERT INTO `tb_inscripciones` VALUES ('d21b4e2f-d691-1',NULL,'1','2024-02-28','Activo'),('d337ef72-d691-1',NULL,'2','2024-02-28','Activo'),('d44780af-d691-1',NULL,'3','2024-02-28','Inactivo'),('d57f0799-d691-1',NULL,'4','2024-02-28','Activo'),('d69e7506-d691-1',NULL,'5','2024-02-28','Inactivo'),('d7f58ea8-d691-1',NULL,'6','2024-02-28','Activo'),('d90ac721-d691-1',NULL,'7','2024-02-28','Activo'),('daaa8d6c-d691-1',NULL,'8','2024-02-28','Inactivo'),('dc00ff6c-d691-1',NULL,'9','2024-02-28','Activo'),('ddd14bd5-d691-1',NULL,'10','2024-02-28','Activo'),('df33b481-d691-1',NULL,'11','2024-02-28','Inactivo'),('e0c0663b-d691-1',NULL,'12','2024-02-28','Activo'),('e21df7b2-d691-1',NULL,'13','2024-02-28','Activo'),('e3ae1fad-d691-1',NULL,'14','2024-02-28','Inactivo'),('e510a339-d691-1',NULL,'15','2024-02-28','Activo');
/*!40000 ALTER TABLE `tb_inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_materias`
--

DROP TABLE IF EXISTS `tb_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_materias` (
  `id_materia` char(15) NOT NULL DEFAULT uuid(),
  `nombre_materia` varchar(100) DEFAULT NULL,
  `grupo_materia` int(11) DEFAULT NULL,
  `id_profesor` char(15) DEFAULT NULL,
  `cupos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `tb_materias_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `tb_profesores` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_materias`
--

LOCK TABLES `tb_materias` WRITE;
/*!40000 ALTER TABLE `tb_materias` DISABLE KEYS */;
INSERT INTO `tb_materias` VALUES ('6f25fc01-d691-1','Matemáticas',1,NULL,30),('703b914b-d691-1','Física',2,NULL,25),('71bfc97d-d691-1','Química',1,NULL,30),('72f1242a-d691-1','Historia',3,NULL,20),('7452a2be-d691-1','Literatura',2,NULL,25),('75509f8e-d691-1','Inglés',1,NULL,0),('7686b4eb-d691-1','Biología',3,NULL,20),('77de1920-d691-1','Geografía',2,NULL,25),('7954d43d-d691-1','Arte',1,NULL,30),('7b1849b8-d691-1','Música',3,NULL,10),('7d373c8e-d691-1','Educación Física',2,NULL,5),('7e622bbe-d691-1','Informática',1,NULL,30),('801c3415-d691-1','Economía',3,NULL,20),('8259590a-d691-1','Filosofía',2,NULL,25),('83ef9524-d691-1','Ciencias Sociales',1,NULL,30);
/*!40000 ALTER TABLE `tb_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profesores`
--

DROP TABLE IF EXISTS `tb_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profesores` (
  `id_profesor` char(15) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profesores`
--

LOCK TABLES `tb_profesores` WRITE;
/*!40000 ALTER TABLE `tb_profesores` DISABLE KEYS */;
INSERT INTO `tb_profesores` VALUES ('4f373e5a-d691-1','Ricardo','De_Leon','Ricardo@gmail.com'),('5084d6ed-d691-1','Luis','Ortega','luis.ortega@example.com'),('5224fbd4-d691-1','Mario','Castro','mario.castro@example.com'),('53873574-d691-1','Isabel','Ortiz','isabel.ortiz@example.com'),('557545f0-d691-1','Antonio','Fernandez','antonio.fernandez@example.com'),('56f24ebc-d691-1','Raquel','Ramos','raquel.ramos@example.com'),('57e8b81a-d691-1','Pablo','Mendez','pablo.mendez@example.com'),('59812ef1-d691-1','Silvia','Cabrera','silvia.cabrera@example.com'),('5a8fcd4c-d691-1','Adrian','Guerra','adrian.guerra@example.com'),('5bb36357-d691-1','Natalia','Perez','natalia.perez@example.com'),('5d531312-d691-1','Julio','Gonzalez','julio.gonzalez@example.com'),('5eae6957-d691-1','Carolina','Delgado','carolina.delgado@example.com'),('5ff45f42-d691-1','Daniel','Serrano','daniel.serrano@example.com'),('613d63d6-d691-1','Marta','Luna','marta.luna@example.com'),('629205cc-d691-1','Roberto','Mora','roberto.mora@example.com');
/*!40000 ALTER TABLE `tb_profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 18:16:24
