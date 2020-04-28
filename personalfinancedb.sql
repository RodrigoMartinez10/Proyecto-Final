-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: personalfinancedb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `idOrden` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Plato` varchar(45) NOT NULL,
  `Complemento` varchar(45) DEFAULT NULL,
  `Bebida` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) NOT NULL COMMENT 'Anulada, Activa, Pagada',
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idOrden`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,'20182031','2020-04-25','00:00:00','Chao mein','Ensalada','Horchata','Anulada',6.25),(2,'20182031','2020-04-25','00:00:00','Hamburguesa','Papas fritas','Soda','Pagada',6.25),(3,'20182031','2020-04-25','12:26:03','Hamburguesa','Ensalada','Horchata','Pagada',6.50),(4,'20182031','2020-04-25','12:27:06','Papa horneada','Pure de papas','Te de jamaica','Anulada',4.75),(5,'20182970','2020-04-25','13:49:55','Hamburguesa','Ensalada','Soda','Pagada',6.75),(6,'20182970','2020-04-25','17:27:24','Pasta','Papas fritas','Soda','Pagada',5.50),(7,'20182031','2020-04-25','17:29:15','Tacos','Chimol','Te helado','Anulada',5.75),(8,'20182970','2020-04-27','19:19:03','Sopa de pollo','none','Horchata','Anulada',4.25),(9,'20182970','2020-04-27','19:21:47','Papa horneada','Chimol','Soda','Anulada',5.00),(10,'20182970','2020-04-27','20:51:03','Papa horneada','Chimol','Horchata','Activa',4.75),(11,'20182031','2020-04-27','22:02:09','Carne','Chimol','Horchata','Activa',6.25);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillos`
--

DROP TABLE IF EXISTS `platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platillos` (
  `Nombre` varchar(50) NOT NULL,
  `Precio` double NOT NULL,
  `Disponibilidad` int NOT NULL DEFAULT '0',
  `Tipo` varchar(50) NOT NULL,
  `Descripción` varchar(140) DEFAULT NULL,
  `Imagen` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillos`
--

LOCK TABLES `platillos` WRITE;
/*!40000 ALTER TABLE `platillos` DISABLE KEYS */;
INSERT INTO `platillos` VALUES ('Arroz',1,0,'complemento','3 oz de arroz.','arroz.jpg'),('Carne',4,1,'principal','4 oz a la plancha servida con cebolla.','carne.jpg'),('Chao mein',3.5,0,'principal','Fideos chinos combinados con carne, mariscos y verduras.','chaomein.jpg'),('Chimol',1.5,1,'complemento','Salsa de trozos de tomate, cebolla y cilantro.','chimol.jpg'),('Costillas',3,0,'principal','Costillas de cerdo guisadas y aderezadas con salsa BBQ.','costillas.jpg'),('Ensalada',2,1,'complemento','Ensalada fresca con cebolla, tomate y pepino.','ensalada.jpg'),('Hamburguesa',3.75,1,'principal','Hamburguesa de carne al pastor con tocino y queso cheddar.','hamburguesa.jpg'),('Horchata',0.75,1,'bebida','12 oz de horchata fresca.','horchata.jpg'),('Jugo de naranja',0.75,0,'bebida','12 oz de jugo de naranja natural.','jugodenaranja.jpg'),('Papa horneada',2.5,1,'principal','Papa horneada con queso y mantequilla.','papahorneada.jpg'),('Papas fritas',1.5,1,'complemento','Papas fritas con salsa ketchup y mayonesa.','papasfritas.jpg'),('Pasta',3,0,'principal','Pasta bañada en salsa de tomate con trozos de pollo.','pasta.jpg'),('Pescado',4,1,'principal','5 oz de pescado frito.','pescado.jpg'),('Pizza',3,0,'principal','p','p'),('Pollo',4,0,'principal','Pollo con papa y zanahoria bañado en salsa de tomate','pollo.jpg'),('Pure de papas',1.5,0,'complemento',' 3 oz de pure con especias.','puredepapas.jpg'),('Soda',1,1,'bebida','12 oz de cualquier soda disponible en la cafetería.','soda.jpg'),('Sopa de pollo',3.5,0,'principal','6 oz de sopa de pollo con vegetales, servido con tortilla','sopadepollo.jpg'),('Sopa de Tortilla',4,1,'principal','6 oz de sopa de tortilla con queso.','sopadetortilla.jpg'),('Tacos',3.5,0,'principal','Orden de 3 tacos al pastor.','tacos.jpg'),('Te de jamaica',0.75,0,'bebida','12 oz de té de jamaica.','tedejamaica.jpg'),('Te helado',0.75,0,'bebida','12 oz de té helado de limón.','tehelado.jpg');
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'normal',''),(2,'admin','');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idtype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Carnet_UNIQUE` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'20182960','Rodrigo Martínez','ro-martinez11@hotmail.com','rodrigo123','2'),(2,'20183104','David Rivas','david.martinezrivas@gmail.com','david123','2'),(3,'20182199','Diego Rivas','diegor.1999@hotmail.com','diego123','2'),(4,'20181726','Adrián Rodríguez','adrianrg099@gmail.com','adrian123','2'),(5,'20182202','Julio Blanco','imjebn@gmail.com','julio123','2'),(6,'20182892','Pablo Mendoza','Misterpablo15@gmail.com','pablo123','2'),(7,'20182359','Sebastián Córdova','sebascorcea@gmail.com','sebastian123','2'),(8,'17002960','prueba 1','rodsam45@gmail.com','prueba1','1'),(9,'20000000','prueba 2','rodsam45@gmail.com','prueba2','1'),(11,'11111111','prueba 3','rodsam45@gmail.com','prueba3','1'),(12,'22222222','prueba 4','rodsam45@gmail.com','prueba4','1'),(13,'23232323','prueba 5','a@c','prueba5','1'),(16,'20182031','Karen Larissa López Peña','karenvklc@gmail.com','lari123','1'),(17,'20182969','prueba15','ro@gmail.com','prueba15','1'),(18,'20182970','pruebaOrden','rodrigo@gmail.com','pruebaorden','1'),(19,'20180000','Prueba 22','correo@gmail.com','prueba','1'),(20,'20100000','Rodrigo','rod@mail.com','rodrigo123','1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'personalfinancedb'
--

--
-- Dumping routines for database 'personalfinancedb'
--
/*!50003 DROP PROCEDURE IF EXISTS `obtenerBebida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerBebida`()
BEGIN
select platillos.Nombre
from platillos
where platillos.Tipo = "bebida" and platillos.Disponibilidad = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerComplemento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerComplemento`()
BEGIN
select platillos.Nombre
from platillos
where platillos.Tipo = "complemento" and platillos.Disponibilidad = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerPlatoPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPlatoPrincipal`()
BEGIN
select platillos.Nombre
from platillos
where platillos.Tipo = "principal" and platillos.Disponibilidad = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 22:24:37
