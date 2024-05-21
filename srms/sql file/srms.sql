-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 21, 2024 at 04:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `ParentID` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `StudentClass` varchar(100) NOT NULL,
  `SignUpDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`ParentID`, `UserName`, `Email`, `Password`, `StudentClass`, `SignUpDate`) VALUES
(5, 'Victor Kweka', 'j.kweka@gmail.com', '$2y$10$vcFttiv6F6i6zeskunJMHeTgzwKzlDGtufLJHEHgHQAlldkp/4tKy', 'Form 1 Stream A', '2024-05-20 09:37:28'),
(6, 'Abdul-Swammad Hassan', 'hassan.jumanne@gmail.com', '$2y$10$esprBrWs32Si6LfJo0Rl/ermxOnnF7bqVR52vfs5drE4R0dN49Gui', 'Form 1 Stream A', '2024-05-21 02:07:16'),
(7, 'Beckham Yona', 'mwakanjuki@gmail.com', '$2y$10$qKPE0xC6NG1HBdvUtshWHOhFNlNbEtsuXRdOo5DbK/N2o3YTKi0Se', 'Form 1 Stream B', '2024-05-21 02:09:15'),
(8, 'Nuhi Katambi', 's.katambi@gmail.com', '$2y$10$0D8uDr5UZq8ol2D96xBfRuL.Rh39.JmO782vi6KKvV3gObGnngSKO', 'Form 1 Stream C', '2024-05-21 02:11:58'),
(9, 'Mahir Abdul', 'a.rashid@gmail.com', '$2y$10$NQYZ/ymlp.s6sqd89RZ3VOyAlWtveFDXH47mQrlfx68budQ0wnncC', 'Form 2 Stream A', '2024-05-21 02:12:41'),
(10, 'Joel Kiwango', 'v.kiwango@gmail.com', '$2y$10$VrrYDt.xomVmFp74wM.t8.w5Td.69bmRdt5xMji31LisqpJRwZQNi', 'Form 2 Stream B', '2024-05-21 02:13:16'),
(11, 'Winfrida Joseph', 'j.hamisi@gmail.com', '$2y$10$IGLfEEnA8nt.EtCTomMeoO4BnLDgrZBcRbq90xPH27kWrr0iI.1Nm', 'Form 3 Stream A', '2024-05-21 02:15:27'),
(12, 'Julius Peter', 'p.ntale@gmail.com', '$2y$10$oJQY0kjbYRqLzs1NeWs6c.KQz6N.NR/0wpdWE5MN4iyFBzWsAOB/2', 'Form 3 Stream B', '2024-05-21 02:16:30'),
(13, 'Gladness Rutaihwa', 'raph.ruta@gmail.com', '$2y$10$MIB9q0Fyzf7qGz68PNNuvesoUPv96itdUJSVb2uLr7GJWf1LPu2qi', 'Form 1 Stream A', '2024-05-21 02:17:34'),
(14, 'Jackson Kawawa', 'm.kawawa@gmail.com', '$2y$10$c1NjQlX4gDrTUXxVojGEBu4L6E2.bWDI2zn296AKc7isCxhnsEIf.', 'Form 3 Stream C', '2024-05-21 02:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `parent_temp_password`
--

CREATE TABLE `parent_temp_password` (
  `id` int(11) NOT NULL,
  `child_name` varchar(255) NOT NULL,
  `temp_password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `UserName`, `Email`, `Password`, `Subject`, `Gender`, `Phone`) VALUES
(9, 'Lucian Ngeze', 'lucian.ngeze@cive.udom.ac.tz', '$2y$10$5jLqeDWK28kMdVC77EoMPuhRg9g8qi0wSba8oGp5YNQy8if.CJ8UK', 'English', 'Male', '+255609010203'),
(10, 'Doris Mwengwa', 'doris.mwengwa@cive.udom.ac.tz', '$2y$10$dfGNFbiUtE/J0zrTCKh/QujnSy5GqZstkofcMiN1rMBGU5O1a889K', 'Geography', 'Female', '+255710203040'),
(11, 'Abraham Macha', 'abraham.macha@cive.udom.ac.tz', '$2y$10$juis6EE5GFgOLqF5Z1ZlNe0RiezLllLQIrEwvKifPtfsjV3eOqqe2', 'Kiswahili', 'Male', '+255729394959');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(3, 'Leonard Msele', '$2y$10$69tM.OAb5XqqPbLWDuYTseHG5JApVkTXfuZT.dDrHDUSF0j/2ypx6', '2024-05-19 13:25:16'),
(4, 'Tabu Kondo', '$2y$10$P.uppjDrH/RCCHPQuKzPLuv972X1/mHomjOidgnKiK4COugyH82KK', '2024-05-19 13:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `tblclasses`
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) NOT NULL,
  `Section` varchar(5) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Form', 1, 'A', '2017-06-06 16:52:33', '2023-09-16 12:06:46'),
