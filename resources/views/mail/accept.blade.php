Halo {{ $application->requester->name }},
<br>
<br>Pengajuan cuti ({{ $application->leave->name }}) Anda dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }} telah diterima oleh semua pihak yang bersangkutan. Pastikan semua pekerjaan yang sedang berjalan sudah didokumentasikan dan diserahkan kepada setiap delegasi Anda.
<br>
<br>Selamat menikmati waktu cuti Anda.
<br>
<br>Salam,
<br>HR Konsultan XYZ