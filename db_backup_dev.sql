/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.38-0ubuntu0.14.04.1 : Database - tony
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tony` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tony`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `books` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `media` */

insert  into `media`(`id`,`title`,`url`,`created_at`,`updated_at`) values (1,'Hyvä paha pomo','media/books/hyvapahapomo.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `mediables` */

DROP TABLE IF EXISTS `mediables`;

CREATE TABLE `mediables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `mediable_id` int(11) NOT NULL,
  `mediable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mediables` */

insert  into `mediables`(`id`,`media_id`,`mediable_id`,`mediable_type`,`created_at`,`updated_at`) values (1,1,1,'Dunderfelt\\Tony\\News','2014-11-09 16:49:50','2014-11-09 16:49:52'),(2,1,2,'Dunderfelt\\Tony\\News','2014-11-09 16:49:50','2014-11-09 16:49:52'),(3,1,3,'Dunderfelt\\Tony\\News','2014-11-09 16:49:50','2014-11-09 16:49:52');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`migration`,`batch`) values ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_reminders_table',1),('2014_10_12_100000_create_password_resets_table',1),('2014_11_08_164620_create_pages_table',2),('2014_11_08_165743_add_menu_to_pages',3),('2014_11_08_171747_add_link_to_pages',4),('2014_11_09_141726_create_news_table',5),('2014_11_09_141907_create_media_table',5),('2014_11_09_143259_create_books_table',6),('2014_11_09_144048_create_mediables_table',7),('2014_11_09_144630_add_cta_to_news_table',8);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `published` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cta_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cta_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`type`,`body`,`published`,`created_at`,`updated_at`,`cta_link`,`cta_text`) values (1,'Hyvä paha pomo julkaistu','book-release','Tonyn uusi kirja, Hyvä paha pomo (Kauppakamari 2014) julkaistu!',1,'2014-11-09 16:45:47','2014-11-09 16:45:49','none','Katso kirjakaupassa'),(2,'Hyvä paha pomo julkaistu','book-release','Tonyn uusi kirja, Hyvä paha pomo (Kauppakamari 2014) julkaistu!',1,'2014-11-09 16:45:47','2014-11-09 16:45:49','none','Katso kirjakaupassa'),(3,'Hyvä paha pomo julkaistu','book-release','Tonyn uusi kirja, Hyvä paha pomo (Kauppakamari 2014) julkaistu!',1,'2014-11-09 16:45:47','2014-11-09 16:45:49','none','Katso kirjakaupassa');

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pages` */

insert  into `pages`(`id`,`title`,`slug`,`menu`,`type`,`parent`,`body`,`created_at`,`updated_at`,`link`) values (1,'Tervetuloa','/','tony','home',0,'<h2>Tony Dunderfeltin sivuille!</h2>\r\n<p>Keskustelu erilaisten ihmisten kanssa, elämän ilmiöiden pohdinta ja itsetuntemuksen harjoittelu - ne ovat kaikki hienoja asioita, eikö vain. Näiltä sivuilta löydät psykologiaa ja ihmistuntemusta käsitteleviä ajatuksia, kirjoja, artikkeleita ja valmennusta. Toivottavasti ne inspiroivat Sinua ja syventävät ymmärrystäsi elämästä.</p>','2014-11-08 18:51:17','2014-11-08 18:51:21',NULL),(2,'Kirjat','kirjat','','books',0,'<p>Tonyn kirjat.</p>','2014-11-08 18:52:21','2014-11-08 18:52:22',NULL),(3,'Kurssit','kurssit','','text',0,'<p>Tonyn kurssit</p>','2014-11-08 19:00:52','2014-11-08 19:00:54',NULL),(4,'Artikkelit','artikkelit','','articles',0,'<p>Artikkelit</p>','2014-11-08 19:01:47','2014-11-08 19:01:49',NULL),(5,'Valmennus ja terapia','valmennus-ja-terapia','','text',0,'<p>Valmennukset</p>','2014-11-08 19:02:30','2014-11-08 19:02:32',15),(6,'Ota yhteyttä!','yhteydenotto','','text',0,'<p>Yhteydenotto</p>','2014-11-08 19:03:05','2014-11-08 19:03:06',NULL),(7,'Tonyn elämänkulku','tonyn-elama','','text',1,'<p>Tonyn elämänkulku</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(8,'CV lyhyesti','cv','','text',1,'<p>CV</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(9,'Dialogia OY','dialogia','','text',1,'<p>Dialogia</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(10,'Kuvat','kuvat','','gallery',1,'<p>Kuvat</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(11,'Ajankohtaista','ajankohtaista','','news',1,'<p>Ajankohtaista</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(12,'Suositut teemat','suositut-teemat','','text',3,'<p>Suositut teemat</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(13,'Työyhteisön kehittäminen','tyoyhteison-kehittaminen','','text',3,'<p>työ</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(14,'Johtaminen','johtaminen','','text',3,'<p>johto</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(15,'Valmennus','valmennus','','text',5,'<p>Valmennus</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(16,'Terapia','terapia','','text',5,'<p>Terapia</p>','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL);

/*Table structure for table `password_reminders` */

DROP TABLE IF EXISTS `password_reminders`;

CREATE TABLE `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_reminders` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
