@extends("layout.default")

@section("content")
    <div class="container-xl">
        <div class="page-header text-white d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-pretitle text-white">
                        Pengajuan
                    </div>
                    <h2 class="page-title">
                        Riwayat Pengajuan Cuti
                    </h2>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-12">
                    <div class="card">
                        <div class="table-responsive m-0">
                            <table class="table card-table table-hover table-vcenter text-nowrap table-special">
                                <thead>
                                    <tr>
                                        <th>
                                            Tanggal Diajukan
                                        </th>
                                        <th>
                                            Jenis Cuti
                                        </th>
                                        <th>
                                            Tanggal Cuti
                                        </th>
                                        <th>
                                            Durasi Cuti
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                        <th>
                                            Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($applicationList as $application)
                                        <tr>
                                            <td>
                                                {{ date('d M Y', strtotime($application->created_at)) }}
                                            </td>
                                            <td>
                                                {{ $application->leave->name }}
                                            </td>
                                            <td>
                                                {{ date('d M Y', strtotime($application->started_at)) }} s/d 
                                                {{ date('d M Y', strtotime($application->ended_at)) }}
                                            </td>
                                            <td>
                                                {{ $application->days }} Hari
                                            </td>
                                            <td>
                                                @if ($application->status == 1)
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="icon text-default">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                        <path d="M12 7a5 5 0 1 1 -4.995 5.217l-.005 -.217l.005 -.217a5 5 0 0 1 4.995 -4.783z" />
                                                    </svg>
                                                    Persetujuan Delegasi Cuti
                                                @elseif ($application->status == 2)
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="icon text-default">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                        <path d="M12 7a5 5 0 1 1 -4.995 5.217l-.005 -.217l.005 -.217a5 5 0 0 1 4.995 -4.783z" />
                                                    </svg>
                                                    Persetujuan Cuti
                                                @elseif ($application->status == 99)
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="icon text-success">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                        <path d="M12 7a5 5 0 1 1 -4.995 5.217l-.005 -.217l.005 -.217a5 5 0 0 1 4.995 -4.783z" />
                                                    </svg>
                                                    Cuti Disetujui
                                                @elseif ($application->status == 0)
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="icon text-danger">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                        <path d="M12 7a5 5 0 1 1 -4.995 5.217l-.005 -.217l.005 -.217a5 5 0 0 1 4.995 -4.783z" />
                                                    </svg>
                                                    Cuti Tidak Disetujui
                                                @endif
                                            </td>
                                            <td class="w-1">
                                                <form class="d-inline-block" action="" method="POST">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="id" value="{{ $application->id }}">
                                                    <button type="submit" name="submit-view" value="submit-view" class="btn btn-default btn-sm">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-eye">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                            <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                                            <path d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" />
                                                        </svg>
                                                        Lihat
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                    @if (count($applicationList) == 0)
                                        <tr>
                                            <td colspan="6" class="text-center text-muted">
                                                Data Tidak Ditemukan
                                            </td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                        @if ($applicationList->hasPages())
                            <div class="card-footer">
                                {{ $applicationList->links() }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop