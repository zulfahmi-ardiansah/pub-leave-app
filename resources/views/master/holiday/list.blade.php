@extends("layout.default")

@section("content")
    <div class="container-xl">
        <div class="page-header text-white d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-pretitle text-white">
                        Pengelolaan
                    </div>
                    <h2 class="page-title">
                        Hari Libur
                    </h2>
                </div>
                <div class="col-auto ms-auto d-print-none">
                    <form action="" method="POST">
                        {{ csrf_field() }}
                        <button name="submit-integrate" value="submit-integrate" class="btn btn-primary mt-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M20 11a8.1 8.1 0 0 0 -15.5 -2m-.5 -4v4h4" /><path d="M4 13a8.1 8.1 0 0 0 15.5 2m.5 4v-4h-4" /></svg>
                            Sinkronisasi
                        </button>
                        &nbsp;
                        <button name="submit-form" value="submit-form" class="btn btn-success mt-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="12" y1="5" x2="12" y2="19" /><line x1="5" y1="12" x2="19" y2="12" /></svg>
                            Tambah
                        </button>
                    </form>
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
                                <div class="input-group">
                                    <select name="year" class="form-control">
                                        <?php
                                            for ($year = (date('Y') - 1); $year != (date('Y') + 2) ; $year++) { 
                                        ?>
                                            <option value="{{ $year }}" <?= isset($_GET['year']) ? (strip_tags($_GET['year']) == $year ? 'selected' : '') : (date('Y') == $year ? 'selected' : '') ?>>
                                                Tahun {{ $year }}
                                            </option>
                                        <?php
                                            }
                                        ?>
                                    </select>
                                    <input value="{{ isset($_GET['keyword']) ? $_GET['keyword'] : '' }}" type="text" name="keyword" class="form-control" placeholder="Ingin mencari sesuatu?">
                                    <button class="btn btn-primary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-search">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                            <path d="M21 21l-6 -6" />
                                        </svg>
                                        Cari
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="table-responsive m-0">
                            <table class="table card-table table-hover table-vcenter text-nowrap table-special">
                                <thead>
                                    <tr>
                                        <th>
                                            Tanggal
                                        </th>
                                        <th>
                                            Nama
                                        </th>
                                        <th>
                                            Cuti Bersama?
                                        </th>
                                        <th>
                                            Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($holidayList as $holiday)
                                        <tr>
                                            <td>
                                                {{ date('d M Y', strtotime($holiday->started_at)) }}
                                                @if ($holiday->started_at != $holiday->ended_at)
                                                    - {{ date('d M Y', strtotime($holiday->ended_at)) }}
                                                @endif
                                            </td>
                                            <td>
                                                {{ $holiday->name }}
                                            </td>
                                            <td>
                                                {{ $holiday->is_public == 1 ? '✓' : '✕' }}
                                            </td>
                                            <td class="w-1">
                                                <form class="d-inline-block" action="" method="POST">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="id" value="{{ $holiday->id }}">
                                                    <button type="submit" name="submit-form" value="submit-form" class="btn btn-default btn-sm">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 20h4l10.5 -10.5a1.5 1.5 0 0 0 -4 -4l-10.5 10.5v4" /><line x1="13.5" y1="6.5" x2="17.5" y2="10.5" /></svg>
                                                        Ubah
                                                    </button>
                                                </form>
                                                &nbsp;
                                                <form class="d-inline-block validate-delete" action="" method="POST">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="id" value="{{ $holiday->id }}">
                                                    <button type="submit" name="submit-delete" value="submit-delete" class="btn btn-danger btn-sm">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="4" y1="7" x2="20" y2="7" /><line x1="10" y1="11" x2="10" y2="17" /><line x1="14" y1="11" x2="14" y2="17" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                                        Hapus
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                    @if (count($holidayList) == 0)
                                        <tr>
                                            <td colspan="4" class="text-center text-muted">
                                                Data Tidak Ditemukan
                                            </td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                        @if ($holidayList->hasPages())
                            <div class="card-footer">
                                {{ $holidayList->links() }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop