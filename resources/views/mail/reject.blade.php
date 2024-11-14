Halo {{ $application->requester->name }},
<br>
<br>Mohon maaf, pengajuan cuti ({{ $application->leave->name }}) Anda dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }} tidak dapat disetujui. Silakan hubungi rekan, manajer, serta kepala divisi Anda untuk diskusi lebih lanjut.
<br>
<br>Salam,
<br>HR Konsultan XYZ