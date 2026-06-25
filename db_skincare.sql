-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2026-06-25 11:58:25
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `db_skincare`
--

-- --------------------------------------------------------

--
-- 表的结构 `archived_reports`
--

CREATE TABLE `archived_reports` (
  `id` int(11) NOT NULL,
  `report_id` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `export_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `archived_reports`
--

INSERT INTO `archived_reports` (`id`, `report_id`, `file_path`, `export_date`) VALUES
(1, 'RPT-1781699158978', 'Archived_Reports/SalesReport_20260617_202559.csv', '2026-06-17'),
(2, 'RPT-1782115351316', 'Archived_Reports/SalesReport_20260622_160326.csv', '2026-06-22'),
(3, 'ARCHIVE-1782197244190', '/reports/auto_archive.csv', '2026-06-23'),
(4, 'ARCHIVE-1782198071154', '/reports/auto_archive.csv', '2026-06-23'),
(5, 'ARCHIVE-1782198112088', '/reports/auto_archive.csv', '2026-06-23'),
(6, 'ARCHIVE-1782198113047', '/reports/auto_archive.csv', '2026-06-23'),
(7, 'ARCHIVE-1782198113626', '/reports/auto_archive.csv', '2026-06-23'),
(8, 'ARCHIVE-1782198172605', '/reports/auto_archive.csv', '2026-06-23'),
(9, 'ARCHIVE-1782317592235', '/reports/auto_archive.csv', '2026-06-25'),
(10, 'ARCHIVE-1782373329738', '/reports/auto_archive.csv', '2026-06-25'),
(11, 'ARCHIVE-1782379614743', '/reports/auto_archive.csv', '2026-06-25'),
(12, 'ARCHIVE-1782379908129', '/reports/auto_archive.csv', '2026-06-25'),
(13, 'RPT-1782380044919', 'C:\\Users\\User\\OneDrive\\Documents\\NetBeansProjects\\unified\\Archived_Reports\\SalesReport_20260625_173404.txt', '2026-06-25'),
(14, 'RPT-1782380044919', 'C:\\Users\\User\\OneDrive\\Documents\\NetBeansProjects\\unified\\Archived_Reports\\SalesReport_20260625_173404.csv', '2026-06-25');

-- --------------------------------------------------------

--
-- 表的结构 `orderdetails`
--

CREATE TABLE `orderdetails` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `orderdetails`
--

INSERT INTO `orderdetails` (`detail_id`, `order_id`, `product_id`, `product_name`, `quantity`, `subtotal`) VALUES
(1, 1, 101, 'Sample Product 101', 16, 408.00),
(2, 2, 102, 'Sample Product 102', 10, 255.00),
(3, 3, 0, 'Hydrating Cleanser', 1, 19.79),
(4, 4, 0, 'Vitamin C Serum', 3, 35.70),
(5, 5, 0, 'Vitamin C Serum', 4, 47.60),
(6, 5, 0, 'Hydrating Cleanser', 1, 19.79);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_amount`, `payment_method`) VALUES
(1, '2026-06-23 03:08:29', 408.00, 'Cash'),
(2, '2026-06-23 03:10:00', 255.00, 'Card'),
(3, '2026-06-23 14:47:08', 19.79, 'Cash'),
(4, '2026-06-23 15:02:44', 35.70, 'Cash'),
(5, '2026-06-25 15:36:57', 67.39, 'Cash');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `skin_type` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `brand`, `category`, `skin_type`, `price`, `stock`) VALUES
('P001', 'Hydrating Cleanser', 'CeraVe', 'Cleanser', 'Oily', 19.79, 120),
('P002', 'Niacinamide Serum', 'The Ordinary', 'Serum', 'Combination', 9.90, 50),
('P003', 'Vitamin C Serum', 'Garnier', 'Serum', 'Oily', 11.90, 20),
('P004', 'Alia Sunscreen', 'Sunscreen', 'Sunscreen', 'Normal', 12.90, 10),
('P005', 'Women Facial Cleanser', 'TeraMide', 'Cleanser', 'Oily', 15.90, 20);

-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `product_id` varchar(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `alert_threshold` int(11) DEFAULT 5,
  `supplier_name` varchar(100) DEFAULT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `quantity`, `alert_threshold`, `supplier_name`, `price`) VALUES
('P001', 'Hydrating Cleanser', 'Skin Care', 120, 5, 'Cerave', 'RM 40.00'),
('P002', 'Niacinamide Serum', 'Skin Care', 50, 5, 'BeautyCorp', 'RM 59.00'),
('P003', 'Vitamin C Serum', 'Skin Care', 20, 10, 'BeautyCorp', 'RM 45.00'),
('P004', 'Alia Sunscreen', 'Skin Care', 10, 10, 'BeautyCorp', 'RM 30.00');

-- --------------------------------------------------------

--
-- 表的结构 `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `quantity_sold` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `sale_date`, `quantity_sold`, `total_amount`, `profit`) VALUES
(1, 'P001', '2026-06-17', 1, 3500.00, 500.00),
(2, 'P002', '2026-06-17', 2, 400.00, 100.00);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `status` varchar(30) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `name`, `reg_no`, `email`, `category`, `status`) VALUES
('SUP1', 'Torriden', '01', 'torriden@gmail.com', 'Body', 'Active'),
('SUP2', 'Cerave', '02', 'cera@gnail.com', 'Body', 'Active'),
('SUP3', 'Skintific', '03', 'skintific@gmail.com', 'Facial', 'Active'),
('SUP4', 'Glad2Glow', '04', 'glad2glow@gmail.com', 'Facial', 'Active'),
('SUP6', '', '06', '', 'Body', 'Active');

--
-- 转储表的索引
--

--
-- 表的索引 `archived_reports`
--
ALTER TABLE `archived_reports`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- 表的索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- 表的索引 `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 表的索引 `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `archived_reports`
--
ALTER TABLE `archived_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 限制导出的表
--

--
-- 限制表 `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- 限制表 `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
