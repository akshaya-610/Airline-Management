-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 01:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_mgmt`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `annualincome_tax` (`SALARY` INTEGER) RETURNS VARCHAR(20) CHARSET utf8mb4 DETERMINISTIC BEGIN
IF SALARY*12 > 70000 THEN 
RETURN ("Taxable");
ELSE
RETURN ("Non Taxable");
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AIRLINEID` varchar(3) NOT NULL,
  `AL_NAME` varchar(50) DEFAULT NULL,
  `AP_NAME` varchar(100) NOT NULL,
  `THREE_DIGIT_CODE` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`AIRLINEID`, `AL_NAME`, `AP_NAME`, `THREE_DIGIT_CODE`) VALUES
('9W', 'Jet Airways', 'John F. Kennedy International Airport', '589'),
('AA', 'American Airlines', 'Louisville International Airport', '001'),
('AI', 'Air India Limited', 'Chandigarh International Airport', '098'),
('BA', 'British Airways', 'San Francisco International Airport', '125'),
('EK', 'Emirates', 'George Bush Intercontinental Airport', '176'),
('EY', 'Ethiad Airways', 'Tampa International Airport', '607'),
('LH', 'Lufthansa', 'Dallas/Fort Worth International Airport', '220'),
('QR', 'Qatar Airways', 'Chhatrapati Shivaji International Airport', '157');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `AP_NAME` varchar(100) NOT NULL,
  `STATE` varchar(15) DEFAULT NULL,
  `COUNTRY` varchar(30) DEFAULT NULL,
  `CNAME` varchar(15) DEFAULT NULL,
  `AIRLINEID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`AP_NAME`, `STATE`, `COUNTRY`, `CNAME`, `AIRLINEID`) VALUES
('Chandigarh International Airport', 'Chandigarh', 'India', 'Chandigarh', 'AI'),
('Chhatrapati Shivaji International Airport', 'Maharashtra', 'India', 'Mumbai', 'QR'),
('Dallas/Fort Worth International Airport', 'Texas', 'United States', 'Fort Worth', 'LH'),
('Frankfurt Airport', 'Hesse', 'Germany', 'Frankfurt', 'LH'),
('George Bush Intercontinental Airport', 'Texas', 'United States', 'Houston', 'AI'),
('Indira GandhiInternational Airport', 'Delhi', 'India', 'Delhi', 'AI'),
('John F. Kennedy International Airport', 'New York', 'United States', 'New York City', 'BA'),
('Louisville International Airport', 'Kentucky', 'United States', 'Louisville', 'AA'),
('San Francisco International Airport', 'California', 'United States', 'San Francisco', 'BA'),
('Tampa International Airport', 'Florida', 'United States', 'Tampa', 'QR');

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `AIRLINEID` varchar(3) NOT NULL,
  `AP_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contains`
--

INSERT INTO `contains` (`AIRLINEID`, `AP_NAME`) VALUES
('AA', 'George Bush Intercontinental Airport'),
('AA', 'John F. Kennedy International Airport'),
('AA', 'Louisville International Airport'),
('AA', 'San Francisco International Airport'),
('AA', 'Tampa International Airport'),
('AI', 'Chandigarh International Airport'),
('AI', 'Chhatrapati Shivaji International Airport'),
('AI', 'Dallas/Fort Worth International Airport'),
('AI', 'George Bush Intercontinental Airport'),
('AI', 'Indira GandhiInternational Airport'),
('BA', 'Chandigarh International Airport'),
('BA', 'Chhatrapati Shivaji International Airport'),
('BA', 'Frankfurt Airport'),
('BA', 'John F. Kennedy International Airport'),
('BA', 'San Francisco International Airport'),
('LH', 'Chhatrapati Shivaji International Airport'),
('LH', 'Dallas/Fort Worth International Airport'),
('LH', 'Frankfurt Airport'),
('LH', 'John F. Kennedy International Airport'),
('LH', 'San Francisco International Airport'),
('QR', 'Chhatrapati Shivaji International Airport'),
('QR', 'Dallas/Fort Worth International Airport'),
('QR', 'John F. Kennedy International Airport'),
('QR', 'Louisville International Airport'),
('QR', 'Tampa International Airport');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `FNAME` varchar(20) DEFAULT NULL,
  `M` varchar(1) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PHONE` bigint(20) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `JOBTYPE` varchar(30) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  `PID` int(11) NOT NULL,
  `AP_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `FNAME`, `M`, `LNAME`, `ADDRESS`, `PHONE`, `AGE`, `SEX`, `JOBTYPE`, `SALARY`, `PID`, `AP_NAME`) VALUES
(123456789, 'LINDA', 'M', 'GOODMAN', '731 Fondren, Houston, TX', 4356789345, 35, 'F', 'ADMINISTRATIVE SUPPORT', 50000, 2, 'Louisville International Airport'),
(125478909, 'PRATIK', 'T', 'GOMES', '334 VITRUVIAN PARK, ALBANY, NY', 4444678903, 56, 'M', 'TRAFFIC MONITOR', 80000, 3, 'John F. Kennedy International Airport'),
(324567897, 'ADIT', 'P', 'DESAI', '987 SOMNATH, CHANDIGARH, INDIA', 2244658909, 36, 'M', 'TRAFFIC MONITOR', 80000, 9, 'Chandigarh International Airport'),
(333445555, 'JOHNY', 'N', 'PAUL', '638 Voss, Houston, TX', 9834561995, 40, 'M', 'ADMINISTRATIVE SUPPORT', 50000, 1, 'Louisville International Airport'),
(453453453, 'RAJ', 'B', 'SHARMA', '345 FLOYDS, MUMBAI,INDIA', 4326789031, 35, 'M', 'AIRPORT AUTHORITY', 90000, 6, 'Chhatrapati Shivaji International Airport'),
(456651407, 'Micheal', 'V', 'Smith', 'Brook\'s Valley', 7834568801, 43, 'M', 'Administrative support', 42000, 9, 'John F. Kennedy International Airport'),
(666884444, 'SHELDON', 'A', 'COOPER', '345 CHERRY PARK, HESSE,GERMANY', 1254678903, 55, 'M', 'TRAFFIC MONITOR', 80000, 3, 'Frankfurt Airport'),
(888665555, 'SHUBHAM', 'R', 'GUPTA', '567 CHANDANI CHOWK, DELHI, INDIA', 8566778890, 39, 'M', 'ADMINISTRATIVE SUPPORT', 50000, 4, 'Indira GandhiInternational Airport'),
(987654321, 'SHERLOCK', 'A', 'HOLMES', '123 TOP HILL, SAN Francisco,CA', 8089654321, 47, 'M', 'TRAFFIC MONITOR', 80000, 5, 'San Francisco International Airport'),
(987987987, 'NIKITA', 'C', 'PAUL', '110 SYNERGY PARK, DALLAS,TX', 5678904325, 33, 'F', 'ENGINEER', 70000, 2, 'Dallas/Fort Worth International Airport'),
(999887777, 'JAMES', 'P', 'BOND', '3321 Castle, Spring, TX', 9834666995, 50, 'M', 'ENGINEER', 70000, 4, 'Louisville International Airport');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `FLIGHT_CODE` varchar(10) NOT NULL,
  `SOURCE` varchar(3) DEFAULT NULL,
  `DESTINATION` varchar(3) DEFAULT NULL,
  `ARRIVAL` varchar(10) DEFAULT NULL,
  `DEPARTURE` varchar(10) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `DURATION` varchar(30) DEFAULT NULL,
  `FLIGHTTYPE` varchar(10) DEFAULT NULL,
  `LAYOVER_TIME` varchar(30) DEFAULT NULL,
  `NO_OF_STOPS` int(11) DEFAULT NULL,
  `AIRLINEID` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`FLIGHT_CODE`, `SOURCE`, `DESTINATION`, `ARRIVAL`, `DEPARTURE`, `STATUS`, `DURATION`, `FLIGHTTYPE`, `LAYOVER_TIME`, `NO_OF_STOPS`, `AIRLINEID`) VALUES
('9W2334', 'IAH', 'DEL', '23:00', '13:45', 'On-time', '23hrs', 'Direct', '0', 0, '9W'),
('AA4367', 'SFO', 'FRA', '18:10', '18:55', 'On-time', '21hrs', 'Non-stop', '0', 0, 'AA'),
('AA9046', 'BOM', 'DEL', '05:00', '06:15', 'On-time', '15hrs', 'Connecting', '3', 1, 'AA'),
('AI2014', 'BOM', 'DFW', '02:10', '03:15', 'On-time', '24hr', 'Connecting', '3', 1, 'AI'),
('AI4557', 'JFK', 'FRA', '13:05', '14:10', 'Delayed', '20hrs', 'Connecting', '4', 1, 'AI'),
('BA1689', 'FRA', 'DEL', '10:20', '10:55', 'On-time', '14hrs', 'Non-stop', '0', 0, 'BA'),
('BA3056', 'BOM', 'DFW', '02:15', '02:55', 'On-time', '29hrs', 'Connecting', '3', 1, 'BA'),
('BA5607', 'SFO', 'DFW', '11:25', '12:05', 'On-time', '14hrs', 'Non-stop', '5', 2, 'BA'),
('EK3456', 'BOM', 'SFO', '18:50', '19:40', 'On-time', '30hrs', 'Non-stop', '0', 0, 'EK'),
('EY1234', 'JFK', 'TPA', '19:20', '20:05', 'On-time', '16hrs', 'Connecting', '5', 2, 'EY'),
('LH5602', 'IAH', 'TPA', '15:10', '15:35', 'On-time', '17hrs', 'Direct', '0', 0, 'LH'),
('LH9876', 'JFK', 'BOM', '05:50', '06:35', 'On-time', '18hrs', 'Non-stop', '0', 0, 'LH'),
('QR1902', 'IXC', 'IAH', '22:00', '22:50', 'Delayed', '28hrs', 'Non-stop', '0', 1, 'QR'),
('QR2305', 'BOM', 'DFW', '13:00', '13:55', 'Delayed', '21hr', 'Non-stop', '0', 0, 'QR');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PID` int(11) NOT NULL,
  `PASSPORTNO` varchar(10) NOT NULL,
  `FNAME` varchar(20) DEFAULT NULL,
  `M` varchar(1) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PHONE` bigint(20) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `FLIGHT_CODE` varchar(10) DEFAULT NULL,
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PID`, `PASSPORTNO`, `FNAME`, `M`, `LNAME`, `ADDRESS`, `PHONE`, `AGE`, `SEX`, `FLIGHT_CODE`, `SSN`) VALUES
(0, 'E3277889', 'John', 'A', 'GATES', '1234 BAKER APTS, APT 59, HESSE, GERMANY', 9724569986, 10, 'M', 'BA3056', 333445555),
(0, 'K3212322', 'SARA', 'B', 'GOMES', '6785 SPLITSVILLA, APT 34, MIAMI, FL', 9024569226, 15, 'F', 'EY1234', 666884444),
(0, 'P3452390', 'ALIA', 'V', 'BHAT', '548 MARKET PLACE, SAN Francisco, CA', 9734567800, 10, 'F', 'QR1902', 999887777),
(0, 'R8990566', 'RIA', 'T', 'GUPTA', '3355 PALENCIA, APT 2065, MUMBAI, INDIA', 4724512343, 10, 'M', 'LH9876', 123456789),
(0, 'W7543336', 'JOHN', 'P', 'SMITH', '6666 ROCK HILL, APT 2902, TAMPA, FL', 4624569986, 55, 'M', '9W2334', 333445555),
(1, 'A1234568', 'ALEN', 'M', 'SMITH', '2230 NORTHSIDE, APT 11, ALBANY, NY', 8080367290, 30, 'M', 'AI2014', 123456789),
(2, 'B9876541', 'ANKITA', 'V', 'AHIR', '3456 VIKAS APTS, APT 102,DOMBIVLI, INDIA', 8080367280, 26, 'F', 'QR2305', 123456789),
(3, 'C2345698', 'KHYATI', 'A', 'MISHRA', '7820 MCCALLUM COURTS, APT 234, AKRON, OH', 8082267280, 30, 'F', 'BA1689', 888665555),
(4, 'D1002004', 'ANKITA', 'S', 'PATIL', '7720 MCCALLUM BLVD, APT 1082, DALLAS, TX', 9080367266, 23, 'F', 'AI2014', 123456789),
(5, 'X9324666', 'TEJASHREE', 'B', 'PANDIT', '9082 ESTAES OF RICHARDSON, RICHARDSON, TX', 9004360125, 28, 'F', 'QR1902', 333445555),
(6, 'B8765430', 'LAKSHMI', 'P', 'SHARMA', '1110 FIR HILLS, APT 903, AKRON, OH', 7666190505, 30, 'F', 'BA1689', 123456789),
(7, 'J9801235', 'AKHILESH', 'D', 'JOSHI', '345 CHATHAM COURTS, APT 678, MUMBAI, INDIA', 9080369290, 29, 'M', 'EK3456', 888665555),
(8, 'A1122334', 'MANAN', 'S', 'LAKHANI', '5589 CHTHAM REFLECTIONS, APT 349 HOUSTON, TX', 9004335126, 25, 'F', 'QR1902', 333445555),
(9, 'Q1243567', 'KARAN', 'M', 'MOTANI', '4444 FRANKFORD VILLA, APT 77, GUILDERLAND, NY', 9727626643, 22, 'M', 'AA4367', 666884444),
(10, 'S1243269', 'ROM', 'A', 'SOLANKI', '7720 MCCALLUM BLVD, APT 2087, DALLAS, TX', 9004568903, 60, 'M', '9W2334', 999887777),
(11, 'E3277889', 'John', 'A', 'GATES', '1234 BAKER APTS, APT 59, HESSE, GERMANY', 9724569986, 10, 'M', 'BA3056', 333445555),
(12, 'K3212322', 'SARA', 'B', 'GOMES', '6785 SPLITSVILLA, APT 34, MIAMI, FL', 9024569226, 15, 'F', 'EY1234', 666884444),
(13, 'P3452390', 'ALIA', 'V', 'BHAT', '548 MARKET PLACE, SAN Francisco, CA', 9734567800, 10, 'F', 'QR1902', 999887777),
(14, 'W7543336', 'JOHN', 'P', 'SMITH', '6666 ROCK HILL, APT 2902, TAMPA, FL', 4624569986, 55, 'M', '9W2334', 333445555),
(15, 'R8990566', 'RIA', 'T', 'GUPTA', '3355 PALENCIA, APT 2065, MUMBAI, INDIA', 4724512343, 10, 'M', 'LH9876', 123456789);

