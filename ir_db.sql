-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2024 at 10:16 AM
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
-- Database: `ir_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL COMMENT 'Name of the asset',
  `category` varchar(256) DEFAULT NULL COMMENT 'Category of the asset',
  `filetype` varchar(256) DEFAULT NULL COMMENT 'Filetype of the asset',
  `filesize` float DEFAULT NULL COMMENT 'File size of asset. Float as MB',
  `link` varchar(512) DEFAULT NULL COMMENT 'Website link to asset',
  `screenshot` varchar(256) DEFAULT NULL COMMENT 'Filename and type together for screenshot',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID of user who created this asset'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `category`, `filetype`, `filesize`, `link`, `screenshot`, `user_id`) VALUES
(1, 'FPS Project File', 'Unity Project', '.rar', 1056.8, 'http://google.com', 'test-screenshot.jpg', 1),
(2, 'Road Sign 002', '3D Objects', 'obj', 20.1, 'http://bing.com.au', 'test-obj.jpg', 2),
(3, 'Sidewalk', '3D Object', 'obj', 10.6, 'http://youtube.com.au', 'obj-test-2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL COMMENT 'Project Title',
  `type` varchar(256) DEFAULT NULL COMMENT 'Type of Project (Eg: Movie, Asset Creation, Virtual Reality)',
  `client` varchar(256) DEFAULT NULL COMMENT 'Company or Clients Name',
  `date_start` varchar(128) DEFAULT NULL COMMENT 'Project Start Date',
  `date_end` varchar(128) DEFAULT NULL COMMENT 'Project End Date',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID who created this project'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `type`, `client`, `date_start`, `date_end`, `user_id`) VALUES
(1, 'Generic Shooter Game', 'Video Game', 'Valve', '2025-10-01', NULL, NULL),
(2, '3D Road Asset Bundle', '3D', 'Sold By Bundle', '2022-10-21', '2023-08-23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_assets`
--

CREATE TABLE `project_assets` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL COMMENT 'ID of the related Project',
  `asset_id` int(11) NOT NULL COMMENT 'ID of the related Asset'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_assets`
--

INSERT INTO `project_assets` (`id`, `project_id`, `asset_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'ID of user',
  `first_name` varchar(256) DEFAULT NULL COMMENT 'First name of user',
  `last_name` varchar(256) DEFAULT NULL COMMENT 'Last name of user',
  `email` varchar(256) DEFAULT NULL COMMENT 'Email of user',
  `password` varchar(512) NOT NULL COMMENT 'Password of user. Hashed',
  `session` varchar(256) DEFAULT NULL COMMENT 'Session of user',
  `enabled` tinyint(1) NOT NULL COMMENT 'User is enabled or disabled aplication access',
  `last_login` date DEFAULT NULL COMMENT 'Last login date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `session`, `enabled`, `last_login`) VALUES
(1, 'Jesse', 'Read', 'jesse@mail.com', '45e89226f34083a64bc9035e8a367006a824abf89ae55fee9540d8d3c43ff07b', 'edd60db14650079b61c9751d07cc8a42cf4e38944b2f9adc6d4f29176aeed267', 1, '2024-11-07'),
(2, 'Maja', 'S', 'maya@mail.com', 'b7effcc360ad9f6e62a255c9eb852a99c69373a25f218bce299dfc20d511ac3b', NULL, 1, '2024-10-29'),
(3, 'Steven', 'S', 'steven@mail.com', 'f7a76fe0a090a2d2c88231c1a39f64e32771fa1b93314de093a1cf217ddfd72e', NULL, 1, '2024-11-03'),
(6, 'Arye', 'A', 'arye@mail.com', '5c3e8c90730ceee64143d635797c8f48f86d223db362648bca92d70daf9046a4', NULL, 0, '2024-11-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_assets`
--
ALTER TABLE `project_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_assets`
--
ALTER TABLE `project_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of user', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
