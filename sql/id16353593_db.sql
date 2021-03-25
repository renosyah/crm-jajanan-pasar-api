-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2021 at 11:21 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16353593_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image_url`) VALUES
(1, 'Snack', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'reno', '', 'reno@gmail.com', '123'),
(2, 'rikka', '', 'rikka@gmail.com', '123'),
(3, 'riko', '', 'rikko@gmail.com', '123'),
(4, 'ovan', '', 'ovan@gmail.com', 'ovan'),
(5, 'kustiarno', '', 'kustiarno@gmail.com', '1234'),
(6, 'bangbrain', '', 'bangbrain@gmail.com', 'qwerty'),
(7, 'nr', '', 'nr@gmail.com', '1'),
(8, 'kodry', '', 'kodry@gmail.com', '1234'),
(9, 'ocha', '', 'ocha@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaction`
--

CREATE TABLE `detail_transaction` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `detail_transaction`
--

INSERT INTO `detail_transaction` (`id`, `transaction_id`, `product_id`, `quantity`, `price`, `sub_total`) VALUES
(15, 7, 3, 2, 1500, 3000),
(16, 7, 2, 1, 2000, 2000),
(18, 8, 1, 4, 5000, 20000),
(19, 9, 1, 2, 5000, 10000),
(20, 10, 3, 2, 1500, 3000),
(21, 11, 3, 3, 1500, 4500),
(22, 12, 3, 1, 1500, 1500),
(23, 13, 3, 4, 1500, 6000),
(24, 13, 2, 7, 2000, 14000),
(25, 13, 1, 2, 5000, 10000),
(26, 14, 3, 1, 1500, 1500),
(27, 15, 3, 4, 1500, 6000),
(28, 15, 2, 2, 2000, 4000),
(29, 15, 1, 6, 5000, 30000),
(30, 16, 3, 2, 1500, 3000),
(31, 17, 2, 1, 2000, 2000),
(32, 17, 2, 1, 2000, 2000),
(34, 18, 3, 1, 1500, 1500),
(35, 19, 3, 2, 1500, 3000),
(36, 20, 3, 1, 1500, 1500),
(37, 20, 2, 3, 2000, 6000),
(38, 20, 1, 4, 5000, 20000),
(39, 21, 1, 3, 5000, 15000),
(40, 22, 3, 6, 1500, 9000),
(41, 23, 3, 1, 1500, 1500),
(42, 24, 2, 10, 2000, 20000),
(43, 25, 2, 8, 2000, 16000),
(44, 26, 2, 4, 2000, 8000),
(45, 27, 3, 1, 1500, 1500),
(46, 28, 3, 4, 1500, 6000),
(47, 29, 2, 3, 2000, 6000),
(48, 30, 3, 7, 1500, 10500);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `detail`) VALUES
(1, 'Bank BRI', '1444-4444-4444-4444'),
(2, 'Bank BNI', '1555-5555-5555-5555'),
(3, 'Bank Mandiri', '1333-3333-3333-3333');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `default_qty` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `image_url`, `stock`, `rating`, `detail`) VALUES
(1, 1, 'Arem-Arem', 2000, 'https://crm-jajanan-pasar-api.000webhostapp.com/img/aYwHCXRYVF.png', 0, 0, 'Arem-arem merupakan penganan serupa lemper, yaitu nasi berisi sayuran atau sambal goreng yang dibungkus dengan daun pisang. Arem-arem populer sebagai penganan pengganti sarapan. Biasanya ukurannya dibuat lebih besar dari pada lemper.'),
(2, 1, 'Lemper', 2000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/5zUO1rcDSC.png', 0, 0, 'Lemper adalah penganan yang terbuat dari ketan yang biasanya berisi abon atau cincangan daging ayam, dan dibungkus dengan daun pisang. Penganan ini terkenal di seluruh Indonesia sebagai pengganjal perut sebelum memasuki tahap makan besar.'),
(3, 1, 'Kue Lapis', 1500, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/5qwFJlCuky.png', 0, 0, 'Kue lapis adalah makanan khas Indonesia. Kue ini biasanya terdiri dari dua warna yang berlapis-lapis, ini yang memberi nama kue ini. Kue ini dibuat dari tepung beras, tepung kanji, santan, gula pasir, garam dan pewarna. Kue ini dikukus setiap lapisannya sebelum kemudian lapisan di atasnya ditambahkan.'),
(4, 1, 'Kue Lumpur', 2000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/SgoxzXpZiC.png', 0, 0, 'Kue Lumpur yang resepnya terdiri dari telur, gula, tepung dan air santan itu sejenis jajan susu telur (custard), yang semestinya merupakan makanan kecil import dari eropa dari situ bisa di usut asal dari kue tersebut yang sebenarnya dari Lisbon Portugal, disana kue itu dinamakan Pasteis de Nata yaitu Pastel Natal.'),
(5, 1, 'Onde-onde', 1000, 'https://crm-jajanan-pasar-api.000webhostapp.com/img/sVjMLTCAaY.png', 0, 0, 'Onde-onde adalah makanan bulet'),
(6, 1, 'Pastel', 2000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/lRDKeP3JrX.png', 0, 0, 'Kue Pastel adalah kue pastel.'),
(7, 1, 'Pukis', 2000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/jaMftRXgiE.png', 0, 0, 'Kue Pukis adalah kue pukis.'),
(8, 1, 'Risoles', 2000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/tVoNG2RlSb.png', 0, 0, 'Kue Risoles adalah kue risoles.'),
(9, 1, 'Serabi Solo', 1500, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/zxZ00bUPzV.png', 0, 0, 'Kue Serabi Solo adalah Serabi yang berasal dari solo.'),
(10, 1, 'Kue Klepon', 1000, 'http://crm-jajanan-pasar-api.000webhostapp.com/img/24IldC1uxA.png', 0, 0, 'Kue Klepon adalah Klepon yang berbentuk bulat.');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `product_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_detail`
--

CREATE TABLE `recipe_detail` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `step` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recipe_detail`
--

INSERT INTO `recipe_detail` (`id`, `recipe_id`, `step`, `text`) VALUES
(10, 1, 1, '400 gram beras, cuci bersih, lalu diamkan'),
(11, 1, 2, '1000 ml santan'),
(12, 1, 3, '1 buah kelapa parut'),
(13, 1, 4, '3 lembar daun salam'),
(14, 1, 5, 'Garam halus secukupnya'),
(15, 1, 6, 'Daun pisang secukupnya'),
(16, 1, 7, '6 siung bawang merah'),
(17, 1, 8, '4 siung bawang putih'),
(18, 1, 9, '3 lembar daun salam'),
(19, 1, 10, '2 cm lengkuas'),
(20, 1, 11, '200 gram daging ayam tanpa kulit'),
(21, 1, 12, '100 gram wortel, iris dadu kecil'),
(22, 1, 13, '1 batang daun bawang'),
(23, 1, 14, '1 batang daun seledri'),
(24, 1, 15, '2 buah cabai merah'),
(25, 1, 16, '6 buah hati ayam'),
(26, 1, 17, '3 sendok makan minyak goreng'),
(27, 1, 18, 'Garam secukupnya'),
(28, 1, 19, 'Gula pasir secukupnya'),
(29, 2, 1, '400 gram beras, cuci bersih, lalu diamkan'),
(30, 2, 2, '1000 ml santan'),
(31, 2, 3, '1 buah kelapa parut'),
(32, 2, 4, '3 lembar daun salam'),
(33, 2, 5, 'Garam halus secukupnya'),
(34, 2, 6, 'Daun pisang secukupnya'),
(35, 2, 7, '6 siung bawang merah'),
(36, 2, 8, '4 siung bawang putih'),
(37, 2, 9, '3 lembar daun salam'),
(38, 2, 10, '2 cm lengkuas'),
(39, 2, 11, '200 gram daging ayam tanpa kulit'),
(40, 2, 12, '100 gram wortel, iris dadu kecil'),
(41, 2, 13, '1 batang daun bawang'),
(42, 2, 14, '1 batang daun seledri'),
(43, 2, 15, '2 buah cabai merah'),
(44, 2, 16, '6 buah hati ayam'),
(45, 2, 17, '3 sendok makan minyak goreng'),
(46, 2, 18, 'Garam secukupnya'),
(47, 2, 19, 'Gula pasir secukupnya'),
(48, 3, 1, '½ kg tepung beras'),
(49, 3, 2, '¼ kg tepung kanji'),
(50, 3, 3, '8 gelas santan'),
(51, 3, 4, '½ kg gula pasir'),
(52, 3, 5, '1 buah daun pandan'),
(53, 4, 1, '300 cc santan'),
(54, 4, 2, '50 gr mentega'),
(55, 4, 3, '100 gr gula pasir'),
(56, 4, 4, '½ sendok teh garam'),
(57, 4, 5, '¼ sendok teh vanili'),
(58, 4, 6, '100 gr terigu segitiga biru'),
(59, 4, 7, '2 butir telur'),
(60, 4, 8, '125 gr kentang yang sudah dikukus dan dihaluskan'),
(61, 4, 9, '100 cc susu cair full cream'),
(62, 4, 10, 'Pewarna makanan kuning secukupnya'),
(63, 5, 1, '250 gr tepung ketan'),
(64, 5, 2, '35 gr tepung beras'),
(65, 5, 3, '75 gr gula pasir'),
(66, 5, 4, '125 gr kentang kukus, haluskan'),
(67, 5, 5, '1 sendok teh garam'),
(68, 5, 6, '200 ml air'),
(69, 5, 7, 'Wijen secukupnya'),
(70, 5, 8, '100 gr kacang hijau, rendam 1 jam buang kulitnya'),
(71, 5, 9, '50 ml santan kental'),
(72, 5, 10, '50 ml air'),
(73, 5, 11, '60 gr gula pasir'),
(74, 5, 12, '1 lembar daun pandan'),
(75, 5, 13, '¼ sendok teh garam'),
(76, 5, 14, '½ sendok teh bubuk vanili'),
(77, 6, 1, '500 gram terigu protein sedang'),
(78, 6, 2, '1 sendok teh garam'),
(79, 6, 3, '100 gram margarin'),
(80, 6, 4, '150-200 ml air hangat '),
(81, 6, 5, '1 kentang'),
(82, 6, 6, '1 wortel, '),
(83, 6, 7, '3 sendok makan ayam giling'),
(84, 6, 8, '4 butir bawang merah'),
(85, 6, 9, '2 siung bawang putih'),
(86, 6, 10, '1 batang daun bawang, '),
(87, 6, 11, '1 batang seledri'),
(88, 6, 12, 'Garam secukupnya'),
(89, 6, 13, 'Lada bubuk secukupnya'),
(90, 6, 14, 'Kaldu bubuk secukupnya'),
(91, 6, 15, '50 ml air'),
(92, 6, 16, '6 butir telur rebus'),
(93, 7, 1, '½ kg terigu'),
(94, 7, 2, '½ kg gula pasir'),
(95, 7, 3, '5 butir telur'),
(96, 7, 4, '1 sendok fermipan'),
(97, 7, 5, '3 gelas santan kental'),
(98, 8, 1, '150 gram tepung terigu protein sedang'),
(99, 8, 2, '2 butir telur'),
(100, 8, 3, '¼ sendok teh garam'),
(101, 8, 4, '350 ml susu cair'),
(102, 8, 5, '15 gram margarin, lelehkan'),
(103, 8, 6, '500 ml minyak untuk menggoreng'),
(104, 8, 7, '5 butir bawang merah, cincang halus'),
(105, 8, 8, '3 siung bawang putih, cincang halus'),
(106, 8, 9, '150 gram ayam giling'),
(107, 8, 10, '½ sendok makan tepung terigu'),
(108, 8, 11, '150 gram wortel, iris panjang'),
(109, 8, 12, '50 gram buncis, iris miring'),
(110, 8, 13, '75 gram kentang, potong kotak kecil'),
(111, 8, 14, '100 ml air'),
(112, 8, 15, 'Daun bawang secukupnya'),
(113, 8, 16, 'Garam secukupnya'),
(114, 8, 17, 'Merica bubuk secukupnya'),
(115, 8, 18, 'Gula pasir secukupnya'),
(116, 8, 19, 'Seledri secukupnya, iris'),
(117, 8, 20, '2 sendok makan margarin'),
(118, 9, 1, '200 gram tepung beras'),
(119, 9, 2, '2 sendok makan tepung terigu'),
(120, 9, 3, '4 sendok makan gula pasir'),
(121, 9, 4, '1 sendok makan ragi instan'),
(122, 9, 5, '1 sendok teh baking soda'),
(123, 9, 6, '1 sendok teh bubuk vanili'),
(124, 9, 7, '700 ml santan'),
(125, 9, 8, 'Daun pisang secukupnya '),
(126, 9, 9, '100 ml santan kental'),
(127, 10, 1, '200 gr tepung ketan putih'),
(128, 10, 2, '190-200 ml air hangat + pasta pandan'),
(129, 10, 3, '50 gr kelapa parut kering'),
(130, 10, 4, '10 ml santan kara'),
(131, 10, 5, '½ sendok teh garam'),
(132, 10, 6, '40 ml air panas');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `ref_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `ref_id`, `customer_id`, `address`, `total`, `expired_date`) VALUES
(7, 'rX1xSFAeeH', 1, '', 5000, '2021-03-11 05:03:48'),
(8, 'kv3XYp9kgJ', 2, '', 20000, '2021-03-11 05:03:32'),
(9, 'iOyK55nlPA', 2, '', 10000, '2021-03-11 05:03:35'),
(10, 'eUt9oMd6vM', 3, '', 3000, '2021-03-11 05:03:54'),
(11, '4RZUDk70dR', 3, '', 4500, '2021-03-11 05:03:56'),
(12, 'eY863edAyA', 4, '', 1500, '2021-03-11 06:03:03'),
(13, 'bUblfsh10p', 4, '', 30000, '2021-03-11 06:03:54'),
(14, 'ev4A5fkQLg', 1, '', 1500, '2021-03-11 06:03:17'),
(15, '8ZISIH2lQ2', 4, '', 40000, '2021-03-11 07:03:53'),
(16, 'ftVhoKlU0V', 4, '', 3000, '2021-03-11 07:03:19'),
(17, 'rDreYF03qb', 4, '', 4000, '2021-03-11 07:03:11'),
(18, 'xzYGFrls7Z', 1, '', 1500, '2021-03-11 07:03:28'),
(19, 'VtrKjCoO6B', 4, '', 3000, '2021-03-11 07:03:52'),
(20, 'FrBe974tio', 5, '', 27500, '2021-03-11 07:03:03'),
(21, 'VKT0gKtEkT', 1, '', 15000, '2021-03-11 01:03:47'),
(22, 'Og6Lo5bxYw', 6, '', 9000, '2021-03-12 09:03:03'),
(23, 'bVoEgWfmj4', 7, '', 1500, '2021-03-12 09:03:02'),
(24, 'wsx7jMAsYm', 8, '', 0, '2021-03-12 10:03:12'),
(25, 'cqcTfgZs9r', 9, '', 16000, '2021-03-12 10:03:32'),
(26, 'z4X01hSKYr', 1, '', 8000, '2021-03-13 04:03:16'),
(27, 'slXhL4Pqyw', 1, '', 0, '2021-03-13 12:03:26'),
(28, 'KpdZvESV8l', 1, '', 6000, '2021-03-13 01:03:50'),
(29, 'e4XSgyWEAe', 1, '', 6000, '2021-03-13 01:03:38'),
(30, 'ovt6lPNChb', 9, '', 10500, '2021-03-14 11:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validate_transaction`
--

CREATE TABLE `validate_transaction` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `image_url` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `validate_transaction`
--

INSERT INTO `validate_transaction` (`id`, `transaction_id`, `image_url`) VALUES
(7, 7, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/VIp8W5cWq7.jpg'),
(8, 9, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/w3Ow2ODzir.jpg'),
(9, 10, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/kOKULwxshn.jpg'),
(10, 11, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/JER21f7tC8.jpg'),
(11, 13, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/RJtesM4WtD.jpg'),
(12, 14, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/JfiP3e54hu.jpg'),
(13, 16, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/qo7UFAG5GM.jpg'),
(14, 18, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/gGPgcTvgou.jpg'),
(15, 19, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/4BZCdoekBB.jpg'),
(16, 20, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/hrTA4pQs85.jpg'),
(17, 22, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/6sMiKI4zTd.jpg'),
(18, 24, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/JA5wTMvEll.jpg'),
(19, 25, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/nI6z1SA0FQ.jpg'),
(20, 29, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/aaHvjiatzz.jpg'),
(21, 30, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/t5l5ll1xUL.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `validate_transaction`
--
ALTER TABLE `validate_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `validate_transaction`
--
ALTER TABLE `validate_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  ADD CONSTRAINT `detail_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`),
  ADD CONSTRAINT `detail_transaction_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD CONSTRAINT `recipe_detail_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `validate_transaction`
--
ALTER TABLE `validate_transaction`
  ADD CONSTRAINT `validate_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
