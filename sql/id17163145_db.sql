-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 18, 2021 at 04:02 AM
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
-- Database: `id17163145_db`
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
(9, 'ocha', '', 'ocha@gmail.com', '1234'),
(10, 'gani', 'gani', 'gani@gmail.com', '123'),
(11, 'bedul', '', 'ahfikri58@gmail.com', '1234'),
(12, 'lira', '', 'lira@gmail.com', '1234'),
(13, 'kiano', '', 'kiano@gmail.com', '1234');

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
(48, 30, 3, 7, 1500, 10500),
(49, 31, 8, 4, 2000, 8000),
(50, 31, 6, 2, 2000, 4000),
(51, 31, 2, 3, 2000, 6000),
(52, 31, 3, 2, 1500, 3000),
(53, 31, 1, 1, 2000, 2000),
(56, 32, 1, 3, 2000, 6000),
(57, 32, 4, 4, 2000, 8000),
(58, 32, 6, 3, 2000, 6000),
(59, 32, 2, 6, 2000, 12000),
(60, 32, 3, 2, 1500, 3000),
(63, 33, 2, 20, 2000, 40000),
(64, 34, 1, 1, 2000, 2000),
(65, 35, 8, 10, 2000, 20000),
(66, 36, 2, 3, 2000, 6000),
(67, 36, 8, 4, 2000, 8000),
(69, 37, 8, 10, 2000, 20000),
(70, 37, 7, 10, 2000, 20000),
(72, 38, 4, 7, 2000, 14000),
(73, 38, 7, 6, 2000, 12000),
(74, 38, 8, 4, 2000, 8000),
(75, 39, 1, 11, 2000, 22000),
(76, 39, 10, 4, 1000, 4000),
(78, 40, 3, 1, 1500, 1500),
(79, 41, 2, 1, 2000, 2000),
(80, 42, 2, 2, 2000, 4000),
(81, 42, 1, 10, 8000, 8000),
(83, 43, 11, 10, 8000, 8000),
(84, 44, 11, 10, 8000, 8000),
(85, 44, 1, 3, 2000, 6000),
(87, 45, 11, 10, 8000, 8000),
(88, 45, 2, 2, 2000, 4000),
(90, 46, 2, 1, 2000, 2000),
(91, 47, 2, 1, 2000, 2000),
(92, 48, 2, 1, 2000, 2000),
(93, 49, 3, 2, 1500, 3000),
(94, 49, 11, 10, 8000, 8000),
(95, 49, 1, 4, 2000, 8000),
(96, 50, 3, 2, 1500, 3000),
(97, 50, 4, 4, 2000, 8000),
(98, 50, 8, 3, 2000, 6000),
(99, 51, 9, 3, 1500, 4500),
(100, 51, 8, 4, 2000, 8000),
(101, 51, 4, 5, 2000, 10000),
(102, 52, 10, 1, 1000, 1000),
(103, 53, 6, 2, 2000, 4000),
(104, 53, 10, 1, 1000, 1000),
(106, 54, 11, 10, 8000, 8000),
(107, 55, 11, 10, 8000, 8000),
(108, 56, 1, 2, 2000, 4000),
(109, 57, 1, 8, 2000, 16000),
(110, 57, 10, 4, 1000, 4000),
(111, 57, 2, 2, 2000, 4000),
(112, 59, 1, 1, 2000, 2000),
(113, 61, 2, 1, 2000, 2000),
(114, 62, 3, 1, 1500, 1500),
(115, 62, 1, 1, 2000, 2000),
(117, 63, 1, 1, 2000, 2000),
(118, 64, 1, 1, 2000, 2000),
(119, 65, 1, 1, 2000, 2000),
(120, 66, 1, 15, 2000, 30000),
(121, 67, 1, 1, 2000, 2000),
(122, 68, 3, 6, 1500, 9000),
(123, 69, 3, 8, 1500, 12000),
(124, 70, 9, 2, 1500, 3000),
(125, 70, 8, 1, 2000, 2000),
(127, 71, 4, 2, 2000, 4000),
(128, 72, 6, 1, 2000, 2000),
(129, 73, 1, 3, 2000, 6000),
(130, 74, 11, 10, 8000, 8000),
(131, 74, 4, 4, 2000, 8000),
(132, 74, 10, 4, 1000, 4000),
(133, 75, 10, 2, 1000, 2000),
(134, 75, 1, 2, 2000, 4000),
(136, 76, 2, 1, 2000, 2000),
(137, 77, 1, 4, 2000, 8000),
(138, 78, 5, 3, 1000, 3000),
(139, 79, 10, 1, 1000, 1000),
(140, 80, 1, 1, 2000, 2000),
(141, 81, 1, 1, 2000, 2000),
(142, 82, 1, 1, 2000, 2000),
(143, 83, 1, 1, 2000, 2000),
(144, 84, 1, 1, 2000, 2000),
(145, 85, 1, 1, 2000, 2000),
(146, 86, 1, 1, 2000, 2000),
(147, 87, 2, 1, 2000, 2000),
(148, 88, 1, 1, 2000, 2000),
(149, 89, 1, 1, 2000, 2000);

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
  `product_type` int(11) DEFAULT NULL,
  `default_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `image_url`, `stock`, `rating`, `detail`, `product_type`, `default_qty`) VALUES
(1, 1, 'Arem-Arem', 2000, 'https://japas-api.000webhostapp.com/img/aYwHCXRYVF.png', 0, 0, 'Arem-arem merupakan penganan serupa lemper, yaitu nasi berisi sayuran atau sambal goreng yang dibungkus dengan daun pisang. Arem-arem populer sebagai penganan pengganti sarapan. Biasanya ukurannya dibuat lebih besar dari pada lemper.', 0, 1),
(2, 1, 'Lemper', 2000, 'https://japas-api.000webhostapp.com/img/5zUO1rcDSC.png', 0, 0, 'Lemper adalah penganan yang terbuat dari ketan yang biasanya berisi abon atau cincangan daging ayam, dan dibungkus dengan daun pisang. Penganan ini terkenal di seluruh Indonesia sebagai pengganjal perut sebelum memasuki tahap makan besar.', 0, 1),
(3, 1, 'Kue Lapis', 1500, 'https://japas-api.000webhostapp.com/img/5qwFJlCuky.png', 0, 0, 'Kue lapis adalah makanan khas Indonesia. Kue ini biasanya terdiri dari dua warna yang berlapis-lapis, ini yang memberi nama kue ini. Kue ini dibuat dari tepung beras, tepung kanji, santan, gula pasir, garam dan pewarna. Kue ini dikukus setiap lapisannya sebelum kemudian lapisan di atasnya ditambahkan.', 0, 1),
(4, 1, 'Kue Lumpur', 2000, 'https://japas-api.000webhostapp.com/img/SgoxzXpZiC.png', 0, 0, 'Kue Lumpur yang resepnya terdiri dari telur, gula, tepung dan air santan itu sejenis jajan susu telur (custard), yang semestinya merupakan makanan kecil import dari eropa dari situ bisa di usut asal dari kue tersebut yang sebenarnya dari Lisbon Portugal, disana kue itu dinamakan Pasteis de Nata yaitu Pastel Natal.', 0, 1),
(5, 1, 'Onde-onde', 1000, 'https://japas-api.000webhostapp.com/img/sVjMLTCAaY.png', 0, 0, 'Onde-onde ini berisi kacang hijau sehingga memiliki rasa yang sedikit gurih dan cocok dengan lidah orang Indonesia. ', 0, 1),
(6, 1, 'Pastel', 2000, 'https://japas-api.000webhostapp.com/img/lRDKeP3JrX.png', 0, 0, 'Makanan ini sebenarnya sejenis pastry yang dibuat dari tepung terigu. Bentuknya seperti kerang di mana bagian dalamnya diberikan isian wortel dan bihun.', 0, 1),
(7, 1, 'Pukis', 2000, 'https://japas-api.000webhostapp.com/img/jaMftRXgiE.png', 0, 0, 'Kue Pukis, kue yang terbuat dari adonan tepung terigu dan ditambah dengan taburan coklat ceres diatasnya Ketika sudah matang dan diangkat dari cetakannya.', 0, 1),
(8, 1, 'Risoles', 2000, 'https://japas-api.000webhostapp.com/img/tVoNG2RlSb.png', 0, 0, 'Risoles ini berisi daging dan sayuran, risoles yang biasanya dinikmati di Indonesia juga berisi ragout atau daging dan sayuran yang dibuat dalam bentuk padat.', 0, 1),
(9, 1, 'Serabi Solo', 1500, 'https://japas-api.000webhostapp.com/img/zxZ00bUPzV.png', 0, 0, 'Serabi Solo atau dikenal juga dengan nama serabi Solo terbuat dari tepung beras, gula santan kelapa dan garam. Biasanya tepung beras yang digunakan ini diolah sendiri dan bukan dari tepung beras instan.', 0, 1),
(10, 1, 'Kue Klepon', 1000, 'https://japas-api.000webhostapp.com/img/24IldC1uxA.png', 0, 0, 'Kue Klepon merupakan jajanan tradisional khas Indonesia yang terbuat dari tepung ketan. Kue ini memiliki bentuk bulat berukuran mini dengan warna hijau muda, mirip dengan onde-onde. Kue klepon berisikan irisan gula merah dengan bagian luarnya yang ditaburi kelapa parut.', 0, 1),
(11, 1, 'Arem-Arem (Promo)', 8000, 'https://japas-api.000webhostapp.com/img/aYwHCXRYVF.png', 0, 0, 'Arem-arem merupakan penganan serupa lemper, yaitu nasi berisi sayuran atau sambal goreng yang dibungkus dengan daun pisang. Arem-arem populer sebagai penganan pengganti sarapan. Biasanya ukurannya dibuat lebih besar dari pada lemper.', 1, 10);

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
(10, 10),
(11, 11);

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
(132, 10, 6, '40 ml air panas'),
(133, 11, 1, '400 gram beras, cuci bersih, lalu diamkan'),
(134, 11, 2, '1000 ml santan'),
(135, 11, 3, '1 buah kelapa parut'),
(136, 11, 4, '3 lembar daun salam'),
(137, 11, 5, 'Garam halus secukupnya'),
(138, 11, 6, 'Daun pisang secukupnya'),
(139, 11, 7, '6 siung bawang merah'),
(140, 11, 8, '4 siung bawang putih'),
(141, 11, 9, '3 lembar daun salam'),
(142, 11, 10, '2 cm lengkuas'),
(143, 11, 11, '200 gram daging ayam tanpa kulit'),
(144, 11, 12, '100 gram wortel, iris dadu kecil'),
(145, 11, 13, '1 batang daun bawang'),
(146, 11, 14, '1 batang daun seledri'),
(147, 11, 15, '2 buah cabai merah'),
(148, 11, 16, '6 buah hati ayam'),
(149, 11, 17, '3 sendok makan minyak goreng'),
(150, 11, 18, 'Garam secukupnya'),
(151, 11, 19, 'Gula pasir secukupnya');

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

INSERT INTO `transaction` (`id`, `ref_id`, `customer_id`, `address`, `total`, `expired_date`, `transaction_date`) VALUES
(7, 'rX1xSFAeeH', 1, '', 5000, '2021-03-11 05:03:48', '2021-03-26 00:00:00'),
(8, 'kv3XYp9kgJ', 2, '', 20000, '2021-03-11 05:03:32', '2021-03-26 00:00:00'),
(9, 'iOyK55nlPA', 2, '', 10000, '2021-03-11 05:03:35', '2021-03-26 00:00:00'),
(10, 'eUt9oMd6vM', 3, '', 3000, '2021-03-11 05:03:54', '2021-03-26 00:00:00'),
(11, '4RZUDk70dR', 3, '', 4500, '2021-03-11 05:03:56', '2021-03-26 00:00:00'),
(12, 'eY863edAyA', 4, '', 1500, '2021-03-11 06:03:03', '2021-03-26 00:00:00'),
(13, 'bUblfsh10p', 4, '', 30000, '2021-03-11 06:03:54', '2021-03-26 00:00:00'),
(14, 'ev4A5fkQLg', 1, '', 1500, '2021-03-11 06:03:17', '2021-03-26 00:00:00'),
(15, '8ZISIH2lQ2', 4, '', 40000, '2021-03-11 07:03:53', '2021-03-26 00:00:00'),
(16, 'ftVhoKlU0V', 4, '', 3000, '2021-03-11 07:03:19', '2021-03-26 00:00:00'),
(17, 'rDreYF03qb', 4, '', 4000, '2021-03-11 07:03:11', '2021-03-26 00:00:00'),
(18, 'xzYGFrls7Z', 1, '', 1500, '2021-03-11 07:03:28', '2021-03-26 00:00:00'),
(19, 'VtrKjCoO6B', 4, '', 3000, '2021-03-11 07:03:52', '2021-03-26 00:00:00'),
(20, 'FrBe974tio', 5, '', 27500, '2021-03-11 07:03:03', '2021-03-26 00:00:00'),
(21, 'VKT0gKtEkT', 1, '', 15000, '2021-03-11 01:03:47', '2021-03-26 00:00:00'),
(22, 'Og6Lo5bxYw', 6, '', 9000, '2021-03-12 09:03:03', '2021-03-26 00:00:00'),
(23, 'bVoEgWfmj4', 7, '', 1500, '2021-03-12 09:03:02', '2021-03-26 00:00:00'),
(24, 'wsx7jMAsYm', 8, '', 0, '2021-03-12 10:03:12', '2021-03-26 00:00:00'),
(25, 'cqcTfgZs9r', 9, '', 16000, '2021-03-12 10:03:32', '2021-03-26 00:00:00'),
(26, 'z4X01hSKYr', 1, '', 8000, '2021-03-13 04:03:16', '2021-03-26 00:00:00'),
(27, 'slXhL4Pqyw', 1, '', 0, '2021-03-13 12:03:26', '2021-03-26 00:00:00'),
(28, 'KpdZvESV8l', 1, '', 6000, '2021-03-13 01:03:50', '2021-03-26 00:00:00'),
(29, 'e4XSgyWEAe', 1, '', 6000, '2021-03-13 01:03:38', '2021-03-26 00:00:00'),
(30, 'ovt6lPNChb', 9, '', 10500, '2021-03-14 11:03:44', '2021-03-26 00:00:00'),
(31, 'HpMtO6V0Ww', 10, '', 21000, '2021-03-15 12:03:25', '2021-03-26 00:00:00'),
(32, 'WMXlQxTww1', 10, '', 35000, '2021-03-15 12:03:55', '2021-03-26 00:00:00'),
(33, 'RdRKoVG8jI', 11, '', 40000, '2021-03-19 03:03:14', '2021-03-26 00:00:00'),
(34, '9SU5KYSCbW', 4, '', 2000, '2021-03-21 05:03:07', '2021-03-26 00:00:00'),
(35, 'XstPN7NqUR', 12, '', 20000, '2021-03-23 06:03:24', '2021-03-26 00:00:00'),
(36, 'BsgwBun7Lw', 12, '', 14000, '2021-03-23 06:03:05', '2021-03-26 00:00:00'),
(37, 'mDCEbr8DCE', 13, '', 40000, '2021-03-23 06:03:42', '2021-03-26 00:00:00'),
(38, 'EMLJ7y3MH9', 13, '', 34000, '2021-03-23 06:03:34', '2021-03-26 00:00:00'),
(39, 'UJKdf61WOy', 4, '', 26000, '2021-03-24 08:03:16', '2021-03-26 00:00:00'),
(40, 'qgyeba28ax', 5, '', 1500, '2021-03-25 02:03:40', '2021-03-26 00:00:00'),
(41, 'VpGs7fhAdB', 5, '', 2000, '2021-03-25 04:03:11', '2021-03-26 00:00:00'),
(42, '2srEmRzSKN', 1, '', 12000, '2021-03-25 10:03:17', NULL),
(43, 'xkyTsEMT46', 1, '', 8000, '2021-03-25 10:03:59', '2021-03-26 00:00:00'),
(44, 'Vsslhd49n0', 1, '', 14000, '2021-03-26 09:03:45', '2021-03-26 00:00:00'),
(45, 'uxGtLgzASV', 1, '', 12000, '2021-03-27 09:03:49', '2021-03-27 00:00:00'),
(46, 'K7fBj9rw2n', 5, '', 2000, '2021-03-27 10:03:56', NULL),
(47, 'W7mRy3pYsz', 5, '', 2000, '2021-03-27 10:03:10', NULL),
(48, '39dtPMAi4c', 5, '', 2000, '2021-03-27 11:03:11', NULL),
(49, 'czFLuqrvri', 5, '', 19000, '2021-03-28 12:03:55', '2021-03-28 00:00:00'),
(50, 'abeFQ1JT9I', 5, '', 17000, '2021-03-28 12:03:16', '2021-03-28 00:00:00'),
(51, 'xYyyce7dMV', 5, '', 22500, '2021-03-28 12:03:42', '2021-03-28 00:00:00'),
(52, 'nXlJvL00Mp', 5, '', 1000, '2021-03-28 12:03:41', '2021-03-28 00:00:00'),
(53, 'wzuWpfqoV6', 5, '', 5000, '2021-03-28 12:03:30', '2021-03-28 00:00:00'),
(54, 'IeXOzSnBRp', 1, '', 8000, '2021-03-28 12:03:16', '2021-03-28 00:00:00'),
(55, 'IZjhhrRnRJ', 6, '', 8000, '2021-04-02 02:04:17', '2021-04-02 00:00:00'),
(56, 'DgLe6wnvTt', 6, '', 4000, '2021-04-02 02:04:09', '2021-04-02 00:00:00'),
(57, 'rItb1kD4Bv', 4, '', 0, '2021-04-20 03:04:55', NULL),
(58, 'YPq0Z9KBCj', 4, '', 0, '2021-04-20 03:04:55', NULL),
(59, 'jO2qlvoCfE', 4, '', 2000, '2021-04-29 08:04:57', NULL),
(60, '8Rlhur2Noi', 4, '', 0, '2021-04-29 08:04:46', NULL),
(61, 'g9SP0DRbsB', 4, '', 0, '2021-04-29 08:04:21', NULL),
(62, 'LEagkImyAm', 6, '', 3500, '2021-06-12 04:06:44', '2021-06-12 00:00:00'),
(63, 'homK30RlsY', 6, '', 2000, '2021-06-12 04:06:07', '2021-06-12 00:00:00'),
(64, 'BxQtYxkvEn', 6, '', 2000, '2021-06-14 12:06:55', '2021-06-14 00:00:00'),
(65, 'OIBTyuLaV3', 6, '', 2000, '2021-06-14 01:06:55', '2021-06-14 00:00:00'),
(66, 'g0WRpWbqW3', 4, '', 30000, '2021-06-20 02:06:22', NULL),
(67, 'MH3ZzRrjEE', 4, '', 2000, '2021-06-20 03:06:56', NULL),
(68, 'tV5Q9OzFka', 6, '', 9000, '2021-06-23 01:06:40', '2021-06-23 00:00:00'),
(69, 'JSTS7Mf1nq', 6, '', 12000, '2021-06-23 01:06:38', '2021-06-23 00:00:00'),
(70, 'MQdqAcEOAX', 6, '', 5000, '2021-06-30 04:06:01', '2021-06-30 00:00:00'),
(71, '98eHqazIQF', 6, '', 4000, '2021-06-30 04:06:17', '2021-06-30 00:00:00'),
(72, 'qqusI82px2', 6, '', 2000, '2021-06-30 04:06:33', '2021-06-30 00:00:00'),
(73, 'Wvb6g8PTFN', 6, '', 6000, '2021-07-01 08:07:31', '2021-07-01 00:00:00'),
(74, 'B36m6TlqdW', 6, '', 20000, '2021-07-01 10:07:53', '2021-07-01 00:00:00'),
(75, 'fpFbQ78uqH', 1, '', 6000, '2021-07-01 02:07:06', '2021-07-01 00:00:00'),
(76, 'Q19Iu1zeVa', 6, '', 2000, '2021-07-02 06:07:56', '2021-07-02 00:00:00'),
(77, 'TpmE75GB08', 6, '', 8000, '2021-07-02 07:07:45', '2021-07-02 00:00:00'),
(78, 'sZaeYecLPk', 1, '', 3000, '2021-07-27 10:07:32', '2021-07-27 00:00:00'),
(79, 'FCl3zABgC4', 1, '', 1000, '2021-07-27 12:07:22', '2021-07-27 00:00:00'),
(80, 'Kh1prjo2kN', 1, '', 2000, '2021-07-27 12:07:37', '2021-07-27 00:00:00'),
(81, 'mR59JNPoGv', 1, '', 2000, '2021-07-27 12:07:19', '2021-07-27 00:00:00'),
(82, '2i3G6tXRBq', 1, '', 2000, '2021-07-27 12:07:20', '2021-07-27 00:00:00'),
(83, 'fpSwARDW2b', 1, '', 2000, '2021-07-27 12:07:45', '2021-07-27 00:00:00'),
(84, 'P0gFlbtM37', 1, '', 2000, '2021-07-27 12:07:28', '2021-07-27 00:00:00'),
(85, '5gQEsfDtXf', 1, '', 2000, '2021-07-27 12:07:52', '2021-07-27 00:00:00'),
(86, 'Y4F3W7VHiV', 1, 'jl janti', 2000, '2021-07-27 12:07:00', NULL),
(87, 'L2rVxMNTs0', 1, 'Jl janti', 2000, '2021-07-27 12:07:57', NULL),
(88, 'WonVIYzzWa', 1, 'jl janti', 2000, '2021-07-27 12:07:07', NULL),
(89, '1KmwEj9koY', 1, 'jl janti', 2000, '2021-07-27 12:07:17', '2021-07-27 00:00:00');

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

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`) VALUES
(1, 'admin', 'ipuladmin', '123'),
(2, 'admin', 'ipuladmin', '123'),
(3, 'admin', 'ipuladmin', '123');

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
(7, 7, '/img/VIp8W5cWq7.jpg'),
(8, 9, '/img/w3Ow2ODzir.jpg'),
(9, 10, '/img/kOKULwxshn.jpg'),
(10, 11, '/img/JER21f7tC8.jpg'),
(11, 13, '/img/RJtesM4WtD.jpg'),
(12, 14, '/img/JfiP3e54hu.jpg'),
(13, 16, '/img/qo7UFAG5GM.jpg'),
(14, 18, '/img/gGPgcTvgou.jpg'),
(15, 19, '/img/4BZCdoekBB.jpg'),
(16, 20, '/img/hrTA4pQs85.jpg'),
(17, 22, '/img/6sMiKI4zTd.jpg'),
(18, 24, '/img/JA5wTMvEll.jpg'),
(19, 25, '/img/nI6z1SA0FQ.jpg'),
(20, 29, '/img/aaHvjiatzz.jpg'),
(21, 30, '/img/t5l5ll1xUL.jpg'),
(22, 31, '/img/XlUasVQ1Ho.jpg'),
(23, 32, '/img/VLyyTBSovb.jpg'),
(24, 33, '/img/dQnKut3Bpk.jpg'),
(25, 35, '/img/Y4TJq3KxmT.jpg'),
(26, 36, '/img/uPVwHoKESH.jpg'),
(27, 37, '/img/ZaOzsSxEKR.jpg'),
(28, 38, '/img/246xu277M4.jpg'),
(29, 39, '/img/BS1sZURkK0.jpg'),
(30, 42, '/img/vBR5pB0DYv.jpg'),
(31, 44, '/img/mQsxDSNzcQ.jpg'),
(32, 45, '/img/dKBcE5aXcj.jpg'),
(33, 49, '/img/8CVWAZ19ty.jpg'),
(34, 50, '/img/IAz7ytelBc.jpg'),
(35, 51, '/img/mMrH7QwCWj.jpg'),
(36, 52, '/img/YFvIrUHSCJ.jpg'),
(37, 53, '/img/YpziRAsA42.jpg'),
(38, 54, '/img/Q5q6hb2lW6.jpg'),
(39, 55, '/img/IUgk5drpcd.jpg'),
(40, 56, '/img/cD8AIsXbhe.jpg'),
(41, 58, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/vBajjtf1XW.jpg'),
(42, 61, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/wJUtnBZrEy.jpg'),
(43, 63, '/img/G13mbXvpdw.jpg'),
(44, 64, '/img/Yuq1pvDFgP.jpg'),
(45, 65, '/img/PNwlE47E6o.jpg'),
(46, 66, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/NAv7RZeMn5.jpg'),
(47, 67, 'https://crm-jajanan-pasar-api.000webhostapp.com//img/ly0Mfh9fzi.jpg'),
(48, 68, '/img/iHWovealwI.jpg'),
(49, 69, '/img/z88txLfbUf.jpg'),
(50, 71, '/img/DhIBBMLxZS.jpg'),
(51, 72, '/img/udNpSp6Qc2.jpg'),
(52, 73, '/img/MFB6EVyDgZ.jpg'),
(53, 74, '/img/4vmcY2tNuu.jpg'),
(54, 75, '/img/ZyMCjm9u7n.jpg'),
(55, 76, '/img/xbNDskvJ8z.jpg'),
(56, 77, '/img/hg20X5RpgH.jpg'),
(57, 78, '/img/uUfdR6loPI.jpg'),
(58, 86, '/img/VIA_COD.jpg'),
(59, 87, '/img/VIA_COD.jpg'),
(60, 88, '/img/VIA_COD.jpg'),
(61, 89, '/img/VIA_COD.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `detail_transaction`
--
ALTER TABLE `detail_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `validate_transaction`
--
ALTER TABLE `validate_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
