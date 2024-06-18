-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-05-29 16:13:06
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `orrs_db`
--

-- --------------------------------------------------------

--
-- 資料表結構 `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'Mark Cooper', '09456123789', 'mcooper@sample.com', 'Sample Inquiry only', 1, '2022-01-06 09:13:14'),
(2, 'asdvasdv', '2351235', 'ghmfghm@sdasdf.com', 'ctghmghmfg', 1, '2024-05-29 11:05:42'),
(3, 'roy', '0933222331', 'asd@asd.com', 'where is your company ?', 1, '2024-05-29 22:03:50');

-- --------------------------------------------------------

--
-- 資料表結構 `reservation_list`
--

CREATE TABLE `reservation_list` (
  `id` int(30) NOT NULL,
  `seat_num` varchar(50) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `seat_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=First Class, 2 = Economy',
  `fare_amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `reservation_list`
--

INSERT INTO `reservation_list` (`id`, `seat_num`, `schedule_id`, `schedule`, `firstname`, `middlename`, `lastname`, `seat_type`, `fare_amount`, `date_created`, `date_updated`) VALUES
(1, 'FC-001', 1, '2022-01-07 07:00:00', 'John', 'D', 'Smith', 1, 50, '2022-01-05 16:26:00', NULL),
(3, 'FC-003', 1, '2022-01-07 07:00:00', 'Mark', 'D', 'Cooper', 1, 50, '2022-01-05 16:27:56', NULL),
(4, 'FC-001', 2, '2022-01-07 08:00:00', 'John', 'D', 'Smith', 1, 250, '2022-01-05 16:31:27', NULL),
(5, 'FC-002', 2, '2022-01-07 08:00:00', 'Claire', 'C', 'Blake', 1, 250, '2022-01-05 16:31:27', NULL),
(6, 'E-001', 1, '2022-01-07 07:00:00', 'John', 'D', 'Smith', 2, 25, '2022-01-06 08:35:53', NULL),
(7, 'E-002', 1, '2022-01-07 07:00:00', 'Claire', 'C ', 'Blake', 2, 25, '2022-01-06 08:35:53', NULL),
(8, 'E-001', 2, '2022-01-07 08:00:00', 'Mark', 'D', 'Cooper', 2, 170, '2022-01-06 09:24:57', NULL),
(9, 'E-002', 2, '2022-01-07 08:00:00', 'Samantha', 'C', 'Cooper', 2, 170, '2022-01-06 09:24:57', NULL),
(10, 'FC-001', 1, '2024-05-28 07:00:00', 'Morris', '', 'Chang', 1, 50, '2024-05-28 12:09:48', NULL),
(11, 'FC-001', 1, '2024-12-12 07:00:00', 'Morris', '', 'Chang', 1, 50, '2024-05-29 10:46:34', NULL),
(12, 'FC-001', 1, '2024-05-30 07:00:00', 'Morris', '', 'Chang', 1, 50, '2024-05-29 11:15:15', NULL),
(13, 'FC-002', 1, '2024-05-30 07:00:00', 'enzo', '', 'Cheng', 1, 50, '2024-05-29 22:01:18', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `train_id` int(30) NOT NULL,
  `route_from` text NOT NULL,
  `route_to` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = daily, 2= One-Time Schedule',
  `date_schedule` date DEFAULT NULL,
  `time_schedule` time NOT NULL,
  `first_class_fare` float NOT NULL DEFAULT 0,
  `economy_fare` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `code`, `train_id`, `route_from`, `route_to`, `type`, `date_schedule`, `time_schedule`, `first_class_fare`, `economy_fare`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202201-0001', 1, 'Station 1', 'Station 2', 1, NULL, '07:00:00', 50, 25, 0, '2022-01-05 13:14:45', '2022-01-05 13:23:17'),
(2, '202201-0003', 2, 'Station 2', 'Station 5', 2, '2022-01-07', '08:00:00', 250, 170, 0, '2022-01-05 13:17:49', '2022-01-05 13:25:18'),
(3, '202201-0002', 1, 'Station 1', 'Station 3', 1, NULL, '08:30:00', 100, 75, 0, '2022-01-05 13:18:25', '2022-01-05 13:24:28'),
(4, '202201-0004', 1, 'Station 1', 'Station 2', 1, NULL, '00:00:00', 123, 89, 1, '2022-01-05 13:59:44', '2022-01-05 13:59:56');

-- --------------------------------------------------------

--
-- 資料表結構 `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', '九州高級鐵道線上預訂系統'),
(6, 'short_name', 'KHROS'),
(11, 'logo', 'uploads/logo-1641351863.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1641351863.png'),
(15, 'content', 'Array'),
(16, 'email', 'cs@khros.co.jp'),
(17, 'contact', '+81922926427'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', '2 Chome-2-1 Hakata Ekimae, Hakata Ward, Fukuoka, 812-0011日本');

-- --------------------------------------------------------

--
-- 資料表結構 `train_list`
--

CREATE TABLE `train_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `first_class_capacity` float NOT NULL DEFAULT 0,
  `economy_capacity` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `train_list`
--

INSERT INTO `train_list` (`id`, `code`, `name`, `first_class_capacity`, `economy_capacity`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'TIR-1001', 'Train 101', 100, 200, 0, '2022-01-05 11:05:42', '2022-01-05 16:27:47'),
(2, 'TIR-1002', 'Train 102', 100, 200, 0, '2022-01-05 11:11:41', NULL),
(3, 'TIR-1003', 'Train 103', 150, 300, 0, '2022-01-05 11:11:56', NULL),
(4, 'TIR-1004', 'Train 104', 150, 300, 0, '2022-01-05 11:12:15', NULL),
(5, 'TIR-1005', 'Train 105', 800, 1500, 1, '2022-01-05 11:13:00', '2022-01-05 11:13:14');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, '系統管理員', NULL, '拳四郎', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2024-05-29 11:35:26'),
(4, 'Nvidia', NULL, 'Huang', 'nvidia', '1ed1255790523a907da869eab7306f5a', 'uploads/avatar-4.png?v=1641346647', NULL, 2, 1, '2022-01-05 09:36:56', '2024-05-29 11:39:02');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `reservation_list`
--
ALTER TABLE `reservation_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- 資料表索引 `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `train_id` (`train_id`);

--
-- 資料表索引 `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `train_list`
--
ALTER TABLE `train_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `reservation_list`
--
ALTER TABLE `reservation_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `train_list`
--
ALTER TABLE `train_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `reservation_list`
--
ALTER TABLE `reservation_list`
  ADD CONSTRAINT `reservation_list_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_list` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `schedule_list_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
