-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 24. mar 2016 ob 15.35
-- Različica strežnika: 10.1.9-MariaDB
-- Različica PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `trgovina`
--

-- --------------------------------------------------------

--
-- Struktura tabele `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `customers`
--

INSERT INTO `customers` (`id`, `name`, `surname`, `email`, `address`, `zip`, `city`, `created_at`, `updated_at`) VALUES
(1, 'Janez', 'Novak', 'j.novak@gmail.com', 'Gorenji Novaki 65', 5282, 'Cerkno', '2016-03-12 11:51:22', '2016-03-12 11:51:22'),
(2, 'Matjaž', 'Kralj', 'kralj.matjaz@gmail.com', 'Ulica kraljev 15', 5000, 'Nova Gorica', '2016-03-13 08:49:35', '2016-03-13 08:49:35'),
(3, 'Marjanca', 'Spodklanca', 'm.spodklanca@gmail.com', 'Pod klancem 5', 5220, 'Tolmin', '2016-03-13 08:50:39', '2016-03-13 08:50:39');

-- --------------------------------------------------------

--
-- Struktura tabele `inventories`
--

CREATE TABLE `inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_03_11_174131_create_vendors_table', 1),
('2016_03_12_100647_create_customers_table', 2),
('2016_03_12_115833_create_suppliers_table', 3),
('2016_03_12_134134_create_packing_units_table', 3),
('2016_03_12_134558_create_products_table', 3),
('2016_03_12_141928_create_seales_table', 3),
('2016_03_12_143334_create_products_sales_table', 4),
('2016_03_12_144352_create_stock_table', 4),
('2016_03_13_105821_create_sales_table', 4);

-- --------------------------------------------------------

--
-- Struktura tabele `packing_units`
--

CREATE TABLE `packing_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `packing_units`
--

INSERT INTO `packing_units` (`id`, `label`, `name`, `created_at`, `updated_at`) VALUES
(1, 'kos', 'kos', NULL, NULL),
(2, 'kg', 'kilogram', NULL, NULL),
(3, 'l', 'liter', NULL, NULL),
(4, 'garn', 'garnitura', NULL, NULL),
(5, 'kpl', 'komplet', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `packing_unit_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `products`
--

INSERT INTO `products` (`id`, `name`, `packing_unit_id`, `supplier_id`, `description`, `unit_price`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 'GARNITURA ORODJA MTECH 1/2 IN 1/4 144 DELNA QG', 4, 2, '\r\n                 Obseg dobave: 13 kos nasadni ključi 6,3 mm (1/4") zevi Quattro Grip 4-14 mm, 11 kos dolgi ključi 6,3 mm (1/4") 4-14 mm, ročaj, reducirna nastavka, 14 kos viličasto obročni ključi 6-19 mm, 9 kos ključi inbus 1,5-10 mm, 20 kos nasadni ključi 12,7 mm (1/2") QG 8-32 mm, 5 kos dolgi ključi 8-19 mm, 4 kos podaljški, TM glava, T ročica, raglji, kardanska zgloba, ključa za svečke 16 in 21 mm, 50 kos vijačni nastavki inbus, križni PH, PZ,matični, ploščati, torx, magnetni nastavek, ključ s polžem 200 mm, klešče kombi 150 mm, papiga 250 mm, ščipalke 150 mm, teleskopski ročaj v kovčku.\r\n       ', 270.00, 'http://cdn.merkurimg.si/media/catalog/product/cache/1/image/163b81649b7ef7bc8a00b0066e59ae0a/g/a/garnitura-orodja-mtech-1_2-in-1_4-144-delna-qg_1579383_.jpg', '2016-03-12 17:55:49', '2016-03-12 17:55:49'),
(2, 'KLEŠČE ZA SNEM. IZOLACIJE UNIOR 160/0.6-10 MM KROMIRANE ART. 478BI', 1, 2, 'Klešče za snemanje izolacije - 478/1BI, material: specialno orodno jeklo, kovane, v celoti poboljšane, robovi rezil induktivno kaljeni, glava klešč polirana, površinska zaščita: kromirane po EN12540, ročaji izolirani z dvo-komponentnimi tulci, Sposobnost snemanja: max. od 0,6-10mm?\r\n                        ', 21.50, 'http://cdn.merkurimg.si/media/catalog/product/cache/1/image/163b81649b7ef7bc8a00b0066e59ae0a/k/l/klesce-za-snem.izol.-unior-160_0.6-10-mm-kromirane-art.-478bi_791578_.jpg', '2016-03-13 07:44:09', '2016-03-13 07:44:09'),
(3, 'TESARSKO KLADIVO UNIOR 550 G Z MAGNETOM ART. 805/1', 1, 2, 'Kladivo krovsko z magnetom - 805A, material: specialno orodno jeklo, kovano, udarna ploskev in konica induktivno kaljeni, površinska zaščita: lakirano, kromiran kovinski ročaj izoliran s plastičnim tulcem, v celoti izdelan v skladu s standardom DIN 7239\r\n                        ', 42.50, 'http://cdn.merkurimg.si/media/catalog/product/cache/1/image/163b81649b7ef7bc8a00b0066e59ae0a/t/e/tesarsko-kladivo-unior-550-g-z-magnetom-art.-805_1_630703_.jpg', '2016-03-13 08:06:57', '2016-03-13 08:06:57');

