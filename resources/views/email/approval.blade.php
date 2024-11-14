Halo {{ $application->current->name }},
<br>
<br>{{ $application->requester->name }} dari {{ $application->status > 1 ? 'divisi' : 'proyek' }} Anda telah mengajukan cuti dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }}. Mohon untuk memberikan persetujuan Anda terkait pengajuan ini.
<br>
<br>Silakan klik tautan berikut untuk memberikan persetujuan: <a href="{{ url('/login') }}">Link</a>
<br>
<br>Terima kasih atas perhatian dan kerja samanya.
<br>
Salam,
<br>ELMA (Employee Leave Application Management) - Konsultan XYZ