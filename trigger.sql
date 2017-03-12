-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 02, 2016 at 03:52 AM
-- Server version: 5.6.28
-- PHP Version: 5.5.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trigger`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE IF NOT EXISTS `audit` (
  `id` mediumint(8) unsigned NOT NULL,
  `blog_id` mediumint(8) unsigned NOT NULL,
  `changetype` enum('NEW','EDIT','DELETE') NOT NULL,
  `changetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` mediumint(8) unsigned NOT NULL,
  `title` text,
  `content` text,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blog posts';

--
-- Triggers `blog`
--
DELIMITER $$
CREATE TRIGGER `blog_after_update` AFTER UPDATE ON `blog`
 FOR EACH ROW BEGIN
	
		IF NEW.deleted THEN
			SET @changetype = 'DELETE';
		ELSE
			SET @changetype = 'EDIT';
		END IF;
    
		INSERT INTO audit (blog_id, changetype) VALUES (NEW.id, @changetype);
		
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `contact_id` int(11) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Delivery_Details`
--

CREATE TABLE IF NOT EXISTS `Delivery_Details` (
  `DId` int(11) NOT NULL,
  `w` int(11) NOT NULL,
  `Qty_Accepted` int(11) NOT NULL,
  `Delivery_Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(20) NOT NULL,
  `prod_cost` float NOT NULL DEFAULT '0',
  `prod_price` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `prod_cost`, `prod_price`) VALUES
(1, 'Basic Widget', 7, 9.8),
(2, 'Micro Widget', 0.95, 1.35),
(3, 'Mega Widget', 99.95, 140);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `updateProductPrice` BEFORE UPDATE ON `products`
 FOR EACH ROW BEGIN
  IF NEW.prod_cost <> OLD.prod_cost
    THEN
      SET NEW.prod_price = NEW.prod_cost * 1.40;
  END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `Pid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `w` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Pid`, `qty`, `w`) VALUES
(0, 0, 0),
(2, 10, 2),
(3, 10, 2),
(5, 5, 2),
(6, 1, 4);

--
-- Triggers `purchase`
--
DELIMITER $$
CREATE TRIGGER `Add_Purchase` AFTER INSERT ON `purchase`
 FOR EACH ROW BEGIN
    
    	UPDATE warehouse
        
        SET warehouse.qtyonhand = warehouse.qtyonhand + new.qty
        
        WHERE warehouse.w = new.w;
   
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Delete_Purchase` AFTER DELETE ON `purchase`
 FOR EACH ROW BEGIN
		UPDATE warehouse
        SET warehouse.qtyonhand = warehouse.qtyonhand - old.qty
        WHERE warehouse.w = old.w;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Purchase` AFTER UPDATE ON `purchase`
 FOR EACH ROW BEGIN
    
    	UPDATE warehouse
        SET warehouse.qtyonhand = warehouse.qtyonhand - old.qty        
        WHERE warehouse.w = old.w;
		
        
		UPDATE warehouse
		SET warehouse.qtyonhand = warehouse.qtyonhand + new.qty        
        WHERE warehouse.w = new.w;
   
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `RId` int(11) NOT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Date_Status_Change` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`RId`, `Date_Created`, `remark`, `Status`, `Date_Status_Change`) VALUES
(3, '2016-05-28 04:24:07', '', '', '0000-00-00'),
(4, '2016-05-28 04:25:14', '', '', '0000-00-00'),
(8, '2016-05-28 05:55:01', '', '', '0000-00-00'),
(9, '2016-05-28 05:55:56', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `request_details`
--

CREATE TABLE IF NOT EXISTS `request_details` (
  `qty` int(11) NOT NULL,
  `w` int(11) NOT NULL,
  `RId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_details`
--

INSERT INTO `request_details` (`qty`, `w`, `RId`) VALUES
(5, 3, 0),
(5, 3, 0),
(5, 3, 8),
(5, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE IF NOT EXISTS `warehouse` (
  `w` int(11) NOT NULL,
  `qtyonhand` int(11) NOT NULL,
  `qtyonorder` int(11) NOT NULL,
  `stocklimit` int(11) NOT NULL,
  `Delivery_Price` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`w`, `qtyonhand`, `qtyonorder`, `stocklimit`, `Delivery_Price`) VALUES
(2, 26, 1, 3, 0),
(3, 1, 0, 3, 0),
(4, 3, 0, 4, 0);

--
-- Triggers `warehouse`
--
DELIMITER $$
CREATE TRIGGER `Add_Request` AFTER UPDATE ON `warehouse`
 FOR EACH ROW BEGIN
 	IF new.qtyonhand <= new.stocklimit THEN

Insert INTO request (request.Date_Created,request.remark,request.Status,request.Date_Status_Change) 	values (now(),"","",""); 

SET @lastID = (SELECT RId FROM request ORDER BY RId DESC LIMIT 1);

Insert INTO request_details (request_details.qty,request_details.w,request_details.RId) 	values (5,old.w,@lastID); 

		 END IF ;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_blog_id` (`blog_id`),
  ADD KEY `ix_changetype` (`changetype`),
  ADD KEY `ix_changetime` (`changetime`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_deleted` (`deleted`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `Delivery_Details`
--
ALTER TABLE `Delivery_Details`
  ADD PRIMARY KEY (`DId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Pid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`RId`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`w`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `RId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `w` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `FK_audit_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
