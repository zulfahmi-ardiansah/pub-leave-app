Halo {{ $application->current->name }},
<br>
<br>{{ $application->requester->name }} telah mengajukan cuti ({{ $application->leave->name }}) dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }} dan memilih Anda sebagai delegasi selama masa cutinya. Mohon konfirmasi apakah Anda menyetujui untuk mengambil alih tugas-tugasnya selama periode tersebut.
<br>
@if (isset($isWhatsapp))
<br>Silahkan masuk ke dalam aplikasi untuk memberikan persetujuan.
@else 
<br>Silakan klik tautan berikut untuk memberikan persetujuan:
<br><a href="{{ url('/login') }}">Link</a>
@endif
<br>
<br>Terima kasih atas kerja samanya.
<br>
<br>Salam,
<br>HR Konsultan XYZ