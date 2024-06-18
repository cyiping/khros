-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-06-03 03:15:11
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
(15, 'FC-001', 11, '2025-01-01 00:01:00', 'Enzo', '', 'Cheng', 1, 10, '2024-06-02 16:06:03', NULL),
(16, 'E-001', 5, '2024-06-03 09:17:00', '駿愷', '', '陳', 2, 1000, '2024-06-02 19:55:11', NULL),
(17, 'E-001', 6, '2024-06-04 10:11:00', '志龍', '', '劉', 2, 1000, '2024-06-02 19:55:42', NULL),
(18, 'E-001', 7, '2024-06-05 14:38:00', '兪宏', '', '汪', 2, 1000, '2024-06-02 19:56:12', NULL),
(19, 'FC-001', 8, '2024-06-06 12:01:00', '丞恩', '', '鄭', 1, 4500, '2024-06-02 19:56:55', NULL),
(20, 'FC-001', 9, '2024-06-07 02:43:00', '華恩', '', '李', 1, 5000, '2024-06-02 19:57:24', NULL),
(21, 'FC-001', 10, '2024-06-08 05:17:00', 'Morris', '', 'Chang', 1, 4500, '2024-06-02 19:58:11', NULL),
(22, 'FC-002', 11, '2025-01-01 00:01:00', 'Morrisa', '', 'Cheng', 1, 10, '2024-06-02 19:58:28', NULL);

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
(1, '202201-0001', 1, 'Station 1', 'Station 2', 1, NULL, '07:00:00', 50, 25, 1, '2022-01-05 13:14:45', '2024-06-01 12:44:50'),
(2, '202201-0003', 2, 'Station 2', 'Station 5', 2, '2022-01-07', '08:00:00', 250, 170, 1, '2022-01-05 13:17:49', '2024-06-01 17:13:20'),
(3, '202201-0002', 1, 'Station 1', 'Station 3', 1, NULL, '08:30:00', 100, 75, 1, '2022-01-05 13:18:25', '2024-06-01 12:44:54'),
(4, '202201-0004', 1, 'Station 1', 'Station 2', 1, NULL, '00:00:00', 123, 89, 1, '2022-01-05 13:59:44', '2022-01-05 13:59:56'),
(5, '202406-0001', 6, '博多(Hakata)', '別府(Beppu)', 1, NULL, '09:17:00', 5000, 1000, 0, '2024-06-01 17:34:13', '2024-06-01 17:34:52'),
(6, '202406-0002', 8, '博多(Hakata)', '別府(Beppu)', 1, NULL, '10:11:00', 5000, 1000, 0, '2024-06-01 17:37:10', NULL),
(7, '202406-0003', 10, '博多(Hakata)', '別府(Beppu)', 1, NULL, '14:38:00', 5000, 1000, 0, '2024-06-01 17:37:49', NULL),
(8, '202406-0004', 7, '由布院(Yufuin)', '博多(Hakata)', 1, NULL, '12:01:00', 4500, 950, 0, '2024-06-01 17:40:43', NULL),
(9, '202406-0005', 9, '別府(Beppu)', '博多(Hakata)', 1, NULL, '02:43:00', 5000, 1000, 0, '2024-06-02 08:31:04', NULL),
(10, '202406-0006', 11, '由布院(Yufuin)', '博多(Hakata)', 1, NULL, '05:17:00', 4500, 900, 0, '2024-06-02 08:32:25', NULL),
(11, '202406-0007', 6, '博多(Hakata)', '別府(Beppu)', 2, '2025-01-01', '00:01:00', 10, 10, 0, '2024-06-02 16:05:30', NULL);

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
(1, 'TIR-1001', 'Train 101', 100, 200, 1, '2022-01-05 11:05:42', '2024-06-01 12:44:59'),
(2, 'TIR-1002', 'Train 102', 100, 200, 1, '2022-01-05 11:11:41', '2024-06-01 12:45:02'),
(3, 'TIR-1003', 'Train 103', 150, 300, 1, '2022-01-05 11:11:56', '2024-06-01 12:45:05'),
(4, 'TIR-1004', 'Train 104', 150, 300, 1, '2022-01-05 11:12:15', '2024-06-01 12:45:08'),
(5, 'TIR-1005', 'Train 105', 800, 1500, 1, '2022-01-05 11:13:00', '2022-01-05 11:13:14'),
(6, 'YNM-1', '由布院之森1號', 100, 200, 0, '2024-06-01 12:51:06', '2024-06-01 12:52:31'),
(7, 'YNM-2', '由布院之森2號', 100, 200, 0, '2024-06-01 12:52:10', NULL),
(8, 'YNM-3', '由布院之森3號', 100, 200, 0, '2024-06-01 12:54:19', NULL),
(9, 'YNM-4', '由布院之森4號', 100, 200, 0, '2024-06-01 12:54:41', NULL),
(10, 'YNM-5', '由布院之森5號', 100, 200, 0, '2024-06-01 12:55:00', NULL),
(11, 'YNM-6', '由布院之森6號', 100, 200, 0, '2024-06-01 12:55:26', NULL);

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `train_list`
--
ALTER TABLE `train_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
