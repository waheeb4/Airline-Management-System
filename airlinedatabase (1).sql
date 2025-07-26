-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2025 at 08:17 PM
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
-- Database: `airlinedatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendants`
--

CREATE TABLE `attendants` (
  `AttendantID` char(2) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `SSN` char(13) NOT NULL,
  `Age` int(11) NOT NULL,
  `PhoneNumber` char(11) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendants`
--

INSERT INTO `attendants` (`AttendantID`, `FirstName`, `LastName`, `SSN`, `Age`, `PhoneNumber`, `Address`) VALUES
('A1', 'Hania', 'Walid', '3125812492141', 23, '01239479272', 'Mandara'),
('A3', 'Karim', 'Fouad', '3123123131231', 26, '01132483951', 'Sidi Beshr');

--
-- Triggers `attendants`
--
DELIMITER $$
CREATE TRIGGER `check_fixed_digits` BEFORE INSERT ON `attendants` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.SSN) != 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SSN must have exactly 13 digits.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_fixed_number` BEFORE INSERT ON `attendants` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.PhoneNumber) != 11 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone numbers must have exactly 11 Numbers.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `FlightCode` char(5) NOT NULL,
  `Source` varchar(50) NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `DateofDep` date NOT NULL,
  `Seats` int(11) NOT NULL
) ;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`FlightCode`, `Source`, `Destination`, `DateofDep`, `Seats`) VALUES
('AAS11', 'Amsterdam', 'Dhaka', '2025-01-23', 1200),
('AF12E', 'Madrid', 'Washington D.C.', '2025-05-29', 200),
('AF324', 'Rome', 'Cairo', '2025-05-31', 300),
('YSOA1', 'Mumbai', 'Alexandria', '2025-05-28', 1000);

--
-- Triggers `flights`
--
DELIMITER $$
CREATE TRIGGER `before_insert_date` BEFORE INSERT ON `flights` FOR EACH ROW BEGIN
    IF NEW.DateofDep < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date cannot be earlier than today.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_fixed_char` BEFORE INSERT ON `flights` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.FlightCode) != 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight Code must have exactly 5 Characters.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Username`, `Password`) VALUES
('Adham Waheeb', '221001600'),
('admin', 'admin'),
('Ahmed Jul', '221001442');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `SSN` char(13) NOT NULL,
  `Age` int(11) NOT NULL,
  `PhoneNumber` char(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `PassengerID` char(2) NOT NULL,
  `PassportNumber` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`FirstName`, `LastName`, `SSN`, `Age`, `PhoneNumber`, `Address`, `PassengerID`, `PassportNumber`) VALUES
('Hamada', 'Helal', '3123312412412', 24, '01140323451', 'Miami', 'P1', '39123'),
('Mohamed', 'Fawzy', '1234567891234', 37, '01234578912', 'Gleem', 'P2', '12345');

--
-- Triggers `passengers`
--
DELIMITER $$
CREATE TRIGGER `check_fixed_digits1` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.SSN) != 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SSN must have exactly 13 Digits.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_fixed_number1` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.PhoneNumber) != 11 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone numbers must have exactly 11 Numbers.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_fixed_number2` BEFORE INSERT ON `passengers` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.PassportNumber) != 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Passport number must have exactly 5 Characters.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pilots`
--

CREATE TABLE `pilots` (
  `PilotID` char(2) NOT NULL,
  `FlightCredit` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `SSN` char(13) NOT NULL,
  `Age` int(11) NOT NULL,
  `PhoneNumber` char(11) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pilots`
--

INSERT INTO `pilots` (`PilotID`, `FlightCredit`, `FirstName`, `LastName`, `SSN`, `Age`, `PhoneNumber`, `Address`) VALUES
('C1', 120, 'Ahmed', 'Hamody', '3312341413123', 43, '01240523119', 'Louran'),
('C2', 130, 'Ehab', 'Magdy', '3131313131314', 23, '01120986542', 'Mandara');

--
-- Triggers `pilots`
--
DELIMITER $$
CREATE TRIGGER `check_fixed_number3` BEFORE INSERT ON `pilots` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.PhoneNumber) != 11 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone numbers must have exactly 11 Numbers.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_fixed_number4` BEFORE INSERT ON `pilots` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.SSN) != 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SSN must have exactly 13 Digits.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `TicketCode` char(2) NOT NULL,
  `PassengerID` char(2) NOT NULL,
  `FlightCode` char(5) NOT NULL,
  `PilotID` char(2) NOT NULL,
  `AttendantID` char(2) NOT NULL,
  `Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendants`
--
ALTER TABLE `attendants`
  ADD PRIMARY KEY (`AttendantID`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightCode`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`PassengerID`),
  ADD UNIQUE KEY `SSN` (`SSN`),
  ADD UNIQUE KEY `PassportNumber` (`PassportNumber`);

--
-- Indexes for table `pilots`
--
ALTER TABLE `pilots`
  ADD PRIMARY KEY (`PilotID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`TicketCode`),
  ADD KEY `aifk` (`AttendantID`),
  ADD KEY `flcdfk` (`FlightCode`),
  ADD KEY `cidfk` (`PilotID`),
  ADD KEY `pifk` (`PassengerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `aifk` FOREIGN KEY (`AttendantID`) REFERENCES `attendants` (`AttendantID`),
  ADD CONSTRAINT `cidfk` FOREIGN KEY (`PilotID`) REFERENCES `pilots` (`PilotID`),
  ADD CONSTRAINT `flcdfk` FOREIGN KEY (`FlightCode`) REFERENCES `flights` (`FlightCode`),
  ADD CONSTRAINT `pifk` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
