-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 08:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webgiay`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
--

CREATE TABLE `danhgia` (
  `id_danhgia` int(11) NOT NULL,
  `danhgiasao` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `noidungdanhgia` text NOT NULL,
  `id_sanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhgia`
--

INSERT INTO `danhgia` (`id_danhgia`, `danhgiasao`, `name`, `email`, `noidungdanhgia`, `id_sanpham`) VALUES
(69, '4', 'hoa', 'hoaguyen@', '                            aaaaaaaaaaa', 126),
(70, '3', 'hoa', 'hoa1@gmail.com', '                            aaaa', 128),
(71, '5', ' hoa', ' admin@gmail.com', '                            =ádjkahdjkqahkjahdkajhdnal', 126),
(74, '4', 'hoa', 'hoa@gmail.com', '                            dep', 132),
(75, '4', ' jim', ' jim@gmail.com', '                            f', 134);

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id_danhmuc` int(11) NOT NULL,
  `tendanhmuc` varchar(255) NOT NULL,
  `thutu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id_danhmuc`, `tendanhmuc`, `thutu`) VALUES
(5, 'Giày Nam', '1'),
(6, 'Giày Nữ', '2'),
(8, 'Giày Trẻ Em', '3');

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `id_giohang` int(11) NOT NULL,
  `id_user` int(10) NOT NULL,
  `mahoadon` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `giaohang` varchar(255) NOT NULL,
  `thanhtoan` varchar(255) NOT NULL,
  `tinhtrang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giohang`
--

INSERT INTO `giohang` (`id_giohang`, `id_user`, `mahoadon`, `username`, `diachi`, `phone`, `email`, `giaohang`, `thanhtoan`, `tinhtrang`) VALUES
(4, 0, '1968', 'hoa', 'dn', '748475875', 'hoa@gmail.com', 'Giao hàng chuyển phát nhanh(2-3 Ngày)', 'Thu tiền tận nơi', '0'),
(5, 8, '4317', ' jim', ' da nang', ' 818440453', ' jim@gmail.com', 'Giao hàng chuyển phát thường(5-7 Ngày)', 'Thanh toán bằng thẻ ATM(OnePay)', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `id_hoadon` int(11) NOT NULL,
  `mahoadon` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `tensanpham` varchar(255) NOT NULL,
  `gia` int(11) NOT NULL,
  `hinhanh` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `thoigian` date NOT NULL,
  `soluongmua` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`id_hoadon`, `mahoadon`, `username`, `tensanpham`, `gia`, `hinhanh`, `id_user`, `id_sanpham`, `thoigian`, `soluongmua`) VALUES
(1, '8078', '', '', 0, '', 0, 131, '0000-00-00', 2),
(2, '5148', '', '', 0, '', 0, 136, '0000-00-00', 1),
(3, '1968', '', '', 0, '', 0, 135, '0000-00-00', 1),
(4, '4317', '', '', 0, '', 0, 132, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `id_khuyenmai` int(11) NOT NULL,
  `tenkhuyenmai` varchar(255) NOT NULL,
  `giakhuyenmai` int(11) NOT NULL,
  `phantram` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khuyenmai`
--

INSERT INTO `khuyenmai` (`id_khuyenmai`, `tenkhuyenmai`, `giakhuyenmai`, `phantram`) VALUES
(7, 'HOT SALE ', 10000, '50%'),
(8, 'FLASH SALE ', 10000, '15%');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sanpham` int(11) NOT NULL,
  `masanpham` varchar(10) NOT NULL,
  `tensanpham` varchar(255) NOT NULL,
  `gia` varchar(20) NOT NULL,
  `soluong` varchar(255) NOT NULL,
  `hinh` varchar(255) NOT NULL,
  `hinh1` varchar(255) NOT NULL,
  `hinh2` varchar(255) NOT NULL,
  `hinh3` varchar(255) NOT NULL,
  `mota` varchar(255) NOT NULL,
  `tinhtrang` varchar(20) NOT NULL,
  `id_danhmuc` int(11) NOT NULL,
  `id_khuyenmai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id_sanpham`, `masanpham`, `tensanpham`, `gia`, `soluong`, `hinh`, `hinh1`, `hinh2`, `hinh3`, `mota`, `tinhtrang`, `id_danhmuc`, `id_khuyenmai`) VALUES
