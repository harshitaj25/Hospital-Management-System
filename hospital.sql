-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2024 at 07:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appointment`
--

CREATE TABLE `Appointment` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Appointment`
--

INSERT INTO `Appointment` (`appointment_id`, `patient_id`, `doctor_id`, `schedule_id`, `start_time`, `end_time`, `date`, `status`) VALUES
(5, 1, 1, 1, '09:30:00', '10:00:00', '2024-06-03', 'Confirmed'),
(6, 2, 1, 2, '10:30:00', '11:00:00', '2024-06-04', 'Pending'),
(7, 3, 3, 3, '09:00:00', '09:30:00', '2024-06-05', 'Confirmed'),
(8, 4, 2, 4, '10:00:00', '10:30:00', '2024-06-06', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Doctor`
--

CREATE TABLE `Doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Doctor`
--

INSERT INTO `Doctor` (`doctor_id`, `name`, `email`, `password`, `gender`) VALUES
(1, 'Dr. Alice Brown', 'alicebrown@example.com', 'docpass123', 'Female'),
(2, 'Dr. Bob Johnson', 'bobjohnson@example.com', 'docpass456', 'Male'),
(3, 'Dr. Emily White', 'emilywhite@example.com', 'docpass789', 'Female'),
(4, 'Dr. Michael Black', 'michaelblack@example.com', 'docpass101', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `MedicalHistory`
--

CREATE TABLE `MedicalHistory` (
  `history_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `surgeries` text DEFAULT NULL,
  `medication` text DEFAULT NULL,
  `condition` text DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MedicalHistory`
--

INSERT INTO `MedicalHistory` (`history_id`, `patient_id`, `surgeries`, `medication`, `condition`, `date_time`) VALUES
(1, 1, 'Appendectomy', 'Ibuprofen', 'Recovered', '2024-06-01 10:00:00'),
(2, 2, 'Gallbladder Removal', 'Painkillers', 'Recovering', '2024-05-20 15:30:00'),
(3, 3, 'Knee Surgery', 'Opioids', 'Recovering', '2024-06-10 09:00:00'),
(4, 4, 'None', 'N/A', 'Healthy', '2024-05-15 11:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`patient_id`, `name`, `gender`, `email`, `address`, `password`) VALUES
(1, 'John Doe', 'Male', 'johndoe@example.com', 'Sydney', 'password123'),
(2, 'Jane Smith', 'Female', 'janesmith@example.com', 'Sydney', 'password456'),
(3, 'Michael Johnson', 'Male', 'michaeljohnson@example.com', 'Blacktown', 'password789'),
(4, 'Emily Brown', 'Female', 'emilybrown@example.com', 'Harris Park', 'password101');

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE `Schedule` (
  `schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `breaks` text DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`schedule_id`, `doctor_id`, `day`, `breaks`, `start_time`, `end_time`) VALUES
(1, 1, 'Monday', '12:00-13:00', '09:00:00', '17:00:00'),
(2, 2, 'Tuesday', '13:00-14:00', '10:00:00', '18:00:00'),
(3, 3, 'Wednesday', '11:00-12:00', '08:00:00', '16:00:00'),
(4, 4, 'Thursday', '14:00-15:00', '09:00:00', '17:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appointment`
--
ALTER TABLE `Appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `Doctor`
--
ALTER TABLE `Doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `MedicalHistory`
--
ALTER TABLE `MedicalHistory`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Appointment`
--
ALTER TABLE `Appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Doctor`
--
ALTER TABLE `Doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `MedicalHistory`
--
ALTER TABLE `MedicalHistory`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Schedule`
--
ALTER TABLE `Schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appointment`
--
ALTER TABLE `Appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`doctor_id`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `Schedule` (`schedule_id`);

--
-- Constraints for table `MedicalHistory`
--
ALTER TABLE `MedicalHistory`
  ADD CONSTRAINT `medicalhistory_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`);

--
-- Constraints for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
