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
  `kind_id` bigint(20) unsigned DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `requester_id` bigint(20) unsigned DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_kinds_FK` (`kind_id`),
  KEY `applications_users_FK` (`requester_id`),
  CONSTRAINT `applications_kinds_FK` FOREIGN KEY (`kind_id`) REFERENCES `kinds` (`id`),
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
INSERT INTO `divisions` VALUES (1,'2024-10-18 14:28:12','2024-10-19 02:43:40','Smart Business Support','SBS',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas penunjang bisnis.'),(2,'2024-10-19 02:43:58','2024-10-19 02:43:58','Pengadaan.com','PDC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Pengadaan.com.'),(3,'2024-10-19 02:44:20','2024-10-19 02:44:20','Great Procurement','GPC',NULL,'Divisi yang bertanggung jawab terhadap seluruh hal yang berkaitan dengan layanan Great Procurement.'),(4,'2024-10-19 02:44:49','2024-10-19 02:44:49','Engineering','ENG',NULL,'Divisi yang bertanggung jawab terhadap seluruh aktivitas pengembangan digital.'),(5,'2024-10-19 02:45:22','2024-10-19 02:45:22','Transformation Service','TFS',NULL,'Divisi yang bertanggung jawab terhadap semua hal yang berkaitan dengan layanan transformasi bisnis dan digital.'),(6,'2024-10-19 02:45:55','2024-10-19 02:46:18','Digital Business Development','DBD',NULL,'Divisi yang bertanggung jawab atas semua hal yang berhubungan dengan pengembangan bisnis digital.');
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
  `is_optional` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kinds`
--

DROP TABLE IF EXISTS `kinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kinds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kinds`
--

LOCK TABLES `kinds` WRITE;
/*!40000 ALTER TABLE `kinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `kinds` ENABLE KEYS */;
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
  `position` varchar(100) DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_members_users_FK` (`user_id`),
  KEY `project_members_projects_FK` (`project_id`),
  CONSTRAINT `project_members_projects_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_members_users_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `projects_users_FK` (`manager_id`),
  CONSTRAINT `projects_users_FK` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('qnpErhXY9FO48a2EBtidDxCw4wolZilMYLqiVgQ3',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0','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',1729331345);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_emp_unique` (`emp`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_divisions_FK` (`division_id`),
  CONSTRAINT `users_divisions_FK` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'000000','Pengelola Aplikasi','Administrator','000-000-000','Sistem','admin@elma.xyz.id','$2y$12$eqMIoo7mAzjpG4zwvQRnhePYxyMUlTxAmOGW6Rur2ORJZ/I3qaVqm',NULL,'2024-10-18 14:28:08','2024-10-18 14:28:08',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elma_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-19 16:55:36
