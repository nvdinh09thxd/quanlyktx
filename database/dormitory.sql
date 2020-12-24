-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 24, 2020 lúc 01:55 AM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dormitory`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `area`
--

INSERT INTO `area` (`id`, `name`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `boots`
--

CREATE TABLE `boots` (
  `id` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `id_room` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `boots`
--

INSERT INTO `boots` (`id`, `id_member`, `id_room`, `status`) VALUES
(25, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `members`
--

INSERT INTO `members` (`id`, `firstname`, `lastname`, `gender`, `address`, `email`, `password`) VALUES
(1, 'Nguyễn', 'Định', 1, '154 Phạm Như Xương, Hoà Khánh Nam, Liên Chiểu, Đà Nẵng', 'nvdinh0766777123@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'Tố', 'Quyên', 1, 'Huyện Thăng Bình, Quảng Nam', 'toquyen123@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `area` int(11) NOT NULL,
  `number_of_bed` int(11) NOT NULL,
  `have_toilet` tinyint(1) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `number_of_bed`, `have_toilet`, `price`) VALUES
(1, 'A101', 1, 8, 1, 400000),
(2, 'A102', 1, 6, 0, 600000),
(3, 'B102', 2, 6, 1, 700000),
(4, 'C101', 3, 4, 1, 1200000),
(5, 'D102', 4, 8, 0, 800000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `boots`
--
ALTER TABLE `boots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Boots` (`id_member`,`id_room`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `boots`
--
ALTER TABLE `boots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