-- --------------------------------------------------------

--
-- Table structure for table `serves`
--

CREATE TABLE `serves` (
  `SSN` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `PASSPORTNO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serves`
--

INSERT INTO `serves` (`SSN`, `PID`, `PASSPORTNO`) VALUES
(123456789, 1, 'A1234568'),
(123456789, 7, 'J9801235'),
(123456789, 9, 'Q1243567'),
(123456789, 15, 'R8990566'),
(333445555, 10, 'S1243269'),
(333445555, 12, 'K3212322'),
(888665555, 4, 'D1002004'),
(888665555, 7, 'J9801235'),
(888665555, 12, 'K3212322'),
(888665555, 13, 'P3452390');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TICKET_NUMBER` bigint(20) NOT NULL,
  `SOURCE` varchar(3) DEFAULT NULL,
  `DESTINATION` varchar(3) DEFAULT NULL,
  `DATE_OF_BOOKING` date DEFAULT NULL,
  `DATE_OF_TRAVEL` date DEFAULT NULL,
  `SEATNO` varchar(5) DEFAULT NULL,
  `CLASS` varchar(15) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `DATE_OF_CANCELLATION` date DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `PASSPORTNO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TICKET_NUMBER`, `SOURCE`, `DESTINATION`, `DATE_OF_BOOKING`, `DATE_OF_TRAVEL`, `SEATNO`, `CLASS`, `PRICE`, `DATE_OF_CANCELLATION`, `PID`, `PASSPORTNO`) VALUES
(11234111122, 'BOM', 'DFW', '2022-10-16', '2022-12-15', '32A', 'BUSINESS', 135000, '2022-10-15', 1, 'A1234568'),
(984567222299, 'JFK', 'BOM', '2022-06-11', '2022-09-16', '45D', 'ECONOMY', 100000, NULL, 2, 'B9876541'),
(1251334499699, 'IXC', 'IAH', '2022-08-20', '2022-11-17', '45D', 'ECONOMY', 120000, NULL, 12, 'K3212322'),
(1255701876107, 'FRA', 'DEL', '2022-10-15', '2022-12-16', '57F', 'BUSINESS', 170000, NULL, 11, 'E3277889'),
(1258776199490, 'BOM', 'DFW', '2022-05-13', '2022-07-15', '37C', 'ECONOMY', 150000, '2022-05-25', 13, 'P3452390'),
(1570864987655, 'IXC', 'IAH', '2022-11-12', '2022-12-30', '54C', 'ECONOMY', 140000, NULL, 9, 'Q1243567'),
(1571357215116, 'SFO', 'FRA', '2022-10-15', '2022-10-18', '34E', 'BUSINESS', 170000, NULL, 8, 'A1122334'),
(1577654664266, 'JFK', 'TPA', '2022-06-13', '2022-12-10', '54E', 'ECONOMY', 90000, NULL, 5, 'X9324666'),
(1579283997799, 'BOM', 'SFO', '2022-01-22', '2022-06-15', '38A', 'FIRST-CLASS', 165000, NULL, 10, 'S1243269'),
(1768901333273, 'IAH', 'DEL', '2022-07-21', '2022-12-25', '1A', 'BUSINESS', 200000, '2022-07-21', 3, 'C2345698'),
(2206543545545, 'BOM', 'DFW', '2022-11-11', '2022-02-17', '43B', 'BUSINESS', 125000, NULL, 6, 'B8765430'),
(5890987441464, 'IXC', 'IAH', '2022-07-10', '2022-09-16', '20C', 'FIRST-CLASS', 150000, NULL, 4, 'D1002004'),
(5891155114477, 'FRA', 'DEL', '2022-06-16', '2022-10-23', '55C', 'ECONOMY', 80000, NULL, 14, 'W7543336'),
(5893069766787, 'BOM', 'DFW', '2022-10-16', '2022-12-22', '33F', 'ECONOMY', 150000, NULL, 15, 'R8990566'),
(7064321779737, 'IAH', 'DEL', '2022-06-11', '2022-08-16', '27B', 'FIRST-CLASS', 195000, '2022-12-10', 7, 'J9801235');

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `TICKET_PRICE_HISTORY` BEFORE UPDATE ON `ticket` FOR EACH ROW BEGIN
INSERT INTO TICKET_PRICE_HISTORY(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES(OLD.DATE_OF_BOOKING, OLD.SOURCE, OLD.DESTINATION, OLD.CLASS, OLD.PRICE);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_price_history`
--

CREATE TABLE `ticket_price_history` (
  `DATE_OF_BOOKING` date NOT NULL,
  `SOURCE` varchar(3) NOT NULL,
  `DESTINATION` varchar(3) NOT NULL,
  `CLASS` varchar(15) NOT NULL,
  `PRICE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_price_history`
--

INSERT INTO `ticket_price_history` (`DATE_OF_BOOKING`, `SOURCE`, `DESTINATION`, `CLASS`, `PRICE`) VALUES
('2022-05-13', 'BOM', 'DFW', 'ECONOMY', 75000),
('2022-10-16', 'BOM', 'DFW', 'ECONOMY', 98000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AIRLINEID`),
  ADD KEY `AP_NAME` (`AP_NAME`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AP_NAME`),
  ADD KEY `AIRLINEID` (`AIRLINEID`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD PRIMARY KEY (`AIRLINEID`,`AP_NAME`),
  ADD KEY `AP_NAME` (`AP_NAME`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `PID` (`PID`),
  ADD KEY `AP_NAME` (`AP_NAME`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`FLIGHT_CODE`),
  ADD KEY `AIRLINEID` (`AIRLINEID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PID`,`PASSPORTNO`),
  ADD KEY `FLIGHT_CODE` (`FLIGHT_CODE`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `serves`
--
ALTER TABLE `serves`
  ADD PRIMARY KEY (`SSN`,`PID`,`PASSPORTNO`),
  ADD KEY `PID` (`PID`,`PASSPORTNO`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_NUMBER`),
  ADD KEY `PID` (`PID`,`PASSPORTNO`);

--
-- Indexes for table `ticket_price_history`
--
ALTER TABLE `ticket_price_history`
  ADD PRIMARY KEY (`DATE_OF_BOOKING`,`SOURCE`,`DESTINATION`,`CLASS`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airline`
--
ALTER TABLE `airline`
  ADD CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`AP_NAME`) REFERENCES `airport` (`AP_NAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`AIRLINEID`) REFERENCES `airline` (`AIRLINEID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`AP_NAME`) REFERENCES `airport` (`AP_NAME`) ON DELETE CASCADE,
  ADD CONSTRAINT `contains_ibfk_3` FOREIGN KEY (`AIRLINEID`) REFERENCES `airline` (`AIRLINEID`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `passenger` (`PID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`AP_NAME`) REFERENCES `airport` (`AP_NAME`) ON DELETE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`AIRLINEID`) REFERENCES `airline` (`AIRLINEID`) ON DELETE CASCADE;

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`FLIGHT_CODE`) REFERENCES `flight` (`FLIGHT_CODE`) ON DELETE CASCADE,
  ADD CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE;

--
-- Constraints for table `serves`
--
ALTER TABLE `serves`
  ADD CONSTRAINT `serves_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE,
  ADD CONSTRAINT `serves_ibfk_2` FOREIGN KEY (`PID`,`PASSPORTNO`) REFERENCES `passenger` (`PID`, `PASSPORTNO`) ON DELETE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PID`,`PASSPORTNO`) REFERENCES `passenger` (`PID`, `PASSPORTNO`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
