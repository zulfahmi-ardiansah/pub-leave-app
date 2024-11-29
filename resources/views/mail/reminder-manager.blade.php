Halo {{ $applicationDelegation->project->manager->name }},
<br>
<br>Kami ingin mengingatkan bahwa {{ $application->requester->name }} akan cuti dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }}. Pengganti yang ditunjuk untuk menangani proyek {{ $applicationDelegation->project->name }} selama masa cuti tersebut adalah {{ $applicationDelegation->delegation->name }}.
<br>
<br>Harap pastikan pengaturan pekerjaan dan komunikasi berjalan dengan lancar.
<br>
<br>Terima kasih atas perhatian Anda.
<br>
<br>Salam,
<br>HR Konsultan XYZ