-- phpMyAdmin SQL Dump
 -- version 5.2.1
 -- https://www.phpmyadmin.net/
 --
 -- Host: 127.0.0.1
 -- Generation Time: May 05, 2025 at 06:50 AM
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
 -- Database: `manuelron`
 --
 
 -- --------------------------------------------------------
 
 --
 -- Table structure for table `customers`
 --
 
 CREATE TABLE `customers` (
   `customer_id` int(10) NOT NULL,
   `first_name` varchar(50) NOT NULL,
   `last_name` varchar(50) NOT NULL,
   `email_address` varchar(50) NOT NULL,
   `number_of_complaints` int(5) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
 --
 -- Dumping data for table `customers`
 --
 
 INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email_address`, `number_of_complaints`) VALUES
 (1008, 'Zyrel', 'Umpay', 'ZyrelTagarda@gmail.com', 2),
 (1009, 'Katelyn', 'Coming', 'katy@gmail.com', 5),
 (1010, ' May', 'Chou', 'MayChou@gmail.com', 1),
 (1011, 'Antony', 'Ben10', 'antony10@gmail.com', 2),
 (1013, 'Peter', 'Lunox', 'Lunox@gmail.com', 1),
 (1014, 'Jacob', 'Ranin', 'JacobRanin@gmail.com', 4),
 (1015, 'Lylle', 'Subesa', 'lylle@gmail.com', 0),
 (1016, 'Jasmen', 'Pacal', 'Jasmen@gmail.com', 0);
 
 -- --------------------------------------------------------
 
 --
 -- Table structure for table `sales`
 --
 
 CREATE TABLE `sales` (
   `purchase_number` int(10) NOT NULL,
   `order_id` int(10) NOT NULL,
   `date_of_purchase` date DEFAULT NULL,
   `customer_id` int(10) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
 --
 -- Dumping data for table `sales`
 --
 
 INSERT INTO `sales` (`purchase_number`, `order_id`, `date_of_purchase`, `customer_id`) VALUES
 (2, 1002, '2025-05-01', 1008),
 (3, 1003, '2025-05-02', 1009),
 (4, 1004, '2025-05-02', 1010),
 (5, 1005, '2025-05-03', 1011),
 (7, 1007, '2025-05-04', 1013),
 (8, 1008, '2025-05-04', 1014),
 (9, 1009, '2025-05-05', 1015),
 (10, 1010, '2025-05-05', 1016);
 
 --
 -- Indexes for dumped tables
 --
 
 --
 -- Indexes for table `customers`
 --
 ALTER TABLE `customers`
   ADD PRIMARY KEY (`customer_id`);
 
 --
 -- Indexes for table `sales`
 --
 ALTER TABLE `sales`
   ADD PRIMARY KEY (`purchase_number`,`order_id`),
   ADD KEY `fk_customer_id` (`customer_id`);
 
 --
 -- AUTO_INCREMENT for dumped tables
 --
 
 --
 -- AUTO_INCREMENT for table `customers`
 --
 ALTER TABLE `customers`
   MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;
 
 --
 -- Constraints for dumped tables
 --
 
 --
 -- Constraints for table `sales`
 --
 ALTER TABLE `sales`
   ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
 COMMIT;
 
 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;