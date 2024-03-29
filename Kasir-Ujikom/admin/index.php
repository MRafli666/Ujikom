<?php
session_start();

require '../koneksi_database/koneksi.php';
$admin = $_SESSION['username'];
$user = mysqli_query($koneksi, "SELECT * FROM organisasi WHERE username = '$admin'");
$row = mysqli_fetch_assoc($user);


// cek apakah yang mengakses halaman ini sudah login dan berlevel admin
if (empty($_SESSION['level']) || $_SESSION['level'] !== "admin") {
	header("location:../form/");
	exit(); // kalo level bukan admin kodigan dibawah di hentikan
} else {
	// Jika sudah login dan levelnya adalah "admin", lanjutkan eksekusi halaman ini
}


//ini buat pergitungan jumlah data yang ada di database
//ini buat hitung admin
$jumlah_admin = "SELECT COUNT(*) as total FROM organisasi WHERE level='admin'";
$admin = $koneksi->query($jumlah_admin);
if ($admin) {
	// Ambil hasil query
	$row_admin = $admin->fetch_assoc();
	$total_admin = $row_admin['total'];
} else {
	// Jika query gagal dieksekusi
	$total_admin = 0;
}
$admin->free();

//ini buat hitung pegawai
$jumlah_pegawai = "SELECT COUNT(*) as total FROM organisasi WHERE level='pegawai'";
$pegawai = $koneksi->query($jumlah_pegawai);
if ($pegawai) {
	// Ambil hasil query
	$row_pegawai = $pegawai->fetch_assoc();
	$total_pegawai = $row_pegawai['total'];
} else {
	// Jika query gagal dieksekusi
	$total_pegawai = 0;
}
$pegawai->free();

//ini buat hitung produk
$jumlah_produk = "SELECT COUNT(*) as total FROM produk";
$produk = $koneksi->query($jumlah_produk);
if ($produk) {
	// Ambil hasil query
	$row_produk = $produk->fetch_assoc();
	$total_produk = $row_produk['total'];
} else {
	// Jika query gagal dieksekusi
	$total_produk = 0;
}

$produk->free();

//ini buat hitung pelanggan
$jumlah_pelanggan = "SELECT COUNT(*) as total FROM pelanggan";
$pelanggan = $koneksi->query($jumlah_pelanggan);
if ($pelanggan) {
	// Ambil hasil query
	$row_pelanggan = $pelanggan->fetch_assoc();
	$total_pelanggan = $row_pelanggan['total'];
} else {
	// Jika query gagal dieksekusi
	$total_pelanggan = 0;
}

$pelanggan->free();


?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/popup_form.css">

	<title>ADMIN KASIR</title>
</head>

<body>
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bx-calculator'></i>
			<span class="text">Admin Kasir</span> 
		</a>
		<ul class="side-menu top"> 
			<li>
				<a href="?page=dashboard">
					<i class='bx bxs-dashboard'></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="?page=r_admin">
					<i class='bx bx-key'></i>
					<span class="text">Admin</span>
				</a>
			</li>
			<li>
				<a href="?page=petugas/crud_pegawai">
					<i class='bx bx-group'></i>
					<span class="text">Petugas</span>
				</a>
			</li>
			<li>
				<a href="?page=pelanggan/pelanggan">
				<i class='bx bx-face'></i>
					<span class="text">Pelanggan</span>
				</a>
			</li>
			<li>
				<a href="?page=produk/crud_barang">
					<i class='bx bx-box'></i>
					<span class="text">Barang</span>
				</a>
			</li>
			<li>
				<a href="?page=penjualan/penjualan">
					<i class='bx bx-money'></i>
					<span class="text">Penjualan</span>
				</a>
			</li>
			<li>
				<a href="?page=laporan/laporan">
					<i class='bx bx-file'></i>
					<span class="text">Laporan</span>
				</a>
			</li>

		</ul>
		<ul class="side-menu">
			<li>
				<a href="?page=toko/edit_toko">
					<i class='bx bx-cog'></i>
					<span class="text">Toko</span>
				</a>
			</li>
		</ul>
	</section>
	<section id="content">
		<nav>
		    <i class='bx bx-menu'></i>
		    <a href="../form/logout.php" class="logout" onclick="return confirm('Yakin Ingin LogOut')">
			<i class='bx bxs-log-out-circle'></i>
			</a>
		</nav>
		<?php
		if (isset($_GET["page"]) && $_GET["page"] != "home") {
			if (file_exists(htmlentities($_GET["page"]) . ".php")) {
				include(htmlentities(($_GET["page"]) . ".php"));
			} else {
				include("404.php");
			}
		} else {
			include("dashboard.php");
		}
		?>
		<!-- MAIN -->

	</section>
	<script src="../js/script.js"></script>
</body>

</html>