<table>
    <thead>
        <tr>
            <th style="border: 1px solid black;">
                <b>
                    Tanggal Diajukan
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Karyawan
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Divisi
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Jenis
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Tanggal Mulai
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Tanggal Berakhir
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Durasi
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Keperluan
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Delegasi
                </b>
            </th>
            <th style="border: 1px solid black;">
                <b>
                    Proyek
                </b>
            </th>
        </tr>
    </thead>
    <tbody>
        @foreach ($applicationList as $application)
            <tr>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ date('d M Y', strtotime($application->created_at)) }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ $application->requester->name }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ $application->requester->division->name }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ $application->leave->name }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ date('d M Y', strtotime($application->started_at)) }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ date('d M Y', strtotime($application->ended_at)) }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ $application->days }} Hari
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    {{ $application->purpose }}
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    @foreach ($application->delegations as $index => $applicationDelegation)
                        @if ($index > 0)
                            <br>
                        @endif
                        {{ $applicationDelegation->delegation->name }}
                    @endforeach
                </td>
                <td style="border: 1px solid black; vertical-align: top;">
                    @foreach ($application->delegations as $index => $applicationDelegation)
                        @if ($index > 0)
                            <br>
                        @endif
                        {{ $applicationDelegation->project->name }}
                    @endforeach
                </td>
            </tr>
        @endforeach
    </tbody>
</table>