(131, 'NAM-MSP001', 'Giay da nam hàn quốc', '99000', '10', 'giaynam1-2.jpg', 'giaynam1-3.jpg', 'giaynam1-4.jpg', 'giaynam1-5.jpg', '<p>phong cách</p>', 'Còn hàng', 5, 8),
(132, 'NAM-MSP002', 'Dày Nam sport hàn quốc', '185000', '10', 'giaynam2-2.jpg', 'giaynam2-3.jpg', 'giaynam2-4.jpg', 'giaynam2-5.jpg', '<p>Thể thao</p>', 'Còn hàng', 5, 7),
(133, 'NAM-MSP003', 'Giay da cổ trụ nam hàn quốc', '145000', '11', 'giaynam3-2.jpg', 'giaynam3-3.jpg', 'giaynam3-4.jpg', 'giaynam3-5.jpg', '<p>Phong cách</p>', 'Còn hàng', 5, 8),
(134, 'NAM-MSP004', 'Giay nam có quai', '89000', '10', 'giaynam4-2.jpg', 'giaynam4-3.jpg', 'giaynam4-4.jpg', 'giaynam4-5.jpg', '<p>Học Sinh</p>', 'Còn hàng', 5, 7),
(135, 'NAM-MSP005', 'Giay nam sport trẻ trung', '145000', '10', 'giaynam5-2.jpg', 'giaynam5-3.jpg', 'giaynam5-4.jpg', 'giaynam5-5.jpg', '<p>hay</p>', 'Còn hàng', 5, 7),
(136, 'NAM-MSP006', 'Giay thể thao ', '99000', '10', 'nam7.jpg', 'nam7-1.jpg', 'nam7-2.jpg', 'nam7-3.jpg', '<p>hay</p>', 'Còn hàng', 5, 7),
(137, 'NAM-MSP007', 'Giay da nam châu âu', '145000', '10', 'giaynam7-2.jpg', 'giaynam7-3.jpg', 'giaynam7-4.jpg', 'giaynam7-5.jpg', '<p>đẹp</p>', 'Còn hàng', 5, 7),
(143, 'NỮ-MSP001', 'Giay bule thể thao nam ', '99000', '10', 'giaynam8-2.jpg', 'giaynam8-3.jpg', 'giaynam8-4.jpg', 'giaynam8-3.jpg', '<p>dep quá</p>', 'Còn hàng', 5, 7),
(144, 'NỮ-MSP001', 'Áo Sơ Mi Nữ form rộng Lụa hàn', '145000', '11', 'nu2.jpg', 'nu2-1.jpg', 'nu2-2.jpg', 'nu2-3.jpg', 'f', 'Còn hàng', 6, 8),
(145, 'NỮ-MSP003', 'Giay nữ đa màu sắc', '155000', '10', 'giaynu6-2.jpg', 'giaynu6-1.jpg', 'giaynu6-2.jpg', 'giaynu6-1.jpg', '<p>giay đẹp da dạng</p>', 'Còn hàng', 6, 7),
(148, 'NỮ-MSP005', 'Giay lười nữ đẹp', '145000', '10', 'giaynu4-4.jpg', 'giaynu4-3.jpg', 'giaynu4-2.jpg', 'giaynu4-1.jpg', '<p>đẹp</p>', 'Còn hàng', 6, 7),
(149, 'NỮ-MSP006', 'Giay đa dạng mẫu', '185000', '10', 'giaynu3-1.jpg', 'giaynu3-2.jpg', 'giaynu3-1.jpg', 'giaynu3-4.jpg', '<p>hay</p>', 'Còn hàng', 6, 7),
(150, 'NỮ-MSP007', 'Giay thể thao nữ xin', '99000', '10', 'giaynu2-1.jpg', 'giaynu2-2.jpg', 'giaynu2-3.jpg', 'giaynu2-4.jpg', '<p>Thể thao năng động</p>', 'Còn hàng', 6, 7),
(151, 'NỮ-MSP008', 'Giay nữ đế thấp', '145000', '10', 'giaynu1-1.jpg', 'giaynu1-2.jpg', 'giaynu1-3.jpg', 'giaynu1-3.jpg', '<p>dep</p>', 'Còn hàng', 6, 7),
(152, 'NỮ-MSP010', 'Giay thể thao phong cach', '185000', '10', 'giaynu5-1.jpg', 'giaynu5-2.jpg', 'giaynu5-1.jpg', 'giaynu5-3.jpg', '<p>phong cách</p>', 'Còn hàng', 6, 7),
(156, 'TREEM-MSP0', 'Giay Bông cute', '99000', '10', 'giay3-2.jpg', 'giay3-3.jpg', 'giay3-4.jpg', 'giay3-5.jpg', '<p>đa dạng</p>', 'Còn hàng', 8, 8),
(157, 'TREEM-MSP0', 'Giay Vãi Trẻ em', '119000', '11', 'giay2-2.jpg', 'giay2-3.jpg', 'giay2-4.jpg', 'giay2-5.jpg', '<p>rất phong phú</p>', 'Còn hàng', 8, 7),
(158, 'TREEM-MSP0', 'Giiafy Trẻ em cute', '89000', '11', 'giay1-2.jpg', 'giay1-3.jpg', 'giay1-4.jpg', 'giay1-5.jpg', '<p>dep</p>', 'Còn hàng', 8, 7),
(166, 'Nu-sp38493', 'Giay phong cách trẻ trung nữ', '100000', '1', 'nu10.jpg', 'nu10-1.jpg', 'nu10-2.jpg', 'nu3-3.jpg', '<p>dep</p>', 'còn hàng', 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `diachi`, `phone`, `avatar`, `email`) VALUES
(7, 'nguyenhuy', '123', '44  hoa nam, 2', '0767162821', '', 'hoa1@gmail.com'),
(8, 'jim', '123', 'da nang', '818440453', '', 'jim@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`id_danhgia`),
  ADD KEY `id_sanpham` (`id_sanpham`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id_giohang`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`id_hoadon`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_sanpham` (`id_sanpham`);

--
-- Indexes for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`id_khuyenmai`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sanpham`),
  ADD KEY `id_danhmuc` (`id_danhmuc`),
  ADD KEY `id_khuyenmai` (`id_khuyenmai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `id_danhgia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id_giohang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `id_hoadon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `id_khuyenmai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