(2, 'Form', 1, 'B', '2017-06-06 17:21:20', '2023-09-16 12:06:46'),
(3, 'Form', 1, 'C', '2017-06-07 09:20:23', '2023-09-16 13:20:59'),
(4, 'Form', 2, 'A', '2017-06-07 09:35:08', '2023-09-16 13:21:46'),
(5, 'Form', 2, 'B', '2017-08-28 18:42:41', '2023-09-16 13:21:46'),
(6, 'Form', 2, 'C', '2017-08-28 18:52:00', '2023-09-16 13:21:46'),
(7, 'Form', 3, 'A', '2017-08-28 19:21:05', '2023-09-16 13:21:46'),
(8, 'Form', 3, 'B', '2023-09-16 12:08:06', '2023-09-16 13:21:46'),
(9, 'Form', 3, 'C', '2023-09-16 12:08:06', '2023-09-16 13:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(85, 13, 1, 17, 99, '2024-05-20 08:59:00', NULL),
(86, 13, 1, 16, 81, '2024-05-20 08:59:00', NULL),
(87, 13, 1, 18, 88, '2024-05-20 08:59:00', NULL),
(88, 13, 1, 13, 89, '2024-05-20 08:59:00', NULL),
(89, 13, 1, 13, 71, '2024-05-20 08:59:00', NULL),
(90, 13, 1, 13, 77, '2024-05-20 08:59:00', NULL),
(91, 13, 1, 14, 70, '2024-05-20 08:59:00', NULL),
(92, 13, 1, 14, 61, '2024-05-20 08:59:00', NULL),
(93, 13, 1, 19, 90, '2024-05-20 08:59:00', NULL),
(103, 15, 3, 11, 88, '2024-05-21 02:01:19', NULL),
(104, 15, 3, 12, 90, '2024-05-21 02:01:19', NULL),
(105, 15, 3, 13, 33, '2024-05-21 02:01:19', NULL),
(106, 15, 3, 14, 45, '2024-05-21 02:01:19', NULL),
(107, 15, 3, 15, 83, '2024-05-21 02:01:19', NULL),
(108, 15, 3, 16, 22, '2024-05-21 02:01:19', NULL),
(109, 15, 3, 17, 91, '2024-05-21 02:01:19', NULL),
(110, 15, 3, 18, 66, '2024-05-21 02:01:19', NULL),
(111, 15, 3, 19, 50, '2024-05-21 02:01:19', NULL),
(112, 22, 1, 11, 88, '2024-05-21 02:41:23', NULL),
(113, 22, 1, 12, 39, '2024-05-21 02:41:23', NULL),
(114, 22, 1, 13, 66, '2024-05-21 02:41:23', NULL),
(115, 22, 1, 14, 91, '2024-05-21 02:41:23', NULL),
(116, 22, 1, 15, 90, '2024-05-21 02:41:23', NULL),
(117, 22, 1, 16, 55, '2024-05-21 02:41:23', NULL),
(118, 22, 1, 17, 76, '2024-05-21 02:41:23', NULL),
(119, 22, 1, 18, 39, '2024-05-21 02:41:23', NULL),
(120, 22, 1, 19, 65, '2024-05-21 02:41:23', NULL),
(121, 14, 2, 11, 39, '2024-05-21 02:41:23', NULL),
(122, 14, 2, 12, 55, '2024-05-21 02:41:23', NULL),
(123, 14, 2, 13, 91, '2024-05-21 02:41:23', NULL),
(124, 14, 2, 14, 88, '2024-05-21 02:41:23', NULL),
(125, 14, 2, 15, 83, '2024-05-21 02:41:23', NULL),
(126, 14, 2, 16, 78, '2024-05-21 02:41:23', NULL),
(127, 14, 2, 17, 62, '2024-05-21 02:41:23', NULL),
(128, 14, 2, 18, 77, '2024-05-21 02:41:23', NULL),
(129, 14, 2, 19, 66, '2024-05-21 02:41:23', NULL),
(130, 16, 4, 11, 45, '2024-05-21 02:41:23', NULL),
(131, 16, 4, 12, 33, '2024-05-21 02:41:23', NULL),
(132, 16, 4, 13, 67, '2024-05-21 02:41:23', NULL),
(133, 16, 4, 14, 77, '2024-05-21 02:41:23', NULL),
(134, 16, 4, 15, 71, '2024-05-21 02:41:23', NULL),
(135, 16, 4, 16, 92, '2024-05-21 02:41:23', NULL),
(136, 16, 4, 17, 67, '2024-05-21 02:41:23', NULL),
(137, 16, 4, 18, 77, '2024-05-21 02:41:23', NULL),
(138, 16, 4, 19, 81, '2024-05-21 02:41:23', NULL),
(139, 17, 5, 11, 95, '2024-05-21 02:41:23', NULL),
(140, 17, 5, 12, 99, '2024-05-21 02:41:23', NULL),
(141, 17, 5, 13, 75, '2024-05-21 02:41:23', NULL),
(142, 17, 5, 14, 77, '2024-05-21 02:41:23', NULL),
(143, 17, 5, 15, 38, '2024-05-21 02:41:23', NULL),
(144, 17, 5, 16, 67, '2024-05-21 02:41:23', NULL),
(145, 17, 5, 17, 55, '2024-05-21 02:41:23', NULL),
(146, 17, 5, 18, 44, '2024-05-21 02:41:23', NULL),
(147, 17, 5, 19, 76, '2024-05-21 02:41:23', NULL),
(148, 18, 6, 11, 56, '2024-05-21 02:41:23', NULL),
(149, 18, 6, 12, 77, '2024-05-21 02:41:23', NULL),
(150, 18, 6, 13, 33, '2024-05-21 02:41:23', NULL),
(151, 18, 6, 14, 67, '2024-05-21 02:41:23', NULL),
(152, 18, 6, 15, 45, '2024-05-21 02:41:23', NULL),
(153, 18, 6, 16, 57, '2024-05-21 02:41:23', NULL),
(154, 18, 6, 17, 88, '2024-05-21 02:41:23', NULL),
(155, 18, 6, 18, 86, '2024-05-21 02:41:23', NULL),
(156, 18, 6, 19, 77, '2024-05-21 02:41:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `RollId` varchar(100) NOT NULL,
  `StudentEmail` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(13, 'Abdul-Swammad Hassan', 'T22 - 03 - 13834', 'abdulswammad@cive.com', 'Male', '2022-10-29', 1, '2024-05-11 21:54:47', NULL, 1),
(14, 'Beckham Yona', 'T22 - 03 - 10715', 'beckham.yona@cive.com', 'Male', '2022-10-29', 2, '2024-05-11 21:55:25', NULL, 1),
(15, 'Nuhi Katambi', 'T22 - 03 - 11753', 'nuhi.katambi@cive.com', 'Female', '2022-10-29', 3, '2024-05-11 21:56:01', NULL, 1),
(16, 'Mahir Abdul', 'T22 - 03 - 05450', 'mahir.abdul@cive.com', 'Male', '2022-10-29', 4, '2024-05-11 21:56:26', NULL, 1),
(17, 'Joel Kiwango', 'T22 - 03 - 01233', 'joel.kiwango@cive.com', 'Male', '2022-10-29', 5, '2024-05-11 21:56:57', NULL, 1),
(18, 'Victor Kweka', 'T22 - 03 - 11759', 'victor.kweka@cive.com', 'Male', '2022-10-29', 6, '2024-05-11 21:58:23', NULL, 1),
(19, 'Winfrida Joseph', 'T22 - 03 - 09890', 'winfrida.joseph@cive.com', 'Female', '2022-10-29', 7, '2024-05-11 21:58:58', NULL, 1),
(20, 'Julius Peter', 'T22 - 03 - 05441', 'julius.peter@cive.com', 'Male', '2022-10-29', 8, '2024-05-11 21:59:33', NULL, 1),
(21, 'Jackson Kawawa', 'T22 - 03 - 05809', 'jack.kawawa@cive.com', 'Male', '2022-10-29', 9, '2024-05-11 22:00:21', NULL, 1),
(22, 'Gladness Rutaihwa', 'T22 - 03 - 00581', 'gladness.raph@cive.com', 'Male', '2022-10-29', 1, '2024-05-11 22:01:03', NULL, 1),
(23, 'Walter Mtui', 'T22 - 03 - 01020', 'w.foden@gmail.com', 'Male', '23 - 01 - 2000', 2, '2024-05-21 01:15:51', NULL, 1),
(24, 'Novert Kimaro', 'T22 - 03 - 10210', 'n.kimaro@gmail.com', 'Male', '01 - 09 - 2001', 1, '2024-05-21 01:15:51', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjectcombination`
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjectcombination`
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(29, 1, 1, 0, '2023-09-17 11:21:47', '2023-09-17 11:21:47'),
(30, 1, 2, 0, '2023-09-17 11:21:52', '2023-09-17 11:21:52'),
(31, 1, 4, 0, '2023-09-17 11:21:57', '2023-09-17 11:21:57'),
(32, 1, 5, 0, '2023-09-17 11:22:02', '2023-09-17 11:22:02'),
(33, 1, 6, 0, '2023-09-17 11:22:08', '2023-09-17 11:22:08'),
(34, 1, 7, 0, '2023-09-17 11:22:15', '2023-09-17 11:22:15'),
(35, 1, 8, 0, '2023-09-17 11:22:19', '2023-09-17 11:22:19'),
(36, 1, 1, 1, '2023-09-17 13:15:11', '2023-09-17 13:15:11'),
(37, 1, 4, 1, '2023-09-17 13:15:15', '2023-09-17 13:15:15'),
(38, 1, 7, 1, '2023-09-17 13:15:20', '2023-09-17 13:15:20'),
(39, 1, 8, 1, '2023-09-17 13:15:24', '2023-09-17 13:15:24'),
(40, 9, 11, 0, '2023-09-17 15:14:05', '2023-09-17 15:14:05'),
(41, 1, 11, 1, '2024-05-17 04:59:41', '2024-05-17 04:59:41'),
(42, 2, 11, 1, '2024-05-17 04:59:56', '2024-05-17 04:59:56'),
(43, 2, 12, 1, '2024-05-17 05:01:02', '2024-05-17 05:01:02'),
(44, 2, 13, 0, '2024-05-17 05:01:06', '2024-05-17 05:01:06'),
(45, 2, 14, 1, '2024-05-17 05:01:10', '2024-05-17 05:01:10'),
(46, 1, 11, 0, '2024-05-17 05:15:00', '2024-05-17 05:15:00'),
(47, 1, 12, 1, '2024-05-17 05:15:04', '2024-05-17 05:15:04'),
(48, 1, 13, 0, '2024-05-17 05:15:09', '2024-05-17 05:15:09'),
(49, 1, 14, 0, '2024-05-17 05:15:12', '2024-05-17 05:15:12'),
(50, 2, 11, 1, '2024-05-17 05:15:31', '2024-05-17 05:15:31'),
(51, 2, 12, 1, '2024-05-17 05:15:37', '2024-05-17 05:15:37'),
(52, 2, 13, 1, '2024-05-17 05:15:44', '2024-05-17 05:15:44'),
(53, 2, 14, 1, '2024-05-17 05:15:51', '2024-05-17 05:15:51'),
(54, 3, 11, 0, '2024-05-17 05:15:58', '2024-05-17 05:15:58'),
(55, 3, 12, 1, '2024-05-17 05:16:10', '2024-05-17 05:16:10'),
(56, 3, 13, 1, '2024-05-17 05:16:15', '2024-05-17 05:16:15'),
(57, 3, 14, 1, '2024-05-17 05:16:23', '2024-05-17 05:16:23'),
(58, 4, 11, 1, '2024-05-17 05:16:33', '2024-05-17 05:16:33'),
(59, 4, 12, 1, '2024-05-17 05:16:40', '2024-05-17 05:16:40'),
(60, 4, 13, 1, '2024-05-17 05:16:54', '2024-05-17 05:16:54'),
(61, 4, 14, 1, '2024-05-17 05:17:01', '2024-05-17 05:17:01'),
(62, 5, 11, 1, '2024-05-17 05:17:07', '2024-05-17 05:17:07'),
(63, 5, 12, 1, '2024-05-17 05:17:16', '2024-05-17 05:17:16'),
(64, 5, 13, 1, '2024-05-17 05:17:24', '2024-05-17 05:17:24'),
(65, 5, 14, 1, '2024-05-17 05:17:31', '2024-05-17 05:17:31'),
(66, 6, 11, 1, '2024-05-17 05:17:38', '2024-05-17 05:17:38'),
(67, 6, 12, 1, '2024-05-17 05:17:50', '2024-05-17 05:17:50'),
(68, 6, 13, 1, '2024-05-17 05:17:57', '2024-05-17 05:17:57'),
(69, 6, 14, 1, '2024-05-17 05:18:03', '2024-05-17 05:18:03'),
(70, 7, 11, 0, '2024-05-17 05:18:10', '2024-05-17 05:18:10'),
(71, 7, 12, 1, '2024-05-17 05:18:16', '2024-05-17 05:18:16'),
(72, 7, 13, 1, '2024-05-17 05:18:23', '2024-05-17 05:18:23'),
(73, 7, 14, 1, '2024-05-17 05:18:28', '2024-05-17 05:18:28'),
(74, 8, 11, 1, '2024-05-17 05:18:35', '2024-05-17 05:18:35'),
(75, 8, 12, 1, '2024-05-17 05:18:42', '2024-05-17 05:18:42'),
(76, 8, 13, 1, '2024-05-17 05:18:51', '2024-05-17 05:18:51'),
(77, 8, 14, 1, '2024-05-17 05:18:58', '2024-05-17 05:18:58'),
(78, 9, 11, 0, '2024-05-17 05:19:06', '2024-05-17 05:19:06'),
(79, 9, 11, 0, '2024-05-17 05:19:06', '2024-05-17 05:19:06'),
(80, 9, 11, 1, '2024-05-17 05:24:32', '2024-05-17 05:24:32'),
(81, 9, 12, 1, '2024-05-17 05:24:40', '2024-05-17 05:24:40'),
(82, 9, 13, 1, '2024-05-17 05:24:47', '2024-05-17 05:24:47'),
(83, 9, 14, 1, '2024-05-17 05:24:53', '2024-05-17 05:24:53'),
(84, 1, 12, 0, '2024-05-20 08:53:12', '2024-05-20 08:53:12'),
(85, 1, 13, 1, '2024-05-20 08:53:18', '2024-05-20 08:53:18'),
(86, 1, 13, 0, '2024-05-20 08:53:23', '2024-05-20 08:53:23'),
(87, 1, 14, 1, '2024-05-20 08:53:27', '2024-05-20 08:53:27'),
(88, 1, 15, 1, '2024-05-20 08:53:32', '2024-05-20 08:53:32'),
(89, 1, 16, 1, '2024-05-20 08:53:36', '2024-05-20 08:53:36'),
(90, 1, 17, 1, '2024-05-20 08:53:41', '2024-05-20 08:53:41'),
(91, 1, 18, 1, '2024-05-20 08:53:48', '2024-05-20 08:53:48'),
(92, 1, 19, 1, '2024-05-20 08:53:51', '2024-05-20 08:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) NOT NULL,
  `Creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(11, 'Mathematics', 'MATH', '2023-09-17 15:13:44', '2024-05-20 08:45:50'),
(12, 'Kiswahili', 'KISW', '2024-05-17 05:00:32', '2024-05-20 08:46:03'),
(13, 'English', 'ENG', '2024-05-17 05:00:41', '2024-05-20 08:46:09'),
(14, 'Geography', 'GEO', '2024-05-17 05:00:56', '2024-05-20 08:46:16'),
(15, 'Physics', 'PHY', '2024-05-20 08:46:23', '0000-00-00 00:00:00'),
(16, 'Chemistry', 'CHEM', '2024-05-20 08:46:28', '0000-00-00 00:00:00'),
(17, 'Biology', 'BIOS', '2024-05-20 08:46:34', '0000-00-00 00:00:00'),
(18, 'Civics', 'CIV', '2024-05-20 08:47:07', '0000-00-00 00:00:00'),
(19, 'History', 'HIST', '2024-05-20 08:47:11', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`ParentID`);

--
-- Indexes for table `parent_temp_password`
--
ALTER TABLE `parent_temp_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclasses`
--
ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `ParentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `parent_temp_password`
--
ALTER TABLE `parent_temp_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblclasses`
--
ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
