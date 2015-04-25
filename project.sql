-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2015 at 05:04 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `about` varchar(500) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `duration`, `grade`, `semester`, `department_id`, `about`) VALUES
(1, 'data minnig', 3, 4, 1, 1, ''),
(2, 'python', 2, 4, 1, 1, ''),
(3, 'biomedical', 3, 4, 1, 2, ''),
(4, 'java', 3, 3, 1, 1, ''),
(5, 'discrete_math', 3, 1, 1, 3, ''),
(6, 'c programming', 3, 1, 1, 3, ''),
(7, 'computer science', 3, 1, 1, 3, ''),
(8, 'english', 2, 2, 1, 3, ''),
(9, 'advanced math', 2, 2, 1, 3, ''),
(10, 'data structure', 3, 2, 1, 3, ''),
(11, 'decision support', 3, 3, 1, 2, ''),
(12, 'graphic', 2, 3, 1, 1, ''),
(13, 'os', 2, 4, 1, 1, 'sgfsdg'),
(14, 'muli database', 3, 3, 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `course_stuff`
--

CREATE TABLE IF NOT EXISTS `course_stuff` (
  `course_id` int(11) NOT NULL,
  `stuff_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `lab_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  UNIQUE KEY `course_id` (`course_id`,`stuff_id`,`section_id`,`lab_id`,`begin_time`,`end_time`,`day_id`),
  UNIQUE KEY `course_id_2` (`course_id`,`section_id`,`lab_id`,`begin_time`,`end_time`,`day_id`),
  UNIQUE KEY `section_id` (`section_id`,`lab_id`,`begin_time`,`end_time`,`day_id`),
  UNIQUE KEY `stuff_id` (`stuff_id`,`section_id`,`lab_id`,`begin_time`,`end_time`,`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_stuff`
--

INSERT INTO `course_stuff` (`course_id`, `stuff_id`, `section_id`, `lab_id`, `begin_time`, `end_time`, `day_id`) VALUES
(1, 1, 1, 1, 3, 8, 2),
(1, 1, 2, 1, 3, 8, 2),
(1, 1, 3, 1, 3, 8, 2),
(1, 3, 2, 9, 9, 12, 2),
(3, 14, 1, 2, 3, 8, 2),
(3, 14, 2, 2, 3, 8, 2),
(3, 14, 3, 2, 3, 8, 2),
(4, 11, 1, 8, 1, 2, 2),
(4, 11, 2, 8, 1, 2, 2),
(4, 11, 3, 8, 1, 2, 2),
(5, 6, 1, 6, 3, 8, 2),
(5, 6, 2, 6, 3, 8, 2),
(5, 6, 3, 6, 3, 8, 2),
(5, 6, 4, 6, 3, 8, 2),
(7, 4, 2, 10, 9, 12, 2),
(8, 10, 1, 3, 1, 4, 2),
(8, 10, 2, 3, 1, 4, 2),
(8, 10, 3, 3, 1, 4, 2),
(11, 2, 1, 4, 5, 10, 2),
(11, 2, 2, 4, 5, 10, 2),
(11, 2, 3, 4, 5, 10, 2),
(14, 15, 1, 9, 1, 4, 2),
(14, 15, 2, 9, 1, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE IF NOT EXISTS `day` (
  `day_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`day_id`, `day_name`) VALUES
(1, 'saturday'),
(2, 'sunday'),
(3, 'monday'),
(4, 'tuesday'),
(5, 'wednesday'),
(6, 'thursday'),
(7, 'friday');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `about` varchar(500) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `about`) VALUES
(1, 'computer_science', ''),
(2, 'information system', ''),
(3, 'general', '');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `grade`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(50) NOT NULL,
  `lab_capacity` int(11) NOT NULL,
  PRIMARY KEY (`lab_id`),
  UNIQUE KEY `lab_name` (`lab_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`lab_id`, `lab_name`, `lab_capacity`) VALUES
(1, 'cisco', 40),
(2, 'oracle', 50),
(3, 'hierarchy1', 100),
(4, 'hierarchy2', 100),
(5, 'hierarchy3', 100),
(6, 'hierarchy4', 200),
(7, 'hierarchy5', 100),
(8, 'hierarchy6', 100),
(9, 'icdl', 35),
(10, 'lab1', 30),
(11, 'lab2', 40),
(12, 'lab3', 40),
(13, 'lab4', 50),
(14, 'lab5', 40);

-- --------------------------------------------------------

--
-- Table structure for table `lecattendance`
--

CREATE TABLE IF NOT EXISTS `lecattendance` (
  `student_id` int(11) NOT NULL,
  `stuff_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `the_time` datetime NOT NULL,
  `day_id` int(11) NOT NULL,
  `stu_attendance` int(11) NOT NULL,
  `stuff_attendance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecattendance`
--

INSERT INTO `lecattendance` (`student_id`, `stuff_id`, `course_id`, `lab_id`, `the_time`, `day_id`, `stu_attendance`, `stuff_attendance`) VALUES
(1, 1, 1, 2, '2015-02-21 09:10:00', 1, 1, 1),
(2, 1, 1, 2, '2015-02-21 09:08:00', 1, 1, 1),
(1, 3, 1, 1, '2015-02-21 12:05:00', 1, 1, 1),
(3, 3, 1, 1, '2015-02-21 12:08:00', 1, 1, 1),
(7, 2, 3, 1, '2015-02-21 09:15:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position`) VALUES
(3, 'doctor'),
(4, 'assistant');

-- --------------------------------------------------------

--
-- Table structure for table `secattendance`
--

CREATE TABLE IF NOT EXISTS `secattendance` (
  `student_id` int(11) NOT NULL,
  `stuff_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `student_attendence` int(11) NOT NULL,
  `stuff_attendence` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secattendance`
--

INSERT INTO `secattendance` (`student_id`, `stuff_id`, `lab_id`, `student_attendence`, `stuff_attendence`, `course_id`) VALUES
(1, 1, 0, 1, 1, 1),
(2, 1, 0, 1, 1, 1),
(3, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` int(11) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section`) VALUES
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
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `Student_grade` int(11) NOT NULL,
  `Student_section` int(11) NOT NULL,
  `Student_imgUrl` varchar(550) DEFAULT NULL,
  `Student_phone` varchar(11) NOT NULL,
  `Student_address` varchar(500) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `Student_name` (`Student_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `Student_name`, `department_id`, `Student_grade`, `Student_section`, `Student_imgUrl`, `Student_phone`, `Student_address`) VALUES
(1, 'ahmed adel', 1, 4, 1, 'C:\\Users\\doola\\Desktop\\Files\\New folder\\IMG_6716.JPG', '684531', 'gkjkd'),
(2, 'mohamed atef', 1, 4, 1, '', '98645', ''),
(3, 'modather nady', 1, 4, 1, '', '658341', ''),
(4, 'ali ahmed', 1, 4, 2, '', '1614865', ''),
(5, 'sally mohamed', 2, 4, 1, '', '644688546', ''),
(6, 'alaa ahmed', 1, 3, 3, '', '2351', ''),
(7, 'ahmed saber', 2, 4, 1, '', '2147483647', ''),
(8, 'eslam tarek', 3, 1, 1, '', '5412661', ''),
(9, 'ahmed el sayed', 3, 1, 1, '', '89646861888', 'dsfsd'),
(10, 'eman saad', 3, 1, 1, '', '64516', ''),
(11, 'amal amr', 3, 1, 1, '', '126854984', ''),
(12, 'esraa mohamed', 3, 1, 2, '', '64516', ''),
(13, 'asmaa sayed', 3, 1, 2, '', '465316', ''),
(14, 'belal gaber', 3, 1, 2, '', '98645312', ''),
(15, 'gamal ahmed', 3, 1, 2, '', '522', ''),
(16, 'alaa emrahim', 3, 1, 3, '', '4685312', ''),
(17, 'karim mohamed', 3, 1, 3, '', '645312', ''),
(18, 'sara ahmed', 3, 1, 3, '', '2147483647', ''),
(19, 'somaya saad', 3, 1, 3, '', '6458651', ''),
(20, 'ali ebrahim', 3, 1, 3, '', '2147483647', ''),
(21, 'mohamed esmail', 3, 1, 4, '', '643568486', ''),
(22, 'moustafa ebrahim', 3, 1, 4, '', '2147483647', ''),
(23, 'mai gamal', 3, 1, 4, '', '2147483647', ''),
(24, 'marwa samy', 3, 1, 4, '', '2147483647', ''),
(25, 'ahmed saad', 3, 2, 1, '', '2147483647', ''),
(26, 'ahmed gamal', 3, 2, 1, '', '2147483647', ''),
(27, 'ebrahim kamal', 3, 2, 1, '', '4685485', ''),
(28, 'amal sayed', 3, 2, 1, '', '486546', ''),
(29, 'esraa fady', 3, 2, 2, '', '4651', ''),
(30, 'eman kamal', 3, 2, 2, '', '5624851', ''),
(31, 'badr ali', 3, 2, 2, '', '465865', ''),
(32, 'fady moustafa', 3, 2, 2, '', '46541', ''),
(33, 'mosaad ebrahim', 3, 2, 3, '', '4651486', ''),
(34, 'merna essam', 3, 2, 3, '', '2147483647', ''),
(35, 'mohab ahmed', 3, 2, 3, '', '2147483647', ''),
(36, 'mona kahled', 3, 2, 3, '', '2147483647', ''),
(37, 'ahmed abd el kader', 1, 3, 1, '', '2147483647', ''),
(38, 'ahmed awad', 1, 3, 1, '', '542', ''),
(39, 'fatma ahmed', 1, 3, 2, '', '64114631', ''),
(40, 'reham ahmed', 1, 3, 2, '', '2147483647', ''),
(41, 'mohamed tarek', 1, 3, 3, '', '65431', ''),
(42, 'mariam yasser', 1, 3, 3, '', '2147483647', ''),
(43, 'ahmed samy', 2, 3, 1, '', '2147483647', ''),
(44, 'ayman salah', 2, 3, 1, '', '746523', ''),
(45, 'beshoy khaled', 2, 3, 2, '', '468148654', ''),
(46, 'hossam mohamed', 2, 3, 2, '', '2147483647', ''),
(47, 'mayada salama', 2, 3, 3, '', '2147483647', ''),
(48, 'mounir ali', 2, 3, 3, '', '2147483647', ''),
(49, 'amr sayed', 1, 4, 2, '', '2147483647', ''),
(50, 'youssef mohamed', 1, 4, 3, '', '9645461', 'aaaaa'),
(51, 'yasmin ali', 1, 4, 3, '', '8461486', ''),
(52, 'omar salah', 2, 4, 2, 'C:\\Users\\doola\\Desktop\\Files\\New folder\\IMG_6755.JPG', '94685320', 'fdghfgd'),
(53, 'omnia maher', 2, 4, 2, '', '946851', ''),
(54, 'yasser hamed', 2, 4, 3, '', '2147483647', ''),
(55, 'yomna tarek', 2, 4, 3, '', '2147483647', ''),
(68, 'dfgsadsf', 3, 2, 1, '', '56123', 'aqegtawergt'),
(69, 'dfgsadsfss', 3, 1, 1, '', '56123', 'aqegtawergt'),
(71, 'sdgasdffg', 3, 1, 1, '', '56123', 'aqegtawergt'),
(72, 'sss', 3, 2, 1, '', '56123', 'aqegtawergt'),
(73, 'sssss', 3, 1, 1, '', '56123', 'aqegtawergt'),
(74, 's', 1, 3, 1, '', '56123', 'aqegtawergt'),
(75, 'ssdfgssr', 2, 3, 1, '', '56123', 'aqegtawergt'),
(77, 'sfgsdf', 1, 3, 2, '', '9642', 'srgtdsrgf'),
(78, 'abdullah ', 1, 3, 3, 'C:\\Users\\doola\\Desktop\\Files\\New folder\\IMG_6701.JPG', '9987645', 'dfgdfg');

-- --------------------------------------------------------

--
-- Table structure for table `stuff`
--

CREATE TABLE IF NOT EXISTS `stuff` (
  `stuff_id` int(11) NOT NULL AUTO_INCREMENT,
  `stuff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `stuff_position` varchar(50) NOT NULL,
  `stuff_phone` int(11) NOT NULL,
  `stuff_address` varchar(50) NOT NULL,
  `stuff_imgurl` varchar(550) DEFAULT NULL,
  PRIMARY KEY (`stuff_id`),
  UNIQUE KEY `stuff_name` (`stuff_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `stuff`
--

INSERT INTO `stuff` (`stuff_id`, `stuff_name`, `department_id`, `stuff_position`, `stuff_phone`, `stuff_address`, `stuff_imgurl`) VALUES
(1, 'ahmed sobhy', 1, '3', 65416, 'alex', 'C:\\Users\\doola\\Desktop\\Files\\New folder\\IMG_6752.JPG'),
(2, 'mohamed adullah', 2, '3', 45631153, 'ismailia', ''),
(3, 'ahmed hamed', 1, '4', 1616146, 'alex', ''),
(4, 'esraa', 1, '4', 1465, 'ismailia', ''),
(5, 'heba', 2, '4', 1453524, 'alex', ''),
(6, 'yasser abd el sattar', 3, '3', 122351562, 'ismailia', ''),
(7, 'mahmoud el gayyar', 1, '3', 45631261, 'ismailia', ''),
(8, 'mohamed waheed', 3, '3', 54615468, 'ismailia', ''),
(9, 'abd el allem el sadany', 3, '3', 5643126, 'ismailia', ''),
(10, 'abd el fatah moftah', 3, '3', 61356896, 'ismailia', ''),
(11, 'walaa el ashmawy', 3, '3', 5423165, 'ismailia', ''),
(12, 'mohamed hamed', 1, '3', 5125414, 'ismailia', ''),
(13, 'ahmed sallam', 1, '3', 121353261, 'ismailia', ''),
(14, 'ben bella', 2, '3', 645312461, 'ismailia', ''),
(15, 'mohamed el sharkawy', 2, '3', 1606845, 'ismailia', ''),
(16, 'يبلسيبل', 1, '3', 64532, 'يبلسيبل', '');

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE IF NOT EXISTS `time` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time NOT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`time_id`, `time`) VALUES
(1, '08:00:00'),
(2, '08:30:00'),
(3, '09:00:00'),
(4, '09:30:00'),
(5, '10:00:00'),
(6, '10:30:00'),
(7, '11:00:00'),
(8, '11:30:00'),
(9, '12:00:00'),
(10, '12:30:00'),
(11, '13:00:00'),
(12, '13:30:00'),
(13, '14:00:00'),
(14, '14:30:00'),
(15, '15:00:00'),
(16, '15:30:00'),
(17, '16:00:00'),
(18, '16:30:00'),
(19, '17:00:00'),
(20, '17:30:00'),
(21, '18:00:00'),
(22, '18:30:00'),
(23, '19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userPass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `stuff_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `userName`, `userPass`, `student_id`, `stuff_id`) VALUES
(0, 'ahmed_adel', '1ahmed_adel', 1, 0),
(1, 'ahmed_sobhy', '1ahmed_sobhy', 0, 1),
(2, 'mohamed_adullah', '1mohamed_adullah', 0, 2),
(3, 'mohamed_atef', '1mohamed_atef', 2, 0),
(4, 'modather_nady', '1modather_nady', 3, 0),
(5, 'ahmed_hamed', '1ahmed_hamed', 0, 3),
(6, 'ali_ahmed', '1ali_ahmed', 4, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
