Halo {{ $application->current->name }},
<br>
<br>{{ $application->requester->name }} dari {{ $application->status == 2 ? 'proyek' : 'divisi' }} Anda telah mengajukan cuti ({{ $application->leave->name }}) dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }}. Mohon untuk memberikan persetujuan Anda terkait pengajuan ini.
<br>
<br>Silakan klik tautan berikut untuk memberikan persetujuan:
<br><a href="{{ url('/login') }}">Link</a>
<br>
<br>Terima kasih atas perhatian dan kerja samanya.
<br>
<br>Salam,
<br>HR Konsultan XYZ