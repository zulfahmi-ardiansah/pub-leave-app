@extends("layout.default")

@section("content")
    <div class="container-xl">
        <div class="page-header text-white d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-pretitle text-white">
                        Beranda
                    </div>
                    <h2 class="page-title">
                        Selamat Datang !
                    </h2>
                </div>
                <div class="col-auto ms-auto d-print-none">
                    <a href="{{ url('/request/creation') }}" class="btn btn-primary mt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="12" y1="5" x2="12" y2="19" /><line x1="5" y1="12" x2="19" y2="12" /></svg>
                        <span class="d-none d-md-inline-block">Buat&nbsp;</span>Pengajuan
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Pengajuan Terakhirmu</h3>
                        </div>
                        @if (count($applicationList))
                            <div class="table-responsive m-0" style="min-height: 245px;">
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
                                                    <form action="{{ url('/request/history') }}" class="d-inline-block" action="" method="POST">
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
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="card-body py-3">
                                <div class="divide-empty">
                                    <img src="{{ asset('/assets/img/icon/empty.svg') }}" alt="empty">
                                    <h3 class="mt-4">
                                        Kamu belum pernah membuat pengajuan
                                    </h3>
                                    <p class="text-muted mt-1 text-center mb-0">
                                        Buat pengajuan cuti dengan menekan menu pengajuan cuti diatas !
                                    </p>
                                </div>
                            </div>
                        @endif
                        <div class="card-footer">
                            <a href="{{ url('/request/history') }}">
                                Lihat Selengkapnya
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-arrow-right">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M5 12l14 0" />
                                    <path d="M13 18l6 -6" />
                                    <path d="M13 6l6 6" />
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop