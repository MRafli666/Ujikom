<main>
    <div class="head-title">
        <!-- navigasi mini -->
        <div class="left">
            <h1>Halo, <span style="text-transform: capitalize;"><?php echo $row['nama']; ?> &nbsp;</span></h1>
            <ul class="breadcrumb">
                <li>
                    <a href="?page=dashboard">Dashboard</a>  
                </li>
            </ul>
        </div>
    </div>

    <ul class="box-info">
        <li>
            <i class='bx bxs-key'></i>
            <span class="text">
                <h3><?php echo $total_admin ?></h3>
                <p>Admin</p>
            </span>
        </li>
        <li>
            <i class='bx bxs-group'></i>
            <span class="text">
                <h3><?php echo $total_pegawai ?></h3>
                <p>Pegawai</p>
            </span>
        </li>
        <li>
            <i class='bx bxs-face'></i>
            <span class="text">
                <h3><?php echo $total_pelanggan ?></h3>
                <p>Pelanggan</p>
            </span>
        </li>
        <li>
            <i class='bx bxs-package'></i>
            <span class="text">
                <h3><?php echo $total_produk ?></h3>
                <p>Produk</p>
            </span>
        </li>
    </ul>
</main>