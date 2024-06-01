-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: MiniDb
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Temporary view structure for view `ActiveReservations`
--

DROP TABLE IF EXISTS `ActiveReservations`;
/*!50001 DROP VIEW IF EXISTS `ActiveReservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ActiveReservations` AS SELECT 
 1 AS `reservation_id`,
 1 AS `client_id`,
 1 AS `flat_id`,
 1 AS `status`,
 1 AS `people_count`,
 1 AS `date_from`,
 1 AS `date_to`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Admins`
--

DROP TABLE IF EXISTS `Admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `Admins_ak_1` (`email`),
  UNIQUE KEY `Admins__email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admins`
--

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` (`admin_id`, `firstname`, `lastname`, `email`, `phone_number`, `password`) VALUES (1,'Administrator','Jeden','admin1@example.com','1234567890','haslo1'),(2,'Administrator','Dwa','admin2@example.com','1234567891','haslo2');
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` varchar(320) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `Clients_ak_1` (`email`),
  UNIQUE KEY `Clients__email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` (`client_id`, `firstname`, `lastname`, `email`, `phone_number`, `password`) VALUES (1,'Jan','Kowalski','jan.kowalski@example.com','9876543210','haslo3'),(2,'Anna','Nowak','anna.nowak@example.com','9876543211','haslo4'),(3,'Alicja','Kowalska','alicja.kowalska@example.com','9876543212','haslo5'),(4,'Robert','Nowak','robert.nowak@example.com','9876543213','haslo6'),(5,'Piotr','Wojciechowski','piotr.wojciechowski@example.com','9876543214','haslo7'),(6,'Maria','Kaczmarek','maria.kaczmarek@example.com','9876543215','haslo8'),(7,'Tomasz','Zieliński','tomasz.zielinski@example.com','9876543216','haslo9'),(8,'Katarzyna','Wójcik','katarzyna.wojcik@example.com','9876543217','haslo10'),(9,'Marek','Lewandowski','marek.lewandowski@example.com','9876543218','haslo11'),(10,'Magdalena','Szymańska','magdalena.szymanska@example.com','9876543219','haslo12'),(11,'Paweł','Woźniak','pawel.wozniak@example.com','9876543220','haslo13'),(12,'Joanna','Dąbrowska','joanna.dabrowska@example.com','9876543221','haslo14'),(13,'Andrzej','Król','andrzej.krol@example.com','9876543222','haslo15'),(14,'Monika','Majewska','monika.majewska@example.com','9876543223','haslo16'),(15,'Krzysztof','Olszewski','krzysztof.olszewski@example.com','9876543224','haslo17'),(16,'Zofia','Stępień','zofia.stepien@example.com','9876543225','haslo18'),(17,'Wojciech','Jaworski','wojciech.jaworski@example.com','9876543226','haslo19'),(18,'Ewa','Malinowska','ewa.malinowska@example.com','9876543227','haslo20'),(19,'Adam','Pawlak','adam.pawlak@example.com','9876543228','haslo21'),(20,'Agnieszka','Kubiak','agnieszka.kubiak@example.com','9876543229','haslo22');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flats`
--

DROP TABLE IF EXISTS `Flats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flats` (
  `flat_id` int NOT NULL AUTO_INCREMENT,
  `floor` int NOT NULL,
  `flat_number` int NOT NULL,
  `size` int NOT NULL,
  `rooms_count` int NOT NULL,
  `is_bathroom` tinyint(1) NOT NULL,
  `is_kitchen` tinyint(1) NOT NULL,
  `price_for_day` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`flat_id`),
  UNIQUE KEY `Flats_ak_1` (`flat_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flats`
--

LOCK TABLES `Flats` WRITE;
/*!40000 ALTER TABLE `Flats` DISABLE KEYS */;
INSERT INTO `Flats` (`flat_id`, `floor`, `flat_number`, `size`, `rooms_count`, `is_bathroom`, `is_kitchen`, `price_for_day`, `description`) VALUES (1,1,101,6,3,1,1,200.00,'Mieszkanie na 1. piętrze: Przestronne trzypokojowe mieszkanie z salonem, wspólną łazienką oraz nowoczesną kuchnią. Luksusowe wykończenia dla wymagających.'),(2,1,102,4,2,1,0,180.00,'Mieszkanie na 1. piętrze: Dwupokojowe mieszkanie z salonem i wspólną łazienką, zapewniające komfort i prywatność. Idealne na krótkoterminowy wynajem.'),(3,1,103,5,3,1,1,220.00,'Mieszkanie na 1. piętrze: Luksusowe trzypokojowe mieszkanie z salonem i wspólną łazienką. Wysokiej klasy wykończenia i kuchnia idealna dla rodziny.'),(4,1,104,2,2,1,0,160.00,'Mieszkanie na 1. piętrze: Dwuosobowe mieszkanie z dwoma pokojami i wspólną łazienką. Eleganckie i idealne dla pary lub dwóch współlokatorów.'),(5,2,201,6,3,1,1,210.00,'Mieszkanie na 2. piętrze: Trzypokojowe mieszkanie z salonem, wspólną łazienką oraz kuchnią. Doskonałe na krótki wynajem dla grupy przyjaciół lub rodziny.'),(6,2,202,4,2,1,0,175.00,'Mieszkanie na 2. piętrze: Dwupokojowe mieszkanie z salonem, wspólną łazienką. Doskonałe dla osób ceniących przestrzeń i luksus.'),(7,2,203,3,2,1,1,190.00,'Mieszkanie na 2. piętrze: Mieszkanie z dwoma pokojami, salonem, wspólną łazienką i kuchnią. Idealne dla małej rodziny lub przyjaciół.'),(8,2,204,1,1,1,0,150.00,'Mieszkanie na 2. piętrze: Jednoosobowe, jednopokojowe mieszkanie z salonem i wspólną łazienką. Komfort i luksus w kompaktowej formie.'),(9,3,301,6,3,1,1,215.00,'Mieszkanie na 3. piętrze: Trzypokojowe mieszkanie z salonem i kuchnią, każdy pokój z własną łazienką. Sauna w mieszkaniu dodaje luksusu.'),(10,3,302,5,3,1,0,200.00,'Mieszkanie na 3. piętrze: Luksusowe trzypokojowe mieszkanie z salonem i wspólną łazienką. Maksymalizacja przestrzeni mieszkalnej.'),(11,3,303,4,3,1,1,205.00,'Mieszkanie na 3. piętrze: Trzypokojowe mieszkanie z salonem, wspólną łazienką i kuchnią. Luksusowy wystrój i wygoda.'),(12,3,304,2,2,1,0,165.00,'Mieszkanie na 3. piętrze: Dwupokojowe mieszkanie dla dwóch osób z salonem i wspólną łazienką. Idealne dla osób ceniących sobie prywatność, doskonałe na krótkoterminowy wynajem.');
/*!40000 ALTER TABLE `Flats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `Payments_ak_1` (`reservation_id`),
  KEY `Payments_Admins` (`admin_id`),
  CONSTRAINT `Payments_Admins` FOREIGN KEY (`admin_id`) REFERENCES `Admins` (`admin_id`),
  CONSTRAINT `Payments_Reservations` FOREIGN KEY (`reservation_id`) REFERENCES `Reservations` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` (`payment_id`, `reservation_id`, `amount`, `date`, `admin_id`) VALUES (1,1,400.00,'2023-04-01 00:00:00',NULL),(2,2,540.00,'2023-04-15 00:00:00',NULL),(3,3,220.00,'2023-05-10 00:00:00',NULL),(4,4,160.00,'2023-03-01 00:00:00',NULL),(5,4,160.00,'2023-03-03 00:00:00',NULL),(6,5,420.00,'2023-03-05 00:00:00',NULL),(7,6,350.00,'2023-03-15 00:00:00',NULL),(8,6,175.00,'2023-03-18 00:00:00',NULL),(9,7,570.00,'2023-02-05 00:00:00',NULL),(10,8,150.00,'2023-02-12 00:00:00',NULL),(11,9,645.00,'2023-02-20 00:00:00',NULL),(12,7,-570.00,'2023-02-07 00:00:00',1),(13,8,-150.00,'2023-02-14 00:00:00',2),(14,10,200.00,'2023-02-25 00:00:00',NULL),(15,11,410.00,'2023-03-02 00:00:00',NULL),(16,12,330.00,'2023-03-10 00:00:00',NULL),(17,13,400.00,'2023-03-12 00:00:00',NULL),(18,14,360.00,'2023-03-18 00:00:00',NULL),(19,15,440.00,'2023-03-20 00:00:00',NULL),(20,16,320.00,'2023-03-22 00:00:00',NULL),(21,17,420.00,'2023-03-25 00:00:00',NULL),(22,18,350.00,'2023-03-28 00:00:00',NULL),(23,19,380.00,'2023-03-30 00:00:00',NULL),(24,20,300.00,'2023-04-02 00:00:00',NULL),(25,2,-540.00,'2024-05-27 20:02:54',1),(26,21,1000.00,'2024-05-30 00:00:00',NULL),(27,22,1000.00,'2024-05-30 11:30:20',NULL),(28,23,1080.00,'2024-05-30 11:30:20',NULL),(29,24,1540.00,'2024-05-30 11:30:20',NULL),(30,25,800.00,'2024-05-30 11:30:20',NULL),(31,26,1260.00,'2024-05-30 11:30:20',NULL),(32,27,2800.00,'2024-05-30 11:30:20',NULL),(33,28,2850.00,'2024-05-30 11:30:20',NULL),(34,29,1050.00,'2024-05-30 11:30:20',NULL),(35,30,1505.00,'2024-05-30 11:30:20',NULL),(36,31,1400.00,'2024-05-30 11:30:20',NULL),(37,32,1435.00,'2024-05-30 11:30:20',NULL),(38,33,1155.00,'2024-05-30 11:30:20',NULL),(39,34,1400.00,'2024-05-30 11:30:20',NULL),(40,35,1260.00,'2024-05-30 11:30:20',NULL),(41,30,-1505.00,'2024-05-30 11:38:58',1);
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservations`
--

DROP TABLE IF EXISTS `Reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `flat_id` int NOT NULL,
  `status` int NOT NULL,
  `people_count` int NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `Reservations_Clients` (`client_id`),
  KEY `Reservations_Flats` (`flat_id`),
  CONSTRAINT `Reservations_Clients` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`),
  CONSTRAINT `Reservations_Flats` FOREIGN KEY (`flat_id`) REFERENCES `Flats` (`flat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservations`
--

LOCK TABLES `Reservations` WRITE;
/*!40000 ALTER TABLE `Reservations` DISABLE KEYS */;
INSERT INTO `Reservations` (`reservation_id`, `client_id`, `flat_id`, `status`, `people_count`, `date_from`, `date_to`, `price`) VALUES (1,1,1,1,4,'2024-06-01','2024-06-03',400.00),(2,2,2,0,3,'2024-06-02','2024-06-05',540.00),(3,3,3,1,5,'2024-06-03','2024-06-04',220.00),(4,4,4,1,2,'2024-06-04','2024-06-06',320.00),(5,5,5,1,6,'2024-06-05','2024-06-07',420.00),(6,6,6,0,4,'2024-06-06','2024-06-09',525.00),(7,7,7,1,3,'2024-06-07','2024-06-10',570.00),(8,8,8,1,1,'2024-06-08','2024-06-09',150.00),(9,9,9,1,6,'2024-06-09','2024-06-12',645.00),(10,10,10,1,5,'2024-06-10','2024-06-11',200.00),(11,11,11,0,4,'2024-06-11','2024-06-13',410.00),(12,12,12,1,2,'2024-06-12','2024-06-14',330.00),(13,13,1,1,4,'2024-06-13','2024-06-15',400.00),(14,14,2,1,3,'2024-06-14','2024-06-16',360.00),(15,15,3,0,5,'2024-06-15','2024-06-17',440.00),(16,16,4,1,2,'2024-06-16','2024-06-18',320.00),(17,17,5,1,6,'2024-06-17','2024-06-19',420.00),(18,18,6,1,4,'2024-06-18','2024-06-20',350.00),(19,19,7,1,3,'2024-06-19','2024-06-21',380.00),(20,20,8,0,1,'2024-06-20','2024-06-22',300.00),(21,2,1,1,6,'2024-06-23','2024-06-28',1000.00),(22,1,1,1,3,'2024-03-28','2024-04-02',1000.00),(23,2,2,1,2,'2024-03-30','2024-04-05',1080.00),(24,3,3,1,5,'2024-03-25','2024-04-01',1540.00),(25,4,4,1,2,'2024-03-29','2024-04-03',800.00),(26,5,5,1,4,'2024-03-27','2024-04-02',1260.00),(27,6,6,1,4,'2024-04-15','2024-05-01',2800.00),(28,7,7,1,3,'2024-04-20','2024-05-05',2850.00),(29,8,8,1,1,'2024-04-05','2024-04-12',1050.00),(30,9,9,0,6,'2024-04-08','2024-04-15',1505.00),(31,10,10,1,5,'2024-04-10','2024-04-17',1400.00),(32,11,11,1,4,'2024-04-12','2024-04-19',1435.00),(33,12,12,1,2,'2024-04-14','2024-04-21',1155.00),(34,1,1,1,3,'2024-04-16','2024-04-23',1400.00),(35,2,2,1,2,'2024-04-18','2024-04-25',1260.00);
/*!40000 ALTER TABLE `Reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS BeforeInsertReservation */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `BeforeInsertReservation` BEFORE INSERT ON `Reservations` FOR EACH ROW BEGIN
#     IF NEW.date_from<curdate() THEN
#         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cannot set date_from to a past date' ;
#     END IF;
    IF NEW.date_from >= NEW.date_to THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'date_from must be less than date_to.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AfterInsertReservation */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AfterInsertReservation` AFTER INSERT ON `Reservations` FOR EACH ROW BEGIN
    INSERT INTO Payments (reservation_id, amount, date, admin_id)
    VALUES (NEW.reservation_id, NEW.price, NOW(), NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS BeforeUpdateReservation */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `BeforeUpdateReservation` BEFORE UPDATE ON `Reservations` FOR EACH ROW BEGIN
#     IF NEW.date_from<curdate() THEN
#         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cannot update date_from to a past date' ;
#     END IF;
    IF NEW.date_from >= NEW.date_to THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'date_from must be less than date_to.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS AfterUpdateReservation */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AfterUpdateReservation` AFTER UPDATE ON `Reservations` FOR EACH ROW BEGIN
    IF NEW.price > OLD.price THEN
        INSERT INTO Payments (reservation_id, amount, date, admin_id)
        VALUES (NEW.reservation_id, NEW.price - OLD.price, NOW(), NULL);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ReservationsToRefund`
--

DROP TABLE IF EXISTS `ReservationsToRefund`;
/*!50001 DROP VIEW IF EXISTS `ReservationsToRefund`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ReservationsToRefund` AS SELECT 
 1 AS `reservation_id`,
 1 AS `client_id`,
 1 AS `flat_id`,
 1 AS `date_from`,
 1 AS `date_to`,
 1 AS `to_return`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'MiniDb'
--
/*!50003 DROP PROCEDURE IF EXISTS `addAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addAdmin`(
    IN in_firstname text,
    IN in_lastname text,
    IN in_email varchar(320),
    IN in_phone_number VARCHAR(15),
    IN in_password varchar(100)
)
BEGIN
    INSERT INTO Admins (firstname, lastname, email, phone_number, password)
    VALUES (in_firstname, in_lastname, in_email, in_phone_number, in_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `addClient`(
    IN in_firstname text,
    IN in_lastname text,
    IN in_email varchar(320),
    IN in_phone_number VARCHAR(15),
    IN in_password varchar(100)
)
BEGIN
    INSERT INTO Clients (firstname, lastname, email, phone_number, password)
    VALUES (in_firstname, in_lastname, in_email, in_phone_number, in_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddReservation`(IN resClientId int, IN resFlatId int, IN resDateFrom date,
                                                IN resDateTo date, IN resPeopleCount int)
BEGIN
    DECLARE roomCapacity INT;
    DECLARE roomPricePerDay DECIMAL(10,2);
    DECLARE nights INT;

    SELECT size, price_for_day INTO roomCapacity, roomPricePerDay FROM Flats WHERE flat_id = resFlatId;
    IF resPeopleCount > roomCapacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The number of people exceeds the room capacity.';
    END IF;
    CALL isRoomAvailable(resFlatId,resDateFrom,resDateTo);
    SET nights = DATEDIFF(resDateTo, resDateFrom);
    INSERT INTO Reservations (client_id, flat_id, date_from, date_to, people_count, status, price)
    VALUES (resClientId, resFlatId, resDateFrom, resDateTo, resPeopleCount, 1, roomPricePerDay * nights);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelFutureReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CancelFutureReservation`(IN reservationID INT)
BEGIN
    DECLARE startDate DATE;
    SELECT date_from INTO startDate FROM Reservations WHERE reservation_id = reservationID;

    IF startDate > CURDATE() THEN

        UPDATE Reservations SET status = 0 WHERE reservation_id = reservationID;
        SELECT 'Reservation cancelled successfully.' AS message;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot cancel past or current reservations.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindAvailableFlats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `FindAvailableFlats`(IN startDate date, IN endDate date, IN numPeople int,
                                                    IN withKitchen tinyint(1))
BEGIN

    SELECT f.flat_id, f.flat_number, f.size, f.is_kitchen,f.description,f.price_for_day
    FROM Flats f
    WHERE f.size >= numPeople AND f.is_kitchen = withKitchen
        AND f.flat_id NOT IN (
            SELECT r.flat_id
            FROM ActiveReservations r
            WHERE (r.date_from < endDate AND r.date_to > startDate)
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRoomsToClean` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetRoomsToClean`(IN target_date date)
BEGIN
    SELECT
        f.flat_number,
        r.date_to,
        r.reservation_id
    FROM
        Flats f
    JOIN
        Reservations r ON f.flat_id = r.flat_id
    WHERE

        r.date_to = target_date
        AND r.status = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `isRoomAvailable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `isRoomAvailable`(IN flatId int, IN dateFrom date, IN dateTo date)
BEGIN
    IF EXISTS (
        SELECT 1 FROM Reservations
        WHERE flat_id = flatId AND  (date_to > dateFrom AND date_from < dateTo) AND status=1
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is not available for the selected dates.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `loginAdmin`(IN in_email varchar(320),IN in_password varchar(100))
BEGIN
    DECLARE adminID INT;
    DECLARE correctPassword varchar(100);
    SELECT admin_id, password INTO adminID, correctPassword
    FROM Admins
    WHERE email = in_email;
    IF correctPassword IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user found.';
    ELSEIF correctPassword=in_password THEN
        SELECT adminID AS admin_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `loginClient`(IN in_email varchar(320), IN in_password varchar(100))
BEGIN
    DECLARE clientID INT;
    DECLARE correctPassword varchar(100);
    SELECT client_id, password INTO clientID, correctPassword
    FROM Clients
    WHERE email = in_email;
    IF correctPassword IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user found.';
    ELSEIF correctPassword=in_password THEN
        SELECT clientID AS client_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonthlyFinancialReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `MonthlyFinancialReport`(IN reportYear int, IN reportMonth int)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ReservationsToRefund r
        WHERE YEAR(r.date_to) = reportYear AND MONTH(r.date_to) = reportMonth
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot generate report: pending refunds exist for this month.';
    ELSE
        SELECT
            r.reservation_id,
            r.client_id,
            r.date_from,
            r.date_to,
            r.status,
            r.price,
            COALESCE((SELECT SUM(p.amount) FROM Payments p WHERE p.reservation_id = r.reservation_id), 0) AS balance
        FROM
            Reservations r
        WHERE
            YEAR(r.date_to) = reportYear AND
            MONTH(r.date_to) = reportMonth;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonthlyFinancialReportPreviousMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `MonthlyFinancialReportPreviousMonth`()
BEGIN
    DECLARE reportYear INT;
    DECLARE reportMonth INT;

    SET reportYear = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);
    SET reportMonth = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);
    CALL MonthlyFinancialReport(reportYear,reportMonth);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RefundReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RefundReservation`(IN adminId int, IN reservationId int, IN amountToRefund decimal(10, 2))
BEGIN
    DECLARE toReturn DECIMAL(10,2);
    SELECT to_return INTO toReturn
    FROM ReservationsToRefund
    WHERE reservation_id = reservationId;
    IF toReturn IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak możliwości zwrotu: rezerwacja nie jest anulowana lub została już zwrócona.';
    ELSE




        IF amountToRefund > toReturn THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Próba zwrotu większej kwoty niż pierwotnie zapłacono.';
        ELSE
            INSERT INTO Payments (reservation_id, amount, date, admin_id)
            VALUES (reservationId, -amountToRefund, NOW(), adminId);
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ShowPaymentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ShowPaymentHistory`(IN clientID int)
BEGIN
    SELECT
        p.payment_id,
        p.reservation_id,
        p.amount,
        p.date,
        r.client_id,
        r.price AS reservation_cost,
        CASE
            WHEN r.status = 0 THEN -1 * IFNULL((SELECT SUM(amount) FROM Payments WHERE reservation_id = p.reservation_id), 0)
            ELSE IFNULL((SELECT SUM(amount) FROM Payments WHERE reservation_id = p.reservation_id), 0)
        END AS balance,
        r.date_from,
        r.date_to,
        r.status
    FROM
        Payments p
    JOIN
        Reservations r ON p.reservation_id = r.reservation_id
    WHERE
        r.client_id = clientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateReservationDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UpdateReservationDate`(IN reservationId int, IN newDateFrom date, IN newDateTo date)
BEGIN
    DECLARE flatId INT;
    DECLARE roomPricePerDay DECIMAL(10,2);
    DECLARE newNights INT;
    DECLARE oldDateFrom DATE;
    DECLARE oldDateTo DATE;

    SELECT flat_id, date_from, date_to INTO flatId, oldDateFrom, oldDateTo
    FROM Reservations
    WHERE reservation_id = reservationId;
    SELECT size, price_for_day INTO roomPricePerDay FROM Flats WHERE flat_id = flatId;
    IF EXISTS (
        SELECT 1 FROM Reservations
        WHERE flat_id = flatId AND NOT reservation_id = reservationId AND
        (date_to > newDateFrom AND date_from < newDateTo) AND status=1
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is not available for the selected new dates.';
    END IF;
    SET newNights = DATEDIFF(newDateTo, newDateFrom);
    UPDATE Reservations
    SET date_from = newDateFrom, date_to = newDateTo, price = roomPricePerDay * newNights
    WHERE reservation_id = reservationId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ActiveReservations`
--

/*!50001 DROP VIEW IF EXISTS `ActiveReservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ActiveReservations` AS select `Reservations`.`reservation_id` AS `reservation_id`,`Reservations`.`client_id` AS `client_id`,`Reservations`.`flat_id` AS `flat_id`,`Reservations`.`status` AS `status`,`Reservations`.`people_count` AS `people_count`,`Reservations`.`date_from` AS `date_from`,`Reservations`.`date_to` AS `date_to`,`Reservations`.`price` AS `price` from `Reservations` where ((`Reservations`.`status` = 1) and ((`Reservations`.`date_from` >= curdate()) or (`Reservations`.`date_to` >= curdate()))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ReservationsToRefund`
--

/*!50001 DROP VIEW IF EXISTS `ReservationsToRefund`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ReservationsToRefund` AS select `r`.`reservation_id` AS `reservation_id`,`r`.`client_id` AS `client_id`,`r`.`flat_id` AS `flat_id`,`r`.`date_from` AS `date_from`,`r`.`date_to` AS `date_to`,sum(`p`.`amount`) AS `to_return`,`r`.`status` AS `status` from (`Reservations` `r` join `Payments` `p` on((`r`.`reservation_id` = `p`.`reservation_id`))) where (`r`.`status` = 0) group by `r`.`reservation_id`,`r`.`client_id`,`r`.`flat_id`,`r`.`status` having (`to_return` <> 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 18:43:12