-- --------------------------------------------------------

--
-- Struktura tabele `products_sales`
--

CREATE TABLE `products_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `products_sales`
--

INSERT INTO `products_sales` (`id`, `product_id`, `sale_id`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 5.00, NULL, NULL),
(3, 1, 3, 2.00, NULL, NULL),
(4, 3, 4, 1.00, NULL, NULL),
(5, 2, 5, 10.00, NULL, NULL),
(6, 1, 6, 1.00, NULL, NULL),
(7, 3, 7, 2.00, NULL, NULL),
(8, 2, 8, 1.00, NULL, NULL),
(9, 3, 9, 2.00, NULL, NULL),
(10, 2, 10, 3.00, NULL, NULL),
(11, 3, 11, 5.00, NULL, NULL),
(12, 1, 12, 1.00, NULL, NULL),
(13, 2, 13, 3.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL,
  `sum_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `vendor_id`, `sale_date`, `sum_total`, `created_at`, `updated_at`) VALUES
(2, 3, 3, '2016-01-12 08:30:00', 212.50, '2016-03-13 17:49:10', '2016-03-13 17:49:10'),
(3, 3, 4, '2016-02-10 07:00:00', 540.00, '2016-03-13 17:54:09', '2016-03-13 17:54:09'),
(4, 1, 1, '2016-01-04 07:00:00', 42.50, '2016-03-13 18:41:24', '2016-03-13 18:41:24'),
(5, 2, 1, '2016-01-04 07:10:00', 215.00, '2016-03-13 18:42:29', '2016-03-13 18:42:29'),
(6, 3, 1, '2016-01-06 08:00:00', 270.00, '2016-03-13 18:44:11', '2016-03-13 18:44:11'),
(7, 2, 1, '2016-02-10 07:15:00', 85.00, '2016-03-14 08:54:38', '2016-03-14 08:54:38'),
(8, 2, 1, '2016-03-14 11:00:00', 21.50, '2016-03-14 11:13:37', '2016-03-14 11:13:37'),
(9, 1, 1, '2016-03-14 11:30:00', 85.00, '2016-03-14 11:17:13', '2016-03-14 11:17:13'),
(10, 2, 3, '2016-02-10 08:15:00', 64.50, '2016-03-14 11:19:55', '2016-03-14 11:19:55'),
(11, 3, 3, '2016-02-11 08:00:00', 212.50, '2016-03-14 11:20:44', '2016-03-14 11:20:44'),
(12, 1, 3, '2016-03-07 07:00:00', 270.00, '2016-03-14 11:32:26', '2016-03-14 11:32:26'),
(13, 2, 3, '2016-03-09 07:00:00', 64.50, '2016-03-14 11:32:54', '2016-03-14 11:32:54');

-- --------------------------------------------------------

--
-- Struktura tabele `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `email`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Mimovrste d.o.o.', 'Gregor Kekec', 'info@mimovrste.com', 'https://www.mimovrste.com/', NULL, NULL),
(2, 'Merkur d.d.', 'Marjetka Cvetka', 'info@merkur.si', 'https://www.merkur.si', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Odloži podatke za tabelo `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `surname`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Janez', 'Kranjski', 'j.kranjski@hobby-market.com', '031-588-663', '2016-03-11 19:04:45', '2016-03-11 19:04:45'),
(3, 'Metka', 'Smetka', 'm.smetka@hobby-market.com', '051-223-332', '2016-03-11 19:10:17', '2016-03-11 19:10:17'),
(4, 'Mojca', 'Pokraculja', 'm.pokraculja@hobby-market.com', '041-558-669', '2016-03-11 19:26:16', '2016-03-11 19:26:16');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indeksi tabele `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `packing_units`
--
ALTER TABLE `packing_units`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indeksi tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `products_sales`
--
ALTER TABLE `products_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

--
-- Indeksi tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeksi tabele `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT tabele `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `packing_units`
--
ALTER TABLE `packing_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT tabele `products_sales`
--
ALTER TABLE `products_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT tabele `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT tabele `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
