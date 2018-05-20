-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2016 at 10:11 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE IF NOT EXISTS `attendence` (
  `ID` char(10) NOT NULL,
  `I_n` datetime NOT NULL,
  `O_ut` datetime DEFAULT NULL,
  `workedHrs` int(11) DEFAULT NULL,
  `Ot_hrs` int(11) DEFAULT NULL,
  `Normal_Hrs` int(11) DEFAULT NULL,
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`ID`,`date`),
  UNIQUE KEY `iid` (`iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DepID` varchar(6) NOT NULL DEFAULT '',
  `DepName` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DepID`),
  UNIQUE KEY `DepartmentID` (`DepID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepID`, `DepName`, `Location`) VALUES
('dep001', 'HR Department', 'Badulla'),
('dep002', 'Computer Department', 'Monaragala');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXISTS `designation` (
  `DesID` varchar(6) NOT NULL DEFAULT '',
  `DesName` varchar(20) DEFAULT NULL,
  `B_Sal` int(11) DEFAULT NULL,
  PRIMARY KEY (`DesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`DesID`, `DesName`, `B_Sal`) VALUES
('0001', 'Manager', 30000),
('0002', 'Execute', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `ID` varchar(6) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `activated` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `username`, `password`, `activated`) VALUES
('adm001', 'admin', 'admin', '1'),
('emp002', 'emp002', 'emp002', '0'),
('emp001', 'emp001', 'emp001', '0'),
('emp003', 'emp003', 'emp003', '0'),
('emp004', 'emp004', 'emp004', '0'),
('emp005', 'emp005', 'emp005', '0'),
('emp006', 'emp006', 'emp006', '0'),
('emp007', 'emp007', 'emp007', '0'),
('emp008', 'emp008', 'emp008', '0'),
('emp009', 'emp009', 'emp009', '0'),
('emp010', 'emp010', 'emp010', '0'),
('emp011', 'emp011', 'emp011', '0'),
('emp012', 'emp012', 'emp012', '0'),
('emp013', 'emp013', 'emp013', '0');

-- --------------------------------------------------------

--
-- Table structure for table `personaldetails`
--

CREATE TABLE IF NOT EXISTS `personaldetails` (
  `Firstname` varchar(20) DEFAULT NULL,
  `Lastname` varchar(20) DEFAULT NULL,
  `NICno` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `JobDate` date DEFAULT NULL,
  `DesID` varchar(6) NOT NULL,
  `DepID` varchar(6) NOT NULL,
  `ID` varchar(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Personaldetails_Firstname_idx` (`Firstname`),
  KEY `Personaldetails_Lastname_idx` (`Lastname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personaldetails`
--

INSERT INTO `personaldetails` (`Firstname`, `Lastname`, `NICno`, `Gender`, `Address`, `ContactNo`, `JobDate`, `DesID`, `DepID`, `ID`) VALUES
('Hashan', 'Hirosh', '912282038v', 'Male', '123', '123', '2016-11-02', 'des001', 'dep001', 'emp001'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp002'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp003'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp004'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp005'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp006'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp007'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp008'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp009'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp010'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp011'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp012'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001', 'dep001', 'emp013');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE IF NOT EXISTS `salary` (
  `allowance` int(11) DEFAULT NULL,
  `Etf` int(11) DEFAULT NULL,
  `Netsalary` time DEFAULT NULL,
  `ID` char(10) NOT NULL,
  `date` date DEFAULT NULL,
  `B_Sal` int(11) DEFAULT NULL,
  `halfdy` int(11) DEFAULT NULL,
  `nopay` int(11) DEFAULT NULL,
  `ot` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`allowance`, `Etf`, `Netsalary`, `ID`, `date`, `B_Sal`, `halfdy`, `nopay`, `ot`) VALUES
(NULL, NULL, NULL, '5', NULL, 30000, NULL, 1200, NULL),
(NULL, NULL, NULL, '1', NULL, 30000, NULL, NULL, 1000);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
