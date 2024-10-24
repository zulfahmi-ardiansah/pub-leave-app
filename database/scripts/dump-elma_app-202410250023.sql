-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: elma_app
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

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
-- Table structure for table `application_delegations`
--

DROP TABLE IF EXISTS `application_delegations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_delegations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delegation_id` bigint(20) unsigned DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `application_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `is_delegation_approved` tinyint(1) DEFAULT NULL,
  `is_manager_approved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_delegations_users_FK` (`delegation_id`),
  KEY `application_delegations_applications_FK` (`application_id`),
  KEY `application_delegations_projects_FK` (`project_id`),
  CONSTRAINT `application_delegations_applications_FK` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `application_delegations_projects_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `application_delegations_users_FK` FOREIGN KEY (`delegation_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_delegations`
--

LOCK TABLES `application_delegations` WRITE;
/*!40000 ALTER TABLE `application_delegations` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_delegations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_histories`
--

DROP TABLE IF EXISTS `application_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `application_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_histories_users_FK` (`user_id`),
  KEY `application_histories_applications_FK` (`application_id`),
  CONSTRAINT `application_histories_applications_FK` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `application_histories_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_histories`
--

LOCK TABLES `application_histories` WRITE;
/*!40000 ALTER TABLE `application_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `leave_id` bigint(20) unsigned DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `requester_id` bigint(20) unsigned DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_kinds_FK` (`leave_id`),
  KEY `applications_users_FK` (`requester_id`),
  CONSTRAINT `applications_kinds_FK` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`),
  CONSTRAINT `applications_users_FK` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'2024-10-18 14:28:12','2024-10-19 02:43:40','Smart Business Support','SBS',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas penunjang bisnis.'),(2,'2024-10-19 02:43:58','2024-10-19 02:43:58','Pengadaan.com','PDC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Pengadaan.com.'),(3,'2024-10-19 02:44:20','2024-10-19 02:44:20','Great Procurement','GPC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Great Procurement.'),(4,'2024-10-19 02:44:49','2024-10-19 02:44:49','Engineering','ENG',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas pengembangan digital.'),(5,'2024-10-19 02:45:22','2024-10-19 02:45:22','Transformation Service','TFS',NULL,'Divisi yang bertanggung jawab terhadap semua hal yang berkaitan dengan layanan transformasi bisnis dan digital.'),(6,'2024-10-19 02:45:55','2024-10-20 07:19:39','Digital Business Development','DBD',NULL,'Divisi yang bertanggung jawab atas semua hal yang berhubungan dengan pengembangan bisnis digital.');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (2,'2024-10-19 08:18:04','2024-10-19 08:30:45','2024-01-01','2024-01-01','Tahun Baru 2024 Masehi',0),(3,'2024-10-19 08:29:30','2024-10-19 08:30:45','2024-02-08','2024-02-08','Isra\' Mi\'raj Nabi Muhammad SAW',0),(4,'2024-10-19 08:29:30','2024-10-19 08:30:45','2024-02-09','2024-02-09','Cuti Bersama Imlek 2575 Kongzili',1),(5,'2024-10-19 08:29:30','2024-10-19 08:30:45','2024-02-10','2024-02-10','Tahun Baru Imlek 2575 Kongzili',0),(6,'2024-10-19 08:29:30','2024-10-19 08:30:45','2024-02-14','2024-02-14','Pemilihan Umum (Pemilu)',0),(7,'2024-10-19 08:29:30','2024-10-19 08:30:45','2024-03-11','2024-03-11','Hari Raya Nyepi Tahun Baru Saka 1946',0),(8,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-03-12','2024-03-12','Cuti Bersama Hari Raya Nyepi',1),(9,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-03-29','2024-03-29','Wafat Isa Al Masih',0),(10,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-03-31','2024-03-31','Hari Paskah',0),(11,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-08','2024-04-08','Cuti Bersama Hari Raya Idul Fitri',1),(12,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-09','2024-04-09','Cuti Bersama Hari Raya Idul Fitri',1),(13,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-10','2024-04-10','Hari Raya Idul Fitri 1445 H',0),(14,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-11','2024-04-11','Hari Raya Idul Fitri 1445 H',0),(15,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-12','2024-04-12','Cuti Bersama Hari Raya Idul Fitri',1),(16,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-04-15','2024-04-15','Cuti Bersama Hari Raya Idul Fitri',1),(17,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-05-01','2024-05-01','Hari Buruh Internasional',0),(18,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-05-09','2024-05-09','Kenaikan Isa Al Masih',0),(19,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-05-10','2024-05-10','Cuti Bersama Kenaikan Isa Al Masih',1),(20,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-05-23','2024-05-23','Hari Raya Waisak 2568 BE',0),(21,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-05-24','2024-05-24','Cuti Bersama Hari Raya Waisak',1),(22,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-06-01','2024-06-01','Hari Lahir Pancasila',0),(23,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-06-17','2024-06-17','Hari Raya Idul Adha 1445 H',0),(24,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-06-18','2024-06-18','Cuti Bersama Hari Raya Idul Adha',1),(25,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-07-07','2024-07-07','Tahun Baru Islam 1446 H',0),(26,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-08-17','2024-08-17','Hari Kemerdekaan Republik Indonesia ke 79',0),(27,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-09-16','2024-09-16','Maulid Nabi Muhammad SAW',0),(28,'2024-10-19 08:29:31','2024-10-19 08:30:45','2024-12-25','2024-12-25','Hari Raya Natal',0),(30,'2024-10-19 08:30:45','2024-10-19 08:30:45','2024-12-26','2024-12-26','Cuti Bersama Hari Raya Natal',1);
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_slots`
--

DROP TABLE IF EXISTS `leave_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `leave_id` bigint(20) unsigned DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_slots_leaves_FK` (`leave_id`),
  CONSTRAINT `leave_slots_leaves_FK` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_slots`
--

LOCK TABLES `leave_slots` WRITE;
/*!40000 ALTER TABLE `leave_slots` DISABLE KEYS */;
INSERT INTO `leave_slots` VALUES (1,'2024-10-24 06:20:41','2024-10-24 06:20:41',1,2024,12);
/*!40000 ALTER TABLE `leave_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `expired_at` varchar(100) DEFAULT NULL,
  `max_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,'2024-10-22 16:46:02','2024-10-24 07:22:16','Cuti Tahunan','YAR','Hak cuti yang diberikan oleh perusahaan setiap tahun.','6-30',NULL),(2,'2024-10-22 16:46:02','2024-10-22 16:46:02','Cuti Bersama','TGT','Hak cuti yang diberikan dengan merujuk pada tanggal yang bertepatan pada hari keagamaan atau peringatan nasional. ','12-31',NULL),(3,'2024-10-22 16:46:02','2024-10-24 05:50:15','Cuti Hamil & Melahirkan','PRG','Hak cuti yang diberikan kepada perempuan yang hamil dan melahirkan.',NULL,30),(4,'2024-10-22 16:46:02','2024-10-24 05:55:24','Cuti Sakit','SCK','Hak cuti yang diberikan kepada pekerja ketika yang bersangkutan sakit dan diharuskan untuk istirahat oleh tenaga kesehatan.',NULL,2),(5,'2024-10-22 16:46:02','2024-10-22 16:46:02','Lembur','OVT','Hak cuti yang diberikan oleh perusahaan ketika pekerja mengambil waktu lembur.',NULL,NULL);
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_members_users_FK` (`user_id`),
  KEY `project_members_projects_FK` (`project_id`),
  CONSTRAINT `project_members_projects_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_members_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
INSERT INTO `project_members` VALUES (10,'2024-10-20 07:01:49','2024-10-20 07:01:49',7,1),(11,'2024-10-20 07:01:49','2024-10-20 07:01:49',9,1),(12,'2024-10-20 07:06:31','2024-10-20 07:06:31',2,2),(13,'2024-10-20 07:06:31','2024-10-20 07:06:31',5,2);
/*!40000 ALTER TABLE `project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `weight_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_users_FK` (`manager_id`),
  KEY `projects_weights_FK` (`weight_id`),
  CONSTRAINT `projects_users_FK` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_weights_FK` FOREIGN KEY (`weight_id`) REFERENCES `weights` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'2024-10-19 23:59:42','2024-10-20 07:00:47','Proyek Basis Data Penyedia Barang dan Jasa Terpadu ABC','PMO-001',12,'2024-10-01','2025-10-01','Mengembangkan sistem informasi terintegrasi penyedia secara komprehensif guna meningkatkan efisiensi pengadaan pada Badan ABC.',3,NULL),(2,'2024-10-20 00:13:56','2024-10-20 00:13:56','Proyek Sistem Pengadaan Barang dan Jasa DEF','PMO-002',11,'2024-10-20','2025-05-20','Mengembangkan sistem pengadaan untuk Perusahaan DEF untuk mengoptimalkan proses pengadaan melalui solusi digital yang efisien dan transparan.',2,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'2024-10-19 09:57:40','2024-10-19 09:57:40','Karyawan','EMP'),(2,'2024-10-19 09:57:40','2024-10-19 09:57:40','Manajer Proyek','PML'),(3,'2024-10-19 09:57:40','2024-10-19 09:57:40','Kepala Divisi','DVL'),(4,'2024-10-19 09:57:40','2024-10-19 09:57:40','Human Resource','HRS');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('GuTkrqHDNoBlWiVhFvuE0d8fOa8y6syp2WqejRoo',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0','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',1729790548);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_leave_slot_calculations`
--

DROP TABLE IF EXISTS `user_leave_slot_calculations`;
/*!50001 DROP VIEW IF EXISTS `user_leave_slot_calculations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_leave_slot_calculations` AS SELECT 
 1 AS `id`,
 1 AS `year`,
 1 AS `expired_at`,
 1 AS `user_id`,
 1 AS `leave_id`,
 1 AS `slot`,
 1 AS `comment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_leave_slots`
--

DROP TABLE IF EXISTS `user_leave_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_leave_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `leave_id` bigint(20) unsigned DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_leave_slots_leaves_FK` (`leave_id`),
  KEY `user_leave_slots_users_FK` (`user_id`),
  CONSTRAINT `user_leave_slots_leaves_FK` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`),
  CONSTRAINT `user_leave_slots_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_slots`
--

LOCK TABLES `user_leave_slots` WRITE;
/*!40000 ALTER TABLE `user_leave_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_leave_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_projects`
--

DROP TABLE IF EXISTS `user_projects`;
/*!50001 DROP VIEW IF EXISTS `user_projects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_projects` AS SELECT 
 1 AS `project_id`,
 1 AS `user_id`,
 1 AS `point`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_roles_users_FK` (`user_id`),
  KEY `user_roles_roles_FK` (`role_id`),
  CONSTRAINT `user_roles_roles_FK` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_roles_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'2024-10-19 09:58:04','2024-10-19 09:58:04',1,1),(2,'2024-10-19 09:58:04','2024-10-19 09:58:04',1,2),(3,'2024-10-19 09:58:04','2024-10-19 09:58:04',1,3),(4,'2024-10-19 09:58:04','2024-10-19 09:58:04',1,4),(10,'2024-10-19 06:27:18','2024-10-19 06:27:18',3,1),(11,'2024-10-19 06:27:29','2024-10-19 06:27:29',2,1),(12,'2024-10-19 06:29:01','2024-10-19 06:29:01',4,1),(13,'2024-10-19 06:30:19','2024-10-19 06:30:19',5,1),(14,'2024-10-19 06:31:40','2024-10-19 06:31:40',6,1),(15,'2024-10-19 06:31:40','2024-10-19 06:31:40',6,3),(16,'2024-10-19 08:49:02','2024-10-19 08:49:02',7,1),(17,'2024-10-19 08:49:48','2024-10-19 08:49:48',8,1),(18,'2024-10-19 08:50:45','2024-10-19 08:50:45',9,1),(19,'2024-10-19 08:51:32','2024-10-19 08:51:32',10,1),(20,'2024-10-19 08:52:20','2024-10-19 08:52:20',11,1),(21,'2024-10-19 08:52:54','2024-10-19 08:52:54',12,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `division_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_emp_unique` (`emp`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_divisions_FK` (`division_id`),
  CONSTRAINT `users_divisions_FK` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'000000','Pengelola Aplikasi','Administrator','000-000-000','Sistem','admin@elma.xyz.id','$2y$12$eqMIoo7mAzjpG4zwvQRnhePYxyMUlTxAmOGW6Rur2ORJZ/I3qaVqm',NULL,'2024-10-18 14:28:08','2024-10-18 14:28:08',1,NULL),(2,'ENG-001','Blaise Pascal','Programmer','012-3456789','DKI Jakarta','pascal@elma.xyz.id','$2y$12$KTF9H6r7ErEWiaeLa5JqjOjF9cdvYya7pX4s9F0/E6sUNr4Q0qt56',NULL,'2024-10-19 05:38:38','2024-10-19 06:27:29',4,NULL),(3,'TFS-001','Friedrich Engels','Manajer Proyek','012-3456789','DKI Jakarta','engels@elma.xyz.id','$2y$12$Sb8plCSf.Ot.6AjyE7mmHOS5GbHvys0AMVCmmBCHv7OIudRPVwzxq',NULL,'2024-10-19 06:27:01','2024-10-19 06:27:18',5,NULL),(4,'SBS-001','Ernst Bloch','Human Resource','012-3456789','DKI Jakarta','bloch@elma.xyz.id','$2y$12$fzdMoz5ZRtpstQtqOtVm0etfg/Zs6JRLcNNYvTIWCKepMLO/tMJDm',NULL,'2024-10-19 06:29:01','2024-10-19 06:29:01',1,NULL),(5,'GPC-001','Jean-Paul Sartre','Implementor','012-3456789','DKI Jakarta','sartre@elma.xyz.id','$2y$12$Nu63DwFfOM/CoNe361XMd.3rYwDlV9fE.92fSQVZtw/X3Ikt3yfVm',NULL,'2024-10-19 06:30:19','2024-10-19 06:30:19',3,NULL),(6,'ENG-000','Martin Heidegger','Kepala Divisi','012-3456789','DKI Jakarta','martin@elma.xyz.id','$2y$12$isDUcN3SuJfWCRa05qY.Wu8KkUvIq1o3CGsfgetOcMnuBBS.b2Cne',NULL,'2024-10-19 06:31:40','2024-10-19 06:31:40',4,NULL),(7,'ENG-002','Isaac Newton','Programmer','012-3456789','DKI Jakarta','newton@elma.xyz.id','$2y$12$em1lhPEU./pEZr0DtHrGKOueDgHJDeUPQCwPczm3NWMLlCcRDbHG2',NULL,'2024-10-19 08:49:02','2024-10-19 08:49:02',4,NULL),(8,'ENG-003','Albert Camus','Programmer','012-3456789','DKI Jakarta','camus@elma.xyz.id','$2y$12$obMAOIgQ6.2H4zHb8CaOjORkK0YJWMsA/VA9GVcwprqcwXX4If3nW',NULL,'2024-10-19 08:49:48','2024-10-19 08:49:48',4,NULL),(9,'GPC-002','Franz Kafka','Implementor','012-3456789','DKI Jakarta','kafka@elma.xyz.id','$2y$12$iGvgW9y6FVLQ4oCLJYkAruit7kvP19QGdSR1jKCjB3/nJhRLO1.Hq',NULL,'2024-10-19 08:50:45','2024-10-19 08:50:45',3,NULL),(10,'GPC-003','Leo Tolstoy','Implementor','012-3456789','DKI Jakarta','tolstoy@elma.xyz.id','$2y$12$6GoGGGm/LYvlsIfjBA5bie5SVeoEqNP0/w1NupN9Dp1w/p8vGcXai',NULL,'2024-10-19 08:51:32','2024-10-19 08:51:32',3,NULL),(11,'TFS-002','Friedrich Nietzsche','Manajer Proyek','012-3456789','DKI Jakarta','nietzsche@elma.xyz.id','$2y$12$8Z.z/iwmFx.40l68QWDSL.afHoyXLgi4swQjeH5p7UnTuMMLe5xUq',NULL,'2024-10-19 08:52:20','2024-10-19 08:52:20',5,NULL),(12,'TFS-003','Karl Marx','Manajer Proyek','012-3456789','DKI Jakarta','marx@elma.xyz.id','$2y$12$mvJxHuTqm11GToXbZtiTUeG5uMu6k5oPipTfmjcgZhWuuvNJ5Dr0q',NULL,'2024-10-19 08:52:54','2024-10-19 08:52:54',5,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weights`
--

DROP TABLE IF EXISTS `weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `classification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weights`
--

LOCK TABLES `weights` WRITE;
/*!40000 ALTER TABLE `weights` DISABLE KEYS */;
INSERT INTO `weights` VALUES (1,'2024-10-20 06:47:00','2024-10-20 06:47:00','MNT','Maintenance (Perawatan)',NULL,'green',1,'Ringan'),(2,'2024-10-20 06:47:00','2024-10-20 06:47:00','IMP','Improvement (Peningkatan)',NULL,'orange',3,'Menengah'),(3,'2024-10-20 06:47:00','2024-10-20 06:47:00','DEV','Development (Pengembangan)',NULL,'red',5,'Berat');
/*!40000 ALTER TABLE `weights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elma_app'
--

--
-- Final view structure for view `user_leave_slot_calculations`
--

/*!50001 DROP VIEW IF EXISTS `user_leave_slot_calculations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_leave_slot_calculations` AS select coalesce(`uls`.`id`,0) AS `id`,`ls`.`year` AS `year`,cast(concat(`ls`.`year` + 1,'-',`l`.`expired_at`) as date) AS `expired_at`,`u`.`id` AS `user_id`,`l`.`id` AS `leave_id`,coalesce(`uls`.`days`,`ls`.`days`) AS `slot`,NULL AS `comment` from (((`users` `u` join `leaves` `l` on(`l`.`code` = 'YAR')) join `leave_slots` `ls` on(`ls`.`leave_id` = `l`.`id`)) left join `user_leave_slots` `uls` on(`uls`.`leave_id` = `l`.`id` and `uls`.`year` = `ls`.`year` and `uls`.`user_id` = `u`.`id`)) union select coalesce(`uls`.`id`,0) AS `id`,`uls`.`year` AS `year`,cast(coalesce(`uls`.`expired_at`,concat(`uls`.`year`,'-',`l`.`expired_at`)) as date) AS `expired_at`,`uls`.`user_id` AS `user_id`,`uls`.`leave_id` AS `leave_id`,`uls`.`days` AS `slot`,`uls`.`comment` AS `comment` from (`user_leave_slots` `uls` join `leaves` `l` on(`l`.`id` = `uls`.`leave_id` and `l`.`code` <> 'YAR')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_projects`
--

/*!50001 DROP VIEW IF EXISTS `user_projects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_projects` AS select `pm`.`project_id` AS `project_id`,`pm`.`user_id` AS `user_id`,`w`.`point` AS `point` from ((`project_members` `pm` join `projects` `p` on(`pm`.`project_id` = `p`.`id`)) join `weights` `w` on(`p`.`weight_id` = `w`.`id`)) union select `p`.`id` AS `project_id`,`p`.`manager_id` AS `user_id`,`w`.`point` AS `point` from (`projects` `p` join `weights` `w` on(`p`.`weight_id` = `w`.`id`)) */;
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

-- Dump completed on 2024-10-25  0:23:01
