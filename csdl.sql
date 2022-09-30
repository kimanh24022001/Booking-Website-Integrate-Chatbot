-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: hotal
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accpted`
--

DROP TABLE IF EXISTS `accpted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accpted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `bedding` varchar(50) DEFAULT NULL,
  `number_of_room` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accpted`
--

LOCK TABLES `accpted` WRITE;
/*!40000 ALTER TABLE `accpted` DISABLE KEYS */;
INSERT INTO `accpted` VALUES (35,'Hamza','rjvideos9@gmail.com','Pakistani','Deluxe Room','Double','3','2021-09-17','2021-09-14'),(36,'Hamza','rjvideos9@gmail.com','Pakistani','Deluxe Room','Double','3','2021-09-17','2021-09-14'),(37,'marruhk','dsfkjafkdf@gmail.com','Pakistani','Superior Room','Single','1','2021-09-15','2021-09-24');
/*!40000 ALTER TABLE `accpted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'hamza','123'),(2,'ahmad','1122');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `name` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('hamza','rjvideos@gmail.com','2021-09-01 00:44:53',NULL,1),('hamza','rjvideos@gmail.com','2021-09-01 00:45:23',NULL,2),('hamza','rjvideos@gmail.com','2021-09-01 00:45:58',NULL,3),('rajpoot','rj@gamil.com','2021-09-01 12:25:40',NULL,4),('rajpoot','rj@gamil.com','2021-09-01 12:25:40',NULL,5),('hamz','rjvideos9@gmail.com','2021-09-01 13:20:10',NULL,6),('helo','rjv@gmail.com','2021-09-01 15:51:11',NULL,7),('Hamza','rjvideos9@gmail.com','2021-09-02 02:43:24',NULL,8),('Hamza','rjvideos9@gmail.com','2021-09-02 10:01:40','03041080841',9),('hamza','rjvideos9@gmail.com','2021-09-02 10:29:40','03041080841',10),('hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',11),('hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',12),('Hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',13),('Hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',14),('Hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',15),('Hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',16),('Hamza','rjvideos9@gmail.com','2021-09-02 10:31:31','03041080841',17),('Hamza','rjvideos9@gmail.com','2021-09-02 10:36:34','03041080841',18),('Hamza','rjvideos9@gmail.com','2021-09-02 10:40:21','03041080841',19),('Hamza','rjvideos9@gmail.com','2021-09-02 10:41:35','03041080841',20),('Hamza','Rjvideos9@gmail.com','2021-09-02 10:41:35','03041080841',21),('Hamza','rjvideos9@gmail.com','2021-09-02 10:41:35','03041080841',22),('Hamza','rjvideos9@gmail.com','2021-09-02 10:41:35','03041080841',23),('Hamza','rjvideos9@gmail.com','2021-09-02 10:41:35','03041080841',24);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reject`
--

DROP TABLE IF EXISTS `reject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `bedding` varchar(50) DEFAULT NULL,
  `number_of_room` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reject`
--

LOCK TABLES `reject` WRITE;
/*!40000 ALTER TABLE `reject` DISABLE KEYS */;
INSERT INTO `reject` VALUES (7,'Waris ali','rjvideos9@gmail.com','Pakistani','Deluxe Room','Single','1','2021-09-09','2021-09-08'),(8,'Waris ali','rjvideos9@gmail.com','Pakistani','Deluxe Room','Single','1','2021-09-09','2021-09-08'),(9,'Hamza','rjvideos9@gmail.com','Pakistani','Superior Room','Triple','1','2021-09-17','2021-09-17'),(10,'Hamza','rjvideos9@gmail.com','Pakistani','Superior Room','Triple','1','2021-09-17','2021-09-17'),(11,'Hamza','rjvideos9@gmail.com','Pakistani','Superior Room','Triple','1','2021-09-17','2021-09-17'),(12,'Hamza','rjvideos9@gmail.com','Pakistani','Superior Room','Triple','1','2021-09-17','2021-09-17'),(13,'Hamza','rjvideos9@gmail.com','Pakistani','Deluxe Room','Double','3','2021-09-17','2021-09-14'),(14,'Hamza','rjvideos9@gmail.com','Pakistani','Deluxe Room','Double','3','2021-09-17','2021-09-14');
/*!40000 ALTER TABLE `reject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type_of_room` varchar(50) DEFAULT NULL,
  `Bedding_Type` varchar(50) DEFAULT NULL,
  `Number_of_rooms` varchar(50) DEFAULT NULL,
  `check_in` varchar(50) DEFAULT NULL,
  `check_out` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (60,'Mr.','Hamza','Rajpoot','rjvideos9@gmail.com','Pakistani','03041080841','Deluxe Room','Double','3','2021-09-17','2021-09-14');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hotal'
--

--
-- Dumping routines for database 'hotal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-29 11:39:54