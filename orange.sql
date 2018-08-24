-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-08-20 02:39:13
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orange`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `aName` varchar(255) NOT NULL,
  `aPwd` varchar(255) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `aName`, `aPwd`, `sex`, `img`) VALUES
(1, 'ysc', '123', '男', 'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `cSessionInfo`
--

CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `cSessionInfo`
--

INSERT INTO `cSessionInfo` (`open_id`, `uuid`, `skey`, `create_time`, `last_visit_time`, `session_key`, `user_info`) VALUES
('orUmW5H4KCD7gnrlIHPJeODmvvUk', '8cef5b5bcb5c2149d5f11fd44f1f595e', 'd83a2880f0a62936fa51144fe32d71021531319a', '2018-08-15 02:50:58', '2018-08-18 09:17:48', '9m2M4pYUrgHh7+EASIEUXA==', '{\"openId\":\"orUmW5H4KCD7gnrlIHPJeODmvvUk\",\"nickName\":\"BuGuo CET6 BuGaiMing\",\"gender\":0,\"language\":\"en\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https:\\/\\/wx.qlogo.cn\\/mmopen\\/vi_32\\/dkWg0UEM4vnh5Dibw69AMWLhW6elnUyCQXcAzCCIZeE6pfz8mad1ejrEKpG9GLViaWXtz78hIib5JYnCfGghuP3pw\\/132\",\"watermark\":{\"timestamp\":1534583866,\"appid\":\"wxe8765fbc1e8341b7\"}}');

-- --------------------------------------------------------

--
-- 表的结构 `driveInfo`
--

CREATE TABLE `driveInfo` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `distance` double(9,2) DEFAULT NULL,
  `fuelBill` double(6,2) DEFAULT NULL,
  `fuel` double(6,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `income` double(7,2) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `driveInfo`
--

INSERT INTO `driveInfo` (`id`, `userId`, `title`, `distance`, `fuelBill`, `fuel`, `date`, `time`, `income`, `other`) VALUES
(1, '1', '繁忙的一天', 100.00, 300.00, 60.00, '2018-08-13', NULL, 400.00, NULL),
(2, '1', '遗忘记录补记', 200.00, 300.00, 60.00, '2018-08-14', NULL, 400.00, NULL),
(3, '3', '啊', 100.00, 300.00, 200.00, '2018-08-15', NULL, 400.00, 'undefined'),
(5, '3', '测试记录9', 20.00, 180.00, 30.00, '2018-08-15', NULL, 300.00, 'undefined'),
(6, '1', '测试记录10', 30.00, 360.00, 60.00, '2018-08-15', NULL, 500.00, 'undefined'),
(7, '1', '测试记录11', 600.00, 180.00, 30.00, '2018-08-15', NULL, 600.00, '其他'),
(8, '1', '测试数据12', 1.00, 1.00, 1.00, '2018-08-15', NULL, 1.00, '其他'),
(9, '1', '测试记录13', 1.00, 1.00, 1.00, '2018-08-15', NULL, 1.00, '1'),
(10, '1', '测试记录14', 12.00, 2.00, 2.00, '2018-08-15', NULL, 3.00, '1'),
(11, '1', '测试记录15', 3.00, 3.00, 3.00, '2018-08-15', NULL, 3.00, '3'),
(12, '1', '测试记录16', 3.00, 3.00, 3.00, '2018-08-16', NULL, 3.00, '3'),
(13, '1', '测试记录16', 4.00, 4.00, 4.00, '2018-08-16', NULL, 4.00, '4'),
(14, '1', '测试记录17', 6.00, 6.00, 6.00, '2018-08-16', NULL, 6.00, '6'),
(15, '1', '测试记录18', 1.00, 1.00, 1.00, '2018-08-16', NULL, 1.00, '1'),
(16, '1', '测试记录19', 1.00, 1.00, 1.00, '2018-08-16', '00:00:00', 1.00, '1'),
(17, '1', '测试记录20', 1.00, 11.00, 1.00, '2018-08-16', '00:00:00', 1.00, '1'),
(18, '1', '测试记录21', 8.00, 8.00, 8.00, '2018-08-16', '00:00:00', 8.00, '8'),
(19, '1', '测试记录21', 1.00, 1.00, 1.00, '2018-08-16', '00:00:00', 1.00, '1'),
(20, '1', '测试记录23', 2.00, 222.00, 2.00, '2018-08-16', '00:00:00', 2.00, '22'),
(21, '1', '测试记录23', 1.00, 1.00, 1.00, '2018-08-17', '00:00:00', 1.00, '1'),
(22, '1', '测试记录24', 4.00, 4.00, 4.00, '2018-08-17', '00:00:00', 4.00, '4'),
(23, '1', '测试记录25', 4.00, 4.00, 4.00, '2018-08-17', '00:00:00', 4.00, '4'),
(24, '1', '测试记录26', 4.00, 4.00, 4.00, '2018-08-17', '00:00:00', 4.00, '4'),
(25, '1', '测试记录27', 56.00, 2.00, 2.00, '2018-08-18', '00:00:00', 1.00, '啊'),
(26, '1', '测试记录27', 4.00, 29.00, 8.00, '2018-08-18', '00:00:00', 20.00, '啊'),
(27, '1', '测试记录28', 39.00, 20.00, 20.00, '2018-08-18', '00:00:00', 30.00, '啊'),
(28, '1', '测试记录29', 1.00, 11.00, 1.00, '2018-08-18', '00:00:00', 1.00, '1'),
(29, '1', '测试记录30', 1.00, 1.00, 1.00, '2018-08-18', '00:00:00', 1.00, '1'),
(30, '1', '测试记录31', 2.00, 22.00, 2.00, '2018-08-18', '00:00:00', 2.00, '2'),
(31, '1', '1', 1.00, 1.00, 1.00, '2018-08-18', '00:00:00', 1.00, '1'),
(34, 'orUmW5H4KCD7gnrlIHPJeODmvvUk', '4', 4.00, 4.00, 4.00, '2018-08-18', '00:00:00', 4.00, '4'),
(35, '1', '5', 5.00, 5.00, 5.00, '2018-08-18', '00:00:00', 5.00, '5'),
(36, '1', '测试记录36', 2.00, 2.00, 2.00, '2018-08-19', '00:00:00', 2.00, '2'),
(38, 'orUmW5H4KCD7gnrlIHPJeODmvvUk', '用户选择Id2', 12.00, 12.00, 12.00, '2018-08-17', '00:03:00', 12.00, '2');

-- --------------------------------------------------------

--
-- 表的结构 `essay`
--

CREATE TABLE `essay` (
  `id` int(11) NOT NULL,
  `openId` varchar(255) DEFAULT NULL,
  `txtTitle` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `text` text,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `openId` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ncName` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `openId`, `ncName`, `sex`, `img`) VALUES
(1, NULL, 'Dr.driver', '男', NULL),
(3, NULL, 'Mrs.driver', '女', NULL),
(4, 'orUmW5H4KCD7gnrlIHPJeODmvvUk', 'Chengzi', '男生', 'https://wx.qlogo.cn/mmopen/vi_32/dkWg0UEM4vnh5Dibw69AMWLhW6elnUyCQXcAzCCIZeE6pfz8mad1ejrEKpG9GLViaWXtz78hIib5JYnCfGghuP3pw/132');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cSessionInfo`
--
ALTER TABLE `cSessionInfo`
  ADD PRIMARY KEY (`open_id`),
  ADD KEY `open_id` (`open_id`),
  ADD KEY `skey` (`skey`);

--
-- Indexes for table `driveInfo`
--
ALTER TABLE `driveInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essay`
--
ALTER TABLE `essay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `driveInfo`
--
ALTER TABLE `driveInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `essay`
--
ALTER TABLE `essay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
