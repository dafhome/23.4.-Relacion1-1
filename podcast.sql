CREATE DATABASE  IF NOT EXISTS `podcast` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `podcast`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: podcast
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `descargas`
--

DROP TABLE IF EXISTS `descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descargas` (
  `iddescargas` int(11) NOT NULL AUTO_INCREMENT,
  `id_podcast` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_descarga` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`iddescargas`),
  KEY `fk_usuarios_idx` (`id_usuario`),
  KEY `fk_podcast_idx` (`id_podcast`),
  CONSTRAINT `fk_podcast` FOREIGN KEY (`id_podcast`) REFERENCES `podcast` (`idpodcast`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descargas`
--

LOCK TABLES `descargas` WRITE;
/*!40000 ALTER TABLE `descargas` DISABLE KEYS */;
INSERT INTO `descargas` VALUES (1,1,1,'2024-06-19 20:20:21'),(2,2,1,'2024-06-19 20:20:21'),(3,3,2,'2024-06-19 20:20:21'),(4,1,2,'2024-06-19 20:20:21'),(5,3,3,'2024-06-19 20:20:21'),(6,2,3,'2024-06-19 20:20:21'),(7,1,2,'2024-06-19 20:20:21'),(8,1,1,'2024-06-19 20:20:21'),(9,1,1,'2024-06-19 20:36:58'),(10,2,2,'2024-06-19 20:36:58'),(11,3,3,'2024-06-19 20:36:58'),(12,4,4,'2024-06-19 20:36:58'),(13,5,5,'2024-06-19 20:36:58'),(14,6,6,'2024-06-19 20:36:58'),(15,7,7,'2024-06-19 20:36:58'),(16,8,8,'2024-06-19 20:36:58'),(17,9,9,'2024-06-19 20:36:58'),(18,10,10,'2024-06-19 20:36:58'),(19,1,2,'2024-06-19 20:36:58'),(20,2,3,'2024-06-19 20:36:58');
/*!40000 ALTER TABLE `descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_descarga`
--

DROP TABLE IF EXISTS `detalle_descarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_descarga` (
  `iddetalle_descarga` int(11) NOT NULL AUTO_INCREMENT,
  `peso_fichero` int(11) NOT NULL,
  `duracion_descarga` time NOT NULL,
  `formato_archivo` varchar(45) NOT NULL,
  `id_descarga` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_descarga`),
  UNIQUE KEY `id_descarga_UNIQUE` (`id_descarga`),
  KEY `fk_descargas_idx` (`id_descarga`),
  CONSTRAINT `fk_descargas` FOREIGN KEY (`id_descarga`) REFERENCES `descargas` (`iddescargas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_descarga`
--

LOCK TABLES `detalle_descarga` WRITE;
/*!40000 ALTER TABLE `detalle_descarga` DISABLE KEYS */;
INSERT INTO `detalle_descarga` VALUES (1,500,'00:05:00','mp3',1),(2,450,'00:04:30','wav',2),(3,600,'00:06:00','aac',3),(4,550,'00:05:45','flac',4),(5,480,'00:04:45','mp3',5),(6,470,'00:04:30','wav',6),(7,620,'00:06:15','aac',7),(8,580,'00:05:55','flac',8),(9,510,'00:05:10','mp3',9),(10,530,'00:05:30','wav',10),(11,490,'00:04:50','aac',11),(12,610,'00:06:10','flac',12),(13,540,'00:05:40','mp3',13),(14,460,'00:04:40','wav',14),(15,570,'00:05:50','aac',15),(16,590,'00:06:00','flac',16),(17,550,'00:05:45','mp3',17),(18,520,'00:05:20','wav',18),(19,580,'00:05:55','aac',19),(20,600,'00:06:05','flac',20);
/*!40000 ALTER TABLE `detalle_descarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podcast`
--

DROP TABLE IF EXISTS `podcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `podcast` (
  `idpodcast` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tema` varchar(45) NOT NULL,
  `duracion` time NOT NULL,
  `fecha_carga` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idpodcast`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podcast`
--

LOCK TABLES `podcast` WRITE;
/*!40000 ALTER TABLE `podcast` DISABLE KEYS */;
INSERT INTO `podcast` VALUES (1,'La Cocina','Comida','01:40:00','2024-06-19 20:15:27'),(2,'La Cochera','Mecanica','00:35:51','2024-06-19 20:15:27'),(3,'Chistes de Barrio','Humor','00:59:59','2024-06-19 20:15:27'),(4,'El Mundo de la Ciencia','Ciencia','00:45:30','2024-06-19 20:36:50'),(5,'Historias de Terror','Terror','01:15:00','2024-06-19 20:36:50'),(6,'Comedia para Todos','Humor','00:50:00','2024-06-19 20:36:50'),(7,'Noticias del Día','Noticias','00:30:00','2024-06-19 20:36:50'),(8,'Tecnología Hoy','Tecnología','01:00:00','2024-06-19 20:36:50'),(9,'Aventuras Fantásticas','Fantasía','01:20:00','2024-06-19 20:36:50'),(10,'Cultura y Sociedad','Cultura','00:40:00','2024-06-19 20:36:50'),(11,'Deportes al Día','Deportes','00:55:00','2024-06-19 20:36:50'),(12,'Misterios del Universo','Misterio','01:10:00','2024-06-19 20:36:50'),(13,'Charlas de Filosofía','Filosofía','01:05:00','2024-06-19 20:36:50');
/*!40000 ALTER TABLE `podcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Pedro','pedro@pedro.com','2024-06-19 20:13:10'),(2,'Maria','maria@maria.com','2024-06-19 20:13:10'),(3,'Juan','juan@yahoo.com','2024-06-19 20:13:10'),(4,'Luis','luis@example.com','2024-06-19 20:36:54'),(5,'Ana','ana@example.com','2024-06-19 20:36:54'),(6,'Carlos','carlos@example.com','2024-06-19 20:36:54'),(7,'Laura','laura@example.com','2024-06-19 20:36:54'),(8,'Miguel','miguel@example.com','2024-06-19 20:36:54'),(9,'Sofía','sofia@example.com','2024-06-19 20:36:54'),(10,'Jorge','jorge@example.com','2024-06-19 20:36:54'),(11,'Elena','elena@example.com','2024-06-19 20:36:54'),(12,'Raúl','raul@example.com','2024-06-19 20:36:54'),(13,'Andrea','andrea@example.com','2024-06-19 20:36:54');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 20:28:14
