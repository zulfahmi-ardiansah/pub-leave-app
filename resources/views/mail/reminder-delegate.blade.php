Halo {{ $applicationDelegation->delegation->name }},
<br>
<br>Ini adalah pengingat bahwa Anda telah dipilih oleh {{ $application->requester->name }} sebagai delegasi untuk proyek {{ $applicationDelegation->project->name }} selama masa cutinya dari tanggal {{ date('d F Y', strtotime($application->started_at)) }} hingga {{ date('d F Y', strtotime($application->ended_at)) }}. Tugas-tugas yang perlu Anda tangani meliputi {{ $applicationDelegation->scope }}.
<br>
<br>Salam,
<br>HR Konsultan XYZ