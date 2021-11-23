/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.17-MariaDB : Database - laravel_8
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `application_setting` */

DROP TABLE IF EXISTS `application_setting`;

CREATE TABLE `application_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `application_setting` */

/*Table structure for table `cms_module_permissions` */

DROP TABLE IF EXISTS `cms_module_permissions`;

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

DROP TABLE IF EXISTS `cms_modules`;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_modules` */

insert  into `cms_modules`(`id`,`parent_id`,`name`,`route_name`,`icon`,`status`,`sort_order`,`created_at`,`updated_at`,`deleted_at`) values 
(1,0,'Cms Roles Management','cms-roles-management.index','fa fa-key','1',1.00,'2021-08-02 21:14:36',NULL,NULL),
(2,0,'Cms Users Management','cms-users-management.index','fa fa-users','1',2.00,'2021-08-02 21:14:36',NULL,NULL),
(3,0,'Application Setting','admin.application-setting','fa fa-cog','1',3.00,'2021-08-02 21:14:36',NULL,NULL),
(4,0,'Users Management','app-users.index','fa fa-users','1',4.00,'2021-08-02 21:14:36',NULL,NULL);

/*Table structure for table `cms_roles` */

DROP TABLE IF EXISTS `cms_roles`;

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
(1,'Super Admin','super-admin','1','2021-08-02 21:14:35',NULL,NULL);

/*Table structure for table `cms_users` */

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cms_role_id` bigint(20) unsigned NOT NULL,
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

insert  into `cms_users`(`id`,`cms_role_id`,`name`,`username`,`slug`,`email`,`mobile_no`,`password`,`image_url`,`status`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'RetroCube','retrocube','retrocube','admin@retrocube.com','1-8882051816','$2y$10$TP/JAiBt6jIM75BiEDimjuQcPRU..WjM5Tg3ZrLA5pgwQ93i2x.zG',NULL,'1',NULL,'2021-08-02 21:14:36',NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

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

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `mail_templates` */

DROP TABLE IF EXISTS `mail_templates`;

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
(1,'forgot-password','Forgot Password Confirmation','<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\r\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n','[USERNAME],[LINK],[YEAR],[APP_NAME]','2021-08-02 21:14:36',NULL,NULL),
(2,'user_registration','Welcome to [APP_NAME]','<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\r\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n','[USERNAME],[LINK],[YEAR],[APP_NAME]','2021-08-02 21:14:36',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14,'2021_08_29_105840_create_jobs_table',2);

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notification` */

/*Table structure for table `notification_setting` */

DROP TABLE IF EXISTS `notification_setting`;

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

/*Table structure for table `reset_password` */

DROP TABLE IF EXISTS `reset_password`;

CREATE TABLE `reset_password` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reset_password` */

/*Table structure for table `user_api_token` */

DROP TABLE IF EXISTS `user_api_token`;

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
  CONSTRAINT `user_api_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_api_token` */

insert  into `user_api_token`(`id`,`user_id`,`api_token`,`refresh_token`,`udid`,`device_type`,`device_token`,`platform_type`,`platform_id`,`ip_address`,`user_agent`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'3f94ea04afd0307cd0c381528eac8cb348b1113323a283146269669f2b2504bb','89ca00ca1bdd1b22945faacbfbbc7a2e56f1e81844fa3d56a28866e1146c44fa','e772afbf-65a2-4263-9ef9-65a3763d55b5','android','1234567890','custom',NULL,'127.0.0.1','PostmanRuntime/7.26.8','2021-08-29 11:06:12',NULL,NULL),
(13,13,'dfdbb0575904eff04c2ac3cdb05700f37c0a5d2f07736eb05ad2290822fdfd0e','84564422b1e862149179cf76c08d0b46948339964587841e04e0cb6c4269d00d','e772afbf-65a2-4263-9ef9-65a3763d55b5','android','1234567890','custom',NULL,'127.0.0.1','PostmanRuntime/7.26.8','2021-08-29 13:06:34',NULL,NULL);

/*Table structure for table `user_groups` */

DROP TABLE IF EXISTS `user_groups`;

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
(1,'App User','app-user','1','2021-08-02 21:14:36',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  KEY `users_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`user_group_id`,`name`,`username`,`slug`,`email`,`mobile_no`,`password`,`image_url`,`status`,`is_email_verify`,`email_verify_at`,`is_mobile_verify`,`mobile_verify_at`,`country`,`city`,`state`,`zipcode`,`address`,`latitude`,`longitude`,`online_status`,`mobile_otp`,`email_otp`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'Ali Raza','ali-raza','ali-raza','aliraza14@yopmail.com','+92-3242744373','$2y$10$wAcmF0EYZyv9oKAQRkVx3.jmlYFb5WDxp9yhbKbQMFxW7lMlr8V4O',NULL,'1','0',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2021-08-29 11:06:11','2021-08-29 11:06:12',NULL),
(13,1,'Ali Raza','ali-raza1948','ali-raza1948','aliraza15@yopmail.com','+92-3242744385','$2y$10$n5f4B3gQef8UjYho8cD4du4aESCrfL7KQkQfCKJmQ./6n3Dh0ZkRS',NULL,'1','0',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'2021-08-29 13:06:34','2021-08-29 13:06:34',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
