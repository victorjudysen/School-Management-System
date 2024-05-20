-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 10:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
(1, 'Nuhi Katambi', 's.katambi@gmail.com', '$2y$10$Ib68bq1QrqQSPJ1q5.2P.ORZ4oA4ppuCHONlrJrUKHMX4/hlOQ/pG', 'Form 1-C', '2024-05-18 15:19:46'),
(2, 'Jackson Kawawa', 'm.kawawa@gmail.com', '$2y$10$tq4cIXaUx7sKYFo92qd3veLh14P3mMQLAjUqk..uO0OhAiUrt7YeK', 'Form 1-A', '2024-05-18 17:08:35');

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
(41, 12, 1, 8, 91, '2023-09-17 15:03:15', NULL),
(42, 12, 1, 8, 99, '2023-09-17 15:03:15', NULL),
(43, 12, 1, 2, 89, '2023-09-17 15:03:15', NULL),
(44, 12, 1, 1, 99, '2023-09-17 15:03:15', NULL),
(45, 14, 2, 13, 88, '2024-05-17 05:01:28', NULL),
(46, 14, 2, 14, 71, '2024-05-17 05:01:28', NULL),
(47, 14, 2, 12, 90, '2024-05-17 05:01:28', NULL),
(48, 14, 2, 11, 81, '2024-05-17 05:01:28', NULL),
(49, 13, 1, 13, 34, '2024-05-17 05:27:52', NULL),
(50, 13, 1, 14, 76, '2024-05-17 05:27:52', NULL),
(51, 13, 1, 12, 69, '2024-05-17 05:27:52', NULL),
(52, 13, 1, 11, 80, '2024-05-17 05:27:52', NULL),
(53, 15, 3, 13, 78, '2024-05-17 05:28:13', NULL),
(54, 15, 3, 14, 87, '2024-05-17 05:28:13', NULL),
(55, 15, 3, 12, 56, '2024-05-17 05:28:13', NULL),
(56, 15, 3, 11, 89, '2024-05-17 05:28:13', NULL),
(57, 16, 4, 13, 87, '2024-05-17 05:28:33', NULL),
(58, 16, 4, 14, 67, '2024-05-17 05:28:33', NULL),
(59, 16, 4, 12, 45, '2024-05-17 05:28:33', NULL),
(60, 16, 4, 11, 80, '2024-05-17 05:28:33', NULL),
(61, 17, 5, 13, 67, '2024-05-17 05:28:53', NULL),
(62, 17, 5, 14, 87, '2024-05-17 05:28:53', NULL),
(63, 17, 5, 12, 45, '2024-05-17 05:28:53', NULL),
(64, 17, 5, 11, 70, '2024-05-17 05:28:53', NULL),
(65, 18, 6, 13, 89, '2024-05-17 05:29:14', NULL),
(66, 18, 6, 14, 79, '2024-05-17 05:29:14', NULL),
(67, 18, 6, 12, 69, '2024-05-17 05:29:14', NULL),
(68, 18, 6, 11, 87, '2024-05-17 05:29:14', NULL),
(69, 19, 7, 13, 67, '2024-05-17 05:29:35', NULL),
(70, 19, 7, 14, 87, '2024-05-17 05:29:35', NULL),
(71, 19, 7, 12, 56, '2024-05-17 05:29:35', NULL),
(72, 19, 7, 11, 78, '2024-05-17 05:29:35', NULL),
(73, 20, 8, 13, 78, '2024-05-17 05:29:56', NULL),
(74, 20, 8, 14, 87, '2024-05-17 05:29:56', NULL),
(75, 20, 8, 12, 77, '2024-05-17 05:29:56', NULL),
(76, 20, 8, 11, 87, '2024-05-17 05:29:56', NULL),
(77, 21, 9, 13, 56, '2024-05-17 05:32:32', NULL),
(78, 21, 9, 14, 98, '2024-05-17 05:32:32', NULL),
(79, 21, 9, 12, 79, '2024-05-17 05:32:32', NULL),
(80, 21, 9, 11, 86, '2024-05-17 05:32:32', NULL),
(81, 22, 1, 13, 56, '2024-05-17 05:33:34', NULL),
(82, 22, 1, 14, 87, '2024-05-17 05:33:34', NULL),
(83, 22, 1, 12, 67, '2024-05-17 05:33:34', NULL),
(84, 22, 1, 11, 87, '2024-05-17 05:33:34', NULL);

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
(22, 'Gladness Rutaihwa', 'T22 - 03 - 00581', 'gladness.raph@cive.com', 'Male', '2022-10-29', 1, '2024-05-11 22:01:03', NULL, 1);

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
(48, 1, 13, 1, '2024-05-17 05:15:09', '2024-05-17 05:15:09'),
(49, 1, 14, 1, '2024-05-17 05:15:12', '2024-05-17 05:15:12'),
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
(83, 9, 14, 1, '2024-05-17 05:24:53', '2024-05-17 05:24:53');

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
(11, 'Mathematics', 'MT-1111', '2023-09-17 15:13:44', '0000-00-00 00:00:00'),
(12, 'Kiswahili', 'KS-122', '2024-05-17 05:00:32', '0000-00-00 00:00:00'),
(13, 'English', 'EN-122', '2024-05-17 05:00:41', '0000-00-00 00:00:00'),
(14, 'Geography', 'GE-122', '2024-05-17 05:00:56', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`ParentID`);

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
  MODIFY `ParentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
