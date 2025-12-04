-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2025 at 09:40 AM
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
-- Database: `pl_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `account_type` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_number`, `fullname`, `email`, `phone`, `address`, `account_type`, `balance`, `created_at`) VALUES
(1, 'PL-863249657', 'Mamundi', 'mamundikaruppasamy.n.2026@rkmshome.org', '01234567890', 'kasnd', 'savings', 21000.00, '2025-03-31 09:23:53'),
(2, 'PL-305968933', 'Karthickraj', 'Karthickraj.p.2026@rmshome.org', '2090897654', 'Tiruttani-631209 Big Steer', 'savings', 10100.00, '2025-04-01 10:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `credit_cards`
--

CREATE TABLE `credit_cards` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `pan` varchar(10) NOT NULL,
  `credit_card` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit_cards`
--

INSERT INTO `credit_cards` (`id`, `company_name`, `NAME`, `date_of_birth`, `mobile_no`, `address`, `pan`, `credit_card`) VALUES
(1, '', 'Mamundi', '2008-01-29', '0123456789', 'Srivilliputhur', '1232144244', '928830871');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_holder` varchar(100) NOT NULL,
  `deposit_amount` decimal(12,2) NOT NULL,
  `deposit_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `account_number`, `account_holder`, `deposit_amount`, `deposit_date`) VALUES
(1, 'PL-863249657', 'Mamundi', 1000.00, '2025-03-31 09:24:20'),
(2, 'PL-30596893', 'karthickraj', 100.00, '2025-04-01 10:36:43'),
(3, 'PL-305968933', 'karthickraj', 100.00, '2025-04-01 10:37:11');

--
-- Triggers `deposits`
--
DELIMITER $$
CREATE TRIGGER `add_balance_after_deposit` AFTER INSERT ON `deposits` FOR EACH ROW BEGIN
    UPDATE accounts 
    SET balance = balance + NEW.deposit_amount
    WHERE account_number = NEW.account_number;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `entrepreneur`
--

CREATE TABLE `entrepreneur` (
  `businessName` varchar(50) DEFAULT NULL,
  `ownerName` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `loanAmount` int(10) DEFAULT NULL,
  `loanPurpose` varchar(40) DEFAULT NULL,
  `businessPlan` varchar(40) DEFAULT NULL,
  `financialStatements` varchar(30) DEFAULT NULL,
  `certificate` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entrepreneur`
--

INSERT INTO `entrepreneur` (`businessName`, `ownerName`, `email`, `loanAmount`, `loanPurpose`, `businessPlan`, `financialStatements`, `certificate`) VALUES
('Software Solution', 'Mamundi', 'mamundikaruppasamy.n.2026@rkms', 100000, 'sdk', 'uploads/5-integrating-artificial-intelli', 'uploads/ijsrp-p14508.pdf', 'uploads/2486cb49-0ba5-4cda-a99');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `insurance_type` varchar(50) NOT NULL,
  `coverage_amount` decimal(12,2) NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_applications`
--

CREATE TABLE `insurance_applications` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `insurance_type` varchar(50) NOT NULL,
  `coverage_amount` decimal(12,2) NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance_applications`
--

INSERT INTO `insurance_applications` (`id`, `name`, `email`, `phone`, `insurance_type`, `coverage_amount`, `application_date`) VALUES
(1, 'Karthickraj', 'Karthickraj.p.2026@rmshome.org', '2090897654', 'health', 1000000.00, '2025-04-01 10:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `loan_type` varchar(50) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banking`
--

CREATE TABLE `mobile_banking` (
  `id` int(11) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Debited_Amount` varchar(200) NOT NULL,
  `Banlance` varchar(200) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobile_banking`
--

INSERT INTO `mobile_banking` (`id`, `User_Name`, `password`, `Debited_Amount`, `Banlance`, `login_time`) VALUES
(1, 'Mamundi', 'Mamundi@123', '100000', '10000', '2025-03-31 08:44:13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `balance` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `password`, `balance`) VALUES
(1, 'Mamundi', 'mamundikaruppasamy.n.2026@rkmshome.org', '01234567890', '$2y$10$ZwJH17lpxy35Kjtsq2ISGOW9yHlyAHaf/JWDOHQ.DBaGWtbdcLFZ.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'Mamundi', '$2y$10$uyejnZ9Klb2CjVnXALm9b.GFf83i/f8UiEf6MfWnXiRMwP63hJyla', '2025-04-11 10:32:25'),
(2, 'Karthi', '$2y$10$jDTo8nDKV1JEsI5Q9H9kwekMRh/N50E1Et9mQlnfgoq9HNJ7JibIm', '2025-04-11 10:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `users_credit`
--

CREATE TABLE `users_credit` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_credit`
--

INSERT INTO `users_credit` (`id`, `username`, `password`, `email`) VALUES
(1, 'plbank@2025', 'pl@Bank', 'plkbank@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `password`) VALUES
(1, 'Mamundi', 'Mamundi@1'),
(3, 'Karthi', 'karthi@123'),
(4, 'Ajay', 'Ajay@123'),
(5, 'Akash', 'Akash@123'),
(6, 'Gopi', 'Gopi@123'),
(7, 'Mothi', 'Mothi@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_number` (`account_number`);

--
-- Indexes for table `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance_applications`
--
ALTER TABLE `insurance_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_banking`
--
ALTER TABLE `mobile_banking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_credit`
--
ALTER TABLE `users_credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_applications`
--
ALTER TABLE `insurance_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_banking`
--
ALTER TABLE `mobile_banking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_credit`
--
ALTER TABLE `users_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
