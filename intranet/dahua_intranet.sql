-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dahua_intranet
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2019-05-31 19:57:15','2019-05-31 19:57:15'),(2,NULL,1,'Category 2','category-2','2019-05-31 19:57:15','2019-05-31 19:57:15'),(3,NULL,1,'Mural','mural','2019-05-31 20:59:27','2019-05-31 20:59:27');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Curso Teste #1','2 semanas','courses\\May2019\\deAcoHrNf8H3Rdo48w36.jpg','curso-teste-1','2019-06-01 01:54:51','2019-06-01 01:54:51'),(2,'Curso Teste #2','58 semanas','courses\\May2019\\poArWhfUKNXBP8dZOxfd.jpg','curso-teste-2','2019-06-01 01:55:12','2019-06-01 01:55:12');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,5,'id','number','ID',1,0,0,0,0,0,'{}',1),(30,5,'author_id','text','Author',1,0,1,1,0,1,'{}',2),(31,5,'category_id','number','Category',0,0,1,1,1,0,'{}',3),(32,5,'title','text','Title',1,1,1,1,1,1,'{}',4),(33,5,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'{}',5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,'{}',6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',0,0,1,1,1,1,'{}',9),(38,5,'meta_keywords','text_area','Meta Keywords',0,0,1,1,1,1,'{}',10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,'{}',14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,'{}',15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(61,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(62,8,'name','text','Nome do Vídeo',1,1,1,1,1,1,'{}',2),(63,8,'url','text','URL',1,0,1,1,1,1,'{}',3),(64,8,'image','image','Imagem',1,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',4),(65,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(66,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(67,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(68,9,'name','text','Nome',1,1,1,1,1,1,'{}',2),(69,9,'duration','text','Duração',1,1,1,1,1,1,'{}',4),(70,9,'image','image','Imagem',1,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',5),(71,9,'slug','text','Slug',0,0,1,1,1,1,'{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',3),(72,9,'created_at','timestamp','Criado em',0,1,1,1,0,1,'{}',6),(73,9,'updated_at','timestamp','Atualizado em',0,0,0,0,0,0,'{}',7),(74,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(75,12,'question','text','Pergunta',1,1,1,1,1,1,'{}',2),(76,12,'answer','text_area','Resposta',1,0,1,1,1,1,'{}',3),(77,12,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',4),(78,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(79,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(80,13,'name','text','Distribuidor',1,1,1,1,1,1,'{}',2),(81,13,'image','image','Imagem',1,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',3),(82,13,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',4),(83,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2019-05-29 03:28:15','2019-05-29 03:28:15'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-05-29 03:28:15','2019-05-29 03:28:15'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-05-29 03:28:15','2019-05-29 03:28:15'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2019-05-31 19:57:14','2019-05-31 19:57:14'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2019-05-31 19:57:15','2019-05-31 20:40:44'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2019-05-31 19:57:16','2019-05-31 19:57:16'),(8,'videos','videos','Video','Videos',NULL,'App\\Models\\Video',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-05-31 21:04:52','2019-05-31 21:10:55'),(9,'courses','courses','Curso','Cursos','voyager-tv','App\\Models\\Course',NULL,NULL,'Cursos ofertados pela plataforma DAHUA',1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-06-01 01:49:13','2019-06-01 01:54:21'),(12,'questions_and_answers','questions-and-answers','FAQ','FAQ','voyager-receipt','App\\Models\\QuestionsAndAnswer',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2019-06-01 15:05:23','2019-06-01 15:05:49'),(13,'distributors','distributors','Distribuidor','Distribuidores','voyager-group','App\\Models\\Distributor',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-06-01 15:23:16','2019-06-01 15:23:16');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributors`
--

DROP TABLE IF EXISTS `distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributors`
--

LOCK TABLES `distributors` WRITE;
/*!40000 ALTER TABLE `distributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2019-05-29 03:28:16','2019-05-29 03:28:16','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,9,'2019-05-29 03:28:16','2019-06-05 14:58:57','voyager.media.index',NULL),(3,1,'Usuários','','_self','voyager-people','#000000',38,2,'2019-05-29 03:28:16','2019-06-01 15:09:23','voyager.users.index','null'),(4,1,'Permissões','','_self','voyager-lock','#000000',38,1,'2019-05-29 03:28:16','2019-06-01 15:08:53','voyager.roles.index','null'),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,10,'2019-05-29 03:28:16','2019-06-05 14:58:57',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2019-05-29 03:28:16','2019-05-31 20:02:14','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2019-05-29 03:28:16','2019-05-31 20:02:14','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2019-05-29 03:28:16','2019-05-31 20:02:14','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2019-05-29 03:28:16','2019-05-31 20:02:14','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,11,'2019-05-29 03:28:16','2019-06-05 14:58:57','voyager.settings.index',NULL),(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2019-05-29 03:28:19','2019-05-31 20:02:14','voyager.hooks',NULL),(12,1,'Categorias','','_self','voyager-categories','#000000',15,2,'2019-05-31 19:57:14','2019-06-01 01:50:08','voyager.categories.index','null'),(13,1,'Artigos','','_self','voyager-news','#000000',15,1,'2019-05-31 19:57:15','2019-06-01 01:50:08','voyager.posts.index','null'),(14,1,'Páginas','','_self','voyager-file-text','#000000',15,3,'2019-05-31 19:57:16','2019-06-01 01:52:14','voyager.pages.index','null'),(15,1,'Blog','','_self','voyager-news','#000000',NULL,3,'2019-05-31 20:01:55','2019-06-01 15:08:34',NULL,''),(17,1,'Videos','','_self','voyager-video','#000000',NULL,8,'2019-05-31 21:04:52','2019-06-05 14:58:57','voyager.videos.index','null'),(18,1,'Cursos','','_self','voyager-tv',NULL,NULL,4,'2019-06-01 01:49:13','2019-06-01 15:08:34','voyager.courses.index',NULL),(19,8,'item 1','','_self',NULL,'#000000',NULL,10,'2019-06-01 03:30:57','2019-06-01 03:30:57',NULL,''),(20,8,'item 2','','_self',NULL,'#000000',NULL,11,'2019-06-01 03:31:03','2019-06-01 03:31:03',NULL,''),(21,8,'item 3','','_self',NULL,'#000000',NULL,12,'2019-06-01 03:31:09','2019-06-01 03:31:24',NULL,''),(22,8,'item 4','','_self',NULL,'#000000',NULL,13,'2019-06-01 03:31:18','2019-06-01 03:31:18',NULL,''),(23,7,'item 1','','_self',NULL,'#000000',NULL,14,'2019-06-01 03:31:49','2019-06-01 03:31:49',NULL,''),(24,7,'item 2','','_self',NULL,'#000000',NULL,15,'2019-06-01 03:31:55','2019-06-01 03:31:55',NULL,''),(25,7,'item 3','','_self',NULL,'#000000',NULL,16,'2019-06-01 03:32:01','2019-06-01 03:32:01',NULL,''),(26,7,'item 4','','_self',NULL,'#000000',NULL,17,'2019-06-01 03:32:07','2019-06-01 03:32:07',NULL,''),(27,9,'My Dahua','','_self',NULL,'#000000',NULL,18,'2019-06-01 03:38:33','2019-06-01 03:38:33',NULL,''),(28,9,'Marketing','','_self',NULL,'#000000',NULL,19,'2019-06-01 03:38:40','2019-06-01 03:38:40',NULL,''),(29,9,'Dahua Academy','','_self',NULL,'#000000',NULL,20,'2019-06-01 03:38:48','2019-06-01 03:38:48',NULL,''),(30,9,'Ferramentas','','_self',NULL,'#000000',NULL,21,'2019-06-01 03:39:01','2019-06-01 03:39:01',NULL,''),(31,9,'Registro de Projetos','','_self',NULL,'#000000',NULL,22,'2019-06-01 03:39:15','2019-06-01 03:39:15',NULL,''),(32,9,'FAQ','','_self',NULL,'#000000',NULL,23,'2019-06-01 03:39:21','2019-06-01 03:39:21',NULL,''),(33,9,'Chamados','','_self',NULL,'#000000',NULL,24,'2019-06-01 03:39:37','2019-06-01 03:40:56',NULL,''),(34,9,'RMA','','_self',NULL,'#000000',NULL,25,'2019-06-01 03:39:44','2019-06-01 03:39:44',NULL,''),(37,1,'FAQ','','_self','voyager-receipt',NULL,NULL,7,'2019-06-01 15:05:23','2019-06-05 14:58:57','voyager.questions-and-answers.index',NULL),(38,1,'Autenticação','','_self','voyager-person','#000000',NULL,2,'2019-06-01 15:08:26','2019-06-01 15:08:34',NULL,''),(39,1,'Distribuidores','','_self','voyager-group',NULL,NULL,5,'2019-06-01 15:23:17','2019-06-01 15:23:38','voyager.distributors.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-05-29 03:28:16','2019-05-29 03:28:16'),(2,'my-dahua','2019-06-01 03:18:46','2019-06-01 03:18:46'),(3,'marketing','2019-06-01 03:18:57','2019-06-01 03:18:57'),(4,'dahua-academy','2019-06-01 03:19:13','2019-06-01 03:19:13'),(5,'ferramentas','2019-06-01 03:19:19','2019-06-01 03:19:19'),(6,'registro-projetos','2019-06-01 03:19:28','2019-06-01 03:19:28'),(7,'faq','2019-06-01 03:19:34','2019-06-01 03:19:34'),(8,'rma','2019-06-01 03:19:39','2019-06-01 03:19:39'),(9,'menu-principal','2019-06-01 03:33:19','2019-06-01 03:33:19');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2016_01_01_000000_create_pages_table',2),(24,'2016_01_01_000000_create_posts_table',2),(25,'2016_02_15_204651_create_categories_table',2),(26,'2017_04_11_000000_alter_post_nullable_fields_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2019-05-31 19:57:16','2019-05-31 19:57:16');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `looking_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-05-29 03:28:16','2019-05-29 03:28:16'),(2,'browse_bread',NULL,'2019-05-29 03:28:16','2019-05-29 03:28:16'),(3,'browse_database',NULL,'2019-05-29 03:28:16','2019-05-29 03:28:16'),(4,'browse_media',NULL,'2019-05-29 03:28:17','2019-05-29 03:28:17'),(5,'browse_compass',NULL,'2019-05-29 03:28:17','2019-05-29 03:28:17'),(6,'browse_menus','menus','2019-05-29 03:28:17','2019-05-29 03:28:17'),(7,'read_menus','menus','2019-05-29 03:28:17','2019-05-29 03:28:17'),(8,'edit_menus','menus','2019-05-29 03:28:17','2019-05-29 03:28:17'),(9,'add_menus','menus','2019-05-29 03:28:17','2019-05-29 03:28:17'),(10,'delete_menus','menus','2019-05-29 03:28:17','2019-05-29 03:28:17'),(11,'browse_roles','roles','2019-05-29 03:28:17','2019-05-29 03:28:17'),(12,'read_roles','roles','2019-05-29 03:28:17','2019-05-29 03:28:17'),(13,'edit_roles','roles','2019-05-29 03:28:17','2019-05-29 03:28:17'),(14,'add_roles','roles','2019-05-29 03:28:17','2019-05-29 03:28:17'),(15,'delete_roles','roles','2019-05-29 03:28:17','2019-05-29 03:28:17'),(16,'browse_users','users','2019-05-29 03:28:17','2019-05-29 03:28:17'),(17,'read_users','users','2019-05-29 03:28:17','2019-05-29 03:28:17'),(18,'edit_users','users','2019-05-29 03:28:17','2019-05-29 03:28:17'),(19,'add_users','users','2019-05-29 03:28:17','2019-05-29 03:28:17'),(20,'delete_users','users','2019-05-29 03:28:17','2019-05-29 03:28:17'),(21,'browse_settings','settings','2019-05-29 03:28:17','2019-05-29 03:28:17'),(22,'read_settings','settings','2019-05-29 03:28:17','2019-05-29 03:28:17'),(23,'edit_settings','settings','2019-05-29 03:28:17','2019-05-29 03:28:17'),(24,'add_settings','settings','2019-05-29 03:28:18','2019-05-29 03:28:18'),(25,'delete_settings','settings','2019-05-29 03:28:18','2019-05-29 03:28:18'),(26,'browse_hooks',NULL,'2019-05-29 03:28:20','2019-05-29 03:28:20'),(27,'browse_categories','categories','2019-05-31 19:57:15','2019-05-31 19:57:15'),(28,'read_categories','categories','2019-05-31 19:57:15','2019-05-31 19:57:15'),(29,'edit_categories','categories','2019-05-31 19:57:15','2019-05-31 19:57:15'),(30,'add_categories','categories','2019-05-31 19:57:15','2019-05-31 19:57:15'),(31,'delete_categories','categories','2019-05-31 19:57:15','2019-05-31 19:57:15'),(32,'browse_posts','posts','2019-05-31 19:57:15','2019-05-31 19:57:15'),(33,'read_posts','posts','2019-05-31 19:57:15','2019-05-31 19:57:15'),(34,'edit_posts','posts','2019-05-31 19:57:15','2019-05-31 19:57:15'),(35,'add_posts','posts','2019-05-31 19:57:15','2019-05-31 19:57:15'),(36,'delete_posts','posts','2019-05-31 19:57:15','2019-05-31 19:57:15'),(37,'browse_pages','pages','2019-05-31 19:57:16','2019-05-31 19:57:16'),(38,'read_pages','pages','2019-05-31 19:57:16','2019-05-31 19:57:16'),(39,'edit_pages','pages','2019-05-31 19:57:16','2019-05-31 19:57:16'),(40,'add_pages','pages','2019-05-31 19:57:16','2019-05-31 19:57:16'),(41,'delete_pages','pages','2019-05-31 19:57:16','2019-05-31 19:57:16'),(47,'browse_videos','videos','2019-05-31 21:04:52','2019-05-31 21:04:52'),(48,'read_videos','videos','2019-05-31 21:04:52','2019-05-31 21:04:52'),(49,'edit_videos','videos','2019-05-31 21:04:52','2019-05-31 21:04:52'),(50,'add_videos','videos','2019-05-31 21:04:52','2019-05-31 21:04:52'),(51,'delete_videos','videos','2019-05-31 21:04:52','2019-05-31 21:04:52'),(52,'browse_courses','courses','2019-06-01 01:49:13','2019-06-01 01:49:13'),(53,'read_courses','courses','2019-06-01 01:49:13','2019-06-01 01:49:13'),(54,'edit_courses','courses','2019-06-01 01:49:13','2019-06-01 01:49:13'),(55,'add_courses','courses','2019-06-01 01:49:13','2019-06-01 01:49:13'),(56,'delete_courses','courses','2019-06-01 01:49:13','2019-06-01 01:49:13'),(67,'browse_questions_and_answers','questions_and_answers','2019-06-01 15:05:23','2019-06-01 15:05:23'),(68,'read_questions_and_answers','questions_and_answers','2019-06-01 15:05:23','2019-06-01 15:05:23'),(69,'edit_questions_and_answers','questions_and_answers','2019-06-01 15:05:23','2019-06-01 15:05:23'),(70,'add_questions_and_answers','questions_and_answers','2019-06-01 15:05:23','2019-06-01 15:05:23'),(71,'delete_questions_and_answers','questions_and_answers','2019-06-01 15:05:23','2019-06-01 15:05:23'),(72,'browse_distributors','distributors','2019-06-01 15:23:17','2019-06-01 15:23:17'),(73,'read_distributors','distributors','2019-06-01 15:23:17','2019-06-01 15:23:17'),(74,'edit_distributors','distributors','2019-06-01 15:23:17','2019-06-01 15:23:17'),(75,'add_distributors','distributors','2019-06-01 15:23:17','2019-06-01 15:23:17'),(76,'delete_distributors','distributors','2019-06-01 15:23:17','2019-06-01 15:23:17');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-05-31 19:57:16','2019-05-31 20:29:54'),(2,1,3,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-05-31 19:57:16','2019-05-31 20:59:56'),(3,1,1,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',1,'2019-05-31 19:57:16','2019-05-31 20:39:18'),(4,1,1,'Yarr Post Swab deadlights Buccaneer fire',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post-swab-deadlights-buccaneer-fire','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2019-05-31 19:57:16','2019-05-31 20:54:52');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_and_answers`
--

DROP TABLE IF EXISTS `questions_and_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_and_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_and_answers`
--

LOCK TABLES `questions_and_answers` WRITE;
/*!40000 ALTER TABLE `questions_and_answers` DISABLE KEYS */;
INSERT INTO `questions_and_answers` VALUES (1,'Pergunta 1','Mussum Ipsum, cacilds vidis litro abertis. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Mé faiz elementum girarzis, nisi eros vermeio. Delegadis gente finis, bibendum egestas augue arcu ut est. Paisis, filhis, espiritis santis.\r\n\r\nTodo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Si num tem leite então bota uma pinga aí cumpadi! Quem num gosta di mim que vai caçá sua turmis! Manduma pindureta quium dia nois paga.','2019-06-02 18:49:14','2019-06-02 18:49:14'),(2,'Pergunta 2','Mussum Ipsum, cacilds vidis litro abertis. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Mé faiz elementum girarzis, nisi eros vermeio. Delegadis gente finis, bibendum egestas augue arcu ut est. Paisis, filhis, espiritis santis.','2019-06-02 18:49:27','2019-06-02 18:49:27'),(3,'Pergunta 3','Mussum Ipsum, cacilds vidis litro abertis. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Si num tem leite então bota uma pinga aí cumpadi! Não sou faixa preta cumpadi, sou preto inteiris, inteiris.\r\n\r\nPra lá , depois divoltis porris, paradis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Mé faiz elementum girarzis, nisi eros vermeio. Leite de capivaris, leite de mula manquis sem cabeça.\r\n\r\nAenean aliquam molestie leo, vitae iaculis nisl. Suco de cevadiss deixa as pessoas mais interessantis. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis.','2019-06-02 18:49:39','2019-06-02 18:49:39'),(4,'Pergunta 4','Mussum Ipsum, cacilds vidis litro abertis. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Si num tem leite então bota uma pinga aí cumpadi! Não sou faixa preta cumpadi, sou preto inteiris, inteiris.\r\n\r\nPra lá , depois divoltis porris, paradis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Mé faiz elementum girarzis, nisi eros vermeio. Leite de capivaris, leite de mula manquis sem cabeça.','2019-06-02 18:49:49','2019-06-02 18:49:49');
/*!40000 ALTER TABLE `questions_and_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-05-29 03:28:16','2019-05-29 03:28:16'),(2,'user','Normal User','2019-05-29 03:28:16','2019-05-29 03:28:16'),(3,'partner','Parceiro','2019-06-05 15:34:43','2019-06-05 15:34:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Intranet Dahua','','text',1,'Site'),(2,'site.description','Site Description','Intranet Dahua','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Intranet Dahua','','text',1,'Admin'),(7,'admin.description','Admin Description','Intranet Dahua','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(12,'site.facebook','Facebook','',NULL,'text',6,'Site'),(13,'site.youtube','youtube','',NULL,'text',7,'Site'),(14,'site.instagram','Instagram','',NULL,'text',8,'Site'),(15,'site.twitter','Twitter','',NULL,'text',9,'Site'),(16,'site.linkedin','Linkedin','',NULL,'text',10,'Site'),(17,'site.cellphone','Celular','',NULL,'text',11,'Site'),(18,'site.phone','Telefone Fixo','',NULL,'text',12,'Site'),(19,'site.email','Email','',NULL,'text',13,'Site');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
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
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2019-05-31 19:57:16','2019-05-31 19:57:16'),(2,'data_types','display_name_singular',6,'pt','Página','2019-05-31 19:57:16','2019-05-31 19:57:16'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2019-05-31 19:57:16','2019-05-31 19:57:16'),(4,'data_types','display_name_singular',4,'pt','Categoria','2019-05-31 19:57:16','2019-05-31 19:57:16'),(5,'data_types','display_name_singular',2,'pt','Menu','2019-05-31 19:57:16','2019-05-31 19:57:16'),(6,'data_types','display_name_singular',3,'pt','Função','2019-05-31 19:57:16','2019-05-31 19:57:16'),(7,'data_types','display_name_plural',5,'pt','Posts','2019-05-31 19:57:16','2019-05-31 19:57:16'),(8,'data_types','display_name_plural',6,'pt','Páginas','2019-05-31 19:57:16','2019-05-31 19:57:16'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2019-05-31 19:57:17','2019-05-31 19:57:17'),(10,'data_types','display_name_plural',4,'pt','Categorias','2019-05-31 19:57:17','2019-05-31 19:57:17'),(11,'data_types','display_name_plural',2,'pt','Menus','2019-05-31 19:57:17','2019-05-31 19:57:17'),(12,'data_types','display_name_plural',3,'pt','Funções','2019-05-31 19:57:17','2019-05-31 19:57:17'),(13,'categories','slug',1,'pt','categoria-1','2019-05-31 19:57:17','2019-05-31 19:57:17'),(14,'categories','name',1,'pt','Categoria 1','2019-05-31 19:57:17','2019-05-31 19:57:17'),(15,'categories','slug',2,'pt','categoria-2','2019-05-31 19:57:17','2019-05-31 19:57:17'),(16,'categories','name',2,'pt','Categoria 2','2019-05-31 19:57:17','2019-05-31 19:57:17'),(17,'pages','title',1,'pt','Olá Mundo','2019-05-31 19:57:17','2019-05-31 19:57:17'),(18,'pages','slug',1,'pt','ola-mundo','2019-05-31 19:57:17','2019-05-31 19:57:17'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2019-05-31 19:57:17','2019-05-31 19:57:17'),(20,'menu_items','title',1,'pt','Painel de Controle','2019-05-31 19:57:17','2019-05-31 19:57:17'),(21,'menu_items','title',2,'pt','Media','2019-05-31 19:57:17','2019-05-31 19:57:17'),(22,'menu_items','title',13,'pt','Publicações','2019-05-31 19:57:17','2019-05-31 19:57:17'),(23,'menu_items','title',3,'pt','Utilizadores','2019-05-31 19:57:17','2019-05-31 19:57:17'),(24,'menu_items','title',12,'pt','Categorias','2019-05-31 19:57:17','2019-05-31 19:57:17'),(25,'menu_items','title',14,'pt','Páginas','2019-05-31 19:57:17','2019-05-31 19:57:17'),(26,'menu_items','title',4,'pt','Funções','2019-05-31 19:57:17','2019-05-31 19:57:17'),(27,'menu_items','title',5,'pt','Ferramentas','2019-05-31 19:57:17','2019-05-31 19:57:17'),(28,'menu_items','title',6,'pt','Menus','2019-05-31 19:57:17','2019-05-31 19:57:17'),(29,'menu_items','title',7,'pt','Base de dados','2019-05-31 19:57:17','2019-05-31 19:57:17'),(30,'menu_items','title',10,'pt','Configurações','2019-05-31 19:57:17','2019-05-31 19:57:17');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Administrador','admin@admin.com','users/default.png',NULL,'$2y$10$Un0de0xzasayNaQ84GhQuemQJnTIKBaMKguBGAd7EtPaX4CpKPqoK',NULL,NULL,'2019-05-29 03:30:06','2019-05-29 03:30:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'Teste Dummy Video 1','https://www.youtube.com/watch?v=sVnfv3-SeuU','videos\\May2019\\ACfiiu3rLSOBo79YHKTb.jpg','2019-05-31 21:11:24','2019-05-31 21:11:24'),(2,'Dummy Video Test 2','https://www.youtube.com/watch?v=sVnfv3-SeuU','videos\\May2019\\saUtP46K4zkMGviwXBaQ.jpg','2019-05-31 21:11:39','2019-05-31 21:11:39'),(3,'Dummy Video Test 3','https://www.youtube.com/watch?v=sVnfv3-SeuU','videos\\May2019\\6X6nay6Q4r8p920pNgqm.jpg','2019-05-31 21:11:53','2019-05-31 21:11:53');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-05 22:09:24
