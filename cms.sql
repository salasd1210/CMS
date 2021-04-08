-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 11:13 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '185de3668626b1920ba44f55feab40b1', '21-12-2020 10:54:24 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Account Section', 'Any Query or Complaint Related to Account Section', '2020-12-12 06:10:55', '2020-12-15 13:05:00'),
(2, 'Academics', 'Any Query Related to Academics', '2020-12-12 10:54:06', '2020-12-15 13:05:50'),
(3, 'Teacher Feedback', 'Give any Feedback Related to the Professor.', '2020-12-12 13:06:57', '2020-12-21 12:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(12, 27, 'in process', 'Will Contact the HOD and then let you Know', '2020-12-15 18:30:32'),
(13, 28, 'closed', 'No Events due to the Pandemic.', '2020-12-15 18:56:52'),
(14, 30, 'closed', 'Yes Sure, Give the application to the accounts section.', '2020-12-15 18:57:55'),
(15, 34, 'in process', 'Taking the inputs form accounts section', '2020-12-15 18:58:32'),
(16, 32, 'in process', 'Will let you know after the meeting of EPEC.', '2020-12-15 18:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `deptName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `deptName`) VALUES
(1, 'Computer Engineering'),
(2, 'Information Technology'),
(3, 'Electronics and Telecommunication Engineering'),
(4, 'Mechanical Engineering'),
(5, 'Instrumentation Engineering'),
(6, 'Chemical Engineering'),
(7, 'Production Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Fees Related', '2020-12-12 07:11:07', '2020-12-15 16:03:16'),
(2, 1, 'Document Related', '2020-12-12 07:11:20', '2020-12-15 16:04:45'),
(3, 2, 'Exam Related', '2020-12-12 07:06:44', '2020-12-15 16:05:20'),
(4, 2, 'Marksheet Related', '2020-12-15 17:05:19', '2020-12-15 17:05:19'),
(5, 2, 'Events In College', '2020-12-15 17:05:19', '2020-12-15 17:05:19'),
(6, 3, 'Classroom Related', '2020-12-15 17:05:19', '2020-12-15 17:05:40'),
(7, 3, 'Assignments or Submissions', '2020-12-15 17:05:19', '2020-12-15 17:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `department`, `noc`, `complaintDetails`, `regDate`, `status`, `lastUpdationDate`) VALUES
(26, 1, 1, 'Fees Related', 'Computer Engineering', 'Fee Receipt', 'I have not received any fee receipt for my payment of fees.', '2020-12-15 18:15:59', NULL, NULL),
(27, 1, 2, 'Exam Related', 'Computer Engineering', 'Dates', 'When Are the Exams for Third Year Students Scheduled?', '2020-12-15 18:16:37', 'in process', '2020-12-15 18:30:32'),
(28, 1, 2, 'Events In College', 'Computer Engineering', 'Any Events', 'Are there any events organized in our college?', '2020-12-15 18:18:09', 'closed', '2020-12-15 18:56:52'),
(29, 2, 3, 'Classroom Related', 'Computer Engineering', 'Discipline', 'There is no Discipline in the class during lectures.', '2020-12-15 18:19:12', NULL, NULL),
(30, 2, 1, 'Document Related', 'Computer Engineering', 'Duplicates', 'Can I get duplicates of the documents that I have submitted in the college?', '2020-12-15 18:20:10', 'closed', '2020-12-15 18:57:55'),
(31, 2, 2, 'Marksheet Related', 'Computer Engineering', 'Issue', 'When we will be issued the mark sheets for the 4th Semester?', '2020-12-15 18:21:36', NULL, NULL),
(32, 3, 2, 'Events In College', 'Mechanical Engineering', 'Dates', 'When are the events in the college finalized?', '2020-12-15 18:22:40', 'in process', '2020-12-15 18:59:44'),
(33, 4, 2, 'Exam Related', 'Electronics and Telecommunication Engineering', 'Mode', 'In which mode will the exams be conducted? whether they will be online or offline?', '2020-12-15 18:24:22', NULL, NULL),
(34, 4, 1, 'Document Related', 'Mechanical Engineering', 'Delay', 'I have requested a duplicate copy of my documents 7 days ago but have not received it till now. When will they be provided to me?', '2020-12-15 18:25:46', 'in process', '2020-12-15 18:58:32'),
(35, 4, 1, 'Fees Related', 'Electronics and Telecommunication Engineering', 'Deducation', 'Is there any deduction in college fees due to the pandemic situation, as we are also not attending the college physically?', '2020-12-15 18:27:00', NULL, NULL),
(36, 3, 3, 'Assignments or Submissions', 'Mechanical Engineering', 'Final Dates', 'When are the final dates to submit the assignments and Course Projects?', '2020-12-15 18:29:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `loginTime`, `logout`, `status`) VALUES
(29, 1, 'salas@gmail.com', '2020-12-21 11:07:52', '', 1),
(30, 1, 'salas@gmail.com', '2020-12-21 16:23:37', '21-12-2020 10:39:51 PM', 1),
(31, 1, 'salas@gmail.com', '2020-12-21 17:10:45', '21-12-2020 10:44:22 PM', 1),
(32, 1, 'salas@gmail.com', '2020-12-22 10:54:49', '22-12-2020 04:44:12 PM', 1),
(33, 1, 'salas@gmail.com', '2020-12-22 11:14:57', '', 1),
(34, 1, 'salas@gmail.com', '2020-12-23 17:09:50', '23-12-2020 10:40:42 PM', 1),
(35, 0, 'salas@gmail.com', '2021-03-08 07:42:53', '', 0),
(36, 1, 'salas@gmail.com', '2021-03-08 07:43:35', '08-03-2021 01:22:01 PM', 1),
(37, 1, 'salas@gmail.com', '2021-04-01 06:17:11', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `Department`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Salas Dongaonkar', 'salas@gmail.com', 'fc6067e380942cf2d255c35037551400', 8275393548, 'Beed', 'Computer Engineering', 'India', 431122, 'fa3cb071169b3d0ca8988fe8140fc90e.jpg', '2020-12-12 01:43:00', '2020-12-22 11:01:18', 1),
(2, 'Sahil Bhende', 'sahil@gmail.com', '1006f0ae5a7ece19828a67ac62288e05', 123456, NULL, NULL, NULL, NULL, NULL, '2020-12-12 17:11:19', '2020-12-15 18:07:46', 1),
(3, 'Vipul Doshi', 'vipul@gmail.com', '721307e5b715dea44b55e56cd72cc154', 123456, NULL, NULL, NULL, NULL, NULL, '2020-12-12 17:11:38', '2020-12-15 18:07:54', 1),
(4, 'Amaan Baig', 'amaan@gmail.com', 'ac6f3d4d696ba928a03f70cbbef83356', 123456, NULL, NULL, NULL, NULL, NULL, '2020-12-12 17:11:56', '2020-12-15 18:08:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
