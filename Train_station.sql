-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: train_station
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_em` int NOT NULL,
  `id_st` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Gender` varchar(200) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Salery` int DEFAULT NULL,
  `STARTING_DATE` date DEFAULT NULL,
  `job_description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_em`),
  KEY `id_st` (`id_st`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handles`
--

DROP TABLE IF EXISTS `handles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `handles` (
  `id_r3` int NOT NULL,
  `id_st` int DEFAULT NULL,
  `id_em` int DEFAULT NULL,
  PRIMARY KEY (`id_r3`),
  KEY `id_st` (`id_st`),
  KEY `id_em` (`id_em`),
  CONSTRAINT `handles_ibfk_1` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`),
  CONSTRAINT `handles_ibfk_2` FOREIGN KEY (`id_em`) REFERENCES `employee` (`id_em`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handles`
--

LOCK TABLES `handles` WRITE;
/*!40000 ALTER TABLE `handles` DISABLE KEYS */;
/*!40000 ALTER TABLE `handles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `id_tr` bigint DEFAULT NULL,
  `id_st` int DEFAULT NULL,
  `trip_no` int DEFAULT NULL,
  KEY `id_tr` (`id_tr`),
  KEY `id_st` (`id_st`),
  KEY `trip_no` (`trip_no`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`id_tr`) REFERENCES `train` (`id_tr`),
  CONSTRAINT `has_ibfk_2` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`),
  CONSTRAINT `has_ibfk_3` FOREIGN KEY (`trip_no`) REFERENCES `timetable` (`trip_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manages`
--

DROP TABLE IF EXISTS `manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manages` (
  `id_r1` int NOT NULL,
  `id_st` int DEFAULT NULL,
  `id_em` int DEFAULT NULL,
  PRIMARY KEY (`id_r1`),
  KEY `id_st` (`id_st`),
  KEY `id_em` (`id_em`),
  CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`),
  CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`id_em`) REFERENCES `employee` (`id_em`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manages`
--

LOCK TABLES `manages` WRITE;
/*!40000 ALTER TABLE `manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Name` varchar(255) DEFAULT NULL,
  `National_id` bigint NOT NULL,
  `Trip_no` int DEFAULT NULL,
  PRIMARY KEY (`National_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `id_st` int NOT NULL,
  `id_tr` bigint DEFAULT NULL,
  `National_id` bigint DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_st`),
  KEY `id_tr` (`id_tr`),
  KEY `National_id` (`National_id`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`id_tr`) REFERENCES `train` (`id_tr`),
  CONSTRAINT `station_ibfk_2` FOREIGN KEY (`National_id`) REFERENCES `passenger` (`National_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `id_r4` int NOT NULL,
  `National_id` bigint DEFAULT NULL,
  `id_tr` bigint DEFAULT NULL,
  PRIMARY KEY (`id_r4`),
  KEY `id_tr` (`id_tr`),
  KEY `National_id` (`National_id`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`id_tr`) REFERENCES `train` (`id_tr`),
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`National_id`) REFERENCES `passenger` (`National_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `trip_no` int NOT NULL,
  `id_tr` bigint DEFAULT NULL,
  `id_st` int DEFAULT NULL,
  `arriving_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`trip_no`),
  KEY `id_tr` (`id_tr`),
  KEY `id_st` (`id_st`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`id_tr`) REFERENCES `train` (`id_tr`),
  CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `id_tr` bigint NOT NULL,
  `Destination` varchar(300) NOT NULL,
  `Traine_degree` varchar(20) NOT NULL,
  `Seat_no` int NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`id_tr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_in`
--

DROP TABLE IF EXISTS `works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_in` (
  `id_r2` int NOT NULL,
  `id_em` int DEFAULT NULL,
  `id_st` int DEFAULT NULL,
  PRIMARY KEY (`id_r2`),
  KEY `id_em` (`id_em`),
  KEY `id_st` (`id_st`),
  CONSTRAINT `works_in_ibfk_1` FOREIGN KEY (`id_em`) REFERENCES `employee` (`id_em`),
  CONSTRAINT `works_in_ibfk_2` FOREIGN KEY (`id_st`) REFERENCES `station` (`id_st`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_in`
--

LOCK TABLES `works_in` WRITE;
/*!40000 ALTER TABLE `works_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-09  0:17:05
