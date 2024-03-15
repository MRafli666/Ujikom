-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Mar 2024 pada 10.17
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan_ujikom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `detailID` int(11) NOT NULL,
  `penjualanID` int(11) NOT NULL,
  `produkID` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`detailID`, `penjualanID`, `produkID`, `jumlah_produk`, `subtotal`) VALUES
(1, 20, 4, 1, '125000000'),
(3, 23, 7, 1, '9800000'),
(4, 23, 1, 1, '1500000'),
(5, 24, 1, 5, '7500000'),
(6, 25, 4, 1, '125000000'),
(7, 25, 1, 2, '3000000'),
(9, 27, 1, 1, '1500000'),
(10, 28, 1, 1, '1500000'),
(11, 29, 8, 1, '1200000'),
(12, 30, 7, 1, '9800000'),
(13, 31, 1, 1, '1500000'),
(15, 33, 1, 1, '1500000'),
(16, 34, 9, 1, '2000000'),
(17, 35, 10, 1, '5000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `organisasi`
--

CREATE TABLE `organisasi` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` text NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `organisasi`
--

INSERT INTO `organisasi` (`id`, `username`, `nama`, `password`, `level`) VALUES
(1, 'admin', 'Hidayat', 'qwerty', 'admin'),
(12, 'agus123', 'Agus Yan', '123agus', 'pegawai'),
(13, 'ahmad007', 'Ahmad Udin', '007ahmad', 'pegawai'),
(14, 'diana129', 'Putri Diana', '129diana', 'pegawai');

--
-- Trigger `organisasi`
--
DELIMITER $$
CREATE TRIGGER `update_penjualan_organisasi` AFTER UPDATE ON `organisasi` FOR EACH ROW BEGIN
    UPDATE penjualan
    SET kasir = NEW.nama
    WHERE kasir = OLD.nama;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelangganID` int(11) NOT NULL,
  `nama_pelanggan` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`pelangganID`, `nama_pelanggan`, `alamat`, `nomor_telepon`) VALUES
(3, 'Pelanggan Tercinta', 'Planet Bumi', '12121212'),
(5, 'maman abdulrahman', 'DKI Jakarta', '+62896788811'),
(6, 'cristiano ronaldo', 'Ngawi, Jawa Timur', '+62896788811'),
(7, 'michael john', 'rancaekek', '+1 12428888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `penjualanID` int(11) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `total_harga` decimal(10,0) NOT NULL,
  `pelangganID` int(11) DEFAULT NULL,
  `bayar` bigint(20) NOT NULL,
  `kembali` bigint(20) NOT NULL,
  `kasir` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`penjualanID`, `tanggal_penjualan`, `total_harga`, `pelangganID`, `bayar`, `kembali`, `kasir`) VALUES
(20, '2024-03-06', '125000000', 3, 125000000, 0, 'aldi muhammad'),
(23, '2024-03-07', '11300000', 6, 11500000, 200000, 'Hidayat'),
(24, '2024-03-07', '7500000', 5, 8000000, 500000, 'Hidayat'),
(25, '2024-03-07', '128000000', 7, 130000000, 2000000, 'Hidayat'),
(27, '2024-03-07', '1500000', 3, 1600000, 100000, 'Hidayat'),
(28, '2024-03-07', '1500000', 3, 1600000, 100000, 'Hidayat'),
(29, '2024-03-07', '1200000', 3, 1200000, 0, 'prian'),
(30, '2024-03-08', '9800000', 6, 10000000, 200000, 'Hidayat'),
(31, '2024-03-11', '1500000', 3, 10000000, 8500000, 'Hidayat'),
(33, '2024-03-11', '1500000', 3, 10000000, 8500000, 'Hidayat'),
(34, '2024-03-15', '2000000', 3, 3000000, 1000000, 'Agus Yan'),
(35, '2024-03-15', '5000000', 3, 5000000, 0, 'Agus Yan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `produkID` int(11) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`produkID`, `nama_produk`, `harga`, `stok`) VALUES
(1, '32S3U Cooca', '1500000', 43),
(4, 'Neo Qled 8k Samsung', '125000000', 4),
(7, 'Smart TV Polytron 4k', '9800000', 9),
(8, 'TV XIomi', '1200000', 4),
(9, 'TV LG', '2000000', 14),
(10, 'Lemari Es Sharp', '5000000', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `nama` text NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`nama`, `alamat`) VALUES
('Toko Sejahtera', 'Bandung');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`detailID`),
  ADD KEY `penjualanID` (`penjualanID`),
  ADD KEY `produkID` (`produkID`);

--
-- Indeks untuk tabel `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelangganID`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`penjualanID`),
  ADD KEY `pelangganID` (`pelangganID`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produkID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `detailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `pelangganID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `penjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `produkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`produkID`) REFERENCES `produk` (`produkID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`penjualanID`) REFERENCES `penjualan` (`penjualanID`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`pelangganID`) REFERENCES `pelanggan` (`pelangganID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
