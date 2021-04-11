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
  -- `user_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  -- `email` varchar(50) DEFAULT NULL,
   `name` varchar(50) DEFAULT NULL,
  -- `address` varchar(75) DEFAULT NULL,
  -- `rating` integer DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','password','Patricia Jones'), ('deeznuts','password', 'Deez Nuts');
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
  KEY `fk_help_user` (`username`),
  KEY `fk_help_rep` (`rep_id`),
  CONSTRAINT `fk_help_rep` FOREIGN KEY (`rep_id`) REFERENCES `CustomerServiceRep` (`rep_id`),
  CONSTRAINT `fk_help_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
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
  KEY `fk_create_adminuser` (`username`),
  KEY `fk_create_rep` (`rep_id`),
  CONSTRAINT `fk_create_rep` FOREIGN KEY (`rep_id`) REFERENCES `CustomerServiceRep` (`rep_id`),
  CONSTRAINT `fk_create_adminuser` FOREIGN KEY (`username`) REFERENCES `admin` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `items`
--
DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` integer NOT NULL DEFAULT 0,
  `initial_price` integer NOT NULL DEFAULT 0,
  `increment_amt` integer NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rating` integer DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`, `username`),
  KEY `items_user` (`username`),
  CONSTRAINT `items_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  KEY `fk_gr_item_id` (`item_id`),
  KEY `fk_gr_adminuser` (`usernameadmin`),
  KEY `fk_gr_user` (`username`),
  CONSTRAINT `fk_gr_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_gr_adminuser` FOREIGN KEY (`usernameadmin`) REFERENCES `admin` (`username`),
  CONSTRAINT `fk_gr_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `bid_on`
--
DROP TABLE IF EXISTS `bid_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid_on` (
  `item_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `bid_value` integer DEFAULT NULL,
  `max_bid` integer DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `bid_num` integer DEFAULT NULL,
  PRIMARY KEY(`item_id`,`username`),
  KEY `fk_bid_item_id` (`item_id`),
  KEY `fk_bid_user` (`username`),
  CONSTRAINT `fk_bid_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_bid_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `list`
--
DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list` (
  `item_id` integer NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `listing_number` integer DEFAULT NULL,
  `min_win` integer DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY(`item_id`,`username`),
  KEY `fk_list_item_id` (`item_id`),
  KEY `fk_list_user` (`username`),
  CONSTRAINT `fk_list_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_list_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
