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
                        Jatah Cuti : Umum
                    </h2>
                </div>
                <!-- <div class="col-auto ms-auto d-print-none">
                    <a href="{{ url('/master/leave/employee') }}">
                        <button type="button" class="btn btn-success mt-2">
                            <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-week"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z" /><path d="M16 3v4" /><path d="M8 3v4" /><path d="M4 11h16" /><path d="M8 14v4" /><path d="M12 14v4" /><path d="M16 14v4" /></svg>
                            Jatah Per-Karyawan
                        </button>
                    </a>
                </div> -->
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-12">
                    <div class="card">
                        <div class="table-responsive m-0">
                            <table class="table card-table table-hover table-vcenter table-special">
                                <thead>
                                    <tr>
                                        <th>
                                            Kode
                                        </th>
                                        <th>
                                            Nama
                                        </th>
                                        <th>
                                            Jatah
                                        </th>
                                        <th>
                                            Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($leaveList as $leave)
                                        <tr>
                                            <td class="text-muted">
                                                {{ $leave->code }}
                                            </td>
                                            <td>
                                                {{ $leave->name }}
                                                <div>
                                                    <small>{{ $leave->description }}</small>
                                                </div>
                                            </td>
                                            <td style="white-space: nowrap;">
                                                {{ $leave->getMaxDays() }} Hari
                                                <div>
                                                    <small>
                                                        @if (in_array($leave->code, ['TGT', 'YAR']))
                                                            Tahun {{ date('Y') }}
                                                        @else
                                                            Per-pengajuan
                                                        @endif
                                                    </small>
                                                </div>
                                            </td>
                                            <td class="w-1">
                                                <form class="d-inline-block" action="" method="POST">
                                                    {{ csrf_field() }}
                                                    <input type="hidden" name="id" value="{{ $leave->id }}">
                                                    <button type="submit" name="submit-form" value="submit-form" class="btn btn-default btn-sm">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 20h4l10.5 -10.5a1.5 1.5 0 0 0 -4 -4l-10.5 10.5v4" /><line x1="13.5" y1="6.5" x2="17.5" y2="10.5" /></svg>
                                                        Ubah
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop