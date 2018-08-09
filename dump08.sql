-- MySQL dump 10.13  Distrib 5.5.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: travel_development
-- ------------------------------------------------------
-- Server version	5.5.61-0ubuntu0.14.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-06-29 04:28:17','2018-06-29 04:28:17');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_vehicles`
--

DROP TABLE IF EXISTS `book_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `light_bill` varchar(255) DEFAULT NULL,
  `rent_agr` varchar(255) DEFAULT NULL,
  `bs` varchar(255) DEFAULT NULL,
  `itr` varchar(255) DEFAULT NULL,
  `native_light_bill` varchar(255) DEFAULT NULL,
  `pan_guarantor` varchar(255) DEFAULT NULL,
  `adhar_guarantor` varchar(255) DEFAULT NULL,
  `light_bill_guarantor` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor` varchar(255) DEFAULT NULL,
  `bs_guarantor` varchar(255) DEFAULT NULL,
  `itr_guarantor` varchar(255) DEFAULT NULL,
  `pan_guarantor1` varchar(255) DEFAULT NULL,
  `adhar_guarantor1` varchar(255) DEFAULT NULL,
  `light_bill_guarantor1` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor1` varchar(255) DEFAULT NULL,
  `bs_guarantor1` varchar(255) DEFAULT NULL,
  `itr_guarantor1` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_book_vehicles_on_enquiry_id` (`enquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_vehicles`
--

LOCK TABLES `book_vehicles` WRITE;
/*!40000 ALTER TABLE `book_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_vehicles`
--

DROP TABLE IF EXISTS `booking_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `light_bill` varchar(255) DEFAULT NULL,
  `rent_agr` varchar(255) DEFAULT NULL,
  `bs` varchar(255) DEFAULT NULL,
  `itr` varchar(255) DEFAULT NULL,
  `native_light_bill` varchar(255) DEFAULT NULL,
  `pan_guarantor` varchar(255) DEFAULT NULL,
  `adhar_guarantor` varchar(255) DEFAULT NULL,
  `light_bill_guarantor` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor` varchar(255) DEFAULT NULL,
  `bs_guarantor` varchar(255) DEFAULT NULL,
  `itr_guarantor` varchar(255) DEFAULT NULL,
  `pan_guarantor1` varchar(255) DEFAULT NULL,
  `adhar_guarantor1` varchar(255) DEFAULT NULL,
  `light_bill_guarantor1` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor1` varchar(255) DEFAULT NULL,
  `bs_guarantor1` varchar(255) DEFAULT NULL,
  `itr_guarantor1` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_booking_vehicles_on_enquiry_id` (`enquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_vehicles`
--

LOCK TABLES `booking_vehicles` WRITE;
/*!40000 ALTER TABLE `booking_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `light_bill` varchar(255) DEFAULT NULL,
  `rent_agr` varchar(255) DEFAULT NULL,
  `bs` varchar(255) DEFAULT NULL,
  `itr` varchar(255) DEFAULT NULL,
  `native_light_bill` varchar(255) DEFAULT NULL,
  `pan_guarantor` varchar(255) DEFAULT NULL,
  `adhar_guarantor` varchar(255) DEFAULT NULL,
  `light_bill_guarantor` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor` varchar(255) DEFAULT NULL,
  `bs_guarantor` varchar(255) DEFAULT NULL,
  `itr_guarantor` varchar(255) DEFAULT NULL,
  `pan_guarantor1` varchar(255) DEFAULT NULL,
  `adhar_guarantor1` varchar(255) DEFAULT NULL,
  `light_bill_guarantor1` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor1` varchar(255) DEFAULT NULL,
  `bs_guarantor1` varchar(255) DEFAULT NULL,
  `itr_guarantor1` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bookings_on_enquiry_id` (`enquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_branches_on_company_id` (`company_id`),
  CONSTRAINT `fk_rails_9d5c1c06e3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'B001','IBSL','mumbai','','',NULL,'2018-06-29 12:34:48','2018-06-29 12:34:48',NULL),(2,'B002','ibsl_mumbai','mumbai','ibsl@gmail.com','+9970282876',0,'2018-06-29 12:36:21','2018-07-14 09:07:51',1);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'C001','IBPL','pune','India','Maharashtra','Pune','pune',411011,'santosh@gmail.com','8871342226',NULL,'2018-06-29 12:22:58','2018-07-20 09:09:30','2518857-large.jpeg','image/jpeg',16569,'2018-07-20 09:09:30');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_lists`
--

DROP TABLE IF EXISTS `document_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `document_master_id` int(11) DEFAULT NULL,
  `vehicle_booking_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_document_lists_on_employee_id` (`employee_id`),
  KEY `index_document_lists_on_document_master_id` (`document_master_id`),
  KEY `index_document_lists_on_vehicle_booking_id` (`vehicle_booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_lists`
--

LOCK TABLES `document_lists` WRITE;
/*!40000 ALTER TABLE `document_lists` DISABLE KEYS */;
INSERT INTO `document_lists` VALUES (1,2,2,4,1,'2018-07-18 12:04:54','2018-07-19 12:31:43'),(2,2,3,4,1,'2018-07-18 12:04:54','2018-07-19 12:31:43'),(3,NULL,4,4,0,'2018-07-18 12:04:54','2018-07-19 11:24:34'),(4,NULL,5,4,0,'2018-07-18 12:04:54','2018-07-19 11:23:34'),(5,NULL,NULL,NULL,0,'2018-07-18 12:28:21','2018-07-18 12:28:21'),(6,2,2,5,1,'2018-07-21 07:49:56','2018-07-21 07:50:12'),(7,2,3,5,1,'2018-07-21 07:49:56','2018-07-21 07:50:12'),(8,NULL,4,5,0,'2018-07-21 07:49:56','2018-07-21 07:49:56'),(9,NULL,5,5,0,'2018-07-21 07:49:56','2018-07-21 07:49:56'),(10,2,2,1,1,'2018-08-08 10:26:08','2018-08-08 12:22:22'),(11,NULL,3,1,0,'2018-08-08 10:26:08','2018-08-08 10:26:08'),(12,NULL,4,1,0,'2018-08-08 10:26:08','2018-08-08 10:26:08'),(13,NULL,5,1,0,'2018-08-08 10:26:08','2018-08-08 10:26:08');
/*!40000 ALTER TABLE `document_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_masters`
--

DROP TABLE IF EXISTS `document_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_masters`
--

LOCK TABLES `document_masters` WRITE;
/*!40000 ALTER TABLE `document_masters` DISABLE KEYS */;
INSERT INTO `document_masters` VALUES (2,'D001','Adhar','Adhar',1,'2018-07-02 10:28:09','2018-07-18 06:58:22'),(3,'D002','Pan Card','pan card.',1,'2018-07-18 06:58:03','2018-07-18 06:58:03'),(4,'D003','Licence','Licence',1,'2018-07-18 06:59:03','2018-07-18 06:59:03'),(5,'D004','Voter Id','Voter Id',1,'2018-07-18 06:59:36','2018-07-18 06:59:36');
/*!40000 ALTER TABLE `document_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `adhar_no` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employees_on_company_id` (`company_id`),
  KEY `index_employees_on_branch_id` (`branch_id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_8604ac23f2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Emp001','Mr.','Sarang','Sadashiv','Kumbhar','1990-03-29','Male','8890758610','sarang@gmail.com','O-','Kalyani Nagar,Pune','India','Maharashtra','Pune','Pune',416114,'78965412365',NULL,'2018-07-14 09:26:01','2018-07-14 09:26:01',1,NULL),(2,'Emp002','Mr','Vishal','undefined','Hake',NULL,'Male','9876543210','vishal@gmail.com','B+','Near wakad','India','Maharashtra','Pune','Pune',411057,'undefined',0,'2018-07-14 09:30:47','2018-07-14 09:30:47',1,NULL),(3,'Emp003','Mrs.','Taniya','','Chourey','1981-06-06','Female','8890758612','tanu.chourey26@gmail.com','O-','Kalyani Nagar,Pune','India','Maharashtra','Pune','Pune',416114,'78965412374',0,'2018-07-20 11:10:09','2018-07-20 11:12:20',1,1),(4,'Emp004','Miss.','Surbhi','','Sharma','1990-06-04','Female','8890758666','surbhi6@gmail.com','O-','Kalyani Nagar,Pune','India','Maharashtra','Mumbai','Pune',NULL,'78965412377',0,'2018-07-20 11:16:50','2018-07-20 11:16:50',1,1),(5,'Emp005','Miss.','Surbhi','','Kurapa','1990-06-04','Female','8890758666','surbhi@gmail.com','O-','Kalyani Nagar,Pune','India','Maharashtra','Mumbai','Pune',NULL,'78965412377',0,'2018-07-20 11:19:30','2018-07-20 11:19:30',1,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiries`
--

DROP TABLE IF EXISTS `enquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile_no` varchar(255) DEFAULT NULL,
  `name_first` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `place` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vehicle_type_id` bigint(20) DEFAULT NULL,
  `scheme_id` bigint(20) DEFAULT NULL,
  `enquiry_date` date DEFAULT NULL,
  `description` text,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enquiries_on_user_id` (`user_id`),
  KEY `index_enquiries_on_vehicle_type_id` (`vehicle_type_id`),
  KEY `index_enquiries_on_scheme_id` (`scheme_id`),
  CONSTRAINT `fk_rails_4cb86fa9ea` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_97a38ddb44` FOREIGN KEY (`scheme_id`) REFERENCES `schemes` (`id`),
  CONSTRAINT `fk_rails_c8404dfc83` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
INSERT INTO `enquiries` VALUES (1,'9892864450','Sapna','','Hingorani','sapna@gmail.com','Belapur','Mumbai',2,'2018-08-08 10:18:30','2018-08-08 10:18:30',NULL,5,'2018-10-20','Want to buy car',NULL),(2,'9970474802','Tanmay','','Singh','tanmay@gmail.com','Kharghar,Navi Mumbai','Mumbai',2,'2018-08-08 10:37:32','2018-08-08 10:37:32',NULL,7,'2018-10-20','Want to buy car',NULL),(3,'9892864451','Vishal Hake','','Singh','sapna@gmail.com','Belapur','Mumbai',2,'2018-08-08 11:29:31','2018-08-08 11:29:31',NULL,9,'1993-10-23','Want to buy car',NULL);
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financer_masters`
--

DROP TABLE IF EXISTS `financer_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financer_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `pin_code` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financer_masters`
--

LOCK TABLES `financer_masters` WRITE;
/*!40000 ALTER TABLE `financer_masters` DISABLE KEYS */;
INSERT INTO `financer_masters` VALUES (2,'F001','Financer','',421100,'','','','','',0,'2018-07-02 08:06:37','2018-07-02 08:07:20'),(6,'F002','Financer2',NULL,NULL,NULL,'Address2',NULL,NULL,NULL,0,'2018-07-02 12:54:01','2018-07-02 12:54:01'),(7,'F003','Financer3',NULL,NULL,'Mumbai',NULL,NULL,'aa@gmail.com',NULL,0,'2018-07-02 12:54:01','2018-07-02 12:54:01');
/*!40000 ALTER TABLE `financer_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180625050513'),('20180625110139'),('20180625110231'),('20180625114946'),('20180625121433'),('20180626072124'),('20180626102655'),('20180626113710'),('20180626114121'),('20180626114507'),('20180628100935'),('20180628101111'),('20180629101435'),('20180629102005'),('20180629112806'),('20180629114446'),('20180629120257'),('20180702071048'),('20180702071421'),('20180702071440'),('20180703054715'),('20180703105940'),('20180718071922'),('20180719053633'),('20180720074001'),('20180720093322'),('20180721072717'),('20180724071617'),('20180724100559'),('20180808124900');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemes`
--

DROP TABLE IF EXISTS `schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT NULL,
  `down_payment` varchar(255) DEFAULT NULL,
  `intrest` decimal(10,0) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `installment_amount` decimal(10,0) DEFAULT NULL,
  `scheme_type` varchar(255) DEFAULT NULL,
  `installment` varchar(255) DEFAULT NULL,
  `vehicle_type_id` bigint(20) DEFAULT NULL,
  `description` text,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `image1_file_name` varchar(255) DEFAULT NULL,
  `image1_content_type` varchar(255) DEFAULT NULL,
  `image1_file_size` int(11) DEFAULT NULL,
  `image1_updated_at` datetime DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `emi_amount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schemes_on_vehicle_type_id` (`vehicle_type_id`),
  CONSTRAINT `fk_rails_8115123ef3` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemes`
--

LOCK TABLES `schemes` WRITE;
/*!40000 ALTER TABLE `schemes` DISABLE KEYS */;
INSERT INTO `schemes` VALUES (5,'get 20% off on maruti',100000,'20000',10,'2018-10-10','2018-11-10',1,'2018-07-23 07:16:12','2018-07-23 07:16:12',NULL,'Scheme1','3',NULL,'its 1 month opportunity to buy any vehicle of maruti.','lamborghini-urus.jpg','image/jpeg',42516,'2018-07-23 07:16:11','20170915074030000000-6700492630241514497.png','image/png',139786,'2018-07-23 07:16:12',NULL,NULL,NULL),(6,'Acessories will be free on purchase above 12 lakh',1200000,'50000',20,'2018-07-01','2018-07-30',1,'2018-07-23 11:08:09','2018-07-23 11:08:09',NULL,'Scheme2','4',NULL,'its 1 month opportunity to buy any vehicle above 12 lakh.','2518857-large.jpeg','image/jpeg',16569,'2018-07-23 11:08:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'offer_car',700000,'100000',5,'2018-10-10','2018-11-10',1,'2018-07-24 06:20:30','2018-07-24 06:20:30',NULL,'Scheme1','36',NULL,'its 1 month opportunity to buy any vehicle.','goalsetting1.png','image/png',123502,'2018-07-24 06:20:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'offer_car1',700000,'100000',5,'2018-10-10','2018-11-10',1,'2018-07-24 06:22:26','2018-07-24 06:22:26',46666,'Scheme1','36',NULL,'its 1 month opportunity to buy any vehicle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'offer_car3',700000,'100000',6,'2018-10-10','2018-11-10',1,'2018-07-24 06:36:56','2018-07-24 09:55:35',19666,'Scheme1','36',NULL,'its 1 month opportunity to buy any vehicle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'108000','708000',NULL),(12,'scheme_one',160000,'50000',10,'2018-07-12','2018-09-12',1,'2018-08-08 05:53:46','2018-08-08 05:53:46',6416,'Scheme1','20',NULL,'Des',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18333.333333333336','128333.33333333334','110000');
/*!40000 ALTER TABLE `schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom_masters`
--

DROP TABLE IF EXISTS `showroom_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showroom_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `pin_code` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom_masters`
--

LOCK TABLES `showroom_masters` WRITE;
/*!40000 ALTER TABLE `showroom_masters` DISABLE KEYS */;
INSERT INTO `showroom_masters` VALUES (1,'S001','BMW','ss',NULL,'','','','','',0,'2018-07-02 08:37:47','2018-08-08 06:24:56'),(3,'S003','Show3','Descrip3',420014,'Mumbai','Aroli','8422060823.0',NULL,'Surbhi',1,'2018-07-02 13:02:31','2018-07-02 13:02:31'),(4,'S004','Show4','Descrip4',420015,'Mumbai','Ghansoli','8422060824.0',NULL,'Santosh',1,'2018-07-02 13:02:31','2018-07-02 13:02:31'),(5,'S005','Show5','Descrip5',420016,'Mumbai','Rabale','8422060825.0',NULL,'Vishal',0,'2018-07-02 13:02:31','2018-07-02 13:02:31');
/*!40000 ALTER TABLE `showroom_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'tanu.chourey26@gmail.com','$2a$11$OthxnqsdQiZWOG.07IjaR.SfjyscMtKN8Q/4VedKHyGlfScH/g8.W',NULL,NULL,'2018-08-04 09:29:22',8,'2018-08-08 06:23:43','2018-08-04 09:29:22','127.0.0.1','127.0.0.1','2018-07-18 05:51:09','2018-08-08 06:23:43','Admin',2,NULL,NULL,NULL,NULL),(3,'surbhi@gmail.com','$2a$11$pkMXUHQcqaZGmx4DLzFw8uFgPqOYXSCffhy8Ke0S0Q/FmT7wKfSoK',NULL,NULL,NULL,3,'2018-08-08 05:05:47','2018-07-21 07:14:28','127.0.0.1','127.0.0.1','2018-07-20 11:19:30','2018-08-08 05:05:47','Branch',5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_bookings`
--

DROP TABLE IF EXISTS `vehicle_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pan` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `light_bill` varchar(255) DEFAULT NULL,
  `rent_agr` varchar(255) DEFAULT NULL,
  `bs` varchar(255) DEFAULT NULL,
  `itr` varchar(255) DEFAULT NULL,
  `native_light_bill` varchar(255) DEFAULT NULL,
  `pan_guarantor` varchar(255) DEFAULT NULL,
  `adhar_guarantor` varchar(255) DEFAULT NULL,
  `light_bill_guarantor` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor` varchar(255) DEFAULT NULL,
  `bs_guarantor` varchar(255) DEFAULT NULL,
  `itr_guarantor` varchar(255) DEFAULT NULL,
  `pan_guarantor1` varchar(255) DEFAULT NULL,
  `adhar_guarantor1` varchar(255) DEFAULT NULL,
  `light_bill_guarantor1` varchar(255) DEFAULT NULL,
  `rent_agr_guarantor1` varchar(255) DEFAULT NULL,
  `bs_guarantor1` varchar(255) DEFAULT NULL,
  `itr_guarantor1` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enquiry_id` int(11) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_bookings`
--

LOCK TABLES `vehicle_bookings` WRITE;
/*!40000 ALTER TABLE `vehicle_bookings` DISABLE KEYS */;
INSERT INTO `vehicle_bookings` VALUES (1,'BACCV9006L','122245566765','','1200','18000','BS','ITR','700','','','','','','','ASYUL0342L','','','','','',1,'2018-08-08 10:26:08','2018-08-08 10:26:08',1,NULL);
/*!40000 ALTER TABLE `vehicle_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'001','Car','Car',1,'2018-06-29 04:42:33','2018-06-29 04:42:33');
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-08 18:30:45
