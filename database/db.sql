/*
SQLyog Community
MySQL - 10.4.21-MariaDB : Database - shot_shifter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `application_setting` */

CREATE TABLE `application_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_file` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `application_setting` */

insert  into `application_setting`(`id`,`identifier`,`meta_key`,`value`,`is_file`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'application_setting','favicon','images/favicon.png',1,'2021-11-23 12:47:44',NULL,NULL),
(2,'application_setting','logo','images/favicon.png',1,'2021-11-23 12:47:44',NULL,NULL),
(3,'application_setting','application_name','Shot Shifter',0,'2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `breaks` */

CREATE TABLE `breaks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `scene_id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `breaks_slug_unique` (`slug`),
  KEY `breaks_user_id_foreign` (`user_id`),
  KEY `breaks_scene_id_foreign` (`scene_id`),
  CONSTRAINT `breaks_scene_id_foreign` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `breaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `breaks` */

/*Table structure for table `cms_module_permissions` */

CREATE TABLE `cms_module_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cms_role_id` bigint(20) unsigned NOT NULL,
  `cms_module_id` bigint(20) unsigned NOT NULL,
  `is_add` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_delete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_module_permissions_cms_role_id_foreign` (`cms_role_id`),
  KEY `cms_module_permissions_cms_module_id_foreign` (`cms_module_id`),
  CONSTRAINT `cms_module_permissions_cms_module_id_foreign` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_modules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_module_permissions_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_module_permissions` */

/*Table structure for table `cms_modules` */

CREATE TABLE `cms_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-list',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort_order` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_modules_name_unique` (`name`),
  UNIQUE KEY `cms_modules_route_name_unique` (`route_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_modules` */

insert  into `cms_modules`(`id`,`parent_id`,`name`,`route_name`,`icon`,`status`,`sort_order`,`created_at`,`updated_at`,`deleted_at`) values 
(1,0,'Cms Roles Management','cms-roles-management.index','fa fa-key','1',1.00,'2021-11-23 12:47:44',NULL,NULL),
(2,0,'Cms Users Management','cms-users-management.index','fa fa-users','1',2.00,'2021-11-23 12:47:44',NULL,NULL),
(3,0,'Application Setting','admin.application-setting','fa fa-cog','1',3.00,'2021-11-23 12:47:44',NULL,NULL),
(4,0,'Users Management','app-users.index','fa fa-users','1',4.00,'2021-11-23 12:47:44',NULL,NULL),
(5,0,'Content Management','content-management.index','fa fa-tasks','1',5.00,'2021-11-23 12:47:44',NULL,NULL),
(6,0,'FAQ`s','faq.index','fa fa-question-circle-o','1',6.00,'2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `cms_roles` */

CREATE TABLE `cms_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super_admin` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_roles` */

insert  into `cms_roles`(`id`,`name`,`slug`,`is_super_admin`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Super Admin','super-admin','1','2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `cms_users` */

CREATE TABLE `cms_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cms_role_id` bigint(20) unsigned NOT NULL,
  `user_ref_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_users_username_unique` (`username`),
  UNIQUE KEY `cms_users_slug_unique` (`slug`),
  UNIQUE KEY `cms_users_email_unique` (`email`),
  UNIQUE KEY `cms_users_mobile_no_unique` (`mobile_no`),
  KEY `cms_users_cms_role_id_foreign` (`cms_role_id`),
  CONSTRAINT `cms_users_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_users` */

insert  into `cms_users`(`id`,`cms_role_id`,`user_ref_id`,`name`,`username`,`slug`,`email`,`mobile_no`,`password`,`image_url`,`status`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,0,'RetroCube','retrocube','retrocube','admin@retrocube.com','1-8882051816','$2y$10$.t/gWtdgcplQ3yQTFxz60egYXXcsIspFv3uhiPrVmbfWvQAn6md0y',NULL,'1',NULL,'2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `cms_widget_role` */

CREATE TABLE `cms_widget_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cms_widget_id` bigint(20) unsigned NOT NULL,
  `cms_role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_widget_role_cms_widget_id_foreign` (`cms_widget_id`),
  KEY `cms_widget_role_cms_role_id_foreign` (`cms_role_id`),
  CONSTRAINT `cms_widget_role_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_widget_role_cms_widget_id_foreign` FOREIGN KEY (`cms_widget_id`) REFERENCES `cms_widgets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_widget_role` */

/*Table structure for table `cms_widgets` */

CREATE TABLE `cms_widgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `div_column_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_type` enum('small_box','line_chart','bar_chat','pie_chart','map_chart') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_widgets_widget_type_index` (`widget_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_widgets` */

insert  into `cms_widgets`(`id`,`title`,`description`,`icon`,`color`,`div_column_class`,`link`,`widget_type`,`sql`,`config`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Total User',NULL,'icon-user','#4b71fa','col-md-3','/admin/app-users','small_box','Select count(*) from users limit 1','','0',NULL,NULL,NULL),
(2,'Total Roles',NULL,'icon-people','#7bcb4d','col-md-3','/admin/app-users','small_box','Select count(*) from users limit 1','','0',NULL,NULL,NULL),
(3,'Total User',NULL,'icon-user','#4b71fa','col-md-3','/admin/app-users','small_box','Select count(*) from users limit 1','','0',NULL,NULL,NULL),
(4,'Total Roles',NULL,'icon-people','#7bcb4d ','col-md-3','/admin/app-users','small_box','Select count(*) from users limit 1','','0',NULL,NULL,NULL),
(5,'Users',NULL,'icon-user','#fff','col-md-12','/admin/app-users','line_chart','SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users where YEAR(created_at) = YEAR(now()) group by MONTH(created_at) order by MONTH(created_at) asc','','0',NULL,NULL,NULL);

/*Table structure for table `content_management` */

CREATE TABLE `content_management` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_management_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `content_management` */

insert  into `content_management`(`id`,`title`,`slug`,`content`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Terms Condition','terms-condition','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',1,'2020-02-11 15:01:25',NULL,NULL),
(2,'Privacy Policy','privacy-policy','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',1,'2020-02-11 15:01:25',NULL,NULL),
(3,'About Us','about-us','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',1,'2020-02-11 15:01:25',NULL,NULL);

/*Table structure for table `failed_jobs` */

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `faqs` */

CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faqs` */

insert  into `faqs`(`id`,`slug`,`question`,`answer`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'619ce2f10c150619ce2f10c152','How to change the language','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',1,'2020-02-17 15:45:47',NULL,NULL),
(2,'619ce2f10c154619ce2f10c155','How to restore your chat history','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',1,'2020-02-17 15:51:16',NULL,NULL);

/*Table structure for table `feeling_activity` */

CREATE TABLE `feeling_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feeling_activity_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `feeling_activity` */

/*Table structure for table `jobs` */

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `mail_templates` */

CREATE TABLE `mail_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_templates_identifier_unique` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mail_templates` */

insert  into `mail_templates`(`id`,`identifier`,`subject`,`body`,`wildcard`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'forgot-password','Forgot Password Confirmation','<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\r\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n','[USERNAME],[LINK],[YEAR],[APP_NAME]','2021-11-23 12:47:44',NULL,NULL),
(2,'user_registration','Welcome to [APP_NAME]','<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\r\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n','[USERNAME],[LINK],[YEAR],[APP_NAME]','2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `media` */

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `media_type` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_module_module_id_index` (`module`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_08_19_000000_create_failed_jobs_table',1),
(2,'2021_03_05_000000_create_cms_roles_table',1),
(3,'2021_03_05_172240_create_cms_users_table',1),
(4,'2021_03_05_174918_create_cms_modules_table',1),
(5,'2021_03_05_175415_create_cms_module_permissions_table',1),
(6,'2021_03_06_185651_create_mail_templates_table',1),
(7,'2021_03_08_191839_create_reset_password_table',1),
(8,'2021_03_13_121206_create_application_setting_table',1),
(9,'2021_04_20_200223_create_user_groups_table',1),
(10,'2021_04_20_200451_create_users_table',1),
(11,'2021_04_20_202053_create_user_api_token_table',1),
(12,'2021_06_04_181436_create_notification_table',1),
(13,'2021_06_06_130550_create_notification_setting_table',1),
(14,'2021_08_29_105840_create_jobs_table',1),
(15,'2021_09_07_154417_create_cms_widgets_table',1),
(16,'2021_09_07_161059_create_cms_widget_role_table',1),
(17,'2021_09_08_081135_create_content_management_table',1),
(18,'2021_09_08_082346_create_faqs_table',1),
(19,'2021_09_20_180624_create_media_table',1),
(20,'2021_10_05_172625_user_follow',1),
(21,'2021_10_12_155219_post',1),
(22,'2021_10_12_161817_post_tagged_user',1),
(23,'2021_10_12_162512_post_media',1),
(24,'2021_10_12_163704_post_like',1),
(25,'2021_10_12_164023_reactions',1),
(26,'2021_10_12_164452_post_comments',1),
(27,'2021_10_12_164953_post_share',1),
(28,'2021_10_12_165719_post_report',1),
(29,'2021_10_13_165453_feeling_activity',1),
(30,'2021_11_24_081654_create_shot_list_table',2),
(31,'2021_11_24_081858_create_scenes_table',2),
(32,'2021_11_24_081933_create_breaks_table',2),
(33,'2021_11_24_081958_create_user_share_table',2),
(34,'2021_11_24_082347_create_user_member_table',2);

/*Table structure for table `notification` */

CREATE TABLE `notification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `actor_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `target_id` int(11) NOT NULL,
  `target_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `reference_id` int(11) NOT NULL,
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_redirect_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_unique_id_identifier_target_id_index` (`unique_id`,`identifier`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notification` */

/*Table structure for table `notification_setting` */

CREATE TABLE `notification_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_setting_user_id_index` (`user_id`),
  CONSTRAINT `notification_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notification_setting` */

/*Table structure for table `post_comments` */

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `reaction_id` int(11) NOT NULL DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_like` int(11) NOT NULL DEFAULT 0,
  `total_reply` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_comments` */

/*Table structure for table `post_like` */

CREATE TABLE `post_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `reaction_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_like_post_id_foreign` (`post_id`),
  KEY `post_like_user_id_foreign` (`user_id`),
  CONSTRAINT `post_like_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_like_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_like` */

/*Table structure for table `post_media` */

CREATE TABLE `post_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` enum('image','video','audio','doc','pdf','xlx') COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `media_type` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_media_post_id_foreign` (`post_id`),
  CONSTRAINT `post_media_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_media` */

/*Table structure for table `post_report` */

CREATE TABLE `post_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_report_post_id_foreign` (`post_id`),
  KEY `post_report_user_id_foreign` (`user_id`),
  CONSTRAINT `post_report_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_report_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_report` */

/*Table structure for table `post_share` */

CREATE TABLE `post_share` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_share_post_id_foreign` (`post_id`),
  KEY `post_share_user_id_foreign` (`user_id`),
  CONSTRAINT `post_share_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_share_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_share` */

/*Table structure for table `post_tagged_user` */

CREATE TABLE `post_tagged_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tagged_user_user_id_foreign` (`user_id`),
  KEY `post_tagged_user_post_id_foreign` (`post_id`),
  CONSTRAINT `post_tagged_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tagged_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_tagged_user` */

/*Table structure for table `posts` */

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `privacy_type` enum('everyone','friends','friends_except','only_me') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'everyone',
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_style` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_color` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` enum('post','feeling_activity') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `feeling_activity_id` int(11) NOT NULL DEFAULT 0,
  `total_like` int(11) NOT NULL DEFAULT 0,
  `total_dislike` int(11) NOT NULL DEFAULT 0,
  `total_comment` int(11) NOT NULL DEFAULT 0,
  `total_view` int(11) NOT NULL DEFAULT 0,
  `total_share` int(11) NOT NULL DEFAULT 0,
  `total_report` int(11) NOT NULL DEFAULT 0,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

/*Table structure for table `reactions` */

CREATE TABLE `reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reactions` */

/*Table structure for table `reset_password` */

CREATE TABLE `reset_password` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reset_password` */

insert  into `reset_password`(`id`,`module`,`email`,`token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'users','ali.raza5@yopmail.org','DKPY4nNYH8hxDFLaqLkAr10uedfm2G8KU9cI7VDG7spGQSyzPpC9PvFkMrxjBG2Yu5w66kcpoNypOvfoTS5IlDgnP2iZ9RSb2A9XM37E4XsJiUztATNdrLveJtnwMN7gIgeBDxIXYfTlswtLFzLd3w','2021-11-23 13:09:10',NULL,NULL);

/*Table structure for table `scenes` */

CREATE TABLE `scenes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shot_list_id` bigint(20) unsigned NOT NULL,
  `size` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angle` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lens` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_external` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sun_time` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_pin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wardrobe` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `props` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sound` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timepicker` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lines_dialogue_english` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lines_dialogue_foreign` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `camera` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_complete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scenes_slug_unique` (`slug`),
  KEY `scenes_shot_list_id_foreign` (`shot_list_id`),
  CONSTRAINT `scenes_shot_list_id_foreign` FOREIGN KEY (`shot_list_id`) REFERENCES `shot_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `scenes` */

insert  into `scenes`(`id`,`shot_list_id`,`size`,`title`,`slug`,`image_url`,`description`,`angle`,`lens`,`internal_external`,`sun_time`,`location`,`location_pin`,`cast`,`wardrobe`,`props`,`action`,`speed`,`sound`,`timepicker`,`lines_dialogue_english`,`lines_dialogue_foreign`,`camera`,`is_complete`,`sort_order`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'size','title','1637758604619e368c127a4','scene/3xbguOfazbFWPMCLxXLmS5dx7v2q2IQaNnxLkq9M.jpg','test description','test angle','test lens','internel externel','sun time','location','location pin','cast','wardrobe','props','action','speed','sound','timepicker','lines_dialogue_english','lines_dialogue_foreign','camera','0',NULL,'1','2021-11-24 12:56:44','2021-11-24 12:56:44',NULL),
(2,1,'size','title','1637758991619e380f1fac8','scene/X0kOIToDuWcDHQAaZaRVemzGtjDfhx8ncAsAGj7R.jpg','test description','test angle','test lens','internel externel','sun time','location','location pin','cast','wardrobe','props','action','speed','sound','timepicker','lines_dialogue_english','lines_dialogue_foreign','camera','0',NULL,'1','2021-11-24 13:03:11','2021-11-24 13:55:09','2021-11-24 13:55:09'),
(3,1,'size','title','1637761908619e43746a5d0','scene/zpxQyZ4PkrldIzfbadBvAVrEOgty7k568ac1IzUz.jpg','test description','test angle','test lens','internel externel','sun time','location','location pin','cast','wardrobe','props','action','speed','sound','timepicker','lines_dialogue_english','lines_dialogue_foreign','camera','0',NULL,'1','2021-11-24 13:51:48','2021-11-24 13:51:48',NULL),
(4,1,'size','title','1637761927619e4387aa167','scene/2N3oITjoHytiZhXTviVnClMt14AHfl04EQo3GCbh.jpg','test description','test angle','test lens','internel externel','sun time','location','location pin','cast','wardrobe','props','action','speed','sound','timepicker','lines_dialogue_english','lines_dialogue_foreign','camera','0',NULL,'1','2021-11-24 13:52:07','2021-11-24 13:52:07',NULL),
(5,1,'size','title','1637763513619e49b9b4936','scene/07joe28O6yCnih1wvq4Kw6sJkOtSr2wHVwX7hL8s.jpg','test description','test angle','test lens','internel externel','sun time','location','location pin','cast','wardrobe','props','action','speed','sound','timepicker','lines_dialogue_english','lines_dialogue_foreign','camera','0',NULL,'1','2021-11-24 14:18:33','2021-11-24 14:18:33',NULL);

/*Table structure for table `shot_list` */

CREATE TABLE `shot_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lock` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_pin` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total_scene` int(11) NOT NULL DEFAULT 0,
  `total_completed_scene` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shot_list_slug_unique` (`slug`),
  KEY `shot_list_user_id_foreign` (`user_id`),
  CONSTRAINT `shot_list_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `shot_list` */

insert  into `shot_list`(`id`,`user_id`,`name`,`slug`,`image_url`,`description`,`is_lock`,`is_pin`,`sort_order`,`status`,`total_scene`,`total_completed_scene`,`created_at`,`updated_at`,`deleted_at`) values 
(1,4,'test','1637750432619e16a047715','shot_list/OYpfQRXuMai1cLVAXPo4PyIuRuFDGYCvplKqwRHm.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','0','0',NULL,'1',1,0,'2021-11-24 10:40:32','2021-11-24 10:40:32',NULL),
(2,4,'test','1637750802619e1812c2b64','shot_list/RbpdYFoT5oOvU2xZX02HPgIPBumdMrzPPwptpEVa.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','0','0',NULL,'1',0,0,'2021-11-24 10:46:42','2021-11-24 10:46:42',NULL),
(3,4,'testssss','1637750840619e183858728','shot_list/saXwDWzy1vzr5mx7lS12pydtSzPgQQarfQZAPeep.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book','0','0',NULL,'1',0,0,'2021-11-24 10:47:20','2021-11-24 12:34:03','2021-11-24 12:34:03'),
(4,4,'test','1637763473619e4991bbd5f','shot_list/kfqLmz34Ou1BamSrt8hRNuTPsHsR7HUeW0KzdmdF.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','0','0',NULL,'1',0,0,'2021-11-24 14:17:53','2021-11-24 14:17:53',NULL);

/*Table structure for table `user_api_token` */

CREATE TABLE `user_api_token` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_token_api_token_unique` (`api_token`),
  UNIQUE KEY `user_api_token_refresh_token_unique` (`refresh_token`),
  KEY `user_api_token_user_id_foreign` (`user_id`),
  KEY `user_api_token_api_token_index` (`api_token`),
  CONSTRAINT `user_api_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_api_token` */

insert  into `user_api_token`(`id`,`user_id`,`api_token`,`refresh_token`,`udid`,`device_type`,`device_token`,`platform_type`,`platform_id`,`ip_address`,`user_agent`,`created_at`,`updated_at`,`deleted_at`) values 
(5,4,'51ba8566485f7992cb64885186643b9d944a1bceb95eaddd97ad1b2ce241060f','94fdba6983f91d06bc43020ea5e7f8cde67a6be63d17c8ee531f559447bb85ff','api.Pd*!(5675','android','1234567890','custom',NULL,'127.0.0.1','PostmanRuntime/7.26.8','2021-11-24 10:26:05',NULL,NULL);

/*Table structure for table `user_follow` */

CREATE TABLE `user_follow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_follow_slug_unique` (`slug`),
  KEY `user_follow_target_id_foreign` (`target_id`),
  KEY `user_follow_actor_id_target_id_slug_status_index` (`actor_id`,`target_id`,`slug`,`status`),
  CONSTRAINT `user_follow_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_follow_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_follow` */

/*Table structure for table `user_groups` */

CREATE TABLE `user_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_groups` */

insert  into `user_groups`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'App User','app-user','1','2021-11-23 12:47:44',NULL,NULL);

/*Table structure for table `user_member` */

CREATE TABLE `user_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_member_actor_id_foreign` (`actor_id`),
  KEY `user_member_target_id_foreign` (`target_id`),
  CONSTRAINT `user_member_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_member_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_member` */

/*Table structure for table `user_share` */

CREATE TABLE `user_share` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `shot_list_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_share_actor_id_foreign` (`actor_id`),
  KEY `user_share_target_id_foreign` (`target_id`),
  KEY `user_share_shot_list_id_foreign` (`shot_list_id`),
  CONSTRAINT `user_share_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_share_shot_list_id_foreign` FOREIGN KEY (`shot_list_id`) REFERENCES `shot_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_share_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_share` */

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_email_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verify_at` datetime DEFAULT NULL,
  `is_mobile_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_verify_at` datetime DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_setting` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  KEY `index1` (`user_group_id`,`slug`,`email`,`mobile_no`,`is_email_verify`,`status`),
  CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`user_group_id`,`name`,`username`,`slug`,`email`,`mobile_no`,`password`,`image_url`,`status`,`is_email_verify`,`email_verify_at`,`is_mobile_verify`,`mobile_verify_at`,`country`,`city`,`state`,`zipcode`,`address`,`latitude`,`longitude`,`online_status`,`mobile_otp`,`email_otp`,`notification_setting`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(4,1,'Ali Raza','ali-raza','ali-raza','ali.raza5@abtach.org','92-111222335','$2y$10$NLK5E9fNwRToYHpqTHkY1u1zPxZauGUDlc.AU3TWTtmT1y5GzNMEa','users/AEN85nEUnhymaVqXGpm2U5Z4h9ZweohWG9QXxWiJ.jpg','1','0',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,'0',NULL,'2021-11-24 10:26:05','2021-11-24 10:26:05',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
