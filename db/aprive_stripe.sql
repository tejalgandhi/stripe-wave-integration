-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: aprive_stripe
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `announcement_user`
--

DROP TABLE IF EXISTS `announcement_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_user` (
  `announcement_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  KEY `announcement_user_announcement_id_index` (`announcement_id`),
  KEY `announcement_user_user_id_index` (`user_id`),
  CONSTRAINT `announcement_user_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `announcement_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_user`
--

LOCK TABLES `announcement_user` WRITE;
/*!40000 ALTER TABLE `announcement_user` DISABLE KEYS */;
INSERT INTO `announcement_user` VALUES (1,1),(2,1),(1,15),(2,15),(1,16),(2,16);
/*!40000 ALTER TABLE `announcement_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Wave 1.0 Released','We have just released the first official version of Wave. Click here to learn more!','<p>It\'s been a fun Journey creating this awesome SAAS starter kit and we are super excited to use it in many of our future projects. There are just so many features that Wave has that will make building the SAAS of your dreams easier than ever before.</p>\n<p>Make sure to stay up-to-date on our latest releases as we will be releasing many more features down the road :)</p>\n<p>Thanks! Talk to you soon.</p>','2018-05-20 17:49:00','2018-05-20 19:08:02'),(2,'Wave 2.0 Released','Wave V2 has been released with some awesome new features. Be sure to read up on what\'s new!','<p>This new version of Wave includes the following updates:</p><ul><li>Update to the latest version of Laravel</li><li>New Payment integration with Paddle</li><li>Rewritten theme support</li><li>Deployment integration</li><li>Much more awesomeness</li></ul><p>Be sure to check out the official Wave v2 page at <a href=\"https://devdojo.com/wave\">https://devdojo.com/wave</a></p>','2020-03-20 17:49:00','2020-03-20 19:08:02');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2017-11-21 10:53:22','2017-11-21 10:53:22'),(2,NULL,1,'Category 2','category-2','2017-11-21 10:53:22','2017-11-21 10:53:22');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,NULL,1),(27,3,'name','text','name',1,1,1,1,1,1,NULL,2),(28,3,'email','text','email',1,1,1,1,1,1,NULL,3),(29,3,'password','password','password',1,0,0,1,1,0,NULL,5),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"on\"}',11),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,NULL,6),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,7),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,8),(34,3,'avatar','image','avatar',0,1,1,1,1,1,NULL,9),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(53,3,'role_id','text','role_id',0,1,1,1,1,1,NULL,10),(54,3,'username','text','Username',1,1,1,1,1,1,NULL,4),(55,7,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(56,7,'title','text','Title',1,1,1,1,1,1,NULL,2),(57,7,'description','text_area','Description (max 250 characters)',1,1,1,1,1,1,NULL,3),(58,7,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,4),(59,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,5),(60,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,6),(61,3,'settings','hidden','Settings',0,1,1,1,1,1,NULL,9),(62,3,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\"}',11),(63,3,'locale','text','Locale',0,1,1,1,1,0,'',12),(64,8,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(65,8,'name','text','Name (Basic, Standard, Premium, etc)',1,1,1,1,1,1,NULL,3),(66,8,'description','text_area','Description (optional)',0,0,1,1,1,1,NULL,6),(67,8,'features','text_area','Features (comma separated)',1,0,1,1,1,1,NULL,4),(69,8,'role_id','text','Role Id',1,1,1,1,1,1,NULL,2),(70,8,'created_at','timestamp','Created At',0,1,0,0,0,1,NULL,8),(71,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,9),(72,8,'plan_belongsto_role_relationship','relationship','Role (role permissions for this plan)',0,1,1,1,1,1,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"announcement_user\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(73,8,'default','checkbox','Default (Make this the default plan)',1,0,1,1,1,1,NULL,7),(74,8,'price','text','Price (for display purposes only)',1,1,1,1,1,1,NULL,8),(75,8,'plan_id','text','Plan Id',1,1,1,1,1,1,NULL,6),(76,8,'trial_days','number','Trial Days (If none, set to 0)',1,0,1,1,1,1,NULL,9);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2017-11-21 10:53:22','2017-11-21 10:53:22'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2017-11-21 10:53:22','2017-11-21 10:53:22'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2017-11-21 10:53:22','2018-06-22 14:59:47'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2017-11-21 10:53:22','2017-11-21 10:53:22'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2017-11-21 10:53:22','2017-11-21 10:53:22'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2017-11-21 10:53:22','2017-11-21 10:53:22'),(7,'announcements','announcements','Announcement','Announcements','voyager-megaphone','Wave\\Announcement',NULL,NULL,NULL,1,0,NULL,'2018-05-20 15:38:14','2018-05-20 15:38:14'),(8,'plans','plans','Plan','Plans','voyager-logbook','Wave\\Plan',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-07-02 23:20:28','2018-07-02 23:20:28');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2017-11-21 10:53:22','2017-11-21 10:53:22','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.media.index',NULL),(3,1,'Posts','','_self','voyager-news',NULL,NULL,6,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.posts.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,4,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.users.index',NULL),(5,1,'Categories','','_self','voyager-categories',NULL,NULL,8,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.categories.index',NULL),(6,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.pages.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,3,'2017-11-21 10:53:22','2018-07-02 23:21:09','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,10,'2017-11-21 10:53:22','2018-07-02 23:21:03',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,1,'2017-11-21 10:53:22','2018-05-20 15:38:37','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,2,'2017-11-21 10:53:22','2018-05-20 15:38:37','voyager.database.index',NULL),(11,1,'Compass','/admin/compass','_self','voyager-compass',NULL,8,3,'2017-11-21 10:53:22','2018-05-20 15:38:37',NULL,NULL),(12,1,'Hooks','/admin/hooks','_self','voyager-hook','#000000',8,5,'2017-11-21 10:53:22','2018-06-22 15:25:55',NULL,''),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,11,'2017-11-21 10:53:22','2018-07-02 23:21:04','voyager.settings.index',NULL),(14,1,'Themes','/admin/themes','_self','voyager-paint-bucket',NULL,NULL,12,'2017-11-21 11:01:00','2018-07-02 23:21:04',NULL,NULL),(15,2,'Dashboard','','_self','home','#000000',NULL,1,'2017-11-28 09:18:21','2018-03-23 10:55:44','wave.dashboard','null'),(16,2,'Resources','#_','_self','info','#000000',NULL,2,'2017-11-28 09:19:36','2017-11-28 09:41:13',NULL,''),(19,2,'Next Child','/next','_self',NULL,'#000000',18,1,'2017-11-28 09:26:58','2017-11-28 09:27:10',NULL,''),(20,2,'Next Child 2','/next','_self',NULL,'#000000',18,2,'2017-11-28 09:27:07','2017-11-28 09:27:12',NULL,''),(21,2,'Documentation','/docs','_self',NULL,'#000000',16,1,'2017-11-28 09:38:56','2017-11-28 09:39:14',NULL,''),(22,2,'Videos','https://devdojo.com/series/wave','_blank',NULL,'#000000',16,2,'2017-11-28 09:39:22','2017-11-28 09:39:25',NULL,''),(23,2,'Support','https://devdojo.com/forums/category/wave','_blank','lifesaver','#000000',NULL,3,'2017-11-28 09:39:56','2018-03-31 12:52:05',NULL,''),(25,2,'Blog','/blog','_self',NULL,'#000000',16,3,'2018-03-31 12:52:02','2018-03-31 12:52:08',NULL,''),(26,3,'Home','/#','_self',NULL,'#000000',NULL,99,'2018-04-13 16:59:33','2018-08-28 13:09:05',NULL,''),(27,3,'Features','/#features','_self',NULL,'#000000',NULL,100,'2018-04-13 17:00:26','2018-08-27 18:54:49',NULL,''),(28,3,'Testimonials','/#testimonials','_self',NULL,'#000000',NULL,101,'2018-04-13 17:01:03','2018-08-27 18:54:57',NULL,''),(29,3,'Pricing','/#pricing','_self',NULL,'#000000',NULL,102,'2018-04-13 17:01:52','2018-08-27 18:55:04',NULL,''),(30,1,'Announcements','/admin/announcements','_self','voyager-megaphone',NULL,NULL,9,'2018-05-20 15:38:14','2018-07-02 23:21:03',NULL,NULL),(31,1,'BREAD','','_self','voyager-bread','#000000',8,4,'2018-06-22 15:23:25','2018-06-22 15:24:13','voyager.bread.index',NULL),(32,1,'Plans','','_self','voyager-logbook',NULL,NULL,2,'2018-07-02 23:20:28','2018-07-02 23:21:09','voyager.plans.index',NULL),(33,3,'Blog','','_self',NULL,'#000000',NULL,103,'2018-08-24 14:11:14','2018-08-24 14:11:14','wave.blog',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2017-11-21 10:53:22','2017-11-21 10:53:22'),(2,'authenticated-menu','2017-11-28 09:17:49','2018-04-13 16:55:28'),(3,'guest-menu','2018-04-13 16:55:37','2018-04-13 16:55:37');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (45,'2014_10_12_000000_create_users_table',1),(46,'2014_10_12_100000_create_password_resets_table',1),(47,'2016_01_01_000000_add_voyager_user_fields',1),(48,'2016_01_01_000000_create_data_types_table',1),(49,'2016_01_01_000000_create_pages_table',1),(50,'2016_01_01_000000_create_posts_table',1),(51,'2016_02_15_204651_create_categories_table',1),(52,'2016_05_19_173453_create_menu_table',1),(53,'2016_10_21_190000_create_roles_table',1),(54,'2016_10_21_190000_create_settings_table',1),(55,'2016_11_30_135954_create_permission_table',1),(56,'2016_11_30_141208_create_permission_role_table',1),(57,'2016_12_26_201236_data_types__add__server_side',1),(58,'2017_01_13_000000_add_route_to_menu_items_table',1),(59,'2017_01_14_005015_create_translations_table',1),(60,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(61,'2017_03_06_000000_add_controller_to_data_types_table',1),(62,'2017_04_11_000000_alter_post_nullable_fields_table',1),(63,'2017_04_21_000000_add_order_to_data_rows_table',1),(64,'2017_07_05_210000_add_policyname_to_data_types_table',1),(65,'2017_08_05_000000_add_group_to_settings_table',1),(66,'2017_11_26_013050_add_user_role_relationship',1),(67,'2017_11_26_015000_create_user_roles_table',1),(68,'2018_03_11_000000_add_user_settings',1),(69,'2018_03_14_000000_add_details_to_data_types_table',1),(70,'2018_03_16_000000_make_settings_value_nullable',1),(71,'2018_09_22_234251_add_permissions_group_id_to_permissions_table',1),(72,'2018_09_22_234251_add_username_billing_to_users',1),(73,'2018_09_22_234251_create_announcement_user_table',1),(74,'2018_09_22_234251_create_announcements_table',1),(75,'2018_09_22_234251_create_api_keys_table',1),(76,'2018_09_22_234251_create_notifications_table',1),(77,'2018_09_22_234251_create_permission_groups_table',1),(78,'2018_09_22_234251_create_plans_table',1),(79,'2018_09_22_234251_create_subscriptions_table',1),(80,'2018_09_22_234251_create_voyager_theme_options_table',1),(81,'2018_09_22_234251_create_voyager_themes_table',1),(82,'2018_09_22_234251_create_wave_key_values_table',1),(83,'2018_09_22_234252_add_foreign_keys_to_announcement_user_table',1),(84,'2018_09_22_234252_add_foreign_keys_to_plans_table',1),(85,'2020_03_30_032031_change_voyager_themes_table_name',1),(86,'2020_04_22_234252_add_foreign_keys_to_voyager_theme_options_table',1),(87,'2020_06_23_210721_add_stripe_status_column_to_subscriptions_table',1),(88,'2020_07_03_000003_create_subscription_items_table',1),(89,'2021_01_28_041011_create_paddle_subscriptions_table',1),(90,'2021_01_28_182638_removing_cashier_sub_tables',1),(91,'2021_01_29_173720_add_slug_column_to_plans_table',1),(92,'2022_03_17_114424_change_paddle_subscriptions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paddle_subscriptions`
--

DROP TABLE IF EXISTS `paddle_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paddle_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paddle_subscriptions`
--

LOCK TABLES `paddle_subscriptions` WRITE;
/*!40000 ALTER TABLE `paddle_subscriptions` DISABLE KEYS */;
INSERT INTO `paddle_subscriptions` VALUES (1,'sub_1KeHt5SJ9HYIDQ6Ai7i2UxEL','price_1KeFdXSJ9HYIDQ6AewwvBnOt',3,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-17 06:23:22','2022-03-17 06:23:22'),(2,'sub_1KeIAOSJ9HYIDQ6AAsSHfINp','price_1KeFdXSJ9HYIDQ6AewwvBnOt',4,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-17 06:41:07','2022-03-17 06:41:07'),(3,'sub_1KeIBKSJ9HYIDQ6AAxxkMowj','price_1KeFdXSJ9HYIDQ6AewwvBnOt',5,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-17 06:42:02','2022-03-17 06:42:02'),(4,'sub_1KeIFTSJ9HYIDQ6AeX7zaqdn','price_1KeFdXSJ9HYIDQ6AewwvBnOt',6,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-17 06:46:31','2022-03-17 06:46:31'),(5,'sub_1Kfde6SJ9HYIDQ6Ac7miYqV1','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-20 23:49:20','2022-03-20 23:49:20'),(6,'sub_1KfdwESJ9HYIDQ6ASoriX6Rq','price_1KeFdXSJ9HYIDQ6AewwvBnOt',8,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 00:08:03','2022-03-21 00:08:03'),(7,'sub_1KfexDSJ9HYIDQ6AhkIl1tSX','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 01:13:07','2022-03-21 01:13:07'),(8,'sub_1KffFUSJ9HYIDQ6Az4ExRiNV','price_1KeFdXSJ9HYIDQ6AewwvBnOt',9,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 01:32:02','2022-03-21 01:32:02'),(9,'sub_1KffZiSJ9HYIDQ6A5O6uw0pL','price_1KeFdXSJ9HYIDQ6AewwvBnOt',1,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 01:52:56','2022-03-21 01:52:56'),(10,'sub_1KffdWSJ9HYIDQ6ARag72lz2','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 01:56:58','2022-03-21 01:56:58'),(11,'sub_1KfffxSJ9HYIDQ6AAvywscXd','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://wave-stripe.com/cancel',NULL,'2022-03-21 01:59:23','2022-03-21 01:59:23'),(12,'sub_1KfgmKSJ9HYIDQ6A2OU4AkYl','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:10:01','2022-03-21 03:10:01'),(13,'sub_1KfgpUSJ9HYIDQ6AWBfNwJHd','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:13:18','2022-03-21 03:13:18'),(14,'sub_1KfgqhSJ9HYIDQ6AmKmbhcys','price_1KeFdXSJ9HYIDQ6AewwvBnOt',7,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:14:31','2022-03-21 03:14:31'),(15,'sub_1KfguWSJ9HYIDQ6AvIxTMXnS','price_1KeFdXSJ9HYIDQ6AewwvBnOt',10,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:18:30','2022-03-21 03:18:30'),(16,'sub_1KfhNrSJ9HYIDQ6ADyrZ54dL','price_1Kff4cSJ9HYIDQ6AFZ72TF1L',11,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:48:51','2022-03-21 03:48:51'),(17,'sub_1KfhSuSJ9HYIDQ6AHTwCDqiY','price_1Kff4cSJ9HYIDQ6AFZ72TF1L',12,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:54:01','2022-03-21 03:54:01'),(18,'sub_1KfhV2SJ9HYIDQ6A2y5gta2m','price_1Kff4cSJ9HYIDQ6AFZ72TF1L',13,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 03:56:14','2022-03-21 03:56:14'),(19,'sub_1Kfjl7SJ9HYIDQ6ANaAfZetk','price_1KfjhESJ9HYIDQ6Au0CyejRF',14,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 06:23:08','2022-03-21 06:23:08'),(20,'sub_1KfjoWSJ9HYIDQ6AKBbtdYKg','price_1KfjhYSJ9HYIDQ6AmwSsEwHd',15,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 06:24:36','2022-03-21 06:24:36'),(21,'sub_1KfjpvSJ9HYIDQ6AgcapCeXK','price_1Kfji7SJ9HYIDQ6AlO9FkHDR',16,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 06:26:06','2022-03-21 06:26:06'),(22,'sub_1KflAGSJ9HYIDQ6AJxwmva1e','price_1KfjhYSJ9HYIDQ6AmwSsEwHd',17,'active',NULL,'http://127.0.0.1:8000/cancel',NULL,'2022-03-21 08:23:31','2022-03-21 08:23:31');
/*!40000 ALTER TABLE `paddle_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2017-11-21 10:53:23','2017-11-21 10:53:23'),(2,1,'About','This is the about page.','<p>Wave is the ultimate&nbsp;Software as a Service Starter kit. If you\'ve ever wanted to create your own SAAS application, Wave can help save you hundreds of hours. Wave is one of a kind and it is built on top of Laravel and Voyager. Building your application is going to be funner&nbsp;than ever before... Funner may not be a real word, but you get where I\'m trying to go.</p>\n<p>Wave has a bunch of functionality built-in that will save you a bunch of time. Your users will be able to update their settings, billing information, profile information and so much more. You will also be able to accept&nbsp;payments from your user with multiple vendors.</p>\n<p>We want to help you build the SAAS of your dreams by making it easier and less time-consuming. Let\'s start creating some \"Waves\" and build out the SAAS in your particular niche... Sorry about that Wave pun...</p>',NULL,'about','About Wave','about, wave','ACTIVE','2018-03-29 21:34:51','2018-03-29 21:34:51');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_groups`
--

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(16,3),(16,4),(16,5),(17,1),(17,3),(17,4),(17,5),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(26,2),(26,3),(26,4),(26,5),(27,1),(27,2),(27,3),(27,4),(27,5),(28,1),(29,1),(30,1),(31,1),(31,2),(31,3),(31,4),(31,5),(32,1),(32,2),(32,3),(32,4),(32,5),(33,1),(34,1),(35,1),(36,1),(36,2),(36,3),(36,4),(36,5),(37,1),(37,2),(37,3),(37,4),(37,5),(38,1),(39,1),(40,1),(41,1),(42,1),(42,2),(42,3),(42,4),(42,5),(43,1),(43,2),(43,3),(43,4),(43,5),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(2,'browse_bread',NULL,'2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(3,'browse_database',NULL,'2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(4,'browse_media',NULL,'2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(5,'browse_compass',NULL,'2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(6,'browse_menus','menus','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(7,'read_menus','menus','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(8,'edit_menus','menus','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(9,'add_menus','menus','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(10,'delete_menus','menus','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(11,'browse_roles','roles','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(12,'read_roles','roles','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(13,'edit_roles','roles','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(14,'add_roles','roles','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(15,'delete_roles','roles','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(16,'browse_users','users','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(17,'read_users','users','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(18,'edit_users','users','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(19,'add_users','users','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(20,'delete_users','users','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(21,'browse_settings','settings','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(22,'read_settings','settings','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(23,'edit_settings','settings','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(24,'add_settings','settings','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(25,'delete_settings','settings','2018-06-22 14:45:45','2018-06-22 14:45:45',NULL),(26,'browse_categories','categories','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(27,'read_categories','categories','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(28,'edit_categories','categories','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(29,'add_categories','categories','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(30,'delete_categories','categories','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(31,'browse_posts','posts','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(32,'read_posts','posts','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(33,'edit_posts','posts','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(34,'add_posts','posts','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(35,'delete_posts','posts','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(36,'browse_pages','pages','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(37,'read_pages','pages','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(38,'edit_pages','pages','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(39,'add_pages','pages','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(40,'delete_pages','pages','2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(41,'browse_hooks',NULL,'2018-06-22 14:45:46','2018-06-22 14:45:46',NULL),(42,'browse_announcements','announcements','2018-05-20 15:38:14','2018-05-20 15:38:14',NULL),(43,'read_announcements','announcements','2018-05-20 15:38:14','2018-05-20 15:38:14',NULL),(44,'edit_announcements','announcements','2018-05-20 15:38:14','2018-05-20 15:38:14',NULL),(45,'add_announcements','announcements','2018-05-20 15:38:14','2018-05-20 15:38:14',NULL),(46,'delete_announcements','announcements','2018-05-20 15:38:14','2018-05-20 15:38:14',NULL),(47,'browse_themes','admin','2017-11-21 11:01:00','2017-11-21 11:01:00',NULL),(48,'browse_hooks','hooks','2018-06-22 08:25:03','2018-06-22 08:25:03',NULL),(49,'read_hooks','hooks','2018-06-22 08:25:03','2018-06-22 08:25:03',NULL),(50,'edit_hooks','hooks','2018-06-22 08:25:03','2018-06-22 08:25:03',NULL),(51,'add_hooks','hooks','2018-06-22 08:25:03','2018-06-22 08:25:03',NULL),(52,'delete_hooks','hooks','2018-06-22 08:25:03','2018-06-22 08:25:03',NULL),(53,'browse_plans','plans','2018-07-02 23:20:28','2018-07-02 23:20:28',NULL),(54,'read_plans','plans','2018-07-02 23:20:28','2018-07-02 23:20:28',NULL),(55,'edit_plans','plans','2018-07-02 23:20:28','2018-07-02 23:20:28',NULL),(56,'add_plans','plans','2018-07-02 23:20:28','2018-07-02 23:20:28',NULL),(57,'delete_plans','plans','2018-07-02 23:20:28','2018-07-02 23:20:28',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `features` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role_id` bigint unsigned NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_days` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_slug_unique` (`slug`),
  KEY `plans_role_id_foreign` (`role_id`),
  CONSTRAINT `plans_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'CMS','basic','Signup for the Basic User Plan to access all the basic features.','Basic Feature Example 1, Basic Feature Example 2, Basic Feature Example 3, Basic Feature Example 4','prod_LMScsLdz29a41F',3,1,'5000 + 150',0,'2018-07-02 23:33:56','2022-03-21 06:18:21'),(2,'CRM','premium','Signup for our premium plan to access all our Premium Features.','Premium Feature Example 1, Premium Feature Example 2, Premium Feature Example 3, Premium Feature Example 4','prod_LMScZtJ30388gU',5,1,'40',0,'2018-07-03 10:59:46','2022-03-21 06:18:35'),(3,'CMS + CRM','pro','Gain access to our pro features with the pro plan.dd','Pro Feature Example 1, Pro Feature Example 2, Pro Feature Example 3, Pro Feature Example 4','prod_LMSdx0VIQM1bCM',4,0,'5000 + 200',14,'2018-07-03 11:00:43','2022-03-21 06:18:49');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,1,1,'Best ways to market your application','Best ways to market your application',NULL,'<p>There are many different ways to market your application. First, let\'s start off at the beginning and then we will get more in-depth. You\'ll want to discover your target audience and after that, you\'ll want to run some ads.</p>\n<p>Let\'s not complicate things here, if you build a good product, you are going to have users. But you will need to let your users know where to find you. This is where social media and ads come in to play. You\'ll need to boast about your product and your app. If it\'s something that you really believe in, the odds are others will too.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p> Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>','posts/March2018/h86hSqPMkT9oU8pjcrSu.jpg','best-ways-to-market-your-application','Find out the best ways to market your application in this article.','market, saas, market your app','PUBLISHED',0,'2018-03-25 21:25:01','2018-03-25 20:43:05'),(6,1,1,'Achieving your Dreams','Achieving your Dreams',NULL,'<p>What can be said about achieving your dreams? <br>Well... It\'s a good thing, and it\'s probably something you\'re dreaming of. Oh yeah, when you create an app and a product that you enjoy working on... You\'ll be pretty happy and your dreams will probably come true. Cool, right?</p>\n<p>I hope that you are ready for some cool stuff because there is some cool stuff right around the corner. By the time you\'ve reached the sky, you\'ll realize your true limits. That last sentence there... That was a little bit of jibberish, but I\'m trying to write about something cool. Bottom line is that Wave is going to help save you so much time.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>','posts/March2018/rU26aWVsZ2zocWGSTE7J.jpg','achieving-your-dreams','In this post, you\'ll learn about achieving your dreams by building the SAAS app of your dreams','saas app, dreams','PUBLISHED',0,'2018-03-25 21:20:18','2018-03-25 20:45:18'),(7,1,1,'Building a solid foundation','Building a solid foundation',NULL,'<p>The foundation is one of the most important aspects. You\'ll want to make sure that you build your application on a solid foundation because this is where every other feature will grow on top of.</p>\n<p>If the foundation is unstable the rest of the application will be so as well. But a solid foundation will make mediocre features seem amazing. So, if you want to save yourself some time you will build your application on a solid foundation of cool features, awesome jumps, and killer waves... I don\'t know what this paragraph is about anymore.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.&nbsp;</p>','posts/March2018/4vI1gzsAvMZ30yfDIe67.jpg','building-a-solid-foundation','Building a solid foundation for your application is super important. Read on below.','foundation, app foundation','PUBLISHED',0,'2018-03-25 20:54:43','2018-03-25 20:54:43'),(8,1,2,'Finding the solution that fits for you','Finding the solution that fits for you',NULL,'<p>There is a fit for each person. Depending on the service you may want to focus on what each person needs. When you find this you\'ll be able to segregate your application to fit each person\'s needs.</p>\n<p>This is really just an example post. I could write some stuff about how this and that, but it would probably only be information about this and that. Who am I kidding? This really isn\'t going to make some sense, but thanks for still reading. Are you still reading this article? That\'s awesome. Thanks for being interested.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.&nbsp;</p>','posts/March2018/hWOT5yqNmzCnLhVWXB2u.jpg','finding-the-solution-that-fits-for-you','How to build an app and find a solution that fits each users needs','solution, app solution','PUBLISHED',0,'2018-03-25 21:12:44','2018-03-25 21:12:44'),(9,1,2,'Creating something useful','Creating something useful',NULL,'<p>It\'s not enough nowadays to create something you want, instead you\'ll need to focus on what people need. If you find a need for something that isn\'t available... You should create it. Odds are someone will find it useful as well.</p>\n<p>When you focus your energy on building something that you are passionate about it\'s going to show. Your customers will buy because it\'s a great application, but also because they believe in what you are trying to achieve. So, continue to focus on making something that people need and find useful.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>','posts/March2018/weZwLLpaXnxyTR989iDk.jpg','creating-something-useful','Find out how to Create something useful','useful, create something useful','PUBLISHED',0,'2018-03-25 21:19:37','2018-03-25 21:26:38'),(10,1,1,'Never Stop Creating','Never Stop Creating',NULL,'<p>The reason why we are the way we are is... Because we are designed for a purpose. Some people are created to help or service, and others are created to... Well... Create. Are you a creator.</p>\n<p>If you have a passion for creating new things and bringing ideas to life. You\'ll want to save yourself some time by using Wave to build the foundation. Wave has so many built-in features including Billing, User Profiles, User Settings, an API, and so much more.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/posts/March2018/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/posts/March2018/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>','posts/March2018/K804BvnOehlLao0XmI08.jpg','never-stop-creating','In this article you\'ll learn how important it is to never stop creating','creating, never stop','PUBLISHED',0,'2018-03-25 20:38:02','2018-06-28 00:44:31');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin User','2017-11-21 10:53:22','2017-11-21 10:53:22'),(2,'trial','Free Trial','2017-11-21 10:53:22','2017-11-21 10:53:22'),(3,'basic','Basic Plan','2018-07-02 23:33:21','2018-07-03 11:58:44'),(4,'pro','Pro Plan','2018-07-03 10:57:16','2018-07-03 11:58:38'),(5,'premium','Premium Plan','2018-07-03 10:58:42','2018-07-03 11:58:32'),(6,'cancelled','Cancelled User','2018-07-03 10:58:42','2018-07-03 11:58:32');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Wave','','text',1,'Site'),(2,'site.description','Site Description','The Software as a Service Starter Kit built on Laravel & Voyager','','text',2,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(6,'admin.title','Admin Title','Wave','','text',1,'Admin'),(7,'admin.description','Admin Description','Create some waves and build your next great idea','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin'),(11,'site.favicon','Favicon','',NULL,'image',6,'Site'),(12,'auth.dashboard_redirect','Homepage Redirect to Dashboard if Logged in','0',NULL,'checkbox',7,'Auth'),(13,'auth.email_or_username','Users Login with Email or Username','email','{\n\"default\" : \"email\",\n\"options\" : {\n\"email\": \"Email Address\",\n\"username\": \"Username\"\n}\n}','select_dropdown',8,'Auth'),(14,'auth.username_in_registration','Username when Registering','yes','{\n\"default\" : \"yes\",\n\"options\" : {\n\"yes\": \"Yes, Include the Username Field when Registering\",\n\"no\": \"No, Have it automatically generated\"\n}\n}','select_dropdown',9,'Auth'),(15,'auth.verify_email','Verify Email during Sign Up','0',NULL,'checkbox',10,'Auth'),(16,'billing.card_upfront','Require Credit Card Up Front','1','{\n\"on\" : \"Yes\",\n\"off\" : \"No\",\n\"checked\" : false\n}','checkbox',11,'Billing'),(17,'billing.trial_days','Trial Days when No Credit Card Up Front','-1',NULL,'text',12,'Billing');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_options`
--

DROP TABLE IF EXISTS `theme_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voyager_theme_options_theme_id_index` (`theme_id`),
  CONSTRAINT `theme_options_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_options`
--

LOCK TABLES `theme_options` WRITE;
/*!40000 ALTER TABLE `theme_options` DISABLE KEYS */;
INSERT INTO `theme_options` VALUES (17,1,'logo','','2017-11-22 11:24:46','2018-02-10 23:32:40'),(18,1,'home_headline','Welcome to Wave','2017-11-25 12:01:45','2018-08-27 18:47:41'),(19,1,'home_subheadline','Start crafting your next great idea.','2017-11-25 12:01:45','2017-11-26 01:41:47'),(20,1,'home_description','Wave will help you rapidly build a Software as a Service. Out of the box Authentication, Subscriptions, Invoices, Announcements, User Profiles, API, and so much more!','2017-11-25 12:01:45','2017-11-26 01:39:50'),(21,1,'home_cta','Signup','2017-11-25 14:32:29','2020-10-23 14:47:25'),(22,1,'home_cta_url','/register','2017-11-25 14:39:33','2017-11-26 10:42:41'),(23,1,'home_promo_image','themes/February2018/mFajn4fwpGFXzI1UsNH6.png','2017-11-25 16:06:46','2017-11-28 19:47:00'),(24,1,'footer_logo','themes/August2018/TksmVWMqp5JXUQj8C6Ct.png','2018-08-28 17:42:11','2018-08-28 17:42:11');
/*!40000 ALTER TABLE `theme_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voyager_themes_folder_unique` (`folder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Tailwind Theme','tailwind',1,'1.0','2020-08-23 02:36:45','2020-08-23 02:36:45');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',1,'pt','Post','2017-11-21 10:53:23','2017-11-21 10:53:23'),(2,'data_types','display_name_singular',2,'pt','Página','2017-11-21 10:53:23','2017-11-21 10:53:23'),(3,'data_types','display_name_singular',3,'pt','Utilizador','2017-11-21 10:53:23','2017-11-21 10:53:23'),(4,'data_types','display_name_singular',4,'pt','Categoria','2017-11-21 10:53:23','2017-11-21 10:53:23'),(5,'data_types','display_name_singular',5,'pt','Menu','2017-11-21 10:53:23','2017-11-21 10:53:23'),(6,'data_types','display_name_singular',6,'pt','Função','2017-11-21 10:53:23','2017-11-21 10:53:23'),(7,'data_types','display_name_plural',1,'pt','Posts','2017-11-21 10:53:23','2017-11-21 10:53:23'),(8,'data_types','display_name_plural',2,'pt','Páginas','2017-11-21 10:53:23','2017-11-21 10:53:23'),(9,'data_types','display_name_plural',3,'pt','Utilizadores','2017-11-21 10:53:23','2017-11-21 10:53:23'),(10,'data_types','display_name_plural',4,'pt','Categorias','2017-11-21 10:53:23','2017-11-21 10:53:23'),(11,'data_types','display_name_plural',5,'pt','Menus','2017-11-21 10:53:23','2017-11-21 10:53:23'),(12,'data_types','display_name_plural',6,'pt','Funções','2017-11-21 10:53:23','2017-11-21 10:53:23'),(13,'categories','slug',1,'pt','categoria-1','2017-11-21 10:53:23','2017-11-21 10:53:23'),(14,'categories','name',1,'pt','Categoria 1','2017-11-21 10:53:23','2017-11-21 10:53:23'),(15,'categories','slug',2,'pt','categoria-2','2017-11-21 10:53:23','2017-11-21 10:53:23'),(16,'categories','name',2,'pt','Categoria 2','2017-11-21 10:53:23','2017-11-21 10:53:23'),(17,'pages','title',1,'pt','Olá Mundo','2017-11-21 10:53:23','2017-11-21 10:53:23'),(18,'pages','slug',1,'pt','ola-mundo','2017-11-21 10:53:23','2017-11-21 10:53:23'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2017-11-21 10:53:23','2017-11-21 10:53:23'),(20,'menu_items','title',1,'pt','Painel de Controle','2017-11-21 10:53:23','2017-11-21 10:53:23'),(21,'menu_items','title',2,'pt','Media','2017-11-21 10:53:23','2017-11-21 10:53:23'),(22,'menu_items','title',3,'pt','Publicações','2017-11-21 10:53:23','2017-11-21 10:53:23'),(23,'menu_items','title',4,'pt','Utilizadores','2017-11-21 10:53:23','2017-11-21 10:53:23'),(24,'menu_items','title',5,'pt','Categorias','2017-11-21 10:53:23','2017-11-21 10:53:23'),(25,'menu_items','title',6,'pt','Páginas','2017-11-21 10:53:23','2017-11-21 10:53:23'),(26,'menu_items','title',7,'pt','Funções','2017-11-21 10:53:23','2017-11-21 10:53:23'),(27,'menu_items','title',8,'pt','Ferramentas','2017-11-21 10:53:23','2017-11-21 10:53:23'),(28,'menu_items','title',9,'pt','Menus','2017-11-21 10:53:23','2017-11-21 10:53:23'),(29,'menu_items','title',10,'pt','Base de dados','2017-11-21 10:53:23','2017-11-21 10:53:23'),(30,'menu_items','title',13,'pt','Configurações','2017-11-21 10:53:23','2017-11-21 10:53:23');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` datetime DEFAULT NULL,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Wave Admin','admin@admin.com','users/default.png',NULL,'$2y$10$WCujkwZh.xwSCviwcVd31.ScsTlvay97WWGVqzhnukEUPnhMOgTle','226ZKLzXGHSUBIXnNs8ZBOjjZghU4vX2bWVli5V2DmBoze2MyVkO9X2G1JFt',NULL,'2017-11-21 10:37:22','2022-03-21 01:52:56','admin',NULL,NULL,NULL,NULL,NULL,1),(14,3,'felix thomas','felix.thomas@yopmail.com','users/default.png',NULL,'$2y$10$QpH56TZirEspiyMdLI3XSuDmW8emCHPhatDEPSBruT30YDDSmiapy',NULL,NULL,'2022-03-21 06:21:27','2022-03-21 06:23:08','felix-thomas',NULL,NULL,NULL,NULL,NULL,1),(15,5,'felix thomas','felix.thomas1@yopmail.com','users/default.png',NULL,'$2y$10$s9WW5uTlxpZOy5hFI0PLGOFKIvS36/vuSmXcowloIrTNp9hMN5nw6',NULL,NULL,'2022-03-21 06:24:36','2022-03-21 06:24:36','felix-thomas1',NULL,NULL,NULL,NULL,NULL,1),(16,4,'felix thomas','felix.thomas2@yopmail.com','users/default.png',NULL,'$2y$10$IrCZZzHIMzhVBg7sSM59betMDg4IfRIdVNjJ/FUT0iRsCoIZcCQb.',NULL,NULL,'2022-03-21 06:26:06','2022-03-21 06:26:06','felix-thomas2',NULL,NULL,NULL,NULL,NULL,1),(17,5,'felix thomas','felix.thomas3@yopmail.com','users/default.png',NULL,'$2y$10$sBiJTiPatMRTiSa2PsuQ2OOmZPr5jo98uKgtHgBuSJDPXI5uR1xbO',NULL,NULL,'2022-03-21 08:23:31','2022-03-21 08:23:31','felix-thomas3',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wave_key_values`
--

DROP TABLE IF EXISTS `wave_key_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wave_key_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyvalue_id` int unsigned NOT NULL,
  `keyvalue_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wave_key_values_keyvalue_id_keyvalue_type_key_unique` (`keyvalue_id`,`keyvalue_type`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wave_key_values`
--

LOCK TABLES `wave_key_values` WRITE;
/*!40000 ALTER TABLE `wave_key_values` DISABLE KEYS */;
INSERT INTO `wave_key_values` VALUES (10,'text_area',1,'users','about','Hello I am the admin user. You can update this information in the edit profile section. Hope you enjoy using Wave.');
/*!40000 ALTER TABLE `wave_key_values` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 14:39:37
