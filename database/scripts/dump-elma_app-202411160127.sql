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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_delegations`
--

LOCK TABLES `application_delegations` WRITE;
/*!40000 ALTER TABLE `application_delegations` DISABLE KEYS */;
INSERT INTO `application_delegations` VALUES (1,'2024-10-28 09:14:20','2024-10-29 06:38:07',2,'Mengembangkan dasbor analisis data.',1,3,1,1,'Programmer'),(2,'2024-10-28 09:14:20','2024-10-29 06:39:45',8,'Mengembangkan sistem informasi.',1,1,1,1,'Programmer'),(3,'2024-10-29 06:48:07','2024-10-29 06:48:07',2,'Mengembangkan dasbor analisis data.',2,3,0,0,'Programmer'),(4,'2024-11-14 06:45:11','2024-11-14 08:38:54',8,'Mengembangkan dasbor analisis data.',3,3,1,1,'Programmer'),(5,'2024-11-14 06:45:11','2024-11-14 08:39:36',2,'Mengembangkan sistem informasi.',3,1,1,1,'Programmer'),(6,'2024-11-14 09:15:17','2024-11-14 09:17:17',2,'Mengembangkan dasbor analisis data guna.',4,3,1,1,'Programmer'),(7,'2024-11-14 10:41:32','2024-11-14 10:41:32',8,'Mengembangkan sistem pengadaan.',5,2,0,0,'Programmer');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_histories`
--

LOCK TABLES `application_histories` WRITE;
/*!40000 ALTER TABLE `application_histories` DISABLE KEYS */;
INSERT INTO `application_histories` VALUES (1,'2024-10-28 01:00:00','2024-10-28 01:00:00',1,'Mohon disetujui karena berhubungan dengan kegiatan perkuliahan.',7,'Pengajuan Cuti','Karyawan'),(9,'2024-10-28 02:00:00','2024-10-28 02:00:00',1,'Pengajuan disetujui. Tugas akan saya bantu kerjakan.',2,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(12,'2024-10-29 01:00:00','2024-10-29 01:00:00',1,'Delegasi disetujui.',8,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(13,'2024-10-29 02:00:00','2024-10-29 02:00:00',1,'Cuti disetujui, delegasi dapat mengerjakan pekerjaan.',3,'Persetujuan Cuti','Manajer Proyek'),(14,'2024-10-29 03:00:00','2024-10-29 03:00:00',1,'Diperbolehkan, asalkan pekerjaan dapat tertangani dengan baik.',12,'Persetujuan Cuti','Manajer Proyek'),(15,'2024-10-29 04:00:00','2024-10-29 04:00:00',1,'Disetujui, selamat menjalankan perkuliahan!',6,'Persetujuan Cuti','Kepala Divisi'),(16,'2024-10-29 05:00:00','2024-10-29 05:00:00',2,'Mohon disetujui.',8,'Pengajuan Cuti','Karyawan'),(17,'2024-10-29 06:00:00','2024-10-29 06:00:00',2,'Mohon maaf, sepertinya untuk tanggal yang disebutkan, pekerjaan sedang tinggi-tingginya.',2,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(18,'2024-11-14 06:45:11','2024-11-14 06:45:11',3,'Mohon disetujui bapak dan ibu.',7,'Pengajuan Cuti','Karyawan'),(19,'2024-11-14 08:37:10','2024-11-14 08:37:10',3,'Pengajuan disetujui.',8,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(20,'2024-11-14 08:37:49','2024-11-14 08:37:49',3,'Disetujui.',2,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(21,'2024-11-14 08:38:54','2024-11-14 08:38:54',3,'Disetujui.',3,'Persetujuan Cuti','Manajer Proyek'),(22,'2024-11-14 08:39:36','2024-11-14 08:39:36',3,'Disetujui.',12,'Persetujuan Cuti','Manajer Proyek'),(23,'2024-11-14 08:40:16','2024-11-14 08:40:16',3,'Disetujui.',6,'Persetujuan Cuti','Kepala Divisi'),(24,'2024-11-14 09:15:17','2024-11-14 09:15:17',4,'Mohon disetujui semuanya.',8,'Pengajuan Cuti','Karyawan'),(25,'2024-11-14 09:16:49','2024-11-14 09:16:49',4,'Disetujui untuk delegasinya.',2,'Persetujuan Delegasi Cuti','Karyawan Delegasi'),(26,'2024-11-14 09:17:17','2024-11-14 09:17:17',4,'Disetujui.',3,'Persetujuan Cuti','Manajer Proyek'),(27,'2024-11-14 09:17:48','2024-11-14 09:17:48',4,'Disetujui.',6,'Persetujuan Cuti','Kepala Divisi'),(28,'2024-11-14 10:41:32','2024-11-14 10:41:32',5,'Mohon disetujui.',2,'Pengajuan Cuti','Karyawan');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_leave_slots`
--

LOCK TABLES `application_leave_slots` WRITE;
/*!40000 ALTER TABLE `application_leave_slots` DISABLE KEYS */;
INSERT INTO `application_leave_slots` VALUES (1,'2024-10-28 09:14:20','2024-10-28 09:14:20',1,2,'10'),(2,'2024-10-29 06:48:07','2024-10-29 06:48:07',2,4,'5'),(3,'2024-11-14 09:15:17','2024-11-14 09:15:17',4,4,'3'),(4,'2024-11-14 10:41:32','2024-11-14 10:41:32',5,3,'2');
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
  `current_user_id` bigint(20) unsigned DEFAULT NULL,
  `is_head_approved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_kinds_FK` (`leave_id`),
  KEY `applications_users_FK` (`requester_id`),
  KEY `applications_users_FK_1` (`current_user_id`),
  CONSTRAINT `applications_kinds_FK` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`),
  CONSTRAINT `applications_users_FK` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`),
  CONSTRAINT `applications_users_FK_1` FOREIGN KEY (`current_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'2024-10-28 09:14:20','2024-10-29 06:40:48',1,'2024-12-02','2024-12-13',7,10,99,'Keperluan Perkuliahan','storage/files/request-2024-10-28/161420_sample (1).pdf',NULL,1),(2,'2024-10-29 06:48:07','2024-10-29 06:50:05',1,'2024-12-13','2024-12-19',8,5,0,'Beristirahat',NULL,NULL,0),(3,'2024-11-14 06:45:11','2024-11-14 08:40:16',4,'2024-11-14','2024-11-14',7,1,99,'Sakit',NULL,NULL,1),(4,'2024-11-14 09:15:17','2024-11-14 09:17:48',1,'2025-01-27','2025-01-29',8,3,99,'Keperluan Sidang Kuliah','storage/files/request-2024-11-14/161517_sample-pdf.pdf',NULL,1),(5,'2024-11-14 10:41:32','2024-11-14 10:41:32',1,'2024-12-12','2024-12-13',2,2,1,'Keperluan Perkuliahan',NULL,8,0);
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
  `head_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `divisions_users_FK` (`head_id`),
  CONSTRAINT `divisions_users_FK` FOREIGN KEY (`head_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'2024-10-18 14:28:12','2024-10-30 01:32:06','Smart Business Support','SBS',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas penunjang bisnis.',16),(2,'2024-10-19 02:43:58','2024-10-30 01:33:29','Pengadaan.com','PDC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Pengadaan.com.',17),(3,'2024-10-19 02:44:20','2024-10-30 01:24:07','Great Procurement','GPC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Great Procurement.',13),(4,'2024-10-19 02:44:49','2024-10-28 09:09:15','Engineering','ENG',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas pengembangan digital.',6),(5,'2024-10-19 02:45:22','2024-10-30 01:29:33','Transformation Service','TFS',NULL,'Divisi yang bertanggung jawab terhadap semua hal yang berkaitan dengan layanan transformasi bisnis dan digital.',15),(6,'2024-10-19 02:45:55','2024-10-30 01:26:10','Digital Business Development','DBD',NULL,'Divisi yang bertanggung jawab atas semua hal yang berhubungan dengan pengembangan bisnis digital.',14);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-01-01','2023-01-01','Tahun Baru 2023',0),(2,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-01-22','2023-01-22','Tahun Baru Imlek 2574 Kongzili',0),(3,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-01-23','2023-01-23','Cuti Bersama Imlek',1),(4,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-02-18','2023-02-18','Isra\' Mi\'raj Nabi Muhammad SAW',0),(5,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-03-22','2023-03-22','Hari Raya Nyepi 1945',0),(6,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-03-23','2023-03-23','Cuti Bersama Nyepi',1),(7,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-07','2023-04-07','Wafat Isa Al Masih',0),(8,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-19','2023-04-19','Cuti Bersama Idul Fitri',1),(9,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-20','2023-04-20','Cuti Bersama Idul Fitri',1),(10,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-21','2023-04-21','Cuti Bersama Idul Fitri',1),(11,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-22','2023-04-22','Idul Fitri 1444 H',0),(12,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-23','2023-04-23','Idul Fitri 1444 H',0),(13,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-24','2023-04-24','Cuti Bersama Idul Fitri',1),(14,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-04-25','2023-04-25','Cuti Bersama Idul Fitri',1),(15,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-05-01','2023-05-01','Hari Buruh Internasional',0),(16,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-05-18','2023-05-18','Kenaikan Isa Al Masih',0),(17,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-01','2023-06-01','Hari Lahir Pancasila',0),(18,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-02','2023-06-02','Cuti Bersama Waisak',1),(19,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-04','2023-06-04','Hari Raya Waisak 2567',0),(20,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-28','2023-06-28','Cuti Bersama Idul Adha',1),(21,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-29','2023-06-29','Hari Raya Idul Adha 1444 H',0),(22,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-06-30','2023-06-30','Cuti Bersama Idul Adha',1),(23,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-07-19','2023-07-19','Tahun Baru Islam 1445 H',0),(24,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-08-17','2023-08-17','Hari Kemerdekaan Republik Indonesia ke 78',0),(25,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-09-28','2023-09-28','Maulid Nabi Muhammad SAW',0),(26,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-12-25','2023-12-25','Hari Raya Natal',0),(27,'2024-10-29 12:06:38','2024-10-29 12:06:38','2023-12-26','2023-12-26','Cuti Bersama Natal',1),(28,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-01-01','2024-01-01','Tahun Baru 2024 Masehi',0),(29,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-02-08','2024-02-08','Isra\' Mi\'raj Nabi Muhammad SAW',0),(30,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-02-09','2024-02-09','Cuti Bersama Imlek 2575 Kongzili',1),(31,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-02-10','2024-02-10','Tahun Baru Imlek 2575 Kongzili',0),(32,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-02-14','2024-02-14','Pemilihan Umum (Pemilu)',0),(33,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-03-11','2024-03-11','Hari Raya Nyepi Tahun Baru Saka 1946',0),(34,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-03-12','2024-03-12','Cuti Bersama Hari Raya Nyepi',1),(35,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-03-29','2024-03-29','Wafat Isa Al Masih',0),(36,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-03-31','2024-03-31','Hari Paskah',0),(37,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-08','2024-04-08','Cuti Bersama Hari Raya Idul Fitri',1),(38,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-09','2024-04-09','Cuti Bersama Hari Raya Idul Fitri',1),(39,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-10','2024-04-10','Hari Raya Idul Fitri 1445 H',0),(40,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-11','2024-04-11','Hari Raya Idul Fitri 1445 H',0),(41,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-12','2024-04-12','Cuti Bersama Hari Raya Idul Fitri',1),(42,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-04-15','2024-04-15','Cuti Bersama Hari Raya Idul Fitri',1),(43,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-05-01','2024-05-01','Hari Buruh Internasional',0),(44,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-05-09','2024-05-09','Kenaikan Isa Al Masih',0),(45,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-05-10','2024-05-10','Cuti Bersama Kenaikan Isa Al Masih',1),(46,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-05-23','2024-05-23','Hari Raya Waisak 2568 BE',0),(47,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-05-24','2024-05-24','Cuti Bersama Hari Raya Waisak',1),(48,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-06-01','2024-06-01','Hari Lahir Pancasila',0),(49,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-06-17','2024-06-17','Hari Raya Idul Adha 1445 H',0),(50,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-06-18','2024-06-18','Cuti Bersama Hari Raya Idul Adha',1),(51,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-07-07','2024-07-07','Tahun Baru Islam 1446 H',0),(52,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-08-17','2024-08-17','Hari Kemerdekaan Republik Indonesia ke 79',0),(53,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-09-16','2024-09-16','Maulid Nabi Muhammad SAW',0),(54,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-12-25','2024-12-25','Hari Raya Natal',0),(55,'2024-10-29 12:06:52','2024-10-29 12:06:52','2024-12-26','2024-12-26','Cuti Bersama Hari Raya Natal',1);
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
INSERT INTO `sessions` VALUES ('iuZmsIud6ZJs2xbfNJWJIHxB9ycaoiFP8s514wp9',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36 Edg/130.0.0.0','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',1731688112);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_slots`
--

LOCK TABLES `user_leave_slots` WRITE;
/*!40000 ALTER TABLE `user_leave_slots` DISABLE KEYS */;
INSERT INTO `user_leave_slots` VALUES (1,'2024-10-28 09:11:43','2024-10-28 09:11:43',1,2024,12,1,NULL,NULL),(2,'2024-10-28 09:13:20','2024-10-28 09:14:20',1,2024,2,7,NULL,NULL),(3,'2024-10-28 10:01:24','2024-11-15 09:11:58',1,2024,15,2,NULL,NULL),(4,'2024-10-28 10:08:56','2024-11-14 09:15:17',1,2024,9,8,NULL,NULL),(5,'2024-11-15 09:05:41','2024-11-15 09:05:41',1,2024,12,14,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'2024-10-19 09:58:04','2024-10-19 09:58:04',1,1),(2,'2024-10-28 09:04:16','2024-10-28 09:04:16',6,1),(4,'2024-10-28 09:04:42','2024-10-28 09:04:42',7,1),(5,'2024-10-28 09:04:55','2024-10-28 09:04:55',8,1),(6,'2024-10-28 09:05:02','2024-10-28 09:05:02',5,1),(7,'2024-10-28 09:05:14','2024-10-28 09:05:14',9,1),(8,'2024-10-28 09:05:20','2024-10-28 09:05:20',10,1),(10,'2024-10-28 09:05:41','2024-10-28 09:05:41',3,1),(11,'2024-10-28 09:05:49','2024-10-28 09:05:49',11,1),(12,'2024-10-28 09:05:56','2024-10-28 09:05:56',12,1),(13,'2024-10-29 10:21:06','2024-10-29 10:21:06',4,1),(14,'2024-10-29 10:21:06','2024-10-29 10:21:06',4,4),(15,'2024-10-30 01:23:48','2024-10-30 01:23:48',13,1),(16,'2024-10-30 01:25:51','2024-10-30 01:25:51',14,1),(17,'2024-10-30 01:29:01','2024-10-30 01:29:01',15,1),(18,'2024-10-30 01:31:37','2024-10-30 01:31:37',16,1),(19,'2024-10-30 01:33:16','2024-10-30 01:33:16',17,1),(20,'2024-11-15 09:11:58','2024-11-15 09:11:58',2,1);
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
  `mobile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_emp_unique` (`emp`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_divisions_FK` (`division_id`),
  CONSTRAINT `users_divisions_FK` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'000000','Pengelola Aplikasi','Administrator','000-000-000','Sistem','admin@elma.xyz.id','$2y$12$eqMIoo7mAzjpG4zwvQRnhePYxyMUlTxAmOGW6Rur2ORJZ/I3qaVqm',NULL,'2024-10-18 14:28:08','2024-10-18 14:28:08',1,NULL,'+6280000000000'),(2,'ENG-001','Blaise Pascal','Programmer','012-3456789','DKI Jakarta','pascal@elma.xyz.id','$2y$12$KTF9H6r7ErEWiaeLa5JqjOjF9cdvYya7pX4s9F0/E6sUNr4Q0qt56',NULL,'2024-10-19 05:38:38','2024-10-19 06:27:29',4,NULL,'+6280000000000'),(3,'TFS-001','Friedrich Engels','Manajer Proyek','012-3456789','DKI Jakarta','engels@elma.xyz.id','$2y$12$Sb8plCSf.Ot.6AjyE7mmHOS5GbHvys0AMVCmmBCHv7OIudRPVwzxq',NULL,'2024-10-19 06:27:01','2024-10-19 06:27:18',5,NULL,'+6280000000000'),(4,'SBS-001','Ernst Bloch','Human Resource','012-3456789','DKI Jakarta','bloch@elma.xyz.id','$2y$12$fzdMoz5ZRtpstQtqOtVm0etfg/Zs6JRLcNNYvTIWCKepMLO/tMJDm',NULL,'2024-10-19 06:29:01','2024-10-19 06:29:01',1,NULL,'+6280000000000'),(5,'GPC-001','Jean-Paul Sartre','Implementor','012-3456789','DKI Jakarta','sartre@elma.xyz.id','$2y$12$Nu63DwFfOM/CoNe361XMd.3rYwDlV9fE.92fSQVZtw/X3Ikt3yfVm',NULL,'2024-10-19 06:30:19','2024-10-19 06:30:19',3,NULL,'+6280000000000'),(6,'ENG-000','Martin Heidegger','Kepala Divisi','012-3456789','DKI Jakarta','martin@elma.xyz.id','$2y$12$isDUcN3SuJfWCRa05qY.Wu8KkUvIq1o3CGsfgetOcMnuBBS.b2Cne',NULL,'2024-10-19 06:31:40','2024-10-19 06:31:40',4,NULL,'+6280000000000'),(7,'ENG-002','Isaac Newton','Programmer','012-3456789','DKI Jakarta','newton@elma.xyz.id','$2y$12$em1lhPEU./pEZr0DtHrGKOueDgHJDeUPQCwPczm3NWMLlCcRDbHG2',NULL,'2024-10-19 08:49:02','2024-10-19 08:49:02',4,NULL,'+6280000000000'),(8,'ENG-003','Albert Camus','Programmer','012-3456789','DKI Jakarta','camus@elma.xyz.id','$2y$12$obMAOIgQ6.2H4zHb8CaOjORkK0YJWMsA/VA9GVcwprqcwXX4If3nW',NULL,'2024-10-19 08:49:48','2024-10-19 08:49:48',4,NULL,'+6280000000000'),(9,'GPC-002','Franz Kafka','Implementor','012-3456789','DKI Jakarta','kafka@elma.xyz.id','$2y$12$iGvgW9y6FVLQ4oCLJYkAruit7kvP19QGdSR1jKCjB3/nJhRLO1.Hq',NULL,'2024-10-19 08:50:45','2024-10-19 08:50:45',3,NULL,'+6280000000000'),(10,'GPC-003','Leo Tolstoy','Implementor','012-3456789','DKI Jakarta','tolstoy@elma.xyz.id','$2y$12$6GoGGGm/LYvlsIfjBA5bie5SVeoEqNP0/w1NupN9Dp1w/p8vGcXai',NULL,'2024-10-19 08:51:32','2024-10-19 08:51:32',3,NULL,'+6280000000000'),(11,'TFS-002','Friedrich Nietzsche','Manajer Proyek','012-3456789','DKI Jakarta','nietzsche@elma.xyz.id','$2y$12$8Z.z/iwmFx.40l68QWDSL.afHoyXLgi4swQjeH5p7UnTuMMLe5xUq',NULL,'2024-10-19 08:52:20','2024-10-19 08:52:20',5,NULL,'+6280000000000'),(12,'TFS-003','Karl Marx','Manajer Proyek','012-3456789','DKI Jakarta','marx@elma.xyz.id','$2y$12$mvJxHuTqm11GToXbZtiTUeG5uMu6k5oPipTfmjcgZhWuuvNJ5Dr0q',NULL,'2024-10-19 08:52:54','2024-10-19 08:52:54',5,NULL,'+6280000000000'),(13,'GPC-000','Søren Kierkegaard','Kepala Divisi','012-3456789','DKI Jakarta','soren@elma.xyz.id','$2y$12$r9XdndRd2akzgGHJLb9F0ezSAcWEENHspdUcvktcUQ/7R.fC25S1i',NULL,'2024-10-30 01:23:48','2024-10-30 01:23:48',3,NULL,'+6280000000000'),(14,'DBD-000','Arthur Schopenhauer','Kepala Divisi','012-3456789','DKI Jakarta','arthur@elma.xyz.id','$2y$12$OcWaxFPfWmRupA2mlJh3qeuUJhF7et4QNumKcWwknUjMygyiuM/t.',NULL,'2024-10-30 01:25:51','2024-10-30 01:25:51',6,NULL,'+6280000000000'),(15,'TFS-000','Eugène Lonesco','Kepala Divisi','012-3456789','DKI Jakarta','lonesco@elma.xyz.id','$2y$12$ppa.7FK3VHV3XfYgMyVBcOKOcptRr5CJVUXKRzYowkVFUsgjQZMuC',NULL,'2024-10-30 01:29:01','2024-10-30 01:29:01',5,NULL,'+6280000000000'),(16,'SBS-000','Nikolai Tchaikovsky','Kepala Divisi','012-3456789','DKI Jakarta','nikolai@elma.xyz.id','$2y$12$0rfk5uTxsUnIVZmOWK.kX.oklbUQRvYcAup21pfeRFR60kYh5.3DK',NULL,'2024-10-30 01:31:37','2024-10-30 01:31:37',1,NULL,'+6280000000000'),(17,'PDC-000','Pyotr Lavrov','Kepala Divisi','012-3456789','DKI Jakarta','pyotr@elma.xyz.id','$2y$12$IYtU6M7UavLQWaAbx.zpiuG5dHBm7NzKBIDey9hFgUmULi2dVH.5i',NULL,'2024-10-30 01:33:16','2024-10-30 01:33:16',2,NULL,'+6280000000000');
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

-- Dump completed on 2024-11-16  1:27:36
