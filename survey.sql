-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2018 at 02:28 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `ed_answers`
--

CREATE TABLE `ed_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_choice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ed_answers`
--

INSERT INTO `ed_answers` (`id`, `question_id`, `user_id`, `option_choice`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 3),
(3, 3, 1, 9),
(4, 4, 1, 12),
(5, 5, 1, 19),
(6, 6, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `ed_options`
--

CREATE TABLE `ed_options` (
  `id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `options` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ed_options`
--

INSERT INTO `ed_options` (`id`, `questions_id`, `options`) VALUES
(1, 1, 'Yes'),
(2, 1, 'No'),
(3, 2, 'Yes, we have a medical room and a dedicated doctor'),
(4, 2, 'We have a medical room, but we do not have a doctor, but we have a nurse'),
(5, 2, 'No, we neither have a medical room nor a doctor'),
(6, 2, 'We have a medical room, but that\'s never accessible, even when someone is ill or need assistance'),
(7, 3, 'Strongly Disagree'),
(8, 3, 'Disagree'),
(9, 3, 'Neutral'),
(10, 3, 'Agree'),
(11, 3, 'Strongly Agree'),
(12, 4, 'Always'),
(13, 4, 'Very Often'),
(14, 4, 'Sometimes'),
(15, 4, 'Rarely'),
(16, 4, 'Never'),
(17, 5, 'Most of the time'),
(18, 5, 'Some of the time'),
(19, 5, 'Never'),
(20, 6, 'Always'),
(21, 6, 'Very Often'),
(22, 6, 'Sometimes'),
(23, 6, 'Rarely'),
(24, 6, 'Never');

-- --------------------------------------------------------

--
-- Table structure for table `ed_questions`
--

CREATE TABLE `ed_questions` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ed_questions`
--

INSERT INTO `ed_questions` (`id`, `name`) VALUES
(1, 'Do you have free Wi-Fi facility at your campus?'),
(2, 'Do you have a medical room in your campus, with a dedicated doctor who visits the campus regularly?'),
(3, 'Our campus and infrastructure are very clean and hygienic'),
(4, 'The support staff of our school are helpful and provide support when ever needed'),
(5, 'The school\'s support staff treats everyone with care and respect'),
(6, 'In case of any emergency, the support staff is always there to help');

-- --------------------------------------------------------

--
-- Table structure for table `ed_users`
--

CREATE TABLE `ed_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ed_users`
--

INSERT INTO `ed_users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Prabhat Kumar', 'prabhat2k15@gmail.com', '$2y$10$74TdHb.pFaKQ7512LKjmXefHVpSb.zBsi7RoQwrsUomV1.5UkoMhi', 'l8v9oLgWLPHSHSA5ZPRqpDlk4EKSMd2b61vSgoGtHTXsJgnQjDwOcKUa3NSG', '2018-04-02 11:52:06', '2018-04-02 11:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ed_answers`
--
ALTER TABLE `ed_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ed_options`
--
ALTER TABLE `ed_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ed_questions`
--
ALTER TABLE `ed_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ed_users`
--
ALTER TABLE `ed_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ed_answers`
--
ALTER TABLE `ed_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ed_options`
--
ALTER TABLE `ed_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `ed_questions`
--
ALTER TABLE `ed_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ed_users`
--
ALTER TABLE `ed_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
