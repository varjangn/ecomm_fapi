-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ecomm_fapi
-- ------------------------------------------------------
-- Server version	5.7.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics',NULL),(2,'Mobile',1),(3,'TV',1),(4,'Clothes',NULL),(5,'Mens',4),(6,'Womens',4),(7,'Saree',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(2560) NOT NULL,
  `price` float NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'One Plus 7T',34999,2),(2,'One Plus 7T (Glacier Blue)',34999,2),(3,'Samsung Galaxy M40',15999,2),(4,'Samsung Galaxy M3s',14999,2),(5,'Redmi Note 9 Pro Max',16999,2),(6,'Redmi Note 8 Pro',16999,2),(7,'Redmi Note 8 Pro (Shadow Black)',16999,2),(8,'Apple iPhone 11',73600,2),(9,'Apple iPhone 7 (32GB) - Black',29499,2),(10,'Apple iPhone XR (64GB) - White',52500,2),(11,'Apple iPhone 11 (128GB) - (Product) RED',73600,2),(12,'MSamsung 80 cm (32 inches)',14999,3),(13,'LG 80 cm (32 Inches)',14999,3),(14,'Dummy TV1',14999,3),(15,'Dummy TV2',14999,3),(16,'Dummy TV3',14999,3),(17,'Dummy TV4',14999,3),(18,'Dummy TV5',14999,3),(19,'Dummy TV6',14999,3),(20,'Dummy TV67',14999,3),(21,'Dummy TV8',14999,3),(22,'Dummy Phone1',14999,2),(23,'Dummy Phone2',14999,2),(24,'Dummy Phone3',14999,2),(25,'Dummy Phone4',15999,2),(26,'Dummy Phone5',15999,2),(27,'Dummy Phone6',15999,2),(28,'Dummy Phone7',15999,2),(29,'Dummy Phone8',15999,2),(30,'Dummy Phone85',15999,2),(31,'Dummy Phone88',15999,2),(32,'Dummy product1 under Mens cloth',15999,5),(33,'Dummy product2 under Mens cloth',15999,5),(34,'Dummy product3 under Mens cloth',15999,5),(35,'Dummy product4 under Mens cloth',15999,5),(36,'Dummy product5 under Mens cloth',15999,5),(37,'Dummy product6 under Mens cloth',15999,5),(38,'Dummy product7 under Mens cloth',15999,5),(39,'Dummy product8 under Mens cloth',15999,5),(40,'Dummy product9 under Mens cloth',15999,5),(41,'Dummy product10 under Mens cloth',15999,5),(42,'Dummy product11 under Mens cloth',15999,5),(43,'Dummy product112 under Mens cloth',15999,5),(44,'Dummy product113 under Mens cloth',15999,5),(45,'Dummy product12 under Mens cloth',15999,5),(46,'Dummy product12 under Womens cloth',10000,6),(47,'Dummy product1 under Womens cloth',10000,6),(48,'Dummy product2 under Womens cloth',10000,6),(49,'Dummy product3 under Womens cloth',10000,6),(50,'Dummy product4 under Womens cloth',10000,6),(51,'Dummy product4 under Womens cloth',7650,6),(52,'Dummy product5 under Womens cloth',7650,6),(53,'Dummy product6 under Womens cloth',7650,6),(54,'Dummy product7 under Womens cloth',7650,6),(55,'Dummy product8 under Womens cloth',7650,6),(56,'Dummy product9 under Womens cloth',7650,6),(57,'Dummy product10 under Womens cloth',7650,6),(58,'Dummy product11 under Womens cloth',7650,6),(59,'Dummy product1 under Womens saree',7650,7),(60,'Dummy product2 under Womens saree',7650,7),(61,'Dummy product3 under Womens saree',7650,7),(62,'Dummy product4 under Womens saree',7650,7),(63,'Dummy product5 under Womens saree',7650,7),(64,'Dummy product6 under Womens saree',7650,7),(65,'Dummy product7 under Womens saree',7650,7),(66,'Dummy product8 under Womens saree',7650,7),(67,'Dummy product9 under Womens saree',7650,7),(68,'Dummy product10 under Womens saree',7650,7),(69,'Dummy product11 under Womens saree',7650,7),(70,'Dummy product12 under Womens saree',7650,7),(71,'Dummy product13 under Womens saree',7650,7),(72,'Dummy product14 under Womens saree',7650,7),(73,'Dummy product15 under Womens saree',7650,7),(74,'Dummy product16 under Womens saree',7650,7),(75,'Dummy product17 under Womens saree',7650,7),(76,'Dummy product1 under Mobiles',15999,2),(77,'Dummy product2 under Mobiles',15999,2),(78,'Dummy produc3 under Mobiles',15999,2),(79,'Dummy produc4 under Mobiles',15999,2),(80,'Dummy produc5 under Mobiles',15999,2),(81,'Dummy produc6 under Mobiles',15999,2),(82,'Dummy produc7 under Mobiles',15999,2),(83,'Dummy produc8 under Mobiles',15999,2),(84,'Dummy produc9 under Mobiles',15999,2),(85,'Dummy product10 under Mobiles',15999,2),(86,'Dummy product11 under Mobiles',15999,2),(87,'Dummy product12 under Mobiles',15999,2),(88,'Dummy product13 under Mobiles',15999,2),(89,'Dummy product14 under Mobiles',15999,2),(90,'Dummy product15 under Mobiles',15999,2),(91,'Dummy product16 under Mobiles',15999,2),(92,'Dummy product17 under Mobiles',15999,2),(93,'Dummy product1 under TV',19999,3),(94,'Dummy product3 under TV',19999,3),(95,'Dummy product4 under TV',19999,3),(96,'Dummy product5 under TV',19999,3),(97,'Dummy product6 under TV',19999,3),(98,'Dummy product7 under TV',19999,3),(99,'Dummy product8 under TV',19999,3),(100,'Dummy product9 under TV',19999,3),(101,'Dummy product10 under TV',19999,3),(102,'Dummy product11 under TV',19999,3),(103,'Dummy product12 under TV',19999,3),(104,'Dummy product13 under TV',19999,3),(105,'Dummy product14 under TV',19999,3),(106,'Dummy product15 under TV',19999,3),(107,'Dummy product16 under TV',19999,3),(108,'Dummy product17 under TV',19999,3),(109,'Dummy product18 under TV',19999,3),(110,'Dummy product19 under TV',19999,3),(111,'Dummy product11 under Mens cloth',5999,5),(112,'Dummy product12 under Mens cloth',5999,5),(113,'Dummy product13 under Mens cloth',5999,5),(114,'Dummy product14 under Mens cloth',5999,5),(115,'Dummy product15 under Mens cloth',5999,5),(116,'Dummy product16 under Mens cloth',5999,5),(117,'Dummy product17 under Mens cloth',5999,5),(118,'Dummy product18 under Mens cloth',5999,5),(119,'Dummy product19 under Mens cloth',5999,5),(120,'Dummy product20 under Mens cloth',5999,5),(121,'Dummy product21 under Mens cloth',5999,5),(122,'Dummy product22 under Mens cloth',5999,5),(123,'Dummy product23 under Mens cloth',5999,5),(124,'Dummy product24 under Mens cloth',5999,5),(125,'Dummy product25 under Mens cloth',5999,5),(126,'Dummy product26 under Mens cloth',5999,5),(127,'Dummy product27 under Mens cloth',5999,5),(128,'Dummy product28 under Mens cloth',5999,5),(129,'Dummy product29 under Mens cloth',5999,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22  9:45:27
