-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: laravel_movie
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `cast_movie`
--

DROP TABLE IF EXISTS `cast_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast_movie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cast_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cast_movie_cast_id_foreign` (`cast_id`),
  KEY `cast_movie_movie_id_foreign` (`movie_id`),
  CONSTRAINT `cast_movie_cast_id_foreign` FOREIGN KEY (`cast_id`) REFERENCES `casts` (`id`),
  CONSTRAINT `cast_movie_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_movie`
--

LOCK TABLES `cast_movie` WRITE;
/*!40000 ALTER TABLE `cast_movie` DISABLE KEYS */;
INSERT INTO `cast_movie` VALUES (6,31,7),(7,32,7),(8,33,7),(9,34,7),(10,35,7),(11,36,7),(12,37,7),(13,38,7),(14,39,7),(15,40,7),(16,41,10),(17,42,10),(18,43,10),(19,44,10),(20,45,10),(21,46,10),(22,47,10),(23,48,10),(24,49,10),(25,50,10),(26,51,8),(27,52,8),(28,53,8),(29,54,8),(30,55,8),(31,56,8),(32,57,8),(33,58,8),(34,59,8),(35,60,8),(36,61,21),(37,62,21),(38,63,11),(39,64,11),(40,64,22),(41,65,23),(42,65,3);
/*!40000 ALTER TABLE `cast_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casts`
--

DROP TABLE IF EXISTS `casts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casts_tmdb_id_unique` (`tmdb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casts`
--

LOCK TABLES `casts` WRITE;
/*!40000 ALTER TABLE `casts` DISABLE KEYS */;
INSERT INTO `casts` VALUES (1,1,'George Lucas','george-lucas','/WCSZzWdtPmdRxH9LUCVi2JPCSJ.jpg','2024-03-06 02:17:17','2024-03-06 02:17:17'),(2,2,'Mark Hamill','mark-hamill','/2ZulC2Ccq1yv3pemusks6Zlfy2s.jpg','2024-03-06 02:17:22','2024-03-06 02:17:22'),(3,3,'Harrison Ford','harrison-ford','/zVnHagUvXkR2StdOtquEwsiwSVt.jpg','2024-03-06 02:17:28','2024-03-06 02:17:28'),(4,4,'Carrie Fisher','carrie-fisher','/d60ZwPUoizvw1gdU6dXvKUOeoDK.jpg','2024-03-06 02:17:35','2024-03-06 02:17:35'),(5,5,'Peter Cushing','peter-cushing','/if5g03wn6uvHx7F6FxXHLebKc0q.jpg','2024-03-06 02:17:43','2024-03-06 02:17:43'),(6,6,'Anthony Daniels','anthony-daniels','/c876ZM5ObwYgXksrRWNNrL9KeZg.jpg','2024-03-06 02:17:46','2024-03-06 02:17:46'),(7,7,'Andrew Stanton','andrew-stanton','/tRwWuo06aN9vuXAPaswMN42x2ii.jpg','2024-03-06 02:17:52','2024-03-06 02:17:52'),(8,8,'Lee Unkrich','lee-unkrich','/crb297utC6W4HSstOe5djDPTwEN.jpg','2024-03-06 02:18:02','2024-03-06 02:18:02'),(9,9,'Graham Walters','graham-walters','/rmFFUsCJBjtl2xgsED6hODix9cy.jpg','2024-03-06 02:18:16','2024-03-06 02:18:16'),(10,10,'Bob Peterson','bob-peterson','/dJe3nTCIToebjj1WHFHP7LmZKyk.jpg','2024-03-06 02:18:21','2024-03-06 02:18:21'),(11,12,'Alexander Gould','alexander-gould','/fe4mUSp0XotA6Ku4Bs69Q9o2lqU.jpg','2024-03-06 02:35:37','2024-03-06 02:35:37'),(12,13,'Albert Brooks','albert-brooks','/8iDSGu5l93N7benjf6b3AysBore.jpg','2024-03-06 02:35:49','2024-03-06 02:35:49'),(13,14,'Ellen DeGeneres','ellen-degeneres','/z8IEEid4z63CBlJtxrTKEfsW7NA.jpg','2024-03-06 02:36:05','2024-03-06 02:36:05'),(14,20,'Elizabeth Perkins','elizabeth-perkins','/vTWYllD9V76rgv9XAbtkkjjeunG.jpg','2024-03-06 02:36:51','2024-03-06 02:36:51'),(15,19,'Allison Janney','allison-janney','/hpBKWV1jjoXQbr1s0iUZTSvw582.jpg','2024-03-06 02:36:58','2024-03-06 02:36:58'),(16,18,'Brad Garrett','brad-garrett','/813ffbpoaoaJRdoe1yrbivboWKp.jpg','2024-03-06 02:37:03','2024-03-06 02:37:03'),(17,22,'Barry Humphries','barry-humphries','/gtOAbs8ZFJiDDRPPock1qmP4V18.jpg','2024-03-06 02:37:28','2024-03-06 02:37:28'),(18,23,'Bill Hunter','bill-hunter','/gvrRsTfx47KupgRwTKp0gqryHPe.jpg','2024-03-06 02:37:35','2024-03-06 02:37:35'),(19,24,'Robert Zemeckis','robert-zemeckis','/lPYDQ5LYNJ12rJZENtyASmVZ1Ql.jpg','2024-03-06 02:37:42','2024-03-06 02:37:42'),(20,26,'Winston Groom','winston-groom','/d5SooICKys7VofhLcBHi5LjGe63.jpg','2024-03-06 02:37:53','2024-03-06 02:37:53'),(21,27,'Eric Roth','eric-roth','/p61cF5pqC6cH6CgXQUuBpW6P2qa.jpg','2024-03-06 02:37:59','2024-03-06 02:37:59'),(22,29,'Steve Tisch','steve-tisch','/1qXa4o8gSQqxXSRp0X0lvRM018O.jpg','2024-03-06 02:38:14','2024-03-06 02:38:14'),(23,30,'Steve Starkey','steve-starkey','/8YCSIPhLZ6HHbbypEFZY05B7l16.jpg','2024-03-06 02:38:20','2024-03-06 02:38:20'),(24,31,'Tom Hanks','tom-hanks','/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg','2024-03-06 02:38:33','2024-03-06 02:38:33'),(25,32,'Robin Wright','robin-wright','/3IvlZd2PpT3Tuxy8lr6ymWLyoNU.jpg','2024-03-06 02:38:37','2024-03-06 02:38:37'),(26,33,'Gary Sinise','gary-sinise','/ngYV91xYfCu0JNcSxJ4yQ7tzOna.jpg','2024-03-06 02:38:44','2024-03-06 02:38:44'),(27,34,'Mykelti Williamson','mykelti-williamson','/e5f7XCZAUEQ55rVhdphqzdMMI8b.jpg','2024-03-06 02:38:54','2024-03-06 02:38:54'),(28,35,'Sally Field','sally-field','/5fBK36MdmdwQQMuP0W70rXADXih.jpg','2024-03-06 02:38:58','2024-03-06 02:38:58'),(29,36,'Don Burgess','don-burgess','/aIB6XjNFDWxRpB2l5GKXWEzMI4O.jpg','2024-03-06 02:39:08','2024-03-06 02:39:08'),(30,37,'Alan Silvestri','alan-silvestri','/pQOAsQDuYMR4cKaPAP0wkRlCSNo.jpg','2024-03-06 02:39:16','2024-03-06 02:39:16'),(31,70851,'Jack Black','jack-black','/rtCx0fiYxJVhzXXdwZE2XRTfIKE.jpg','2024-03-07 01:16:03','2024-03-07 01:16:03'),(32,1625558,'Awkwafina','awkwafina','/l5AKkg3H1QhMuXmTTmq1EyjyiRb.jpg','2024-03-07 01:27:56','2024-03-07 01:27:56'),(33,4483,'Dustin Hoffman','dustin-hoffman','/yFjTzJHE6AFbwQifOlnNDzmiwlq.jpg','2024-03-12 20:19:36','2024-03-12 20:19:36'),(34,17419,'Bryan Cranston','bryan-cranston','/7Jahy5LZX2Fo8fGJltMreAI49hC.jpg','2024-03-12 20:21:02','2024-03-12 20:21:02'),(35,19492,'Viola Davis','viola-davis','/xDssw6vpYNRjsybvMPRE30e0dPN.jpg','2024-03-12 20:22:38','2024-03-12 20:22:38'),(36,20904,'James Hong','james-hong','/v3lfw5aHOy0paOCx6WHiSnwzbH0.jpg','2024-03-12 20:23:25','2024-03-12 20:23:25'),(37,6972,'Ian McShane','ian-mcshane','/rteBJYNgD1yGsHg2HGZAIrYHz1t.jpg','2024-03-12 20:24:37','2024-03-12 20:24:37'),(38,690,'Ke Huy Quan','ke-huy-quan','/5PfYVcNLs1gGKIo0qwJrvyc2UOZ.jpg','2024-03-12 20:26:04','2024-03-12 20:26:04'),(39,1319469,'Ronny Chieng','ronny-chieng','/nn1y0te102CvakOJ0rSJ7rYPLDF.jpg','2024-03-12 20:27:44','2024-03-12 20:27:44'),(40,18864,'Tom McGrath','tom-mcgrath','/83lSBvaRShYObPvhE89UDUkUfWo.jpg','2024-03-12 20:33:29','2024-03-12 20:33:29'),(41,1755712,'Jefri Nichol','jefri-nichol','/pGr8iSj0Vz5iix7Oknnf4Acu0kJ.jpg','2024-03-12 21:21:53','2024-03-12 21:21:53'),(42,1592066,'Amanda Rawles','amanda-rawles','/7Q6A2CbhkJeSE9qqi80o932VorL.jpg','2024-03-12 21:26:56','2024-03-12 21:26:56'),(43,1028461,'Hannah Al Rashid','hannah-al-rashid','/9dhmyPwVwqnzIJiiS3QIGRcPRH1.jpg','2024-03-12 21:28:33','2024-03-12 21:28:33'),(44,1206436,'Lukman Sardi','lukman-sardi','/pMZiVVu8k5MzGteRgpNVzMybxLm.jpg','2024-03-12 21:29:47','2024-03-12 21:29:47'),(45,1965179,'Gabriella Quinlyn','gabriella-quinlyn','/crasbJX9WCiYqUuEk3O73ZOdVAo.jpg','2024-03-12 21:31:05','2024-03-12 21:31:05'),(46,1297503,'Wulan Guritno','wulan-guritno','/7cZfmpz4tQmvK0R87I3KODMp3f0.jpg','2024-03-12 21:32:06','2024-03-12 21:32:06'),(47,2205990,'Augie Fantinus','augie-fantinus','/ncv2BNWnhjBkEhe6VI8C5X4vCwd.jpg','2024-03-12 21:33:48','2024-03-12 21:33:48'),(48,1158147,'Butet Kertaradjasa','butet-kertaradjasa','/yfdWwoUIn3I0CkxvMEfMaQjpfxB.jpg','2024-03-12 21:34:56','2024-03-12 21:34:56'),(49,1571463,'Egy Fedly','egy-fedly','/kGlLAf9HnrySKR6MP4vasbUtgth.jpg','2024-03-12 21:35:49','2024-03-12 21:35:49'),(50,2057255,'Willem Bevers','willem-bevers','/5TnaOOqNc5KEoIUbQZ83qDwkNYZ.jpg','2024-03-12 21:42:26','2024-03-12 21:42:26'),(51,1136406,'Tom Holland','tom-holland','/yxYOaalFh8SUwNE5C0wzOwF89Ny.jpg','2024-03-12 21:45:01','2024-03-12 21:45:01'),(52,505710,'Zendaya','zendaya','/tylFh0K48CZIIhvKlA7WA1XBAtE.jpg','2024-03-12 21:46:07','2024-03-12 21:46:07'),(53,71580,'Benedict Cumberbatch','benedict-cumberbatch','/fBEucxECxGLKVHBznO0qHtCGiMO.jpg','2024-03-12 21:47:03','2024-03-12 21:47:03'),(54,1649152,'Jacob Batalon','jacob-batalon','/53YhaL4xw4Sb1ssoHkeSSBaO29c.jpg','2024-03-12 21:47:44','2024-03-12 21:47:44'),(55,15277,'Jon Favreau','jon-favreau','/tnx7iMVydPQXGOoLsxXl84PXtbA.jpg','2024-03-12 21:49:02','2024-03-12 21:49:02'),(56,134,'Jamie Foxx','jamie-foxx','/hPwCMEq6jLAidsXAX5BfoYgIfg2.jpg','2024-03-12 21:50:09','2024-03-12 21:50:09'),(57,5293,'Willem Dafoe','willem-dafoe','/ui8e4sgZAwMPi3hzEO53jyBJF9B.jpg','2024-03-12 21:50:49','2024-03-12 21:50:49'),(58,658,'Alfred Molina','alfred-molina','/nJo91Czesn6z0d0pkfbDoVZY3sg.jpg','2024-03-12 21:51:14','2024-03-12 21:51:14'),(59,30082,'Benedict Wong','benedict-wong','/yYfLyrC2CE6vBWSJfkpuVKL2POM.jpg','2024-03-12 21:51:31','2024-03-12 21:51:31'),(60,1291350,'Tony Revolori','tony-revolori','/tSF6XmXDikrKZbFUeoDnafXxKjT.jpg','2024-03-12 21:54:50','2024-03-12 21:54:50'),(61,40,'Orson Welles','orson-welles','/e9lGmqQq3EsHeUQgQLByo275hcc.jpg','2024-03-13 21:00:39','2024-03-13 21:00:39'),(62,7664,'Joseph Cotten','joseph-cotten','/djfCB0jPOgmq3w7RD3BMLzWsAu8.jpg','2024-03-13 21:01:39','2024-03-13 21:01:39'),(63,143346,'Keith Ferguson','keith-ferguson','/mR1ClwyFWtdkArXNTx1ij7FHBzm.jpg','2024-03-13 21:03:29','2024-03-13 21:03:29'),(64,228121,'Laura Post','laura-post','/q95vgGRfaweU7ro1O4VA7KR11RY.jpg','2024-03-13 21:05:45','2024-03-13 21:05:45'),(65,18897,'Jackie Chan','jackie-chan','/nraZoTzwJQPHspAVsKfgl3RXKKa.jpg','2024-03-17 19:14:46','2024-03-17 19:14:46');
/*!40000 ALTER TABLE `casts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` bigint NOT NULL,
  `season_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode_number` int NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `visits` bigint NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `episodes_tmdb_id_unique` (`tmdb_id`),
  KEY `episodes_season_id_foreign` (`season_id`),
  CONSTRAINT `episodes_season_id_foreign` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,1130602,1,'In the Beginning',1,1,1,'in-the-beginning','-','2024-03-06 02:43:30','2024-03-06 02:43:37'),(2,1130601,1,'No Stone Unturned',2,1,1,'no-stone-unturned','-','2024-03-06 02:43:45','2024-03-06 02:43:52'),(3,1130603,1,'A Flying Visit',3,1,1,'a-flying-visit','-','2024-03-06 02:44:13','2024-03-06 02:44:21'),(4,1130605,1,'The Crunch',4,1,1,'the-crunch','-','2024-03-06 02:44:29','2024-03-06 02:44:36'),(5,1130604,1,'An Eye for an Eye',5,1,1,'an-eye-for-an-eye','-','2024-03-06 02:44:41','2024-03-06 02:44:48'),(6,1130606,1,'Exodus',6,1,1,'exodus','-','2024-03-06 02:44:53','2024-03-06 02:45:06'),(7,1130612,2,'Home from Home',1,1,1,'home-from-home','-','2024-03-06 02:45:50','2024-03-06 02:45:57'),(8,1130609,2,'Manna from Heaven',2,1,1,'manna-from-heaven','-','2024-03-06 02:46:08','2024-03-06 02:46:13'),(9,1130611,2,'I Dreamt I Dwelt in Parish Halls',3,1,1,'i-dreamt-i-dwelt-in-parish-halls','-','2024-03-06 02:46:19','2024-03-06 02:46:27'),(10,1130610,2,'Babes and Sucklings',4,1,1,'babes-and-sucklings','-','2024-03-06 02:46:48','2024-03-06 02:46:56'),(11,1130607,2,'The Patience of Job',5,1,1,'the-patience-of-job','-','2024-03-06 02:47:03','2024-03-06 02:47:11'),(12,1130608,2,'Like Father Like Son',6,1,1,'like-father-like-son','-','2024-03-06 02:47:20','2024-03-06 02:47:27'),(13,1130597,3,'Where My Caravan Has Rested',1,1,1,'where-my-caravan-has-rested','-','2024-03-06 02:47:47','2024-03-06 02:47:55'),(14,1130598,3,'And He Fell Among Thieves',2,1,1,'and-he-fell-among-thieves','-','2024-03-06 02:48:02','2024-03-06 02:48:10'),(15,1130599,3,'The Prodigal Son',3,1,1,'the-prodigal-son','-','2024-03-06 02:48:25','2024-03-06 02:48:33'),(16,1130600,3,'The Spirit Is Willing',4,1,1,'the-spirit-is-willing','-','2024-03-06 02:48:39','2024-03-06 02:48:47'),(17,1130595,3,'Behold a Pale Rider',5,1,1,'behold-a-pale-rider','-','2024-03-06 02:48:53','2024-03-06 02:48:59'),(18,1130596,3,'False Profits',6,1,1,'false-profits','-','2024-03-06 02:49:05','2024-03-06 02:49:13'),(19,1130559,4,'Out of the Hive',1,1,1,'out-of-the-hive','Ros and Beckett first meet, after Beckett is forced to levae the Hive when he is framed for teling information from them. the real traitor turns out to be beckett\'s boss, Cottrell, working alongside his lover, Elena Johnson. The pair are trying to steal SACROS, a device which jams satellite signals. Beckett, Ros and Ed race against time to save beckett\'s job and SACROs, and stop Cottrell and Elena.','2024-03-06 02:49:58','2024-03-06 02:50:03'),(20,1130558,4,'Assassins Inc',2,1,1,'assassins-inc','Ros, Ed and Beckett\'s first customer appears in the form of Irene Campell, who turns out to have conned Beckett into helping her continue doing her business. Roland Blatty, a friend of Ros\' who own the new Bureau of Weapons is trying to put a stop to the devices Irene sells, which have killed countless people. The team race against time to stop Irene and her legal adviser, Morasco and at the same time save Ed from a microbe that is killing him.','2024-03-06 02:50:26','2024-03-06 02:50:33'),(21,1130556,4,'All Under Control',3,1,1,'all-under-control','Ros, Ed and Beckett are called in to investigate the mysterious plane that went â€˜out of control\' for a while. However, while Ros is checking out the aeroplane, it suddenly decides to take off!!! Ros is left in the plane and it takes off, and Ed and Beckett discover that there is a man behind it all, controlling the plane like a remote control one. Ros starts to panic as the fuel gradually gets lower and lower, and Ed goes to find the man behind it, telling Ros that she might have to land the plane herself.','2024-03-06 02:50:38','2024-03-06 02:50:43'),(22,1130555,4,'Down Among the Dead Men',4,1,1,'down-among-the-dead-men','Ed and Beckett go \'under cover\' and end up on board a submarine. They are, however, found out to be fakes and, whilst Ed escapes, Beckett is left on the submarine with a money hungry man, eager to gain access to a bank and steal some diamonds a long the way. Beckett ends up getting trapped on the submarine, as it slowly fills with water. The man, meanwhile, has got his associate to steal these diamonds, but their plan is foiled when Ros enters the scene. Ed goes under the sea to search for the submarine and but will he find Beckett in time?','2024-03-06 02:50:53','2024-03-06 02:50:59'),(23,1130560,4,'Shotgun Wedding',5,1,1,'shotgun-wedding','Ros, Ed and Beckett are called in to protect Anna Fabrizi, a visiting Italian politician who has vowed to fight political corruption in her country. Ed takes on the role of the man hired to kill Anna and he finds himself in a situation where he has to decide between Anna\'s life and his own...','2024-03-06 02:51:13','2024-03-06 02:51:18'),(24,1130554,4,'Stealth',6,1,1,'stealth','An attempt to steal a revolutionary new car with an advanced  guidance system is foiled by the Bugs team. The thieves then turn their attention to a millitary vehicle powered by a radioactive RTG, and Ros and Beckett have to cliumb onto the moving driverless vehicle, to stop  the explosion from breaking the radioactive container and killing off most of the people in the country.','2024-03-06 02:51:25','2024-03-06 02:51:33'),(25,1130561,4,'Manna From Heaven',7,1,1,'manna-from-heaven','A new type of food called Phodex has been created and it is made from some sort of algae. Ros, Ed and Beckett are called to investigate about this stuff, and Ros ends up getting trapped in some room, with the oxygen levels slowly decreasing. However, Ed and Beckett realise all is not right when the creator of Phodex tells them that Ros has gone to the hairdressers. They find her just in time and she is OK. However, a short while later, the team find out the secret of Phodex, that it is toxic when exposed to ultra violet light, and Ros ends up eating some contaminated Phodex, and starts to die. There is soon a race against time for Ed and Beckett to save Ros and the other people who have eaten the toxic Phodex, and Ros\' condition gradually begins to deteriorate, as her vision goes blurred and she keeps collapsing. However, she manages to save the day, by finding out what the code is to the place that has the antidote. She has to read an electronic organiser, but will she get the passwor','2024-03-06 02:51:38','2024-03-06 02:51:43'),(26,1130557,4,'Hot Metal',8,1,1,'hot-metal','R-6 is a new type of metal, and it has an explosive nature. A man called DaSilva decides to take advantage of this property of the metal and tries to steal it. The Bugs team are involved and try to stop DaSilva leaving the country with the metal to make it into deadly weapons.','2024-03-06 02:52:50','2024-03-06 02:53:00'),(27,1130553,4,'A Sporting Chance',9,1,1,'a-sporting-chance','A special formula has been developed which enhances the performance of athletes. However, no-one has considered the after effects, which are that when the person\'s heart reaches a certain rate, the body can\'t cope and the person drops down dead. Ed comes to realise this when he is having a karate match with a person who has been injected with the stuff, and the man goes hyper, then falls down dead (whoops!). Ros eventually goes to find out more about the stuff, and ends up with another hyper person chasing her, then he suddenly collapses. however, Ros is still caught and taken away by the developer of the formula, to be his new guinea-pig.','2024-03-06 02:53:20','2024-03-06 02:53:28'),(28,1130562,4,'Pulse',10,1,1,'pulse','Many small companies are being bought up by two mysterious men and Ros, Ed and Beckett are called to investigate. When the manager in another company is suddenly blown up, Beckett takes his place. The two suspicious people turn out to be Jean-Daniel and his brother, Patrick. They realise that Beckett is not the real manager and Jean-Daniel goes round to â€˜Gizmos\' (the place where Ros, Ed and Beckett were based in Series One)  Beckett ends up being kidnapped. Ed\'s friend, Clare, has also got mixed up in the brothers\' plans, and her daughter, Katie, has been held hostage until she gives them exactly what they want. Jean-Daniel\'s brother is killed. Beckett and Katie manage to escape and stop Jean-Daniel\'s plans, and reposition the missile that stops any type of computer generated items from working, to where they are.','2024-03-06 02:53:36','2024-03-06 02:53:44'),(29,1130587,5,'What Goes Up... (1)',1,1,1,'what-goes-up-1','Ed is put into training to go up in a space shuttle, mainly to find out who is trying to stop the launch of it, and not to actually go up in it. But, of course, he ends up having to go up with another woman pilot. However, the â€˜baddie\' trying to stop the launch makes the shuttle \'breakdown\' (so to speak) and they end up getting â€˜stuck in space.....\'','2024-03-06 02:54:06','2024-03-06 02:54:18'),(30,1130586,5,'... Must Come Down (2)',2,1,1,'must-come-down-2','Concluding Part from last week!  Ed is put into training to go up in a space shuttle, mainly to find out who is trying to stop the launch of it, and not to actually go up in it. But, of course, he ends up having to go up with another woman pilot. However, the \'baddie\' trying to stop the launch makes the shuttle \'breakdown\' (so to speak) and they end up getting \'stuck in space.....\'','2024-03-06 02:54:27','2024-03-06 02:54:34'),(31,1130589,5,'Bugged Wheat',3,1,1,'bugged-wheat','A special sort of wheat, being developed so that it is resistant to all known crop diseases is destroyed by intruders breaking into the European Agronomy Council and spray a viroid over the crop. Beckett goes undercover as a sceintist to invesitigate the viroid and dicovers that the plan is to spray the viroid over crops in the world and then deliver a special anti-viroid, which will save the world from starvation and make the makers of the anti-viroid very rich. Ros, however, has problems of her own, when her car is infested with killer wasps and the brakes won\'t work, and she can\'t open the doors...','2024-03-06 02:54:41','2024-03-06 02:54:47'),(32,1130588,5,'Whirling Dervish',4,1,1,'whirling-dervish','The Bugs team are called in to prevent a cartel of the world airlines from sabotaging Strate Air, a successful new airline. Hector Jerome, the airline cartel\'s main agent, becomes a target for the Bugs team and they discover he is in possession of a deadly new fighter plane- the Dervish. The Bugs team fight to stop them from shooting down Strate Air planes out of the sky, with Ed in the position to either shoot the plane down or die.','2024-03-06 02:55:01','2024-03-06 02:55:08'),(33,1130585,5,'Blackout',5,1,1,'blackout','A woman called Pascal holds a building full of people hostage, claiming to be comcerned about the enivornment. However, her intensions are found out to be not that caring, as she plans to steal a lot of money and also the isotope triggers, which would cause a big explosion. the Bugs team fight to get back the triggers and stop Pascal\'s lover driving off with a fortune stolen from a bank','2024-03-06 02:55:15','2024-03-06 02:55:23'),(34,1130592,5,'Gold Rush',6,1,1,'gold-rush','A room full of gold is infected with a new sort of virus that quite literally eats gold. It is up to Ros to make an antidote to return the gold to normal, and she doesn\'t have long- after some time, and once the gold has reached a certain temperature, it will be irreversible and the gold will be lost forever. Ed is trapped in the room with the gold and also two security things that continuously try to shoot him. Beckett decides to get Ed out of the room, as the antidote Ros creates is harmful to humans, but his only way to get to it is by going through a tunnel filled with toxic fumes.','2024-03-06 02:55:30','2024-03-06 02:55:35'),(35,1130591,5,'Schrodinger\'s Bomb',7,1,1,'schrodingers-bomb','Cassandra and â€˜Daddy\' strike a deal with Jean-Daniel and Ros ends up getting kidnapped by him. Roland Blatty has a â€˜brush with death\' when he is left in a room filled with lots of ticking bombs. Ed and Beckett go to save Ros, and end up having to use a chain saw to free her as she was handcuffed to a steering wheel, and inside the car there was a hand grenade. Beckett spends the final scene, sawing the steering wheel, to free Ros\' wrists, and Jean- Daniel returns to the Bactrian Kings tombs to retrieve the Niobian 5 that was left there.','2024-03-06 02:55:43','2024-03-06 02:55:51'),(36,1130590,5,'Newton\'s Run',8,1,1,'newtons-run','Newton the dog is the new creation of a scientific lab. Newton is â€˜a robot dog\' who is just like any other dog, except that when a special controller is turned on, he is controlled by it. A group of â€˜bad guys\' want to use this technology, as they can use Newton to get to places they can\'t. Beckett decides to look after Newton and take him on a little ride on a train. Little does he know that the baddies are hot on his trail and he ends up losing Newton. The baddies find Newton and give him a little bomb, sending into a building that contains many different types of weapons that are for use in WW3. The team find this out and Beckett goes to find Newton.','2024-03-06 02:55:58','2024-03-06 02:56:04'),(37,1130593,5,'The Bureau of Weapons (1)',9,1,1,'the-bureau-of-weapons-1','A deadly powerful creature called Cyberax has escaped from a computer and then suddenly Cyberax the company is born, by no other than Jean-Daniel. He creates a machine that takes over some of the user\'s mind. Once they have finnished using the Cyberax headset, it leaves a little bit of itself behind. when the person finds out about Cyberax again, as they forget all memories to do with Cyberax, their brains go into overload and they kill themselves. Roland Blatty (the old bureau chief) gets hold of one of these headsets and blows his brain up when Ed jokingly says that he hopes that Roland has had the system checked for viruses. The whole Bureau team are also wiped out when they too discover the deadly truth about Cyberax. Beckett decides that the only way to stop this is to pretend that he has used the headset and had his brain blown up (so to speak) and he is taken away by Cassandra, who is now working with Jean-Daniel. Jean-Daniel realises that Beckett wouldn\'t do something so stupid','2024-03-06 02:56:10','2024-03-06 02:56:25'),(38,1130594,5,'A Cage for Satan (2)',10,1,1,'a-cage-for-satan-2','Another second parter to end the Series. Cyberax\'s destructive nature has entered Ros\' brain and Beckett  and Ed find themselves racing against time (and the fact that if Ros finds out about the true nature of Cyberax, her mind will explode) to save her. Beckett â€˜foils\' Jean-Daniel\'s plans, but in the process accidentally tells Ros the truth about Cyberax, and Ed  has to kill her, electrocuting her. The reason being that â€˜because Cyberax is a virus in the memory, you have to shut down the system and reboot with a completely new set of instructions\'- (as said by Ed).','2024-03-06 02:56:32','2024-03-06 02:56:39'),(39,1130576,6,'Blaze of Glory',1,1,1,'blaze-of-glory','First of a two parter to start off Series 3. A man called Mc-hage\'s business is desperately trying to be sabotaged, and he calls in Ros, Ed and Beckett to investigate. It turns out that just recently, Mc-Hage\'s son, Christopher, committed suicide and Ed goes to see Mc-Hage\'s daughter, Kitty Mc-Hage, to find out more about the business. Kitty decides to blow up half of London, using a chemical weapon that is under the â€˜family\' business. Beckett goes to The Bureau of Weapons Technology (the place where Roland used to work), where he meets Jan and Alex. Jan manages to con him into working at the Bureau, because of his financial problems and the fact that she catches him and Alex looking at Code: Red files. The team manage to stop the chemical weapon going off, just in time, but Ed realises that there is another bomb in the â€˜Battle wagon\' (an invention of Kitty\'s). Ed ends up getting blown up with the â€˜wagon\'','2024-03-06 02:57:46','2024-03-06 02:57:59'),(40,1130575,6,'The Revenge Effect',2,1,1,'the-revenge-effect','The second part, where Ed is still in hospital and feeling a bit depressed at the fact that his injuries mean that he will be in and out of hospital for a while. He has, however, agreed to join the Bureau, where as Ros â€˜doesn\'t want to give up her independence.\' Outside, in the hospital corridors, Ros admits that she is worried about Ed and gets all emotional. Beckett tells her that everything will be OK, but sounds more unsure than she is. Kitty tries to change her identity, to drop out of sight, and chooses the Duchess of Forteza. But her unloyal associate changes the password to her new bank account, and gives it to Ed. So, Kitty kidnaps Ed to get it. There is soon a race against time for the team to find the code name for the account, as they know the password, not the name, and for Kitty, to get the password, as she knows the access name. Alex manages to get the code name, by pretending to be Ros, and going to the bank.','2024-03-06 02:58:20','2024-03-06 02:58:29'),(41,1130578,6,'The Price of Peace',3,1,1,'the-price-of-peace','A new engine killer wepaon is stolen whilst Ed and Alex are testing it. Beckett escorts a statsman, Van Straaten to a peace conference, their vehicle is stopped using the engine killer, and they are held hostage by Virghiz nationals, who do not want the peace treaty to go ahead. They want Beckett\'s secret codes for Prject Darkling, so they can attack their enemies in Virghiz. Beckett escapes, but Van Straaten is left behind.','2024-03-06 02:58:37','2024-03-06 02:58:43'),(42,1130577,6,'Hollow Man',4,1,1,'hollow-man','A man creates a holo-imager which is used on the new £100 notes. Another guy, North, who helped design the holo-imager and who is also supposedly dead, turns up alive, and is trying to make fake £100 notes to â€˜up\' his bank balance. Ros goes to dinner with the man who created the holo-imager and he ends up being told to shoot her, but he lets her go.','2024-03-06 02:58:48','2024-03-06 02:58:58'),(43,1130579,6,'Nuclear Family',5,1,1,'nuclear-family','A foreign president is critically ill and everyone thinks he is dying, and there is no cure for his disease. Then, an English doctor discovers a way of saving his life, but he has to wait to undergo the operation. It is then found out that there is a traitor within the embassy, and the finger is instantly pointed at his much younger wife. All of Bureau Two believe her to be the traitor, except Beckett, who won\'t believe it (does he ever?) and thinks that the security guard is responsible. He and Nataliar (the wife) are then kidnapped by the people the traitor is working for, and one woman sets up a bomb next to them, with green pressure pad to detonate it. Ros, of course sets this off.','2024-03-06 02:59:05','2024-03-06 02:59:11'),(44,1130580,6,'Fugitive',6,1,1,'fugitive','Ros is set up and sent into custody. Even Jan seems to believe that she is guilty, but Beckett loyally stays beside her and tries to get her out. Ros eventually manages to escape and runs into the comforting arms of Channing. Ros realises that the â€˜mole\' is actually at the SSD (where she was sent into custody) and finds out who it is. The problem is that all the SSD people still think its her, and she is wanted for theft and murder, neither of which she did. She finally manages to make them see who it is. When things have pretty much got back to normal, Channing then tells Ros he is merging worth an American company and is moving to California, and that he wants her to go with him...','2024-03-06 02:59:19','2024-03-06 02:59:36'),(45,1130583,6,'Happy Ever After?',7,1,1,'happy-ever-after','The team are investigating about the mysterious disapearence of a woman called Julia, kidnapped at her own wedding. Ros and Beckett go to the location she is being kept at, and Ros is shot whilst trying to escape. She is taken to hospital and is OK, but Channing tellls her that her job is just too dangerous and that  she shoulddefinatly go to America with him, and Breckett also tells her that she should go. Ed is caught when he tries to rescue Julia, and they discobver that the person behind it all is Julia\'s husband, Mark. They are trapped underneath a bomb and find a narrow tunnel to escape through. Beckett has to dis-arm a bomb and Ros lets herself out of the Bureau and goes to the Bureau to help them.','2024-03-06 02:59:43','2024-03-06 02:59:51'),(46,1130581,6,'Buried Treasure',8,1,1,'buried-treasure','A lot of convicts are conviently let out of prison a few years before they should by the mysterious â€˜Athena\'. THe Bugs team go to investigate about the third man to be let out of prison, a Mr Flood. However, after they confront him, he escapes and runs to the carpark, closly followed by Alex, who loses him. Suddenly, he runs at her, determined to throw her off the side of the parking lot and she finds herself throwing him iff instead (by accident, of course). So, they decide that Beckett will take his place and he is taken to a place where he has to make a bomb to get through a steel door. With Ros telling him exactly what to do and with the aid of a â€˜neat\' pair of glasses that enable Ros to see what he is doing, he makes it and finallly decides toi tell Ros who he feels, saying that he was jealous about her and Channing. But the communications go down and he realises that she didn\'t hear him. He is just talking to himself, saying that its probably a good thing that she doesn\'t know ho','2024-03-06 03:00:05','2024-03-06 03:00:13'),(47,1130584,6,'Identity Crisis',9,1,1,'identity-crisis','JAN mysterially dissapears and is replaced by a new JAN at the bureau which causes friction between the team. But where has the other JAN gone and why did she leave without saying a word or telling them where she was going?','2024-03-06 03:00:18','2024-03-06 03:00:25'),(48,1130582,6,'Renegades',10,1,1,'renegades','Roland Blatty is still in hospital and a nurse explains to a new one that he will remain that way forever. However, once she has left the room, leaving the new nurse and Roland alone, he suddenly wakes up and attacks her, before walking out of the hospital. Beckett, Ed and Alex go to check on the other two members of the bureau, who are also in hospital. Ed and Alex find that the woman they were going to check on has also escaped from the hospital  she was in, in the same circumstances as Roland. The woman Beckett checks on is, however, still unconscious, and he is explaining to the nurse what to look out for, when the woman wakes up, attacks Beckett and flees from the hospital before anyone can stop her. The team soon find out that the old bureau members are after the four discs that make up the remains of Cyberax. The virus was kept on four discs so that the next time something like that happened, they could use Cyberax to help them overcome it. Beckett is suddenly kidnapped by Rolan','2024-03-06 03:00:29','2024-03-06 03:00:35'),(49,1130564,7,'Absent Friends',1,1,1,'absent-friends','Ros is missing and Beckett, Alex and Ed are desperately searching for her. However, they find her car a river with some of her blood in it, and presume that she is dead. Beckett won\'t accept this, and sobs his little heart out at Ros\' house. He ends up quitting from the bureau, to devote his time to searching for Ros. Beckett goes to see Ros\' Mum, her ex-fianceÃ©, Terry and does everything he can to determine Ros\' whereabouts. Ros is actually alive and well (naturally) and is working with Terry. Ed and Alex are given a job to transport what they think is something that saves lives- but they were given false information. Beckett is also where Alex and Ed are, still trying to find leads on what happened to Ros, and then Ros suddenly appears, steals the stuff that Alex and Ed are looking after, with Terry and two other people and runs to Terry\'s van As she starts the van, and starts to drive off, she sees Beckett, but is told by Terry to keep driving. She does as he says, leaving behind Be','2024-03-06 03:00:52','2024-03-06 03:01:01'),(50,1130570,7,'Sacrifice to Science',2,1,1,'sacrifice-to-science','Ros is still missing, although now the others know that she is not actually dead. Ros decides to ring Beckett and ask him to meet her, and Beckett quickly rushes to where she is. They meet on a bridge and Beckett is demanding an explanation, but Ros is too upset to give an answer. they go to see the others (Terry, Chris and Morag) who voice their opinions on Bureau 2 becoming involved; they don\'t like it one bit, especially Terry, who ideally wants to pick up where he and Ros left off, but he realises that that is never going to happen, because Ros is together with Beckett. However, because Beckett\'s Jeep had a bug on it the people trying to stop Ros and Terry find out where they are, and Chris and Morag are killed. Then they decide to blow up the base where Ros, Terry and Beckett are. They presume they are dead, but they managed to escape just in time. Beckett and Ros are walking in the hospital garden together and Beckett asks for an explanation. Ros tells him exactly what happened t','2024-03-06 03:02:21','2024-03-06 03:03:37'),(51,1130568,7,'Girl Power',3,1,1,'girl-power','Carly, a 14 year old girl breaks into The Hive and for some reason Ros is put in charge of her, which she is not too happy about. Beckett is moving into a rather run-down flat which Alex found for him, and his friendship with Ros is rather â€˜rocky\'. Carly is taken off Ros\' hands by a man who turns out to be a baddie after an ancient funeral mask that the Bureau are looking after. He manages to con Carly into stealing the mask and once she realises why they want it, she runs off and hides it. Soon, both Ros and Carly are held prisoner until Carly gives the whereabouts of the mask. They are trapped under a lift. Carly manages to get out and tell Alex and Ed where it is hidden, and they quickly find it.','2024-03-06 03:02:27','2024-03-06 03:03:44'),(52,1130571,7,'The Two Becketts',4,1,1,'the-two-becketts','A man breaks into a building, and although he tries to escape, he is caught. He then asks for Beckett, saying that he will only talk to him, and no-one else, and although becket doesn\'t know who he is, he goes to meet him. Once he reaches the place and sees the man, he simply says \"\"You,\"\" and punches him. The man then reveals that he is Beckett\'s father. Beckett takes his Dad to his house, where he tries to exlpain why he ran out on Beckett 10 years ago, after his Mum\'s funeral. He then explains that he was trying to find out about the whereabouts of a man who is after the two witnesses that will send him to prison. Ed goes to check it out, only to see that the man has escaped. Both of the witnesses are kidnapped and Beckett\'s Dad finally reveals that he wants to see the man go down because he killed Beckett\'s Mum. So, Beckett and his Dad go to find the man, as well as the two witnesses and Alex, who got mixed up in the whole thing.','2024-03-06 03:02:31','2024-03-06 03:03:49'),(53,1130566,7,'Hell and High Water',5,1,1,'hell-and-high-water','The Bugs team are called in to investiagte why the crew on board the Searanger, an oil rig, have suddenly gone silent. After investigation, they discover that the team they are with on the oil rig are not the really crew, and they work with the last surviving member, Paul Grey, to stop a satellite falling onto the Earth. Ros finds beckett unconscious in a room, and they are forced to work closely when they are left to do, betrayed by Paul Grey.','2024-03-06 03:02:36','2024-03-06 03:03:55'),(54,1130565,7,'Pandora\'s Box',6,1,1,'pandoras-box','The legendary tomb of King Arthur is supposedly at a site, where suddely a lot of people are becoming ill and new owners have stopped all normal work. beckett goes undercover to find out what is going on, and with the help of the others, they discover that the digging for the tomb has unearthed a plague. Alex falls ill with the pague and Ros works at finding her a cure. She is also worried about Beckett, who insists to stay at the site and stop the men from letting more people die and shows for the first time since they split up that she still cares for him.','2024-03-06 03:02:40','2024-03-06 03:03:59'),(55,1130567,7,'Jewel Control',7,1,1,'jewel-control','Ros\' friend, Sorrel marries Richard Blenko, a two faced man with a silver tongue, who\'d give anything to save his own life. He promises a gangster as many emeralds as he\'d like in exchange foir his life, using Sorrel\'s own father, Mr Mandrake, to do so. Mandrake is kidnapped whilst staying at becket\'s place, who went off with Christa when he was supposed to be assuring Mandrake\'s safety. Sorrel and Ros are also kidnapped. The gangsters steal the emeralds and then leave a bomb in the bunker where Ros, Sorrel, Mr Madrake and Richard are. Beckett, Jan and a trainee, Melissa have to stop the bomb and the gansters, before it is too late.','2024-03-06 03:02:51','2024-03-06 03:04:04'),(56,1130572,7,'Twin Geeks',8,1,1,'twin-geeks','Some Twin bright sparks decide that the world does not take them seriously enough, and plan to pay back the company that sacked them, years before. Beckett gets caught up in the process and is Beckett-napped (haha), whilst Ros is having a hard time facing up to the fact that ex-boyfriend Channing sold her designs to a new firm. So, she decides to buy them back, with the help of an old friend, who works at a bank. Alex and Adam go to investigate more about the â€˜twin geeks\'. However, they are trapped in a room, and the temperature is gradually decreasing, so Ed comes to the rescue. Ros goes to find Beckett, who has a little device attached to his wrist that will make a bomb explode just above him, if he walks to far away from it. This bomb is attached to the ceiling by an electromagnet, and Ros releases this and Beckett catches the bomb and has to run around with this. Ed saves Alex and Adam just in time, but gets jealous when she is more concerned about Adam, than thanking him. Beckett','2024-03-06 03:02:57','2024-03-06 03:04:12'),(57,1130569,7,'Money Spiders',9,1,1,'money-spiders','Two baddies (Zephyr and Wymark) create some â€˜spiders\' that route around networks looking for juicy bits of information that they can use to black mail people in a â€˜get rich quick\' scheme using something called Catflap.  The Bugs team are called in when a man has this happen to him, and they set up a trap to lure the people responsible to them. However, this goes horribly wrong and Zephyr and Wymark end up with what they think is Catflap (actually it is just a fake.) So, they turn to Adam Mosby for help and blackmail him by saying that they will kill Alex if he doesn\'t get Catflap from The Hive for them. He agrees and gives it to them in the second part. Ros and Ed go to investigate about Zephyr and Wymark, but are caught and forced to make a run for it, to the top of the building. Luckily Ed has some equipment with him and they absailing down the side of the building. But, Ros gets stuck half way down, as she is panicky about getting caught (her glove got caught in the figure of eight)','2024-03-06 03:03:09','2024-03-06 03:04:18'),(58,1130573,7,'The Enemy Within',10,1,1,'the-enemy-within','Ros has yet another brush with death, this time because she was shot in the head by Zephyr. As she fights for her life in hospital throughout the episode, Beckett is desperately trying to find the people (Wymark and Zephyr) who put her there. Zephyr and Wymark end up in the same hospital as there is the new G-5 chip there which they need to gain enough processing power to con a bank into giving the  m a few million pounds. Many things interrupt the surgery being performed on Ros (by a rather eccentric surgeon) including a power cut brought on by Wymark shooting the main power cables, leaving it up to Beckett and Ed to put it back to normal (which they manage to do, of course). At the end, Ros wakes up and is OK, and Beckett actually kisses her, putting the hope in everybody\'s hearts that they are actually going to get back together. However, this vision is quickly destroyed, as after Alex and Adam\'s wedding, Beckett and Christa are talking together and Christa practically proposes to h','2024-03-06 03:03:21','2024-03-06 03:04:28'),(59,1130473,8,'A Dissertation on the American Justice System by People Who Have Never Been Inside a Courtroom, Let Alone Know Anything About the Law, but Have Seen Way Too Many Legal Thrillers.',1,1,1,'a-dissertation-on-the-american-justice-system-by-people-who-have-never-been-inside-a-courtroom-let-alone-know-anything-about-the-law-but-have-seen-way-too-many-legal-thrillers','Jay sues the Quick Stop--and Dante--after slipping on Randal\'s spilled soda.','2024-03-06 03:05:27','2024-03-06 03:06:26'),(60,1130474,8,'The Clipshow Wherein Dante and Randal Are Locked in the Freezer and Remember Some of the Great Moments in Their Lives',2,1,1,'the-clipshow-wherein-dante-and-randal-are-locked-in-the-freezer-and-remember-some-of-the-great-moments-in-their-lives','The guys take a clip-filled trip down memory lane after getting locked in the Quick Stop\'s freezer.','2024-03-06 03:05:32','2024-03-06 03:06:32'),(61,1130475,8,'Leonardo Leonardo Returns and Dante Has an Important Decision to Make',3,1,1,'leonardo-leonardo-returns-and-dante-has-an-important-decision-to-make','Leonardo Leonardo opens a shop across from the Quick Stop, putting the business in danger.','2024-03-06 03:05:40','2024-03-06 03:06:37'),(62,1130476,8,'Leonardo Is Caught in the Grip of an Outbreak of Randal’s Imagination and Patrick Swayze either Does or Doesn\'t Work in the New Pet Store',4,1,1,'leonardo-is-caught-in-the-grip-of-an-outbreak-of-randals-imagination-and-patrick-swayze-either-does-or-doesnt-work-in-the-new-pet-store','The government descends on the Quick Stop after Leonardo is suspected of contracting a deadly virus from a monkey at a nearby pet store.','2024-03-06 03:05:44','2024-03-06 03:06:43'),(63,1130477,8,'Dante & Randal & Jay & Silent Bob & a Bunch of New Characters & Lando Take Part in a Whole Bunch of Movie Parodies Including, but Not Exclusive To, the Bad News Bears, the Last Starfighter, Indiana Jones & the Temple of Doom, Plus a High School Reunion',5,1,1,'dante-randal-jay-silent-bob-a-bunch-of-new-characters-lando-take-part-in-a-whole-bunch-of-movie-parodies-including-but-not-exclusive-to-the-bad-news-bears-the-last-starfighter-indiana-jones-the-temple-of-doom-plus-a-high-school-reunion','Dante becomes a coach for Leonardo\'s little-league team.','2024-03-06 03:05:48','2024-03-06 03:06:47'),(64,1130478,8,'The Last Episode Ever!',6,1,1,'the-last-episode-ever','The guys\' day slacking off at the Quick Stop is derailed by a spoof of \"The Matrix,\" a carnival riot and a trip through the minds of their illustrators.','2024-03-06 03:05:54','2024-03-06 03:06:52'),(65,1130502,9,'Dégraissage',1,1,1,'degraissage','-','2024-03-06 03:07:20','2024-03-06 03:07:30'),(66,1130503,9,'Image de marque',2,1,1,'image-de-marque','-','2024-03-06 03:07:34','2024-03-06 03:08:12'),(67,1130506,9,'Questions/réponses',3,1,1,'questionsreponses','-','2024-03-06 03:07:37','2024-03-06 03:08:07'),(68,1130504,9,'Conscientisation',4,1,1,'conscientisation','-','2024-03-06 03:07:50','2024-03-06 03:08:00'),(69,1130505,9,'Secrétaire personnelle',5,1,1,'secretaire-personnelle','-','2024-03-06 03:08:21','2024-03-06 03:08:29'),(70,1130498,9,'Quitte ou double',6,1,1,'quitte-ou-double','-','2024-03-06 03:08:32','2024-03-06 03:08:39'),(71,1130499,9,'Bienvenue, Terrebonne!',7,1,1,'bienvenue-terrebonne','-','2024-03-06 03:08:44','2024-03-06 03:08:52'),(72,1130510,9,'Sortie de secours',8,1,1,'sortie-de-secours','-','2024-03-06 03:08:59','2024-03-06 03:09:06'),(73,1130509,9,'Vibrations',9,1,1,'vibrations','-','2024-03-06 03:09:10','2024-03-06 03:09:17'),(74,1130500,9,'Les trois B',10,1,1,'les-trois-b','-','2024-03-06 03:09:21','2024-03-06 03:09:27'),(75,1130507,9,'C\'t\'encore drôle!',11,1,1,'ctencore-drole','-','2024-03-06 03:09:32','2024-03-06 03:09:39'),(76,1130508,9,'Solde avant liquidation',12,1,1,'solde-avant-liquidation','-','2024-03-06 03:09:43','2024-03-06 03:09:49'),(77,1201852,10,'Episode 1',1,1,1,'episode-1','Pilot episode featuring panelists Michael Landon, Vicki Lawrence, Jack Klugman, Jo Ann Pflug, Richard Dawson, and Anita Gillette','2024-03-06 03:10:17','2024-03-06 03:16:03'),(78,1609734,10,'Episode 2',2,1,1,'episode-2','Panelists Michael Landon, Vicki Lawrence, Jack Klugman, Jo Ann Pflug, Richard Dawson, and Anita Gillette join host Gene Rayburn.','2024-03-06 03:10:21','2024-03-06 03:15:59'),(79,1609738,10,'Episode 3',3,1,1,'episode-3','Panelists Michael Landon, Vicki Lawrence, Jack Klugman, Jo Ann Pflug, Richard Dawson, and Anita Gillette join host Gene Rayburn.','2024-03-06 03:10:27','2024-03-06 03:15:56'),(80,1609742,10,'Episode 4',4,1,1,'episode-4','Panelists Michael Landon, Vicki Lawrence, Jack Klugman, Jo Ann Pflug, Richard Dawson, and Anita Gillette join host Gene Rayburn.','2024-03-06 03:10:30','2024-03-06 03:15:52'),(81,1609743,10,'Episode 5',5,1,1,'episode-5','Panelists Michael Landon, Vicki Lawrence, Jack Klugman, Jo Ann Pflug, Richard Dawson, and Anita Gillette join host Gene Rayburn.','2024-03-06 03:10:34','2024-03-06 03:15:49'),(82,3502948,10,'Episode 6',6,1,1,'episode-6','Panelists Della Reese, Richard Dawson, Arlene Francis, Bob Barker, Michael Learned, and Richard Thomas','2024-03-06 03:10:37','2024-03-06 03:15:45'),(83,3502957,10,'Episode 7',7,1,1,'episode-7','Panelists Della Reese, Richard Dawson, Arlene Francis, Bob Barker, Michael Learned, and Richard Thomas','2024-03-06 03:10:41','2024-03-06 03:15:42'),(84,3502961,10,'Episode 8',8,1,1,'episode-8','Panelists Della Reese, Richard Dawson, Arlene Francis, Bob Barker, Michael Learned, and Richard Thomas','2024-03-06 03:10:45','2024-03-06 03:15:38'),(85,3502963,10,'Episode 9',9,1,1,'episode-9','Panelists Della Reese, Richard Dawson, Arlene Francis, Bob Barker, Michael Learned, and Richard Thomas','2024-03-06 03:10:49','2024-03-06 03:15:36'),(86,3502964,10,'Episode 10',10,1,1,'episode-10','Panelists Della Reese, Richard Dawson, Arlene Francis, Bob Barker, Michael Learned, and Richard Thomas','2024-03-06 03:10:54','2024-03-06 03:15:33'),(87,3502965,10,'Episode 11',11,1,1,'episode-11','Panelists Bert Convy, Jaye P. Morgan, Charles Nelson Reilly, Brett Somers, Richard Dawson, and Betty White','2024-03-06 03:10:57','2024-03-06 03:15:26'),(88,3502975,10,'Episode 12',12,1,1,'episode-12','Panelists Bert Convy, Jaye P. Morgan, Charles Nelson Reilly, Brett Somers, Richard Dawson, and Betty White','2024-03-06 03:11:01','2024-03-06 03:15:23'),(89,3502976,10,'Episode 13',13,1,1,'episode-13','Panelists Bert Convy, Jaye P. Morgan, Charles Nelson Reilly, Brett Somers, Richard Dawson, and Betty White','2024-03-06 03:11:04','2024-03-06 03:15:20'),(90,3502977,10,'Episode 14',14,1,1,'episode-14','Panelists Bert Convy, Jaye P. Morgan, Charles Nelson Reilly, Brett Somers, Richard Dawson, and Betty White','2024-03-06 03:11:07','2024-03-06 03:15:12'),(91,3502978,10,'Episode 15',15,1,1,'episode-15','Panelists Bert Convy, Jaye P. Morgan, Charles Nelson Reilly, Brett Somers, Richard Dawson, and Betty White','2024-03-06 03:11:11','2024-03-06 03:15:09'),(92,3502979,10,'Episode 16',16,1,1,'episode-16','Panelists Dick Gautier, Barbara Stuart, Jack Carter, Jo Ann Pflug, Richard Dawson, and Shelley Winters','2024-03-06 03:11:15','2024-03-06 03:15:05'),(93,3502980,10,'Episode 17',17,1,1,'episode-17','Panelists Dick Gautier, Barbara Stuart, Jack Carter, Jo Ann Pflug, Richard Dawson, and Shelley Winters','2024-03-06 03:11:21','2024-03-06 03:15:02'),(94,3502981,10,'Episode 18',18,1,1,'episode-18','Panelists Dick Gautier, Barbara Stuart, Jack Carter, Jo Ann Pflug, Richard Dawson, and Shelley Winters','2024-03-06 03:11:29','2024-03-06 03:14:58'),(95,3502982,10,'Episode 19',19,1,1,'episode-19','Panelists Dick Gautier, Barbara Stuart, Jack Carter, Jo Ann Pflug, Richard Dawson, and Shelley Winters','2024-03-06 03:11:35','2024-03-06 03:14:55'),(96,3502983,10,'Episode 20',20,1,1,'episode-20','Panelists Dick Gautier, Barbara Stuart, Jack Carter, Jo Ann Pflug, Richard Dawson, and Shelley Winters','2024-03-06 03:11:40','2024-03-06 03:14:51'),(97,3502984,10,'Episode 21',21,1,1,'episode-21','Panelists Bert Convy, Loretta Swit, Charles Nelson Reilly, Mary Ann Mobley, Richard Dawson, and Kaye Ballard','2024-03-06 03:11:45','2024-03-06 03:14:48'),(98,3502985,10,'Episode 22',22,1,1,'episode-22','Panelists Bert Convy, Loretta Swit, Charles Nelson Reilly, Mary Ann Mobley, Richard Dawson, and Kaye Ballard','2024-03-06 03:11:49','2024-03-06 03:14:44'),(99,3502986,10,'Episode 23',23,1,1,'episode-23','Panelists Bert Convy, Loretta Swit, Charles Nelson Reilly, Mary Ann Mobley, Richard Dawson, and Kaye Ballard','2024-03-06 03:11:54','2024-03-06 03:14:41'),(100,3502987,10,'Episode 24',24,1,1,'episode-24','Panelists Bert Convy, Loretta Swit, Charles Nelson Reilly, Mary Ann Mobley, Richard Dawson, and Kaye Ballard','2024-03-06 03:12:02','2024-03-06 03:14:38'),(101,3502988,10,'Episode 25',25,1,1,'episode-25','Panelists Bert Convy, Loretta Swit, Charles Nelson Reilly, Mary Ann Mobley, Richard Dawson, and Kaye Ballard','2024-03-06 03:12:08','2024-03-06 03:14:34'),(102,3502989,10,'Episode 26',26,1,1,'episode-26','Panelists Bert Convy, Brett Somers, Morey Amsterdam, Carolyn Jones, Richard Dawson, and Betty White','2024-03-06 03:12:12','2024-03-06 03:14:22'),(103,3502990,10,'Episode 27',27,1,1,'episode-27','Panelists Bert Convy, Brett Somers, Morey Amsterdam, Carolyn Jones, Richard Dawson, and Betty White','2024-03-06 03:12:17','2024-03-06 03:14:18'),(104,3502991,10,'Episode 28',28,1,1,'episode-28','Panelists Bert Convy, Brett Somers, Morey Amsterdam, Carolyn Jones, Richard Dawson, and Betty White','2024-03-06 03:12:22','2024-03-06 03:14:14'),(105,3502992,10,'Episode 29',29,1,1,'episode-29','Panelists Bert Convy, Brett Somers, Morey Amsterdam, Carolyn Jones, Richard Dawson, and Betty White','2024-03-06 03:12:28','2024-03-06 03:14:09'),(106,3502993,10,'Episode 30',30,1,1,'episode-30','Panelists Bert Convy, Brett Somers, Morey Amsterdam, Carolyn Jones, Richard Dawson, and Betty White','2024-03-06 03:12:35','2024-03-06 03:14:04'),(107,3502994,10,'Episode 31',31,1,1,'episode-31','Panelists Bert Convy, Brett Somers, Jack Carter, Lucie Arnaz, Richard Dawson, and Nanette Fabray','2024-03-06 03:12:41','2024-03-06 03:14:01'),(108,3502995,10,'Episode 32',32,1,1,'episode-32','Panelists Bert Convy, Brett Somers, Jack Carter, Lucie Arnaz, Richard Dawson, and Nanette Fabray','2024-03-06 03:12:45','2024-03-06 03:13:57'),(109,3502996,10,'Episode 33',33,1,1,'episode-33','Panelists Bert Convy, Brett Somers, Jack Carter, Lucie Arnaz, Richard Dawson, and Nanette Fabray','2024-03-06 03:12:48','2024-03-06 03:13:54'),(110,3502997,10,'Episode 34',34,1,1,'episode-34','Panelists Bert Convy, Brett Somers, Jack Carter, Lucie Arnaz, Richard Dawson, and Nanette Fabray','2024-03-06 03:12:51','2024-03-06 03:13:49'),(111,3502998,10,'Episode 35',35,1,1,'episode-35','Panelists Bert Convy, Brett Somers, Jack Carter, Lucie Arnaz, Richard Dawson, and Nanette Fabray','2024-03-06 03:12:55','2024-03-06 03:13:45'),(112,3502999,10,'Episode 36',36,1,1,'episode-36','Panelists Morey Amsterdam, Brett Somers, Charles Nelson Reilly, Loretta Swit, Richard Dawson, and Ruta Lee','2024-03-06 03:13:01','2024-03-06 03:13:42'),(113,3503000,10,'Episode 37',37,1,1,'episode-37','Panelists Morey Amsterdam, Brett Somers, Charles Nelson Reilly, Loretta Swit, Richard Dawson, and Ruta Lee','2024-03-06 03:13:06','2024-03-06 03:13:39'),(114,3503001,10,'Episode 38',38,1,1,'episode-38','Panelists Morey Amsterdam, Brett Somers, Charles Nelson Reilly, Loretta Swit, Richard Dawson, and Ruta Lee','2024-03-06 03:13:11','2024-03-06 03:13:35'),(115,3503002,10,'Episode 39',39,1,1,'episode-39','Panelists Morey Amsterdam, Brett Somers, Charles Nelson Reilly, Loretta Swit, Richard Dawson, and Ruta Lee','2024-03-06 03:13:15','2024-03-06 03:13:32'),(116,3503003,10,'Episode 40',40,1,1,'episode-40','Panelists Morey Amsterdam, Brett Somers, Charles Nelson Reilly, Loretta Swit, Richard Dawson, and Ruta Lee','2024-03-06 03:13:19','2024-03-06 03:13:27'),(117,1130462,11,'Bond of Love and Youth',1,1,1,'bond-of-love-and-youth','-','2024-03-06 03:16:52','2024-03-06 03:18:45'),(118,1130463,11,'Strength That Overcomes Loneliness',2,1,1,'strength-that-overcomes-loneliness','-','2024-03-06 03:16:56','2024-03-06 03:18:39'),(119,1130464,11,'Leader\'s Beautiful Form',3,1,1,'leaders-beautiful-form','-','2024-03-06 03:17:00','2024-03-06 03:18:30'),(120,1130465,11,'Men\'s Camaraderie and Women\'s Pride',4,1,1,'mens-camaraderie-and-womens-pride','-','2024-03-06 03:17:09','2024-03-06 03:18:24'),(121,1130466,11,'Wounds of the Heart',5,1,1,'wounds-of-the-heart','-','2024-03-06 03:17:14','2024-03-06 03:18:18'),(122,1130467,11,'Dear Mother',6,1,1,'dear-mother','-','2024-03-06 03:17:18','2024-03-06 03:18:10'),(123,1130468,11,'Disturbance',7,1,1,'disturbance','-','2024-03-06 03:17:23','2024-03-06 03:18:04'),(124,1130469,11,'Tragedy',8,1,1,'tragedy','-','2024-03-06 03:17:26','2024-03-06 03:17:59'),(125,1130470,11,'Lament',9,1,1,'lament','-','2024-03-06 03:17:34','2024-03-06 03:17:53'),(126,1130471,11,'Hope',10,1,1,'hope','-','2024-03-06 03:17:38','2024-03-06 03:17:48'),(127,4786114,12,'Episode 1',1,1,1,'episode-1','-','2024-03-13 01:07:49','2024-03-13 01:07:57'),(128,4786115,12,'Episode 2',2,1,1,'episode-2','-','2024-03-13 01:08:04','2024-03-13 01:08:10'),(129,4786116,12,'Episode 3',3,1,1,'episode-3','-','2024-03-13 01:08:15','2024-03-13 01:08:27'),(130,4786117,12,'Episode 4',4,1,1,'episode-4','-','2024-03-13 01:08:31','2024-03-13 01:08:38'),(131,4786118,12,'Episode 5',5,1,1,'episode-5','-','2024-03-13 01:08:45','2024-03-13 01:08:51');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_movie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_movie_genre_id_foreign` (`genre_id`),
  KEY `genre_movie_movie_id_foreign` (`movie_id`),
  CONSTRAINT `genre_movie_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `genre_movie_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_movie`
--

LOCK TABLES `genre_movie` WRITE;
/*!40000 ALTER TABLE `genre_movie` DISABLE KEYS */;
INSERT INTO `genre_movie` VALUES (1,1,1),(2,17,1),(3,15,1),(4,1,2),(5,4,2),(6,7,3),(7,1,3),(8,17,3),(9,5,3),(10,1,4),(11,4,4),(12,17,4),(13,7,5),(14,2,6),(15,15,6),(16,2,7),(17,3,7),(18,1,7),(19,4,7),(20,8,7),(21,2,8),(22,1,8),(23,15,8),(24,7,9),(25,1,9),(26,18,9),(27,7,10),(28,11,10),(29,3,11),(30,4,11),(31,15,11),(32,4,12),(33,14,12),(34,1,13),(35,17,13),(36,5,13),(37,2,14),(38,9,14),(39,3,14),(40,7,14),(41,8,14),(42,1,15),(43,4,15),(44,1,16),(45,17,16),(46,18,16),(47,11,17),(48,1,17),(49,17,17),(50,7,18),(51,10,18),(52,1,19),(53,5,19),(54,2,20),(55,7,20),(56,15,20),(57,7,21),(58,13,21),(59,9,22),(60,3,22),(61,1,22),(62,2,23),(63,7,23),(64,1,23),(65,8,23);
/*!40000 ALTER TABLE `genre_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genres_tmdb_id_unique` (`tmdb_id`),
  UNIQUE KEY `genres_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,28,'Action','action','2024-03-06 02:22:37','2024-03-06 02:22:37'),(2,12,'Adventure','adventure','2024-03-06 02:22:50','2024-03-06 02:22:50'),(3,16,'Animation','animation','2024-03-06 02:23:03','2024-03-06 02:23:03'),(4,35,'Comedy','comedy','2024-03-06 02:23:30','2024-03-06 02:23:30'),(5,80,'Crime','crime','2024-03-06 02:23:49','2024-03-06 02:23:49'),(6,99,'Documentary','documentary','2024-03-06 02:24:10','2024-03-06 02:24:10'),(7,18,'Drama','drama','2024-03-06 02:24:27','2024-03-06 02:24:27'),(8,10751,'Family','family','2024-03-06 02:24:52','2024-03-06 02:24:52'),(9,14,'Fantasy','fantasy','2024-03-06 02:25:13','2024-03-06 02:25:13'),(10,36,'History','history','2024-03-06 02:25:31','2024-03-06 02:25:31'),(11,27,'Horror','horror','2024-03-06 02:26:41','2024-03-06 02:26:41'),(12,10402,'Music','music','2024-03-06 02:26:55','2024-03-06 02:26:55'),(13,9648,'Mystery','mystery','2024-03-06 02:27:11','2024-03-06 02:27:11'),(14,10749,'Romance','romance','2024-03-06 02:27:23','2024-03-06 02:27:23'),(15,878,'Science Fiction','science-fiction','2024-03-06 02:27:35','2024-03-06 02:27:35'),(16,10770,'TV Movie','tv-movie','2024-03-06 02:27:47','2024-03-06 02:27:47'),(17,53,'Thriller','thriller','2024-03-06 02:28:00','2024-03-06 02:28:00'),(18,10752,'War','war','2024-03-06 02:28:13','2024-03-06 02:28:13'),(19,37,'Western','western','2024-03-06 02:28:23','2024-03-06 02:28:23');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2024_02_26_074703_create_sessions_table',1),(7,'2024_02_26_085805_create_movies_table',1),(8,'2024_02_26_085844_create_series_table',1),(9,'2024_02_26_085952_create_casts_table',1),(10,'2024_02_26_090031_create_tags_table',1),(11,'2024_02_26_090110_create_seasons_table',1),(12,'2024_02_26_090146_create_episodes_table',1),(13,'2024_02_26_090228_create_genres_table',1),(14,'2024_02_26_090253_create_trailers_table',1),(15,'2024_02_26_093147_create_genre_movie_table',1),(16,'2024_02_26_093704_create_cast_movie_table',1),(17,'2024_02_26_094911_create_permission_tables',1),(18,'2024_03_05_094254_add_video_format_to_movies_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `runtime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `video_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visits` bigint NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` decimal(8,1) NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backdrop_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_tmdb_id_unique` (`tmdb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'763164','Apex','2021-11-12','108','en',1,'FHD',520,'apex',4.5,'/chTkFGToW5bsyw3hgLAe4S5Gt3.jpg','/4gKxQIW91hOTELjY5lzjMbLoGxB.jpg','Ex-cop Thomas Malone is serving a life sentence for a crime he didn’t commit. He is offered a chance at freedom if he can survive a deadly game of Apex, in which six hunters pay for the pleasure of hunting another human on a remote island. He accepts, and once he arrives, all hell breaks loose.','2024-03-06 03:19:02','2024-03-06 03:24:43'),(2,'11770','Shaolin Soccer','2001-07-05','113','cn',1,'FHD',250,'shaolin-soccer',4.9,'/kVpq68NxChzynK7otaymRSaWR8p.jpg','/lMRX4cLx4hxYth3iQ96c0E1RHGB.jpg','A young Shaolin follower reunites with his discouraged brothers to form a soccer team using their martial art skills to their advantage.','2024-03-06 03:26:01','2024-03-06 18:49:00'),(3,'11636','New Police Story','2004-09-23','123','cn',1,'FHD',350,'new-police-story',4.5,'/ece4Ivxpt6GKVQaed9xQjKrUwun.jpg','/hbPNqH59r8cTSbm9I4EMzFs1Pk.jpg','Sent into a drunken tailspin when his entire unit is killed by a gang of thrill-seeking punks, disgraced Hong Kong police inspector Wing needs help from his new rookie partner, with a troubled past of his own, to climb out of the bottle and track down the gang and its ruthless leader.','2024-03-06 03:29:37','2024-03-06 03:29:58'),(4,'848538','Argylle','2024-01-31','139','en',1,'FHD',145,'argylle',4.2,'/95VlSEfLMqeX36UVcHJuNlWEpwf.jpg','/xvk5AhfhgQcTuaCQyq3XqAnhEma.jpg','When the plots of reclusive author Elly Conway\'s fictional espionage novels begin to mirror the covert actions of a real-life spy organization, quiet evenings at home become a thing of the past. Accompanied by her cat Alfie and Aiden, a cat-allergic spy, Elly races across the world to stay one step ahead of the killers as the line between Conway\'s fictional world and her real one begins to blur.','2024-03-06 18:59:03','2024-03-06 18:59:28'),(5,'126308','Who Killed Cock Robin?','2005-01-20','88','en',1,'FHD',250,'who-killed-cock-robin',4.9,'/fNOyjiokUAr3JVKNacPyIFq7yez.jpg',NULL,'In depressed Butte, Montana, young men struggle to forge modest lives and make sense of it all.','2024-03-06 19:10:10','2024-03-06 19:10:37'),(6,'438631','Dune','2021-09-15','155','en',1,'FHD',550,'dune',4.7,'/d5NXSklXo0qyIYkgV94XAgMIckC.jpg','/lzWHmYdfeFiMIY4JaMmtR7GEli3.jpg','Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet\'s exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity\'s greatest potential-only those who can conquer their fear will survive.','2024-03-06 19:19:25','2024-03-06 19:19:44'),(7,'1011985','Kung Fu Panda 4','2024-03-02','94','en',1,'FHD',600,'kung-fu-panda-4',4.7,'/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg','/fCwwzOziFYs7YRwP4gbrb9qH1xg.jpg','Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.','2024-03-06 19:22:15','2024-03-06 19:22:42'),(8,'634649','Spider-Man: No Way Home','2021-12-15','148','en',1,'FHD',250,'spider-man-no-way-home',4.8,'/5weKu49pzJCt06OPpjvT80efnQj.jpg','/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg','Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.','2024-03-06 19:39:33','2024-03-06 19:39:58'),(9,'616','The Last Samurai','2003-12-05','154','en',1,'FHD',478,'the-last-samurai',4.9,'/uolYbaXaY1VV0G7vJuYHMBV9yJ.jpg','/z354BaTVzKj7E60WLzDoSmUuO4u.jpg','Nathan Algren is an American hired to instruct the Japanese army in the ways of modern warfare, which finds him learning to respect the samurai and the honorable principles that rule them. Pressed to destroy the samurai\'s way of life in the name of modernization and open trade, Algren decides to become an ultimate warrior himself and to fight for their right to exist.','2024-03-06 20:53:00','2024-03-06 20:53:42'),(10,'461027','Jailangkung','2017-06-25','87','id',1,'FHD',500,'jailangkung',4.5,'/yq2pWpeIUlrqbtH4wZNMxGRddTW.jpg','/6kFCm24tXH6XHmG9b3TYlYnsJqC.jpg','Three sisters, along with their friend who is a student of metaphysics, attempt to learn why their father became comatose at an eerie, remote mansion.','2024-03-06 23:21:08','2024-03-06 23:21:25'),(11,'1239251','Megamind vs. the Doom Syndicate','2024-03-01','85','en',1,'FHD',1,'megamind-vs-the-doom-syndicate',0.0,'/1N7terrMeZPwK5qq31MUD0HQ3IG.jpg','/3Kzc6V4MWs3RXCmE5DhAYnfWL8F.jpg','Megamind\'s former villain team, The Doom Syndicate, has returned. Our newly crowned blue hero must now keep up evil appearances until he can assemble his friends (Roxanne, Ol\' Chum and Keiko) to stop his former evil teammates from launching Metro City to the Moon.','2024-03-12 23:55:56','2024-03-12 23:59:18'),(12,'1072790','Anyone But You','2023-12-21','103','en',1,'FHD',1,'anyone-but-you',0.0,'/5qHoazZiaLe7oFBok7XlUhg96f2.jpg','/nTPFkLUARmo1bYHfkfdNpRKgEOs.jpg','After an amazing first date, Bea and Ben’s fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.','2024-03-12 23:59:03','2024-03-12 23:59:11'),(13,'1227816','Red Right Hand','2024-02-22','111','en',1,'FHD',1,'red-right-hand',0.0,'/vfEG79SQIg3p6B8rBLVeIo2BBhb.jpg','/xi2pblvQtCnh26SeOYzx1YX3DLT.jpg','Cash is trying to live a quiet, honest life in a small Appalachian town. When a vicious crime boss forces him back into her services, he soon learns he\'s capable of anything -- even killing -- to protect his family and his home.','2024-03-13 00:00:29','2024-03-13 00:00:36'),(14,'1022789','Inside Out 2','2024-06-13','0','en',1,'FHD',1,'inside-out-2',0.0,'/xeqXXTE1Cd3qNaAEOT6qbhhCsgJ.jpg','/uVu2fBc114un7F1GD76RBouWyBP.jpg','Teenager Riley\'s mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.','2024-03-13 00:02:20','2024-03-13 00:02:28'),(15,'1217409','Jaque Mate','2024-01-25','104','es',1,'FHD',1,'jaque-mate',0.0,'/umRkEsTwKU5nVbLVNw22cYB2fjm.jpg','/wqmemsQb8xcLVQkwt8WTYnMIYms.jpg','Duque, an international secret agent who retired years ago after a traumatic event, is forced to return to action when a commando operative kidnaps his niece and forces him to steal a precious scientific formula as part of the ransom.','2024-03-13 00:03:09','2024-03-13 00:03:18'),(16,'969492','Land of Bad','2024-01-25','113','en',1,'FHD',1,'land-of-bad',0.0,'/h27WHO2czaY5twDmV3Wfx5IdqoE.jpg','/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg','When a Delta Force special ops mission goes terribly wrong, Air Force drone pilot Reaper has 48 hours to remedy what has devolved into a wild rescue operation. With no weapons and no communication other than the drone above, the ground mission suddenly becomes a full-scale battle when the team is discovered by the enemy.','2024-03-13 00:05:31','2024-03-13 00:05:39'),(17,'1096197','No Way Up','2024-01-18','90','pt',1,'FHD',1,'no-way-up',0.0,'/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg','/mDeUmPe4MF35WWlAqj4QFX5UauJ.jpg','Characters from different backgrounds are thrown together when the plane they\'re travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides.','2024-03-13 00:05:59','2024-03-13 00:06:08'),(18,'872585','Oppenheimer','2023-07-19','181','en',1,'FHD',1,'oppenheimer',0.0,'/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg','/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg','The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.','2024-03-13 00:08:28','2024-03-13 00:08:35'),(19,'1046090','The Pig, the Snake and the Pigeon','2023-10-06','134','zh',1,'FHD',1,'the-pig-the-snake-and-the-pigeon',0.0,'/7IJ7F8tX7IAkpUdaGovOBJqORnJ.jpg','/cu5Qk2QHxOyyMrD3Bq93DxgmJer.jpg','The arrogant, third most-wanted criminal in Taiwan, decides to get rid of the top two competitors and crowns himself the most-wanted criminal before dying.','2024-03-13 00:10:21','2024-03-13 00:10:30'),(20,'636706','Spaceman','2024-02-23','108','en',1,'FHD',1,'spaceman',0.0,'/jDdnDEGu3GiLtJwDXeL4hfFzmGv.jpg','/824e60sDlEXUP1vXCYNqh5RSlI5.jpg','During a research mission, an astronaut discovers that his marriage is in trouble. Luckily, he has the help of a mysterious creature hidden in his ship.','2024-03-13 00:11:19','2024-03-13 00:11:25'),(21,'15','Citizen Kane','1941-04-17','119','en',1,'FHD',1,'citizen-kane',0.0,'/sav0jxhqiH0bPr2vZFU0Kjt2nZL.jpg','/ruF3Lmd4A8MHbnEBE6lxPMbsHGL.jpg','Newspaper magnate Charles Foster Kane is taken from his mother as a boy and made the ward of a rich industrialist. As a result, every well-meaning, tyrannical or self-destructive move he makes for the rest of his life appears in some way to be a reaction to that deeply wounding event.','2024-03-13 01:13:54','2024-03-13 01:14:05'),(22,'408220','Justice League Dark','2017-01-24','75','en',1,'FHD',1,'justice-league-dark',4.5,'/gWcTaDFXDrOAPfVzfBFz0Aya5BE.jpg','/2idkeA6HJ9F7IxeP6zbU4xBU35y.jpg','When innocent civilians begin committing unthinkable crimes across Metropolis, Gotham City and beyond, Batman must call upon mystical counterparts to eradicate this demonic threat to the planet; enter Justice League Dark. This team of Dark Arts specialists must unravel the mystery of Earth\'s supernatural plague and contend with the rising, powerful villainous forces behind the siege—before it\'s too late for all of mankind.','2024-03-13 22:05:02','2024-03-13 22:06:21'),(23,'38575','The Karate Kid','2010-06-10','140','en',1,'FHD',1,'the-karate-kid',4.8,'/bHjLC5GuBfeyW6ZE07x6TalKj19.jpg','/9Cip74Gl1xOkRP0e4OAiPZp8C4k.jpg','Twelve-year-old Dre Parker could have been the most popular kid in Detroit, but his mother\'s latest career move has landed him in China. Dre immediately falls for his classmate Mei Ying but the cultural differences make such a friendship impossible. Even worse, Dre\'s feelings make him an enemy of the class bully, Cheng. With no friends in a strange land, Dre has nowhere to turn but maintenance man Mr. Han, who is a kung fu master. As Han teaches Dre that kung fu is not about punches and parries, but maturity and calm, Dre realizes that facing down the bullies will be the fight of his life.','2024-03-17 19:13:06','2024-03-17 19:16:22');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2024-03-06 02:08:15','2024-03-06 02:08:15'),(2,'user','web','2024-03-06 02:08:22','2024-03-06 02:08:22');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` bigint NOT NULL,
  `serie_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seasons_tmdb_id_unique` (`tmdb_id`),
  KEY `seasons_serie_id_foreign` (`serie_id`),
  CONSTRAINT `seasons_serie_id_foreign` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,2328143,9,'Season 1','1','season-1','/bisvcIK9xIE0whLvPb2hQpfbfw9.jpg','2024-03-06 02:43:05','2024-03-06 02:43:05'),(2,2328144,9,'Season 2','2','season-2','/h9qveCyL3m6tNOrdhUabZk7khKt.jpg','2024-03-06 02:43:15','2024-03-06 02:43:15'),(3,2328142,9,'Season 3','3','season-3','/h9qveCyL3m6tNOrdhUabZk7khKt.jpg','2024-03-06 02:43:20','2024-03-06 02:43:20'),(4,2328137,7,'Season 1','1','season-1','/tCTLuczifNqR31KWr4fmYPBRhps.jpg','2024-03-06 02:49:29','2024-03-06 02:49:29'),(5,2328140,7,'Season 2','2','season-2','/nxWvR0scEZnx2eUmfpScEvdn6fq.jpg','2024-03-06 02:49:35','2024-03-06 02:49:35'),(6,2328139,7,'Season 3','3','season-3','/51ImhExO5XPKDwX9jj7uBJj6XJx.jpg','2024-03-06 02:49:42','2024-03-06 02:49:42'),(7,2328138,7,'Season 4','4','season-4','/1h6G29oFMLboQOHuyRivuvpAiN1.jpg','2024-03-06 02:49:47','2024-03-06 02:49:47'),(8,2328127,2,'Season 1','1','season-1','/qhKzJcAz9AhxZstTAsLu2lulbVY.jpg','2024-03-06 03:05:13','2024-03-06 03:05:13'),(9,2328132,5,'Season 1','1','season-1','/heOhqAyj2L64R2HuFZmEay7zqoj.jpg','2024-03-06 03:07:11','2024-03-06 03:07:11'),(10,78026,8,'Season 1','1','season-1','/yO1yfYyHemDZAJyLNLz3tCiaNC8.jpg','2024-03-06 03:10:09','2024-03-06 03:10:09'),(11,2328126,1,'Season 1','1','season-1','/96Cwc5ejUAiH6iAA6xOp96dkSZS.jpg','2024-03-06 03:16:43','2024-03-06 03:16:43'),(12,359465,11,'Season 1','1','season-1','/sg6tjBKBu62mC9uj2CJPoP0Zl2M.jpg','2024-03-13 01:07:32','2024-03-13 01:07:32'),(13,185015,12,'Season 1','1','season-1','/70LqsAZTI9FlynElLKJSohZ2Qt3.jpg','2024-03-13 01:09:39','2024-03-13 01:09:39'),(14,185016,12,'Season 2','2','season-2','/9zqjEZu7TJlhSgPiMg8wpMX7DKR.jpg','2024-03-13 01:09:44','2024-03-13 01:09:44'),(15,185017,12,'Season 3','3','season-3','/2s28DJyTBzjJ0Qo1oaCBg9TuksE.jpg','2024-03-13 01:09:51','2024-03-13 01:09:51'),(16,335679,12,'Season 4','4','season-4','/i2MwS6U0XzD8ad6aS3HiTNKz8ov.jpg','2024-03-13 01:09:55','2024-03-13 01:09:55'),(17,2328146,13,'Season 1','1','season-1','/khXHvYKAvGqjtnKoLVYZr8r5yKD.jpg','2024-03-13 01:10:44','2024-03-13 01:10:44'),(18,137656,14,'Season 1','1','season-1','/mDFfiQeHgAN4lnAxQr5m1oSkwJy.jpg','2024-03-13 01:12:14','2024-03-13 01:12:14'),(19,141872,14,'Season 2','2','season-2','/eIdGdYgv163BRBoGkhthAcMwh5P.jpg','2024-03-13 01:12:17','2024-03-13 01:12:17'),(20,145170,14,'Season 3','3','season-3','/vg77mhWrIOLFi1Ll2Vj1aNFgqOe.jpg','2024-03-13 01:12:22','2024-03-13 01:12:22'),(21,145171,14,'Season 4','4','season-4','/ypCn8xPHVlaTvuoxKY6T1oUunrr.jpg','2024-03-13 01:12:27','2024-03-13 01:12:27'),(22,145172,14,'Season 5','5','season-5','/z49s8YWvrYqV0ZRRmf8g1cNDNZB.jpg','2024-03-13 01:12:30','2024-03-13 01:12:30'),(23,145173,14,'Season 6','6','season-6','/nsXVn5V0JxDu2pNVLqJagor3hUv.jpg','2024-03-13 01:12:34','2024-03-13 01:12:34'),(24,145174,14,'Season 7','7','season-7','/qM16dUnTM1mIOdn1cyv0o3kRNbt.jpg','2024-03-13 01:12:39','2024-03-13 01:12:39'),(25,145175,14,'Season 8','8','season-8','/kv5fRFJLCYlsW9hjn5TSva6oPtN.jpg','2024-03-13 01:12:43','2024-03-13 01:12:43'),(26,145176,14,'Season 9','9','season-9','/wYTuoDTWJq5mHnFtIBrTWm4edg1.jpg','2024-03-13 01:12:46','2024-03-13 01:12:46'),(27,145177,14,'Season 10','10','season-10','/tdBMyNEMZ81yCQGLGxfVDJXtcZj.jpg','2024-03-13 01:12:51','2024-03-13 01:12:51'),(28,145178,14,'Season 11','11','season-11','/gZQZ1LpcgqsNO4TJeuDzmku9Jk2.jpg','2024-03-13 01:12:58','2024-03-13 01:12:58'),(29,145179,14,'Season 12','12','season-12','/x4EpwGtXgg2MxJHHGybpkCKRNWl.jpg','2024-03-13 01:13:00','2024-03-13 01:13:00'),(30,145180,14,'Season 13','13','season-13','/3Mjk6odiLrg4ieUoZsZK3cjDJhT.jpg','2024-03-13 01:13:03','2024-03-13 01:13:03'),(31,145181,14,'Season 14','14','season-14','/tiel0fQxJNmnonHZWRBEfmWveS6.jpg','2024-03-13 01:13:07','2024-03-13 01:13:07'),(32,145182,14,'Season 15','15','season-15','/iaaatANgrKKvO6H7VmVGoEMpV3x.jpg','2024-03-13 01:13:10','2024-03-13 01:13:10'),(33,145184,14,'Season 16','16','season-16','/2SlAWq9hAagEW0mJto3peBF2inR.jpg','2024-03-13 01:13:14','2024-03-13 01:13:14'),(34,102256,14,'Season 17','17','season-17','/1ViMFoAMR3Pg5VBuKGyIo1sXBlz.jpg','2024-03-13 01:13:18','2024-03-13 01:13:18'),(35,141870,14,'Season 18','18','season-18','/xThMRJEZpPNXgrmaEbNT4Iz4wv6.jpg','2024-03-13 01:13:22','2024-03-13 01:13:22');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmdb_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visits` bigint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_tmdb_id_unique` (`tmdb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,'Pride','pride','2004-01-12','/9Ub2BwnLYKoiSaQF93ItyXriCon.jpg',1,'2024-03-06 02:41:43','2024-03-06 02:41:43'),(2,2,'Clerks','clerks','2000-05-31','/xunXvzFlkf1GGgMkCySA9CCFumB.jpg',1,'2024-03-06 02:41:52','2024-03-06 02:41:52'),(3,3,'The Message','the-message','2006-05-20','/wK9h8FwbmOWlMyW6fT2C6yFPvSu.jpg',1,'2024-03-06 02:41:57','2024-03-06 02:41:57'),(4,4,'The Amazing Mrs Pritchard','the-amazing-mrs-pritchard','2006-10-03','/r2iyYZ98eN70C7kkUIYbW3QaJwn.jpg',1,'2024-03-06 02:42:02','2024-03-06 02:42:02'),(5,5,'La Job','la-job','2006-10-09','/heOhqAyj2L64R2HuFZmEay7zqoj.jpg',1,'2024-03-06 02:42:07','2024-03-06 02:42:07'),(6,6,'Strange Days at Blake Holsey High','strange-days-at-blake-holsey-high','2002-10-05','/eMYBf0Wt2kHsH9JWIChu8Tmk86f.jpg',1,'2024-03-06 02:42:14','2024-03-06 02:42:14'),(7,7,'Bugs','bugs','1995-04-01','/Ae1vRALxdMwxvtCR9YgvpKSHkbS.jpg',1,'2024-03-06 02:42:20','2024-03-06 02:42:20'),(8,9,'Match Game','match-game','1973-07-02','/yO1yfYyHemDZAJyLNLz3tCiaNC8.jpg',1,'2024-03-06 02:42:47','2024-03-06 02:42:47'),(9,10,'All in Good Faith','all-in-good-faith','1985-12-30','/h9qveCyL3m6tNOrdhUabZk7khKt.jpg',1,'2024-03-06 02:42:55','2024-03-06 02:42:55'),(10,11,'Strictly Sex with Dr. Drew','strictly-sex-with-dr-drew','2005-06-08','/3hFpUg6Ty25Vs5XgbnNz1Xcirb5.jpg',1,'2024-03-06 02:42:58','2024-03-06 02:42:58'),(11,12,'汉武大帝','汉武大帝','2005-01-03','/sg6tjBKBu62mC9uj2CJPoP0Zl2M.jpg',1,'2024-03-13 01:06:56','2024-03-13 01:06:56'),(12,13,'How do you like Wednesday?','how-do-you-like-wednesday','1996-10-09','/i2MwS6U0XzD8ad6aS3HiTNKz8ov.jpg',1,'2024-03-13 01:09:17','2024-03-13 01:09:17'),(13,14,'Shuriken School','shuriken-school','2006-07-03','/khXHvYKAvGqjtnKoLVYZr8r5yKD.jpg',1,'2024-03-13 01:10:27','2024-03-13 01:10:27'),(14,15,'Mister Rogers\' Neighborhood','mister-rogers-neighborhood','1968-02-19','/qhbeRYVg120cBmc9XvGxvk6EmJF.jpg',1,'2024-03-13 01:11:20','2024-03-13 01:11:20'),(15,17,'Mighty Truck of Stuff','mighty-truck-of-stuff','2005-10-15','/rIIXBA2fbJ47Qj3SrsHWmfw0P5q.jpg',1,'2024-03-13 01:15:09','2024-03-13 01:15:09'),(16,18,'W*A*L*T*E*R','walter','1984-07-17','/fwSw4fl08MVl5w6Q9lVUGIFkZQ2.jpg',1,'2024-03-13 01:15:47','2024-03-13 01:15:47');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('VH12zMRN31A1A5QqWqDl3S9cJK5HTOGtQ6b1qtuA',1,'192.168.0.16','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiblZNUm1xVjZhNWtHNEhBdEZlVVdhTWNJMmtDSFUxaUg1dzhXQVFSRiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNToiaHR0cHM6Ly93d3cubW92aWVhcHBzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJGY5TjRIbkJnaXE4a0NpSVY1SUZFZnVGVWFZYWttNlNuZFQ0QU91QWI0TUJSRDVBVmpLSGJ5Ijt9',1710728749);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggables` (
  `tag_id` int NOT NULL,
  `taggable_id` int NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggables`
--

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
INSERT INTO `taggables` VALUES (2,7,'App\\Models\\Movie'),(3,7,'App\\Models\\Movie'),(4,7,'App\\Models\\Movie'),(2,10,'App\\Models\\Movie'),(4,10,'App\\Models\\Movie'),(2,8,'App\\Models\\Movie'),(4,8,'App\\Models\\Movie'),(3,10,'App\\Models\\Movie'),(4,22,'App\\Models\\Movie'),(4,23,'App\\Models\\Movie'),(3,3,'App\\Models\\Movie');
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_name_unique` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Best TV Show','best-tv-show','2024-03-06 02:11:07','2024-03-06 21:09:26'),(2,'Free Movie','free-movie','2024-03-06 21:10:06','2024-03-06 21:10:06'),(3,'Online Movie','online-movie','2024-03-06 21:10:22','2024-03-06 21:10:22'),(4,'Favorite Movie','favorite-movie','2024-03-12 21:03:18','2024-03-12 21:03:18');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailers_urls`
--

DROP TABLE IF EXISTS `trailers_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailers_urls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `embed_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailerable_id` int NOT NULL,
  `trailerable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailers_urls`
--

LOCK TABLES `trailers_urls` WRITE;
/*!40000 ALTER TABLE `trailers_urls` DISABLE KEYS */;
INSERT INTO `trailers_urls` VALUES (2,'Shaolin Soccer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/bREfcVPssiE\" title=\"shaolin soccer trailer\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',2,'App\\Models\\Movie','2024-03-06 03:26:52','2024-03-06 03:26:52'),(3,'New Police Story','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/DdEvxSxZAdE\" title=\"New Police Story | 新警察故事 | Trailer 1 | HD\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',3,'App\\Models\\Movie','2024-03-06 03:30:25','2024-03-06 03:30:25'),(4,'Argylle','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/Sy6eNs3EW3E\" title=\"Argylle — Official Trailer | Apple TV+\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',4,'App\\Models\\Movie','2024-03-06 19:00:32','2024-03-06 19:00:32'),(6,'Dune','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/w0HgHet0sxg\" title=\"DUNE – FINAL TRAILER\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',6,'App\\Models\\Movie','2024-03-06 19:20:12','2024-03-06 19:20:12'),(7,'Kung Fu Panda 4 | Sand & Spice Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/d2OONzqh2jk\" title=\"Kung Fu Panda 4 | Sand &amp; Spice Trailer\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',7,'App\\Models\\Movie','2024-03-06 19:23:48','2024-03-06 19:23:48'),(8,'SPIDER-MAN: NO WAY HOME - Spider-mans Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/1mTjfMFyPi8\" title=\"SPIDER-MAN: NO WAY HOME - Spider-Mans Trailer\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',8,'App\\Models\\Movie','2024-03-06 19:41:39','2024-03-06 19:41:39'),(9,'WHO KILLED COCK ROBIN?','<iframe width=\"1128\" height=\"635\" src=\"https://www.youtube.com/embed/5Z3Ia-OYb5E\" title=\"WHO KILLED COCK ROBIN official trailer (with English subtitles)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',5,'App\\Models\\Movie','2024-03-06 19:53:01','2024-03-06 19:53:01'),(10,'APEX PREDATOR | UK Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/Pompk1znaIw\" title=\"APEX PREDATOR | UK Trailer | 2021 | Action/Thriller | Bruce Willis &amp; Neal McDonough\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',1,'App\\Models\\Movie','2024-03-06 19:55:26','2024-03-06 19:55:26'),(11,'The Last Samurai - Original Theatrical Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/QZpQrc0R6J0\" title=\"The Last Samurai - Original Theatrical Trailer\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',9,'App\\Models\\Movie','2024-03-06 20:55:26','2024-03-06 20:55:26'),(12,'Official Trailer Jailangkung','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/vDjjl1rqrCU\" title=\"Official Trailer JAILANGKUNG (2017) - Jefri Nichol &amp; Amanda Rawles\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',10,'App\\Models\\Movie','2024-03-06 23:22:28','2024-03-06 23:22:28'),(16,'In the Beginning','<iframe width=\"1128\" height=\"635\" src=\"https://www.youtube.com/embed/7opYNKdj2EQ\" title=\"Tony Howes in All In Good Faith\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',1,'App\\Models\\Episode','2024-03-13 20:53:19','2024-03-13 20:53:19'),(17,'No Stone Unturned','<iframe width=\"1128\" height=\"635\" src=\"https://www.youtube.com/embed/7opYNKdj2EQ\" title=\"Tony Howes in All In Good Faith\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',2,'App\\Models\\Episode','2024-03-13 20:53:58','2024-03-13 20:53:58'),(18,'Citizen Kane Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/sP6oYa_icqU\" title=\"Citizen Kane 80th Anniversary | September 19 &amp; 22 Only\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',21,'App\\Models\\Movie','2024-03-13 21:00:02','2024-03-13 21:00:02'),(19,'Megamind vs. The Doom Syndicate | Official Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/DXb7tWC2W5o\" title=\"MEGAMIND VS. THE DOOM SYNDICATE | Official Trailer\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',11,'App\\Models\\Movie','2024-03-13 21:05:01','2024-03-13 21:05:01'),(20,'Justice League Dark Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/dpPy3sIxbmA\" title=\"Justice League Dark | Justice League Dark Trailer | Warner Bros. Entertainment\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',22,'App\\Models\\Movie','2024-03-13 23:23:52','2024-03-13 23:23:52'),(21,'The Karate Kid - Official Trailer','<iframe width=\"1463\" height=\"822\" src=\"https://www.youtube.com/embed/XY8amUImEu0\" title=\"THE KARATE KID - Official Trailer (HD)\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',23,'App\\Models\\Movie','2024-03-17 19:13:53','2024-03-17 19:13:53');
/*!40000 ALTER TABLE `trailers_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','admin@admin.com',NULL,'$2y$12$f9N4HnBgiq8kCiIV5IFEfuFUaYakm6SndT4AOuAb4MBRD5AVjKHby',NULL,NULL,NULL,'S8w7AAduCrow7ZT2ClayONbZzw09poxVRQdzArSlnGOxZcKJiT3XfWDWwUaU',NULL,NULL,'2024-03-06 02:08:47','2024-03-06 02:08:47'),(2,'Rahmat Rafli','rahmatrafli1@gmail.com',NULL,'$2y$12$U03A7ZaqzDJx0NSRTVg4Bu8pTSN7yUgfZcHwTjY9fUfqKWZp/7df2',NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-06 02:09:45','2024-03-06 02:09:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18  9:39:01
