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
                        Rekapitulasi Pengajuan Cuti
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
                        <div class="card-body">
                            <form action="" method="GET">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group mb-0">
                                            <label class="form-label">
                                                Tanggal Diajukan
                                            </label>
                                            <div class="input-group">
                                                <input value="{{ isset($_GET['started_at']) ? $_GET['started_at'] : date('Y') . '-01-01' }}" type="date" name="started_at" class="form-control">
                                                <button disabled="true" class="btn">
                                                    Sampai Dengan
                                                </button>
                                                <input value="{{ isset($_GET['ended_at']) ? $_GET['ended_at'] : date('Y') . '-12-31' }}" type="date" name="ended_at" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group mb-0">
                                            <label class="form-label">
                                                Jenis Cuti
                                            </label>
                                            <select name="leave_id" class="form-control">
                                                <option value="">
                                                    Pilih Jenis Cuti
                                                </option>
                                                @foreach ($leaveList as $leave)
                                                    <option value="{{ $leave->id }}" <?= isset($_GET['leave_id']) ? (strip_tags($_GET['leave_id']) == $leave->id ? 'selected' : '') : '' ?>>
                                                        {{ $leave->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group mb-0">
                                            <label class="form-label">
                                                Divisi Karyawan
                                            </label>
                                            <select name="division_id" class="form-control">
                                                <option value="">
                                                    Pilih Divisi
                                                </option>
                                                @foreach ($divisionList as $division)
                                                    <option value="{{ $division->id }}" <?= isset($_GET['division_id']) ? (strip_tags($_GET['division_id']) == $division->id ? 'selected' : '') : '' ?>>
                                                        {{ $division->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group mb-0">
                                            <label class="form-label">
                                                Nama Karyawan
                                            </label>
                                            <input name="name" value="{{ isset($_GET['name']) ? $_GET['name'] : '' }}" placeholder="Cari Berdasarkan Nama Karyawan" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn btn-primary">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-search">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                                <path d="M21 21l-6 -6" />
                                            </svg>
                                            Cari
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="table-responsive m-0">
                            <table class="table card-table table-hover table-vcenter table-special" style="border-top: 1px solid rgba(101, 109, 119, 0.16);">
                                <thead>
                                    <tr>
                                        <th class="text-nowrap">
                                            Tanggal Diajukan
                                        </th>
                                        <th class="text-nowrap">
                                            Karyawan
                                        </th>
                                        <th>
                                            Jenis Cuti
                                        </th>
                                        <th class="text-nowrap">
                                            Tanggal Cuti
                                        </th>
                                        <th class="text-nowrap">
                                            Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($applicationList as $application)
                                        <tr>
                                            <td class="text-nowrap">
                                                {{ date('d M Y', strtotime($application->created_at)) }}
                                            </td>
                                            <td class="text-nowrap">
                                                {{ $application->requester->name }}
                                                <div>
                                                    <small>
                                                        Divisi {{ $application->requester->division->name }}
                                                    </small>
                                                </div>
                                            </td>
                                            <td>
                                                {{ $application->leave->name }}
                                                <div>
                                                    <small>
                                                        {{ $application->purpose }}
                                                    </small>
                                                </div>
                                            </td>
                                            <td class="text-nowrap">
                                                {{ date('d M Y', strtotime($application->started_at)) }} s/d 
                                                {{ date('d M Y', strtotime($application->ended_at)) }}
                                                <div>
                                                    <small>
                                                        Durasi {{ $application->days }} Hari
                                                    </small>
                                                </div>
                                            </td>
                                            <td class="w-1 text-nowrap">
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