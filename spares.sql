-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2016 at 06:33 PM
-- Server version: 5.6.16
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spares`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmId` varchar(20) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Mname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Access_level` int(11) NOT NULL,
  `CcNo` int(11) NOT NULL,
  `Section` varchar(50) NOT NULL,
  PRIMARY KEY (`EmId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmId`, `Username`, `Password`, `Fname`, `Mname`, `Lname`, `Position`, `Access_level`, `CcNo`, `Section`) VALUES
('1', 'Moste', 'Moste.123', 'Cesar', 'B', 'Moste', 'Prop. OFFICER A', 1, 6644014, 'warehouse'),
('2', 'test', 'test.123', 'Juan', 'ky', 'Taman', 'Prop. OFFICER A', 1, 8888, 'warehouse'),
('3', 'Tadulan', 'Tadulan.123', 'Edwin', 'L', 'Tadulan', 'Superintendent', 2, 1234567, 'Agus 6 HEP'),
('4', 'John', 'John.123', 'John', 'G.', 'Ompad', 'Superintendent', 2, 8888888, 'Agus 7 HEP');

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `PId` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Mname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Section` varchar(50) NOT NULL,
  PRIMARY KEY (`PId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`PId`, `Fname`, `Mname`, `Lname`, `Position`, `Section`) VALUES
(1, 'Rolinette', 'R.', 'Daño', 'PPMP Officer', 'Agus 7 HEP'),
(9, 'Lorna', 'L', 'Perez', 'PPMP Officer', 'Agus 6 HEP'),
(10, 'John', 'G.', 'Ompad', 'Oic', 'Agus 6/7 HEP');

-- --------------------------------------------------------

--
-- Table structure for table `Spare`
--

CREATE TABLE IF NOT EXISTS `Spare` (
  `SId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'P',
  `Category` varchar(50) NOT NULL,
  `Spare_Name` varchar(50) NOT NULL,
  `Spare_Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`SId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `Spare`
--

INSERT INTO `Spare` (`SId`, `Category`, `Spare_Name`, `Spare_Description`) VALUES
(1, 'Valve', 'Check , Stainless', 'diameter 3/4'),
(2, '1', '1', '1'),
(3, '2', '2', '2'),
(4, '3', '3', '3'),
(5, '5', '5', '5'),
(6, '6', '6', '6'),
(7, '7', '7', '7'),
(8, '8', '8', '8'),
(9, '9', '9', '9'),
(10, '10', '10', '10'),
(11, '12', '12', '12'),
(12, '12', '12', '12'),
(13, '12', '12', '12'),
(14, '13', '13', '13'),
(15, '15', '15', 'hehe try lang gud'),
(16, '16', '16', '16'),
(17, '17', '17', '17'),
(18, '18', '18', '18'),
(19, '19', '19', '19');

-- --------------------------------------------------------

--
-- Table structure for table `Spare_Purchase`
--

CREATE TABLE IF NOT EXISTS `Spare_Purchase` (
  `SpId` varchar(50) NOT NULL,
  `Date_Prepared` varchar(50) NOT NULL,
  `Date_Needed` varchar(50) NOT NULL,
  `Requisitioning_Section` varchar(20) NOT NULL,
  `Ppmp_officer` varchar(50) NOT NULL,
  `Ppmp_Section` varchar(150) NOT NULL,
  `Item_No` int(11) NOT NULL,
  `Page_No` int(11) NOT NULL,
  `Purpose` varchar(1000) NOT NULL,
  `Oic` varchar(100) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Date_Status_Changed` varchar(50) NOT NULL,
  `Po_Incharge` varchar(50) NOT NULL,
  `DceNo` varchar(50) NOT NULL,
  `note` varchar(500) NOT NULL,
  `remark` varchar(500) NOT NULL,
  PRIMARY KEY (`SpId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Spare_Purchase`
--

INSERT INTO `Spare_Purchase` (`SpId`, `Date_Prepared`, `Date_Needed`, `Requisitioning_Section`, `Ppmp_officer`, `Ppmp_Section`, `Item_No`, `Page_No`, `Purpose`, `Oic`, `Status`, `Date_Status_Changed`, `Po_Incharge`, `DceNo`, `note`, `remark`) VALUES
('ELT-PREPR16-001', 'February 14 ,2016', 'April 28 , 2016', 'Agus 6 HEP', 'L.L. Perez', '0', 0, 0, 'Agus 6 unit 1 maintenance', 'J.G. Ompad', 'Draft', '', '', '3', 'Try lang\r\n', ''),
('ELT-PREPR16-002', 'April 15 ,2016', 'May 15 , 2016', 'Agus 6 HEP', 'L.L. Perez', '0', 0, 0, 'Agus 6 Transformer', 'J.G. Ompad', 'Draft', '', '', '3', 'I need this ,  karon dayon , now na\r\n', ''),
('ELT-PREPR16-003', 'April 29 ,2016', 'April 01 , 2016', 'Agus 6 HEP', 'L.L. Perez', 'PPMP Officer, Agus 6 HEP', 0, 0, 'try1', 'J.G. Ompad', 'PENDING', '0000-00-00', '', '3', 'Please Submit Broshure', ''),
('ELT-PREPR16-004', 'April 29 ,2016', 'May 06 , 2016', 'Agus 6 HEP', 'L.L. Perez', 'PPMP Officer, Agus 6 HEP', 0, 0, 'sdfg', 'J.G. Ompad', 'Draft', '0000-00-00', '', '3', 'Please Submit Broshure', ''),
('ELT-PREPR16-005', 'April 29 ,2016', 'May 08 , 2016', 'Agus 6 HEP', 'L.L. Perez', 'PPMP Officer, Agus 6 HEP', 0, 0, 'date for emergency maintenance', 'J.G. Ompad', 'Declined', 'May 01 ,2016', 'C.B Moste', '3', 'Please Submit Broshure now to know iif it''s available\r\n', 'hahaha.. wla sya labot'),
('ELT-PREPR16-006', 'April 29 ,2016', 'April 30 , 2016', 'Agus 6 HEP', 'L.L. Perez', 'PPMP Officer, Agus 6 HEP', 0, 0, 'with remarksdd', 'J.G. Ompad', 'Approved', 'May 01 ,2016', 'C.B Moste', '3', 'Please Submit Broshures', 'Item #1 is onholdS'),
('JGO-PREPR16-001', 'February 14 ,2016', 'February 25 , 2016', 'Agus 7 HEP', 'R.R. Daño', '0', 0, 0, 'For Agus 7 unit 2 operational shutdown', 'J.G. Ompad', 'Draft', '0000-00-00', '', '4', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Spare_Purchase_Details`
--

CREATE TABLE IF NOT EXISTS `Spare_Purchase_Details` (
  `SId` int(11) NOT NULL,
  `SpId` varchar(20) NOT NULL,
  `Quantity` double NOT NULL,
  `UM` varchar(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Spare_Purchase_Details`
--

INSERT INTO `Spare_Purchase_Details` (`SId`, `SpId`, `Quantity`, `UM`, `amount`) VALUES
(7, 'JGO-PREPR16-001', 0, '', 0),
(13, 'ELT-PREPR16-002', 5, 'LOT', 1),
(14, 'ELT-PREPR16-002', 5, 'SET', 1000),
(15, 'ELT-PREPR16-002', 10, 'UNIT', 1000),
(-1, 'ELT-PREPR16-002', 0, '', 0),
(3, 'ELT-PREPR16-001', 0, '', 0),
(9, 'ELT-PREPR16-001', 0, '', 0),
(15, 'ELT-PREPR16-001', 0, '', 0),
(2, 'ELT-PREPR16-004', 0, '', 0),
(2, 'ELT-PREPR16-006', 3, 'SET', 3),
(2, 'ELT-PREPR16-003', 0, '', 0),
(15, 'ELT-PREPR16-006', 0, '', 0),
(8, 'ELT-PREPR16-005', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Technical_Details`
--

CREATE TABLE IF NOT EXISTS `Technical_Details` (
  `TId` int(11) NOT NULL AUTO_INCREMENT,
  `SId` int(11) NOT NULL,
  `SpId` varchar(20) NOT NULL,
  `Tech_Name` varchar(50) NOT NULL,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`TId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Technical_Details`
--

INSERT INTO `Technical_Details` (`TId`, `SId`, `SpId`, `Tech_Name`, `value`) VALUES
(2, 13, 'ELT-PREPR16-002', 'Weight', '35'),
(3, 13, 'ELT-PREPR16-002', 'length', '354mm'),
(4, 15, 'ELT-PREPR16-002', 'diamerter', '353 mm'),
(5, 15, 'ELT-PREPR16-002', 'heght', '83 MM'),
(6, 7, 'JGO-PREPR16-001', '3', '3'),
(7, 2, 'ELT-PREPR16-004', 'height', '34mm'),
(8, 2, 'ELT-PREPR16-004', 'weight', '343cm'),
(9, 2, 'ELT-PREPR16-003', 'Try', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Warehouse_Spares`
--

CREATE TABLE IF NOT EXISTS `Warehouse_Spares` (
  `WsId` int(11) NOT NULL AUTO_INCREMENT,
  `Quatity_onHand` int(11) NOT NULL,
  `Quatity_onOrder` int(11) NOT NULL,
  `ReOrdering_Pt` int(11) NOT NULL,
  `SId` int(11) NOT NULL,
  PRIMARY KEY (`WsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
