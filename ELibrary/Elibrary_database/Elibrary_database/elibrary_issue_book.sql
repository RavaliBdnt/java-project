-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: elibrary
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `issue_book`
--

DROP TABLE IF EXISTS `issue_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_book` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `reg_no` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(45) NOT NULL,
  `date_of_issue` varchar(45) NOT NULL,
  `name_of_candidate` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `date_of_return` varchar(45) DEFAULT NULL,
  `librarian_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_book`
--

LOCK TABLES `issue_book` WRITE;
/*!40000 ALTER TABLE `issue_book` DISABLE KEYS */;
INSERT INTO `issue_book` VALUES (5,4,'Java for Dummies ','Barry A. Burd','2022-11-24','Vishnudeep Sudham','Adilabad','','Abdul Azeem'),(6,3,'Head First Java ','Kathy Sierra ','2022-11-07','Anmol Rathod','Utnoor','2022-11-29','Abdul Azeem'),(7,5,'Spring in Action ','Craig Walls','2022-11-08','Sai Kiran','Jainath',NULL,'Abdul Azeem'),(8,3,'Head First Java ','Kathy Sierra ','2022-11-11','Salman Khan ','Mumbai',NULL,'Abdul Azeem');
/*!40000 ALTER TABLE `issue_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 17:50:26
