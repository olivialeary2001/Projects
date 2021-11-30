-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: artmuseum
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art` (
  `ID` int NOT NULL,
  `ArtName` char(45) NOT NULL,
  `Code` char(45) DEFAULT NULL,
  `Type` char(45) DEFAULT NULL,
  `Weight` char(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_artist`
--

DROP TABLE IF EXISTS `art_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_artist` (
  `Art_ID` int NOT NULL,
  `Artist_ID` int NOT NULL,
  PRIMARY KEY (`Art_ID`,`Artist_ID`),
  KEY `fk_Art_Artist_Artist1_idx` (`Artist_ID`),
  KEY `fk_Art_Artist_Art1_idx` (`Art_ID`),
  CONSTRAINT `fk_Art_Artist_Art1` FOREIGN KEY (`Art_ID`) REFERENCES `art` (`ID`),
  CONSTRAINT `fk_Art_Artist_Artist1` FOREIGN KEY (`Artist_ID`) REFERENCES `artist` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_artist`
--

LOCK TABLES `art_artist` WRITE;
/*!40000 ALTER TABLE `art_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_storage`
--

DROP TABLE IF EXISTS `art_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_storage` (
  `Art_ID` int NOT NULL,
  `Storage_ID` int NOT NULL,
  `StoreDate` date NOT NULL,
  `Location` char(45) NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`Art_ID`,`Storage_ID`),
  KEY `fk_Art_Storage_Storage1_idx` (`Storage_ID`),
  KEY `fk_Art_Storage_Art1_idx` (`Art_ID`),
  CONSTRAINT `fk_Art_Storage_Art1` FOREIGN KEY (`Art_ID`) REFERENCES `art` (`ID`),
  CONSTRAINT `fk_Art_Storage_Storage1` FOREIGN KEY (`Storage_ID`) REFERENCES `storage` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_storage`
--

LOCK TABLES `art_storage` WRITE;
/*!40000 ALTER TABLE `art_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `ID` int NOT NULL,
  `LastName` char(45) DEFAULT NULL,
  `FirstName` char(45) DEFAULT NULL,
  `Address1` char(45) DEFAULT NULL,
  `Address2` char(45) DEFAULT NULL,
  `City` char(45) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` char(10) DEFAULT NULL,
  `Phone` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibit`
--

DROP TABLE IF EXISTS `exhibit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibit` (
  `ID` int NOT NULL,
  `Exhibit` char(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit`
--

LOCK TABLES `exhibit` WRITE;
/*!40000 ALTER TABLE `exhibit` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibit_art`
--

DROP TABLE IF EXISTS `exhibit_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibit_art` (
  `Exhibit_ID` int NOT NULL,
  `Art_ID` int NOT NULL,
  `Location` char(45) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`Exhibit_ID`,`Art_ID`),
  KEY `fk_Exhibit_Art_Art1_idx` (`Art_ID`),
  KEY `fk_Exhibit_Art_Exhibit1_idx` (`Exhibit_ID`),
  CONSTRAINT `fk_Exhibit_Art_Art1` FOREIGN KEY (`Art_ID`) REFERENCES `art` (`ID`),
  CONSTRAINT `fk_Exhibit_Art_Exhibit1` FOREIGN KEY (`Exhibit_ID`) REFERENCES `exhibit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit_art`
--

LOCK TABLES `exhibit_art` WRITE;
/*!40000 ALTER TABLE `exhibit_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibit_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `ID` int NOT NULL,
  `GalleryName` char(45) NOT NULL,
  `City` char(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_art`
--

DROP TABLE IF EXISTS `gallery_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_art` (
  `Gallery_ID` int NOT NULL,
  `Art_ID` int NOT NULL,
  `Location` char(45) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`Gallery_ID`,`Art_ID`),
  KEY `fk_Gallery_Art_Art1_idx` (`Art_ID`),
  KEY `fk_Gallery_Art_Gallery1_idx` (`Gallery_ID`),
  CONSTRAINT `fk_Gallery_Art_Art1` FOREIGN KEY (`Art_ID`) REFERENCES `art` (`ID`),
  CONSTRAINT `fk_Gallery_Art_Gallery1` FOREIGN KEY (`Gallery_ID`) REFERENCES `gallery` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_art`
--

LOCK TABLES `gallery_art` WRITE;
/*!40000 ALTER TABLE `gallery_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `ID` int NOT NULL,
  `Storage` char(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelingshow`
--

DROP TABLE IF EXISTS `travelingshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelingshow` (
  `ID` int NOT NULL,
  `TraveingShow` char(45) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelingshow`
--

LOCK TABLES `travelingshow` WRITE;
/*!40000 ALTER TABLE `travelingshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelingshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelingshow_art`
--

DROP TABLE IF EXISTS `travelingshow_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelingshow_art` (
  `TravelingShow_ID` int NOT NULL,
  `Art_ID` int NOT NULL,
  `Location` char(45) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`TravelingShow_ID`,`Art_ID`),
  KEY `fk_TravelingShow_Art_Art1_idx` (`Art_ID`),
  KEY `fk_TravelingShow_Art_TravelingShow1_idx` (`TravelingShow_ID`),
  CONSTRAINT `fk_TravelingShow_Art_Art1` FOREIGN KEY (`Art_ID`) REFERENCES `art` (`ID`),
  CONSTRAINT `fk_TravelingShow_Art_TravelingShow1` FOREIGN KEY (`TravelingShow_ID`) REFERENCES `travelingshow` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelingshow_art`
--

LOCK TABLES `travelingshow_art` WRITE;
/*!40000 ALTER TABLE `travelingshow_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelingshow_art` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 16:54:21
