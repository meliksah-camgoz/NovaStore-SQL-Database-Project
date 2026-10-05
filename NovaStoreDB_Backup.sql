-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: novastoredb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Elektronik'),(2,'Bilgisayar'),(3,'Telefon'),(4,'Kozmetik'),(5,'Ev ve Yaşam');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ahmet Yılmaz','İstanbul','ahmet.yilmaz@example.com'),(2,'Elif Demir','Ankara','elif.demir@example.com'),(3,'Mehmet Kaya','İzmir','mehmet.kaya@example.com'),(4,'Zeynep Çelik','Bursa','zeynep.celik@example.com'),(5,'Burak Şahin','Antalya','burak.sahin@example.com'),(6,'Ceren Aydın','Kocaeli','ceren.aydin@example.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `DetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `FK_OrderDetails_Orders` (`OrderID`),
  KEY `FK_OrderDetails_Products` (`ProductID`),
  CONSTRAINT `FK_OrderDetails_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_OrderDetails_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,1,2),(2,1,7,1),(3,2,11,1),(4,2,13,1),(5,3,21,1),(6,3,26,1),(7,4,31,2),(8,4,33,1),(9,5,41,1),(10,5,43,1),(11,6,3,1),(12,6,5,1),(13,7,16,1),(14,7,17,1),(15,8,22,1),(16,8,28,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `TotalAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Orders_Customers` (`CustomerID`),
  CONSTRAINT `FK_Orders_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-09-20 10:15:00',4199.70),(2,2,'2026-09-21 14:30:00',7499.80),(3,3,'2026-09-22 11:45:00',5299.70),(4,4,'2026-09-24 16:20:00',3099.80),(5,5,'2026-09-26 09:50:00',8499.70),(6,6,'2026-09-27 13:10:00',2499.80),(7,1,'2026-09-29 15:40:00',6599.70),(8,3,'2026-10-01 12:25:00',3899.80);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int DEFAULT '0',
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_Products_Categories` (`CategoryID`),
  CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kablosuz Kulaklık',1299.90,25,1),(2,'Bluetooth Hoparlör',899.90,18,1),(3,'Akıllı Saat',2499.90,12,1),(4,'Powerbank 20000mAh',749.90,30,1),(5,'Web Kamera',1099.90,15,1),(6,'USB Mikrofon',1599.90,8,1),(7,'LED Masa Lambası',499.90,22,1),(8,'Akıllı TV Kumandası',349.90,17,1),(9,'Kablosuz Şarj Standı',699.90,14,1),(10,'Taşınabilir SSD 1TB',2899.90,10,1),(11,'Gaming Laptop',42999.90,7,2),(12,'Ofis Laptop',24999.90,12,2),(13,'Mekanik Klavye',1799.90,20,2),(14,'Gaming Mouse',1299.90,25,2),(15,'Mouse Pad XL',599.90,30,2),(16,'24 Inch Monitör',6999.90,11,2),(17,'27 Inch Gaming Monitör',9999.90,8,2),(18,'Laptop Standı',899.90,16,2),(19,'USB-C Hub',1199.90,19,2),(20,'Harici HDD 2TB',2499.90,13,2),(21,'NovaPhone X1',32999.90,9,3),(22,'NovaPhone X1 Pro',44999.90,6,3),(23,'NovaPhone Lite',19999.90,15,3),(24,'Telefon Kılıfı',399.90,40,3),(25,'Ekran Koruyucu',249.90,50,3),(26,'Hızlı Şarj Adaptörü',899.90,28,3),(27,'USB-C Şarj Kablosu',399.90,35,3),(28,'Araç Telefon Tutucu',599.90,21,3),(29,'Bluetooth Araç Kiti',799.90,18,3),(30,'Kablosuz Şarj Cihazı',999.90,16,3),(31,'Nemlendirici Krem',449.90,35,4),(32,'Yüz Temizleme Jeli',349.90,30,4),(33,'Güneş Kremi SPF50',599.90,25,4),(34,'Parfüm 50ml',1499.90,18,4),(35,'Şampuan',299.90,40,4),(36,'Saç Kremi',279.90,38,4),(37,'El Kremi',199.90,45,4),(38,'Dudak Nemlendiricisi',149.90,50,4),(39,'Makyaj Çantası',399.90,22,4),(40,'Cilt Bakım Seti',1299.90,12,4),(41,'Kahve Makinesi',4999.90,10,5),(42,'Elektrikli Süpürge',7499.90,8,5),(43,'Airfryer',5999.90,13,5),(44,'Blender Seti',2299.90,15,5),(45,'Çay Makinesi',2999.90,11,5),(46,'Masa Saati',399.90,20,5),(47,'Nevresim Takımı',1299.90,17,5),(48,'Dekoratif Abajur',799.90,14,5),(49,'Saklama Kabı Seti',499.90,26,5),(50,'Bambu Organizer',349.90,23,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_orderdetails`
--

DROP TABLE IF EXISTS `vw_orderdetails`;
/*!50001 DROP VIEW IF EXISTS `vw_orderdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orderdetails` AS SELECT 
 1 AS `OrderID`,
 1 AS `Musteri`,
 1 AS `Sehir`,
 1 AS `SiparisTarihi`,
 1 AS `Urun`,
 1 AS `Adet`,
 1 AS `BirimFiyat`,
 1 AS `AraToplam`,
 1 AS `SiparisToplami`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_orderdetails`
--

/*!50001 DROP VIEW IF EXISTS `vw_orderdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orderdetails` AS select `o`.`OrderID` AS `OrderID`,`c`.`FullName` AS `Musteri`,`c`.`City` AS `Sehir`,`o`.`OrderDate` AS `SiparisTarihi`,`p`.`ProductName` AS `Urun`,`od`.`Quantity` AS `Adet`,`p`.`Price` AS `BirimFiyat`,(`od`.`Quantity` * `p`.`Price`) AS `AraToplam`,`o`.`TotalAmount` AS `SiparisToplami` from (((`orders` `o` join `customers` `c` on((`o`.`CustomerID` = `c`.`CustomerID`))) join `orderdetails` `od` on((`o`.`OrderID` = `od`.`OrderID`))) join `products` `p` on((`od`.`ProductID` = `p`.`ProductID`))) */;
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

-- Dump completed on 2026-10-03  9:31:25
