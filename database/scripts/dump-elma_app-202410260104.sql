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
  `application_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `is_delegation_approved` tinyint(1) DEFAULT NULL,
  `is_manager_approved` tinyint(1) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_delegations_users_FK` (`delegation_id`),
  KEY `application_delegations_applications_FK` (`application_id`),
  KEY `application_delegations_projects_FK` (`project_id`),
  CONSTRAINT `application_delegations_applications_FK` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `application_delegations_projects_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `application_delegations_users_FK` FOREIGN KEY (`delegation_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_delegations`
--

LOCK TABLES `application_delegations` WRITE;
/*!40000 ALTER TABLE `application_delegations` DISABLE KEYS */;
INSERT INTO `application_delegations` VALUES (1,'2024-10-25 10:44:08','2024-10-25 10:44:08',2,'Mengembangkan sistem informasi.',1,1,0,0,'Programmer'),(2,'2024-10-25 10:44:08','2024-10-25 10:44:08',8,'Mengembangkan dasbor analisis data.',1,3,0,0,'Programmer');
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
  `process` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_histories_users_FK` (`user_id`),
  KEY `application_histories_applications_FK` (`application_id`),
  CONSTRAINT `application_histories_applications_FK` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `application_histories_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_histories`
--

LOCK TABLES `application_histories` WRITE;
/*!40000 ALTER TABLE `application_histories` DISABLE KEYS */;
INSERT INTO `application_histories` VALUES (1,'2024-10-24 17:00:00','2024-10-24 17:00:00',1,'Mohon disetujui bapak/ibu terkait pengajuan cuti untuk kegiatan perkuliahan.',7,'Pengajuan Cuti','Karyawan');
/*!40000 ALTER TABLE `application_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_leave_slots`
--

DROP TABLE IF EXISTS `application_leave_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_leave_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `application_id` bigint(20) unsigned DEFAULT NULL,
  `user_leave_slot_id` bigint(20) unsigned DEFAULT NULL,
  `days` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_leave_slots_user_leave_slots_FK` (`user_leave_slot_id`),
  KEY `application_leave_slots_applications_FK` (`application_id`),
  CONSTRAINT `application_leave_slots_applications_FK` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `application_leave_slots_user_leave_slots_FK` FOREIGN KEY (`user_leave_slot_id`) REFERENCES `user_leave_slots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_leave_slots`
--

LOCK TABLES `application_leave_slots` WRITE;
/*!40000 ALTER TABLE `application_leave_slots` DISABLE KEYS */;
INSERT INTO `application_leave_slots` VALUES (1,'2024-10-25 10:44:08','2024-10-25 10:44:08',1,1,'4');
/*!40000 ALTER TABLE `application_leave_slots` ENABLE KEYS */;
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
  `attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_kinds_FK` (`leave_id`),
  KEY `applications_users_FK` (`requester_id`),
  CONSTRAINT `applications_kinds_FK` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`),
  CONSTRAINT `applications_users_FK` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'2024-10-25 10:44:08','2024-10-25 10:44:08',1,'2024-11-02','2024-11-07',7,4,0,'Kegiatan Perkuliahan','storage/files/request-2024-10-25/174408_sample (1).pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
INSERT INTO `project_members` VALUES (10,'2024-10-20 07:01:49','2024-10-20 07:01:49',7,1),(11,'2024-10-20 07:01:49','2024-10-20 07:01:49',9,1),(12,'2024-10-20 07:06:31','2024-10-20 07:06:31',2,2),(13,'2024-10-20 07:06:31','2024-10-20 07:06:31',5,2),(14,'2024-10-24 19:05:48','2024-10-24 19:05:48',7,3),(15,'2024-10-24 19:05:48','2024-10-24 19:05:48',10,3),(16,'2024-10-24 19:05:48','2024-10-24 19:05:48',8,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'2024-10-19 23:59:42','2024-10-20 07:00:47','Proyek Basis Data Penyedia Barang dan Jasa Terpadu ABC','PMO-001',12,'2024-10-01','2025-10-01','Mengembangkan sistem informasi terintegrasi penyedia secara komprehensif guna meningkatkan efisiensi pengadaan pada Badan ABC.',3,NULL),(2,'2024-10-20 00:13:56','2024-10-20 00:13:56','Proyek Sistem Pengadaan Barang dan Jasa DEF','PMO-002',11,'2024-10-20','2025-05-20','Mengembangkan sistem pengadaan untuk Perusahaan DEF untuk mengoptimalkan proses pengadaan melalui solusi digital yang efisien dan transparan.',2,NULL),(3,'2024-10-24 19:05:48','2024-10-24 19:05:48','Proyek Dasbor Analisis Data Pengadaan KLM','PMO-003',3,'2024-10-01','2025-01-01','Mengembangkan dasbor analisis data guna meningkatkan keterlihatan dan keterbukaan keadaan pengadaan pada Perusahaan KLM.',3,NULL);
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
INSERT INTO `sessions` VALUES ('ZYjdzPUZKyVDa33XcCi4Ur7l9iTB86Sz9arlL7F3',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0','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',1729879476);
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
 1 AS `comment`,
 1 AS `leave_code`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_slots`
--

LOCK TABLES `user_leave_slots` WRITE;
/*!40000 ALTER TABLE `user_leave_slots` DISABLE KEYS */;
INSERT INTO `user_leave_slots` VALUES (1,'2024-10-24 21:17:35','2024-10-25 10:44:08',1,2024,2,7,NULL,NULL);
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
/*!50001 VIEW `user_leave_slot_calculations` AS select coalesce(`uls`.`id`,0) AS `id`,`ls`.`year` AS `year`,cast(concat(`ls`.`year` + 1,'-',`l`.`expired_at`) as date) AS `expired_at`,`u`.`id` AS `user_id`,`l`.`id` AS `leave_id`,coalesce(`uls`.`days`,`ls`.`days`) AS `slot`,NULL AS `comment`,`l`.`code` AS `leave_code` from (((`users` `u` join `leaves` `l` on(`l`.`code` = 'YAR')) join `leave_slots` `ls` on(`ls`.`leave_id` = `l`.`id`)) left join `user_leave_slots` `uls` on(`uls`.`leave_id` = `l`.`id` and `uls`.`year` = `ls`.`year` and `uls`.`user_id` = `u`.`id`)) union select coalesce(`uls`.`id`,0) AS `id`,`uls`.`year` AS `year`,cast(coalesce(`uls`.`expired_at`,concat(`uls`.`year`,'-',`l`.`expired_at`)) as date) AS `expired_at`,`uls`.`user_id` AS `user_id`,`uls`.`leave_id` AS `leave_id`,`uls`.`days` AS `slot`,`uls`.`comment` AS `comment`,`l`.`code` AS `leave_code` from (`user_leave_slots` `uls` join `leaves` `l` on(`l`.`id` = `uls`.`leave_id` and `l`.`code` = 'OVT')) */;
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

-- Dump completed on 2024-10-26  1:04:58
