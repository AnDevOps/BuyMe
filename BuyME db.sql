CREATE DATABASE  IF NOT EXISTS `BuyMe` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BuyMe`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: cs336.ckksjtjg2jto.us-east-2.rds.amazonaws.com    Database: BarBeerDrinkerSample
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `admin`
--
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `admin`
--
LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','password');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
`user_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
   `name` varchar(50) DEFAULT NULL,
   `address` varchar(75) DEFAULT NULL,
  `rating` integer DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (username, password, name) VALUES ('user1','password','Patricia Jones'), ('user2','password', 'Deez Nuts'),('default_bid',null,null);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer service rep`
--
DROP TABLE IF EXISTS `CustomerServiceRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerServiceRep` (
  `rep_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `customer service rep`
--
LOCK TABLES `CustomerServiceRep` WRITE;
/*!40000 ALTER TABLE `CustomerServiceRep` DISABLE KEYS */;
INSERT INTO `CustomerServiceRep` VALUES (001,'rep1','password','somebody@gmail.com'), (002,'rep2','password','somebody1@gmail.com');
/*!40000 ALTER TABLE `CustomerServiceRep` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `help`
--
DROP TABLE IF EXISTS `help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help` (
  `ticketno` integer DEFAULT NULL,
  `rep_id` integer NOT NULL DEFAULT 0,
`username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY(`rep_id`,`username`),
  FOREIGN KEY (`rep_id`) REFERENCES `CustomerServiceRep` (`rep_id`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `create`
--
DROP TABLE IF EXISTS `help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help` (
  `rep_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY(`rep_id`,`username`),
  FOREIGN KEY (`rep_id`) REFERENCES `CustomerServiceRep` (`rep_id`),
  FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question` varchar(200) NOT NULL DEFAULT '',
  `question_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `answer` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY(`question_id`,`username`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (question, question_id, username, answer) values
("How do I create a new account?", 0, "user1", "Go to the home page and click on the register button under the customer header");
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `items`
--
DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` integer NOT NULL DEFAULT 0,
  `initial_price` integer NOT NULL DEFAULT 0,
  `increment` integer NOT NULL DEFAULT 0,
  `start_date` timestamp DEFAULT NULL,
  `end_date` timestamp DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `min_win` integer DEFAULT NULL,
  `clothing_type` varchar(50) DEFAULT NULL,
  `rating` integer DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`, `username`),
FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `items`
--
LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (item_id, initial_price, increment, start_date, end_date, name, username, clothing_type, min_win) values
(001, 5, 1, '2021-04-012 12:00:00', '2021-04-018 23:59:59', 'shirt with 1 hole', 'user1','shirts', 10),
(002, 50, 2, '2021-04-012 12:00:00', '2021-04-018 23:59:59', 'roman civ 5s', 'user1','shoes',75),
(003, 100, 5, '2021-04-012 12:00:00', '2021-04-018 23:59:59', 'hotdog hat', 'user1', 'hats', 125);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `shoes`
--
DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoes` (
  `item_id` integer NOT NULL DEFAULT 0,
`size` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `clothing_type` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `shoes`
--
LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` (item_id, size, gender, color, type, clothing_type) values
(002,'10', 'men', 'brown', 'sandal', 'shoes' );
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `shirts`
--
DROP TABLE IF EXISTS `shirts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirts` (
  `item_id` integer NOT NULL DEFAULT 0,
  `size` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `clothing_type` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `shirts`
--
LOCK TABLES `shirts` WRITE;
/*!40000 ALTER TABLE `shirts` DISABLE KEYS */;
INSERT INTO `shirts` (item_id, size, gender, color, type, clothing_type) values
(001,'Large', 'men', 'white', 'TShirt', 'shirts' );
/*!40000 ALTER TABLE `shirts` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `shirts`
--
DROP TABLE IF EXISTS `hats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hats` (
  `item_id` integer NOT NULL DEFAULT 0,
  `size` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `clothing_type` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `hats`
--
LOCK TABLES `hats` WRITE;
/*!40000 ALTER TABLE `hats` DISABLE KEYS */;
INSERT INTO `hats` (item_id, size, gender, color, type, clothing_type) values
(003,'Large', 'men', 'red', 'Cap', 'hats' );
/*!40000 ALTER TABLE `hats` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `generate_reports`
--
DROP TABLE IF EXISTS `generate_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generate_reports` (
  `item_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `usernameadmin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY(`item_id`,`usernameadmin`,`username`),
 FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
 FOREIGN KEY (`usernameadmin`) REFERENCES `admin` (`username`),
  FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `bid_on`
--
DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `item_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `bid_value` integer NOT NULL DEFAULT 0,
  `max_bid` integer NOT NULL DEFAULT 0,
  `date_time` timestamp DEFAULT NULL,
  PRIMARY KEY(`item_id`,`username`,`bid_value`,`max_bid`),
   FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
   FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `bids`
--
LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` (item_id, username, bid_value, max_bid, date_time) values
(003,'user2', 105, 105, '2021-04-010 12:00:00'),
(003,'user2', 110, 110, '2021-04-011 12:00:00'),
(003,'user2', 115, 125, '2021-04-012 12:00:00');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `watchlists`
--
DROP TABLE IF EXISTS `watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlists` (
  `item_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY(`item_id`,`username`),
   FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
   FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
--
--
LOCK TABLES `watchlists` WRITE;
/*!40000 ALTER TABLE `watchlists` DISABLE KEYS */;
INSERT INTO `watchlists` (item_id, username) values
(001,'user2'),
(003,'user2');
/*!40000 ALTER TABLE `watchlists` ENABLE KEYS */;
UNLOCK TABLES;
--
--
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-10 13:49:53
