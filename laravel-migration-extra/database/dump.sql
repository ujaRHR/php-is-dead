-- -------------------------------------------------------------
-- -------------------------------------------------------------
-- TablePlus 1.0.2
--
-- https://tableplus.com/
--
-- Database: mysql
-- Generation Time: (null)
-- -------------------------------------------------------------

DROP TABLE `laravel_practice`.`brands`;


CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_img` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`categories`;


CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_img` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`migrations`;


CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`personal_access_tokens`;


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

DROP TABLE `laravel_practice`.`product_carts`;


CREATE TABLE `product_carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_carts_email_foreign` (`email`),
  KEY `product_carts_product_id_foreign` (`product_id`),
  CONSTRAINT `product_carts_email_foreign` FOREIGN KEY (`email`) REFERENCES `profiles` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`product_details`;


CREATE TABLE `product_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image4` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_details_product_id_unique` (`product_id`),
  CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`product_reviews`;


CREATE TABLE `product_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_reviews_email_foreign` (`email`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_email_foreign` FOREIGN KEY (`email`) REFERENCES `profiles` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`product_slides`;


CREATE TABLE `product_slides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_slides_product_id_unique` (`product_id`),
  CONSTRAINT `product_slides_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`product_wishes`;


CREATE TABLE `product_wishes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_wishes_email_foreign` (`email`),
  KEY `product_wishes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_wishes_email_foreign` FOREIGN KEY (`email`) REFERENCES `profiles` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_wishes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`products`;


CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(50,2) NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `discount_price` double(50,2) NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` tinyint(1) NOT NULL,
  `star` double(8,2) NOT NULL,
  `remark` enum('new','top','trending','hot','upcoming','special') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `brand_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`profiles`;


CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_email_unique` (`email`),
  CONSTRAINT `profiles_email_foreign` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE `laravel_practice`.`users`;


CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `laravel_practice`.`brands` (`id`, `brand_name`, `brand_img`, `created_at`, `updated_at`) VALUES 
(1, 'Hudson Inc', 'https://via.placeholder.com/640x480.png/007744?text=est', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(2, 'Carroll, Kreiger and Nitzsche', 'https://via.placeholder.com/640x480.png/006655?text=ratione', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(3, 'Heller, Turner and Heaney', 'https://via.placeholder.com/640x480.png/000055?text=nesciunt', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(4, 'Batz Ltd', 'https://via.placeholder.com/640x480.png/00aaee?text=qui', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(5, 'D''Amore Group', 'https://via.placeholder.com/640x480.png/0055dd?text=possimus', '2023-12-16 20:43:08', '2023-12-16 20:43:08');

INSERT INTO `laravel_practice`.`categories` (`id`, `category_name`, `category_img`, `created_at`, `updated_at`) VALUES 
(1, 'quos', 'https://via.placeholder.com/640x480.png/008822?text=omnis', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(2, 'repudiandae', 'https://via.placeholder.com/640x480.png/0077bb?text=esse', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(3, 'ut', 'https://via.placeholder.com/640x480.png/00aa11?text=amet', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(4, 'repellat', 'https://via.placeholder.com/640x480.png/00bb22?text=non', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(5, 'et', 'https://via.placeholder.com/640x480.png/007744?text=amet', '2023-12-16 20:43:08', '2023-12-16 20:43:08');

INSERT INTO `laravel_practice`.`migrations` (`id`, `migration`, `batch`) VALUES 
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_12_04_071418_create_users_table', 1),
(3, '2023_12_04_071419_create_profiles_table', 1),
(4, '2023_12_04_071420_create_categories_table', 1),
(5, '2023_12_04_071421_create_brands_table', 1),
(6, '2023_12_04_071422_create_products_table', 1),
(7, '2023_12_04_071536_create_product_carts_table', 1),
(8, '2023_12_04_071607_create_product_reviews_table', 1),
(9, '2023_12_04_072404_create_product_wishes_table', 1),
(10, '2023_12_04_072430_create_product_details_table', 1),
(11, '2023_12_04_072438_create_product_slides_table', 1);

INSERT INTO `laravel_practice`.`products` (`id`, `title`, `short_des`, `price`, `discount`, `discount_price`, `image`, `stock`, `star`, `remark`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES 
(1, 'recusandae', 'Et reiciendis ipsam impedit quidem praesentium quis fugit voluptate.', 53.32, 1, 8.15, 'https://via.placeholder.com/640x480.png/005588?text=quos', 0, 7.00, 'hot', 5, 5, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(2, 'qui', 'In vero quis dolores saepe fugiat voluptatem ipsa eius id non.', 77.28, 1, 0.51, 'https://via.placeholder.com/640x480.png/00bbaa?text=neque', 0, 9.00, 'new', 4, 1, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(3, 'eligendi', 'Et odit dolores id reprehenderit et qui velit et iure molestiae omnis tempore.', 57.86, 0, 2.91, 'https://via.placeholder.com/640x480.png/00ffbb?text=quo', 0, 7.00, 'special', 5, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(4, 'ut', 'Praesentium molestias totam sit aut at accusantium ullam repellat non eligendi.', 31.52, 1, 1.28, 'https://via.placeholder.com/640x480.png/0055bb?text=doloribus', 0, 8.00, 'new', 4, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(5, 'quo', 'Id ut autem ipsum voluptates natus rerum similique porro dolore ut aut.', 42.58, 1, 4.32, 'https://via.placeholder.com/640x480.png/00ffaa?text=odit', 0, 1.00, 'top', 5, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(6, 'dolor', 'Ut sit qui placeat laudantium deserunt et atque non ut occaecati et.', 70.97, 1, 1.44, 'https://via.placeholder.com/640x480.png/00bb66?text=quia', 0, 5.00, 'trending', 5, 2, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(7, 'nesciunt', 'Unde non nobis consectetur qui itaque ad vel et est voluptas.', 86.42, 1, 4.10, 'https://via.placeholder.com/640x480.png/007766?text=ut', 0, 3.00, 'special', 3, 5, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(8, 'omnis', 'Placeat sint ducimus et qui necessitatibus aut.', 72.78, 1, 3.11, 'https://via.placeholder.com/640x480.png/00bb77?text=sit', 0, 7.00, 'trending', 1, 3, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(9, 'qui', 'Voluptatem tempora dolor voluptatem sit ut porro vitae adipisci.', 86.58, 0, 5.50, 'https://via.placeholder.com/640x480.png/00ccaa?text=voluptatem', 0, 9.00, 'upcoming', 5, 2, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(10, 'et', 'Non distinctio minima corrupti dolorum sint sunt distinctio.', 28.81, 1, 3.64, 'https://via.placeholder.com/640x480.png/00ee55?text=tenetur', 0, 7.00, 'upcoming', 2, 3, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(11, 'facilis', 'Doloremque debitis et temporibus in possimus voluptatem ut qui adipisci et molestiae.', 70.96, 0, 8.88, 'https://via.placeholder.com/640x480.png/000044?text=delectus', 0, 1.00, 'hot', 3, 3, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(12, 'et', 'Sunt totam autem a laudantium et qui est reiciendis.', 66.01, 0, 3.82, 'https://via.placeholder.com/640x480.png/007766?text=praesentium', 0, 4.00, 'upcoming', 2, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(13, 'sit', 'Omnis ex consectetur aspernatur ut et tenetur libero praesentium beatae.', 28.11, 1, 1.38, 'https://via.placeholder.com/640x480.png/0066ee?text=dolorem', 0, 2.00, 'special', 4, 5, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(14, 'expedita', 'Est laudantium at dolor itaque dolor officiis aut quam eligendi.', 57.43, 0, 2.09, 'https://via.placeholder.com/640x480.png/00aa77?text=adipisci', 0, 3.00, 'special', 3, 2, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(15, 'quis', 'Aut explicabo quidem odio sed qui minima repellendus aut doloribus quidem laboriosam sit et.', 19.35, 1, 3.06, 'https://via.placeholder.com/640x480.png/0077cc?text=molestias', 0, 8.00, 'trending', 5, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(16, 'mollitia', 'Fugit quos officiis cupiditate iure sit nulla architecto molestias a voluptas in.', 30.14, 0, 4.96, 'https://via.placeholder.com/640x480.png/009966?text=enim', 0, 8.00, 'hot', 5, 3, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(17, 'voluptates', 'Itaque pariatur eaque harum labore illo commodi omnis.', 91.24, 1, 9.99, 'https://via.placeholder.com/640x480.png/00cc55?text=et', 0, 1.00, 'top', 1, 5, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(18, 'quisquam', 'Libero distinctio aspernatur consequuntur aperiam quia quia nihil numquam dolorem temporibus enim cum voluptate.', 42.23, 1, 0.45, 'https://via.placeholder.com/640x480.png/00cc11?text=quo', 0, 3.00, 'hot', 1, 2, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(19, 'cum', 'Impedit dolor et quibusdam fugiat quia et ut labore.', 72.08, 1, 5.90, 'https://via.placeholder.com/640x480.png/009955?text=at', 0, 6.00, 'new', 2, 4, '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(20, 'facere', 'Quae culpa officia cupiditate minima aspernatur nisi asperiores unde hic architecto nam.', 94.55, 0, 6.02, 'https://via.placeholder.com/640x480.png/002244?text=beatae', 0, 8.00, 'hot', 2, 2, '2023-12-16 20:43:08', '2023-12-16 20:43:08');

INSERT INTO `laravel_practice`.`profiles` (`id`, `first_name`, `last_name`, `mobile`, `city`, `shipping_address`, `email`, `created_at`, `updated_at`) VALUES 
(1, 'Jamison', 'Greenholt', '+19389071438', 'West Herta', '692 Lind Rapids Suite 818', 'alana35@schoen.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(2, 'Frederick', 'Bartoletti', '+13049919806', 'Kossland', '40622 Homenick Drives Apt. 757', 'angelo.miller@kertzmann.biz', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(3, 'Torey', 'Barton', '+12675932333', 'Danielhaven', '3317 Smith Gardens Apt. 110', 'aurelio.rutherford@auer.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(4, 'Clair', 'Huels', '+18587068004', 'Lake Karineberg', '339 Mueller Inlet', 'beer.harmony@gmail.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(5, 'Leonardo', 'Fahey', '+15595820936', 'Ovamouth', '81983 Gladys Station', 'bonita.torp@kirlin.biz', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(6, 'Shannon', 'Orn', '+17148843763', 'Casperstad', '535 Hahn Dale Suite 289', 'cathy45@yahoo.com', '2023-12-16 20:43:08', '2023-12-21 16:08:45'),
(7, 'Monserrat', 'McGlynn', '+19847586536', 'Port Imelda', '1974 Caroline Passage', 'dach.newell@gmail.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(8, 'Alphonso', 'Harber', '+17797039678', 'Dakotamouth', '2658 Lue Cliffs Apt. 348', 'dale48@wisoky.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(9, 'Chandler', 'Bogisich', '+14692590726', 'New Kelley', '8926 Shawn Fork Suite 531', 'ebrekke@gmail.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(10, 'Kathryne', 'Fadel', '+13236843823', 'Wunschmouth', '244 Hayden Hills Suite 454', 'feest.lewis@hotmail.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(11, 'Dylan', 'Mueller', '+12255583734', 'Casperstad', '739 VonRueden Spring Apt. 475', 'jasper.schneider@oberbrunner.com', '2023-12-16 20:43:08', '2023-12-21 16:08:45'),
(12, 'Destany', 'Okuneva', '+14097940234', 'Laurianneberg', '69394 Klein Causeway Suite 145', 'kozey.jayson@conroy.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(13, 'Kiera', 'Bruen', '+12018748798', 'Mosesview', '83901 Wyman Spur', 'krajcik.garett@yahoo.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(14, 'Meghan', 'Tillman', '+13253146942', 'New Florianton', '455 Camren Corners Apt. 138', 'lehner.jamaal@hagenes.biz', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(15, 'Amani', 'Boyer', '+16407419609', 'West Arielle', '547 Schmitt Wells Suite 302', 'lora.koss@lesch.org', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(16, 'Herbert', 'Daugherty', '+12133468353', 'New Tiahaven', '1570 Tyrique Ways', 'mariela68@yahoo.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(17, 'Abdiel', 'Grant', '+14054962502', 'South Julienchester', '424 Barrows Haven Apt. 445', 'monserrate.wintheiser@windler.info', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(18, 'Verona', 'Beatty', '+14069248613', 'Casperstad', '36840 Nolan Grove', 'sherman47@gmail.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(19, 'Jamison', 'Harris', '+19494335069', 'Casperstad', '462 Olaf Summit Suite 904', 'vilma.bergnaum@kulas.com', '2023-12-16 20:43:08', '2023-12-21 16:08:45'),
(20, 'Lenore', 'Gusikowski', '+14699935927', 'Powlowskiburgh', '596 Karl Radial', 'virginie91@hoeger.com', '2023-12-16 20:43:08', '2023-12-16 20:43:08');

INSERT INTO `laravel_practice`.`users` (`id`, `email`, `otp`, `created_at`, `updated_at`) VALUES 
(1, 'ebrekke@gmail.com', '734350', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(2, 'krajcik.garett@yahoo.com', '891604', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(3, 'dale48@wisoky.com', '597417', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(4, 'virginie91@hoeger.com', '282947', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(5, 'sherman47@gmail.com', '905585', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(6, 'angelo.miller@kertzmann.biz', '725226', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(7, 'dach.newell@gmail.com', '295070', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(8, 'kozey.jayson@conroy.com', '106015', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(9, 'feest.lewis@hotmail.com', '445906', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(10, 'alana35@schoen.com', '760834', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(11, 'bonita.torp@kirlin.biz', '171244', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(12, 'jasper.schneider@oberbrunner.com', '725935', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(13, 'aurelio.rutherford@auer.com', '250734', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(14, 'cathy45@yahoo.com', '554590', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(15, 'beer.harmony@gmail.com', '840993', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(16, 'lehner.jamaal@hagenes.biz', '841746', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(17, 'monserrate.wintheiser@windler.info', '280325', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(18, 'mariela68@yahoo.com', '504355', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(19, 'lora.koss@lesch.org', '509661', '2023-12-16 20:43:08', '2023-12-16 20:43:08'),
(20, 'vilma.bergnaum@kulas.com', '169353', '2023-12-16 20:43:08', '2023-12-16 20:43:08');

