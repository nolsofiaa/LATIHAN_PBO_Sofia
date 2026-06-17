<?php
require_once '../config/database.php';
require_once '../classes/Tiket.php';
require_once '../classes/TiketRegular.php';
require_once '../classes/TiketIMAX.php';
require_once '../classes/TiketVelvet.php';

$db = new Database();
$conn = $db->getConnection();

$query = "SELECT * FROM tabel_tiket ORDER BY jenis_studio, jadwal_tayang";
$stmt = $conn->prepare($query);
$stmt->execute();
$tiketData = $stmt->fetchAll(PDO::FETCH_ASSOC);

$tiketObjects = [];

foreach ($tiketData as $data) {
    switch ($data['jenis_studio']) {
        case 'Regular':
            $tiketObjects[] = new TiketRegular(
                $data['id_tiket'], $data['nama_film'], $data['jadwal_tayang'],
                $data['jumlah_kursi'], $data['harga_dasar_tiket'],
                $data['tipe_audio'], $data['lokasi_baris']
            );
            break;
        case 'IMAX':
            $tiketObjects[] = new TiketIMAX(
                $data['id_tiket'], $data['nama_film'], $data['jadwal_tayang'],
                $data['jumlah_kursi'], $data['harga_dasar_tiket'],
                $data['kacamata_3d_id'], $data['efek_gerak_fitur']
            );
            break;
        case 'Velvet':
            $tiketObjects[] = new TiketVelvet(
                $data['id_tiket'], $data['nama_film'], $data['jadwal_tayang'],
                $data['jumlah_kursi'], $data['harga_dasar_tiket'],
                $data['bantal_selimut_pack'], $data['layanan_butler']
            );
            break;
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Manajemen Tiket Studio Bioskop</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #0a0a0a; color: #fff; padding: 20px; }
        .container { max-width: 1400px; margin: 0 auto; }
        h1 { text-align: center; font-size: 2.5em; margin-bottom: 30px; color: #ffd700; text-shadow: 0 0 20px rgba(255,215,0,0.3); }
        .studio-section { margin-bottom: 40px; }
        .studio-title { font-size: 2em; padding: 15px; border-radius: 10px; margin-bottom: 20px; text-align: center; }
        .regular { background: linear-gradient(135deg, #1a237e, #283593); }
        .imax { background: linear-gradient(135deg, #1a237e, #b71c1c); }
        .velvet { background: linear-gradient(135deg, #4a148c, #880e4f); }
        .card-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; }
        .ticket-card { background: rgba(255,255,255,0.05); backdrop-filter: blur(10px); border-radius: 15px; padding: 20px; border: 1px solid rgba(255,255,255,0.1); transition: transform 0.3s, box-shadow 0.3s; }
        .ticket-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(255,215,0,0.2); }
        .ticket-card h3 { color: #ffd700; font-size: 1.3em; margin-bottom: 10px; }
        .ticket-card .info { margin: 8px 0; color: #ccc; }
        .ticket-card .info strong { color: #fff; }
        .ticket-card .facilities { background: rgba(255,215,0,0.1); padding: 10px; border-radius: 8px; margin: 10px 0; border-left: 3px solid #ffd700; }
        .ticket-card .price { font-size: 1.4em; color: #4caf50; font-weight: bold; margin-top: 10px; text-align: right; }
        .badge { display: inline-block; padding: 3px 12px; border-radius: 20px; font-size: 0.8em; margin-right: 5px; }
        .badge-regular { background: #283593; }
        .badge-imax { background: #b71c1c; }
        .badge-velvet { background: #880e4f; }
        .no-data { text-align: center; color: #999; padding: 40px; }
        @media (max-width: 768px) { .card-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎬 Manajemen Tiket Studio Bioskop</h1>
        
        <?php
        $studios = ['Regular' => 'regular', 'IMAX' => 'imax', 'Velvet' => 'velvet'];
        $studioData = ['Regular' => [], 'IMAX' => [], 'Velvet' => []];
        
        foreach ($tiketObjects as $tiket) {
            $class = get_class($tiket);
            switch ($class) {
                case 'TiketRegular': $studioData['Regular'][] = $tiket; break;
                case 'TiketIMAX': $studioData['IMAX'][] = $tiket; break;
                case 'TiketVelvet': $studioData['Velvet'][] = $tiket; break;
            }
        }
        
        foreach ($studios as $studio => $class) {
            if (empty($studioData[$studio])) continue;
        ?>
            <div class="studio-section">
                <div class="studio-title <?= $class ?>">🎞️ Studio <?= $studio ?></div>
                <div class="card-grid">
                    <?php foreach ($studioData[$studio] as $tiket): ?>
                        <div class="ticket-card">
                            <h3><?= htmlspecialchars($tiket->getNamaFilm()) ?></h3>
                            <div class="info"><strong>ID Tiket:</strong> #<?= $tiket->getIdTiket() ?></div>
                            <div class="info"><strong>Jadwal:</strong> <?= date('d/m/Y H:i', strtotime($tiket->getJadwal())) ?></div>
                            <div class="info"><strong>Jumlah Kursi:</strong> <?= $tiket->getJumlahKursi() ?></div>
                            <div class="info"><strong>Harga Dasar:</strong> Rp <?= number_format($tiket->getHargaDasar(), 0, ',', '.') ?></div>
                            <div class="facilities">
                                <strong>🎯 Fasilitas:</strong><br>
                                <?= $tiket->tampilkanInfoFasilitas() ?>
                            </div>
                            <div class="price">
                                💰 Total: Rp <?= number_format($tiket->hitungTotalHarga(), 0, ',', '.') ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        <?php } ?>
    </div>
</body>
</html>