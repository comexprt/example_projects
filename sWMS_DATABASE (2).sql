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
-- Database: `sWMS_DATABASE`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bidding`
--

CREATE TABLE IF NOT EXISTS `Bidding` (
  `BId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Venue` varchar(100) NOT NULL,
  `SpId` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bidding`
--

INSERT INTO `Bidding` (`BId`, `Date`, `Time`, `Venue`, `SpId`) VALUES
(8, '2016-05-31', '13:00:00', 'Conference Room', 'JGO-PR16-004'),
(9, '2016-05-13', '08:08:00', 'Conference Room', 'TTT-PR16-00'),
(10, '2016-05-31', '01:00:00', 'Conference Room', 'JGO-PR16-005');

-- --------------------------------------------------------

--
-- Table structure for table `Bidding_Details`
--

CREATE TABLE IF NOT EXISTS `Bidding_Details` (
  `Quatation` varchar(1000) NOT NULL,
  `WSid` int(11) NOT NULL,
  `SpId` varchar(20) NOT NULL,
  `SDceNo` varchar(20) NOT NULL,
  `BId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Checkpoints_Details`
--

CREATE TABLE IF NOT EXISTS `Checkpoints_Details` (
  `IId` int(11) NOT NULL,
  `Checkpoints_Details` varchar(20) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Remarks` varchar(20) NOT NULL,
  `DId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Delivery`
--

CREATE TABLE IF NOT EXISTS `Delivery` (
  `DId` int(11) NOT NULL,
  `Disposal_Date` date NOT NULL,
  `Date_Delivered` date NOT NULL,
  `Date_Issued` date NOT NULL,
  `Inspected_By` varchar(20) NOT NULL,
  `Inspection_Checkpoints` varchar(20) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Remarks` varchar(20) NOT NULL,
  `POid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `DceNo` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Fname` varchar(10) NOT NULL,
  `Mname` varchar(10) NOT NULL,
  `Lname` varchar(10) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `User_Access_Level` int(10) NOT NULL,
  `CcNo` int(10) NOT NULL,
  `Requisitioning_Section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`DceNo`, `Username`, `Password`, `Fname`, `Mname`, `Lname`, `Position`, `User_Access_Level`, `CcNo`, `Requisitioning_Section`) VALUES
('0000-00-00', 'admin', 'admin', '', '', 'ADMIN', 'Administrator', 3, 6644556, 'Plant Technical'),
('0000-45-33', 'Ompad', 'Ompad.123', 'John', 'Gitungo', 'Ompad', 'End-User', 4, 6644556, 'AGUS 7 HEP'),
('0000-46', 'f', 'f.123', 'Bryan', 'clevaland', 'Kobe', 'End-User', 4, 6644556, 'AGUS 6 HEP'),
('0001-01-02', 'Moste', 'Moste.123', 'Cesar', 'B', 'Moste', 'Property Officer', 1, 6611223, 'Warehouse'),
('1010', 'test1', 'test1.123', 'test1', 'test1', 'test1', 'Property Officer', 1, 6611223, 'Warehouse'),
('1013', 'test3', 'test3.123', 'test3', 'test3', 'test3', 'End-User', 4, 6644556, 'AGUS 6 HEP'),
('2015-04-23', 'juan', 'juan.123', 'juan', 'k', 'taman', 'Procurement Officer', 2, 6622334, 'Admin and Finance');

-- --------------------------------------------------------

--
-- Table structure for table `Fixed_Value`
--

CREATE TABLE IF NOT EXISTS `Fixed_Value` (
  `FvId` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Value` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Fixed_Value`
--

INSERT INTO `Fixed_Value` (`FvId`, `Name`, `Value`) VALUES
(1, 'Tel No.', '(063) 234-1234'),
(2, 'Fax No.', '(063) 567-5679'),
(3, 'Agus 7 PPMP Officer', 'Rolinette R. Daño'),
(4, 'Agus 6 PPMP Officer', 'Lorna L. Perez'),
(5, 'Plant Manager', 'Imman S. Pates'),
(6, 'Q.A Officer', 'Antonio Moncay'),
(7, 'VAT', '12%');

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Order`
--

CREATE TABLE IF NOT EXISTS `Purchase_Order` (
  `POId` varchar(10) NOT NULL,
  `Date` double NOT NULL,
  `Pr_Item_No` int(11) NOT NULL,
  `Inquiry_No` int(11) NOT NULL,
  `PRId` int(11) NOT NULL,
  `SDceNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Requisition`
--

CREATE TABLE IF NOT EXISTS `Purchase_Requisition` (
  `PRId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Remark` varchar(20) NOT NULL,
  `Date_Status_Change` date NOT NULL,
  `Responsible_Person` varchar(20) NOT NULL,
  `DceNo` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Purchase_Requisition`
--

INSERT INTO `Purchase_Requisition` (`PRId`, `Date`, `Status`, `Remark`, `Date_Status_Change`, `Responsible_Person`, `DceNo`) VALUES
(12, '2016-05-30', 'Pending', '', '0000-00-00', '', ''),
(13, '2016-05-29', 'Pending', '', '0000-00-00', '', ''),
(14, '2016-05-30', 'Pending', '', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Requisition_Details`
--

CREATE TABLE IF NOT EXISTS `Purchase_Requisition_Details` (
  `Qty` int(11) NOT NULL,
  `Estimated_Cost` double NOT NULL,
  `PRId` varchar(20) NOT NULL,
  `WSid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Purchase_Requisition_Details`
--

INSERT INTO `Purchase_Requisition_Details` (`Qty`, `Estimated_Cost`, `PRId`, `WSid`) VALUES
(9, 4, '12', 19),
(10, 1000, '13', 20),
(6, 1000, '14', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Spare_Purchase`
--

CREATE TABLE IF NOT EXISTS `Spare_Purchase` (
  `SpId` varchar(20) NOT NULL,
  `Date_Prepared` varchar(50) NOT NULL,
  `Date_Needed` varchar(50) NOT NULL,
  `Requisitioning_Section` varchar(100) NOT NULL,
  `Ppmp_Officer` varchar(30) NOT NULL,
  `Ppmp_Section` varchar(20) NOT NULL,
  `Purpose` varchar(100) NOT NULL,
  `OIC` varchar(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Date_Status_Changed` varchar(50) NOT NULL,
  `PO_Incharge` varchar(20) NOT NULL,
  `note` varchar(500) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `DceNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Spare_Purchase`
--

INSERT INTO `Spare_Purchase` (`SpId`, `Date_Prepared`, `Date_Needed`, `Requisitioning_Section`, `Ppmp_Officer`, `Ppmp_Section`, `Purpose`, `OIC`, `Status`, `Date_Status_Changed`, `PO_Incharge`, `note`, `remark`, `DceNo`) VALUES
('JGO-PR16-002', 'May 20 ,2016', 'May 22 , 2016', 'AGUS 7 HEP', 'Rolinette R. Daño', 'Agus 7 PPMP Officer', 'Testing 3\r\n', 'Jose S. Pates', 'Approved PR', 'May 24 ,2016', 'j.k taman', 'Please Submit Broshure', '', '0000-45-33'),
('JGO-PR16-004', 'May 22 ,2016', 'May 31 , 2016', 'AGUS 7 HEP', 'Rolinette R. Daño', 'Agus 7 PPMP Officer', 'Now na!', 'Jose S. Pates', 'Bidding PR', 'May 24 ,2016', 'j.k taman', 'Please Submit Broshure', '', '0000-45-33'),
('JGO-PR16-005', 'May 25 ,2016', 'May 26 , 2016', 'AGUS 7 HEP', 'Rolinette R. Daño', 'Agus 7 PPMP Officer', 'ASAP!', 'Imman S. Pates', 'Bidding PR', 'May 25 ,2016', 'j.k taman', 'Please Submit Broshure', '', '0000-45-33'),
('JGO-PREPR16-001', 'May 20 ,2016', 'May 22 , 2016', 'AGUS 7 HEP', 'Rolinette R. Daño', 'Agus 7 PPMP Officer', 'testing 2', 'Jose S. Pates', 'Approved Pre-PR', 'May 23 ,2016', 'j.k taman', 'Please Submit Broshures', 'none', '0000-45-33'),
('JGO-PREPR16-003', 'May 22 ,2016', 'May 26 , 2016', 'AGUS 7 HEP', 'Rolinette R. Daño', 'Agus 7 PPMP Officer', 'As soon as possibles', 'Jose S. Pates', 'Draft', '', '', 'Please Submit Broshure when PO past', 'none', '0000-45-33'),
('TTT-PR16-00', 'May 20 ,2016', 'May 23 , 2016', 'AGUS 6 HEP', 'Lorna L. Perez', 'Agus 6 PPMP Officer', 'test3', 'Jose S. Pates', 'Bidding PR', 'May 25 ,2016', 'j.k taman', 'Please Submit Broshure', '', '1013');

-- --------------------------------------------------------

--
-- Table structure for table `Spare_Purchase_Details`
--

CREATE TABLE IF NOT EXISTS `Spare_Purchase_Details` (
  `Qty` int(10) NOT NULL,
  `UM` varchar(10) NOT NULL,
  `Estimated_Cost` double NOT NULL,
  `WSid` int(10) NOT NULL,
  `SpId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Spare_Purchase_Details`
--

INSERT INTO `Spare_Purchase_Details` (`Qty`, `UM`, `Estimated_Cost`, `WSid`, `SpId`) VALUES
(10, 'LOT', 1, 1, 'JGO-PREPR16-001'),
(0, '--', 0, 2, 'JGO-PREPR16-001'),
(100, '--', 1, 3, 'JGO-PREPR16-001'),
(0, '--', 0, 4, 'JGO-PREPR16-001'),
(0, '--', 0, 4, 'JGO-PREPR16-002'),
(0, '--', 0, 3, 'TTT-PREPR16-001'),
(0, '--', 0, 1, 'JGO-PREPR16-003'),
(0, '', 0, 7, 'JGO-PREPR16-003'),
(10, 'SET', 3, 8, 'JGO-PREPR16-003'),
(2, 'TUBE', 1000, 2, 'JGO-PREPR16-004'),
(0, '--', 0, 8, 'JGO-PREPR16-004'),
(2, 'LOT', 2000, 6, 'JGO-PREPR16-005');

-- --------------------------------------------------------

--
-- Table structure for table `Specifications`
--

CREATE TABLE IF NOT EXISTS `Specifications` (
  `SId` int(11) NOT NULL,
  `Specification` varchar(500) NOT NULL,
  `Value` varchar(50) NOT NULL,
  `WSid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Specifications`
--

INSERT INTO `Specifications` (`SId`, `Specification`, `Value`, `WSid`) VALUES
(1, 'Height', '73 cm', 1),
(2, 'Accumulated Pressure', '67 c3', 1),
(3, 'test 1', '34', 7),
(4, 'tr', 'df', 7),
(6, 'john3', '44 cdd3', 7),
(7, 'try 1', 'try2', 2),
(8, 'Height', '30mm', 6),
(9, 'diameter', '34', 6);

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE IF NOT EXISTS `Supplier` (
  `SDceNo` varchar(10) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Tel_No` varchar(10) NOT NULL,
  `Fax_No` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`SDceNo`, `Supplier_Name`, `Address`, `Tel_No`, `Fax_No`) VALUES
('0038336', 'Qualitron Contruction & Industrial Supplies', 'Purok san Miguel, Tubod Iligan City', '222-0343', '222-3434'),
('0038337', 'Ched Coco Lumber & Construction Supply', 'Tibanga, Iligan City, Lanao del Norte', 'Tibanga, I', 'none'),
('0038338', 'Trinity Blocks & Construction Supply', 'Tambo, Iligan City, Lanao del Norte', '(063) 221 ', 'None'),
('0038339', 'Loremar Construction Supply', 'Linamon Bridge, Iligan City, 9200 Lanao del Norte', '(063) 227 ', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `Technical_Details`
--

CREATE TABLE IF NOT EXISTS `Technical_Details` (
  `TId` int(11) NOT NULL,
  `Tech_Name` varchar(50) NOT NULL,
  `Value` varchar(50) NOT NULL,
  `WSid` int(10) NOT NULL,
  `SpId` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Technical_Details`
--

INSERT INTO `Technical_Details` (`TId`, `Tech_Name`, `Value`, `WSid`, `SpId`) VALUES
(1, 'Height', '73 cm', 1, 'JGO-PREPR16-003'),
(2, 'Accumulated Pressure', '67 c3', 1, 'JGO-PREPR16-003'),
(3, 'test 1', '34', 7, 'JGO-PREPR16-003'),
(4, 'tr', 'df', 7, 'JGO-PREPR16-003'),
(6, 'john3', '44 cdd3', 7, 'JGO-PREPR16-003'),
(7, 'try 1', 'try2', 2, 'JGO-PREPR16-004'),
(8, 'Height', '30mm', 6, 'JGO-PREPR16-005'),
(9, 'diameter', '34', 6, 'JGO-PREPR16-005');

-- --------------------------------------------------------

--
-- Table structure for table `Warehouse_Spares`
--

CREATE TABLE IF NOT EXISTS `Warehouse_Spares` (
  `WSid` int(10) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Spare_Name` varchar(100) NOT NULL,
  `Description` varchar(150) NOT NULL,
  `Quantity_onHand` int(11) NOT NULL,
  `Quantity_onOrder` int(11) NOT NULL,
  `ReOrdering_Pt` int(11) NOT NULL,
  `Unit_Of_Measurement` varchar(10) NOT NULL,
  `Delivery_Price` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Warehouse_Spares`
--

INSERT INTO `Warehouse_Spares` (`WSid`, `Category`, `Spare_Name`, `Description`, `Quantity_onHand`, `Quantity_onOrder`, `ReOrdering_Pt`, `Unit_Of_Measurement`, `Delivery_Price`) VALUES
(1, 'Transformer', 'SBH16 Amorphouses', 'Distribution Oil Type Transformer', 12, 1, 1, 'SET', 0),
(2, 'Transformer', 'elasoftsales', 'Oil type, dry type, Auto type', 12, 1, 1, 'SET', 0),
(3, 'Transformer', 'Three Phase 3 Winding Rectifier Transformer', 'Transformer Oil Type With 10000kv 400kva', 16, 1, 1, 'SET', 0),
(4, 'Valve', 'One stem no-pin lug butterfly valve', 'Pressure Test: API 598 ; Flange Drilling: ANSI B16.1 class125, BS4504 PN10/PN16', 10, 1, 1, 'SET', 0),
(5, 'Valve', 'Stainless steel wafer butterfly valve', 'Pressure Test: API 598 ;\r\nFlange Drilling: ANSI B16.1 class125, BS4504 PN10/PN16, DIN2501 PN10/PN16;\r\nTop Flange: ISO5211', 10, 1, 1, 'SET', 0),
(6, 'Valve', 'Dodge Plymouth Chrysler Eagle Honda', '16 Valve 2.0L 2.4L Intake Exhaust Valves', 10, 1, 1, 'SET', 1),
(7, 'Valve', 'Dodge Plymouth Chrysler Eagle Mitsubishi', '16 Valve 2.0L 2.4L Intake Exhaust Valves', 10, 1, 1, 'SET', 1000);

--
-- Triggers `Warehouse_Spares`
--
DELIMITER $$
CREATE TRIGGER `Add_Purchase` AFTER INSERT ON `warehouse_spares`
 FOR EACH ROW BEGIN
 	IF new.Quantity_onHand <= new.ReOrdering_Pt THEN

Insert INTO Purchase_Requisition (Purchase_Requisition.Date,Purchase_Requisition.Status,Purchase_Requisition.Remark,Purchase_Requisition.Date_Status_Change,Purchase_Requisition.Responsible_Person,Purchase_Requisition.DceNo) 	values (now(),"Pending","","0000-00-00 00:00:00","",""); 

SET @lastID = (SELECT PRId FROM Purchase_Requisition ORDER BY PRId DESC LIMIT 1);

SET @qtyorder = new.ReOrdering_Pt + 5;

Insert INTO Purchase_Requisition_Details (Purchase_Requisition_Details.Qty,Purchase_Requisition_Details.Estimated_Cost,Purchase_Requisition_Details.PRId,Purchase_Requisition_Details.WSid) 	values (@qtyorder,new.Delivery_Price,@lastID,new.WSid); 

        END IF ;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Add_Purchase_When_Update` AFTER UPDATE ON `warehouse_spares`
 FOR EACH ROW BEGIN
 	IF new.Quantity_onHand <= new.ReOrdering_Pt THEN

UPDATE Warehouse_Spares
    SET Warehouse_Spares.Quantity_onOrder = Warehouse_Spares.Quantity_onOrder + Warehouse_Spares.ReOrdering_Pt + 5
    WHERE Warehouse_Spares.WSid = old.WSid;

Insert INTO Purchase_Requisition (Purchase_Requisition.Date,Purchase_Requisition.Status,Purchase_Requisition.Remark,Purchase_Requisition.Date_Status_Change,Purchase_Requisition.Responsible_Person,Purchase_Requisition.DceNo) 	values (now(),"Pending","","0000-00-00 00:00:00","",""); 

SET @lastID = (SELECT PRId FROM Purchase_Requisition ORDER BY PRId DESC LIMIT 1);

Insert INTO Purchase_Requisition_Details (Purchase_Requisition_Details.Qty,Purchase_Requisition_Details.Estimated_Cost,Purchase_Requisition_Details.PRId,Purchase_Requisition_Details.WSid) 	values (new.ReOrdering_Pt + 5,new.Delivery_Price,@lastID,old.WSid); 

		 END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Withdrawal_Request`
--

CREATE TABLE IF NOT EXISTS `Withdrawal_Request` (
  `WRId` varchar(20) NOT NULL,
  `Date_Requested` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Remarks` varchar(500) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Released_by` varchar(100) NOT NULL,
  `Date_Released` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DceNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Withdrawal_Request_Details`
--

CREATE TABLE IF NOT EXISTS `Withdrawal_Request_Details` (
  `Qty_Requested` int(11) NOT NULL,
  `Qty_Release` int(11) NOT NULL,
  `WRId` varchar(20) NOT NULL,
  `WSid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Withdrawal_Request_Details`
--

INSERT INTO `Withdrawal_Request_Details` (`Qty_Requested`, `Qty_Release`, `WRId`, `WSid`) VALUES
(5, 5, 'JGO-WRS16-004', 1),
(1, 1, 'JGO-WRS16-002', 7),
(1, 0, 'BCK-WRS16-001', 7),
(5, 0, 'JGO-WRS16-003', 1),
(10, 1, 'JGO-WRS16-005', 1),
(1, 0, 'JGO-WRS16-005', 2);

--
-- Triggers `Withdrawal_Request_Details`
--
DELIMITER $$
CREATE TRIGGER `Delete_Withdrawal_Request` AFTER DELETE ON `withdrawal_request_details`
 FOR EACH ROW BEGIN
		UPDATE Warehouse_Spares
        SET Warehouse_Spares.Quantity_onHand = Warehouse_Spares.Quantity_onHand + old.Qty_Release
        WHERE Warehouse_Spares.WSid = old.WSid;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert_Withdrawal_Request` AFTER INSERT ON `withdrawal_request_details`
 FOR EACH ROW BEGIN
    
    	UPDATE Warehouse_Spares
        
        SET Warehouse_Spares.Quantity_onHand = Warehouse_Spares.Quantity_onHand - new.Qty_Release
        
        WHERE Warehouse_Spares.WSid = new.WSid;
   
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Withdrawal_Request` AFTER UPDATE ON `withdrawal_request_details`
 FOR EACH ROW BEGIN
    
    	UPDATE Warehouse_Spares
        SET Warehouse_Spares.Quantity_onHand = Warehouse_Spares.Quantity_onHand + old.Qty_Release        
        WHERE Warehouse_Spares.WSid = old.WSid;
		
        
		UPDATE Warehouse_Spares
		SET Warehouse_Spares.Quantity_onHand = Warehouse_Spares.Quantity_onHand - new.Qty_Release        
        WHERE Warehouse_Spares.WSid = new.WSid;
   
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bidding`
--
ALTER TABLE `Bidding`
  ADD PRIMARY KEY (`BId`);

--
-- Indexes for table `Checkpoints_Details`
--
ALTER TABLE `Checkpoints_Details`
  ADD PRIMARY KEY (`IId`);

--
-- Indexes for table `Delivery`
--
ALTER TABLE `Delivery`
  ADD PRIMARY KEY (`DId`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`DceNo`);

--
-- Indexes for table `Fixed_Value`
--
ALTER TABLE `Fixed_Value`
  ADD PRIMARY KEY (`FvId`);

--
-- Indexes for table `Purchase_Order`
--
ALTER TABLE `Purchase_Order`
  ADD PRIMARY KEY (`POId`);

--
-- Indexes for table `Purchase_Requisition`
--
ALTER TABLE `Purchase_Requisition`
  ADD PRIMARY KEY (`PRId`);

--
-- Indexes for table `Spare_Purchase`
--
ALTER TABLE `Spare_Purchase`
  ADD PRIMARY KEY (`SpId`);

--
-- Indexes for table `Specifications`
--
ALTER TABLE `Specifications`
  ADD PRIMARY KEY (`SId`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`SDceNo`);

--
-- Indexes for table `Technical_Details`
--
ALTER TABLE `Technical_Details`
  ADD PRIMARY KEY (`TId`);

--
-- Indexes for table `Warehouse_Spares`
--
ALTER TABLE `Warehouse_Spares`
  ADD PRIMARY KEY (`WSid`);

--
-- Indexes for table `Withdrawal_Request`
--
ALTER TABLE `Withdrawal_Request`
  ADD PRIMARY KEY (`WRId`),
  ADD UNIQUE KEY `WRId` (`WRId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bidding`
--
ALTER TABLE `Bidding`
  MODIFY `BId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Checkpoints_Details`
--
ALTER TABLE `Checkpoints_Details`
  MODIFY `IId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Delivery`
--
ALTER TABLE `Delivery`
  MODIFY `DId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Fixed_Value`
--
ALTER TABLE `Fixed_Value`
  MODIFY `FvId` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Purchase_Requisition`
--
ALTER TABLE `Purchase_Requisition`
  MODIFY `PRId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `Specifications`
--
ALTER TABLE `Specifications`
  MODIFY `SId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Technical_Details`
--
ALTER TABLE `Technical_Details`
  MODIFY `TId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Warehouse_Spares`
--
ALTER TABLE `Warehouse_Spares`
  MODIFY `WSid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
