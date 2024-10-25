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
                <div class="col-auto ms-auto d-print-none">
                    <a href="javascript:history.back()" class="btn btn-default mt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9 13l-4 -4l4 -4m-4 4h11a4 4 0 0 1 0 8h-1" /></svg>    
                        Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-cards">
                <div class="col-12">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h4 class="card-title">
                                Data Pengajuan
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">
                                            Tanggal Diajukan
                                        </label>
                                        <p class="form-control mb-0">
                                            {{ date('d F Y', strtotime($application->created_at)) }}, 
                                            Pukul {{ date('H:i', strtotime($application->created_at)) }}
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label">
                                            Tanggal Diperbarui
                                        </label>
                                        <p class="form-control mb-0">
                                            {{ date('d F Y', strtotime($application->updated_at ? $application->updated_at : $application->created_at)) }}, 
                                            Pukul {{ date('H:i', strtotime($application->updated_at ? $application->updated_at : $application->created_at)) }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label">
                                    Status Pengajuan
                                </label>
                                <p class="form-control mb-0">
                                    @if ($application->status == 0)
                                        Persetujuan Delegasi Cuti
                                    @elseif ($application->status == 1)
                                        Persetujuan Cuti
                                    @elseif ($application->status == 99)
                                        Cuti Disetujui
                                    @endif
                                </p>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label">
                                    Jenis Cuti
                                </label>
                                <div style="border-radius: 4px; border: 1px solid #dadcde; border-top: 0px;">
                                    <label class="form-check" style="display: flex; margin: 0px; padding: 0.4375rem 0.75rem; align-items: center; border-top: 1px solid #dadcde;">
                                        <div>
                                            <b>{{ $application->leave->name }} </b>
                                            <div>
                                                <small>{{ $application->leave->description }}</small>
                                            </div>
                                        </div>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label">
                                    Tanggal Cuti
                                </label>
                                <div class="row">
                                    <div class="col-md-5">
                                        <p class="form-control mb-0">
                                            {{ date('d F Y', strtotime($application->started_at)) }}
                                        </p>
                                    </div>
                                    <div class="col-md-2 text-muted text-center py-2">
                                        Sampai Dengan (s/d)
                                    </div>
                                    <div class="col-md-5">
                                        <p class="form-control mb-0">
                                            {{ date('d F Y', strtotime($application->ended_at)) }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label">
                                    Durasi Cuti
                                </label>
                                <div class="input-group">
                                    <p class="form-control mb-0">
                                        {{ $application->days }}
                                    </p>
                                    <button disabled="true" class="btn">
                                        Hari
                                    </button>
                                </div>
                            </div>
                            <div class="form-group mb-0">
                                <label class="form-label">
                                    Keperluan Cuti
                                </label>
                                <p class="form-control mb-0">
                                    {{ $application->purpose }}
                                </p>
                            </div>
                            @if ($application->attachment)
                                <div class="form-group mt-3">
                                    <label class="form-label">
                                        Lampiran Pendukung
                                    </label>
                                </div>
                            @endif
                        </div>
                    </div>

                    @if ($application->delegations)
                        <div class="card mb-3">
                            <div class="card-header">
                                <h4 class="card-title">
                                    Data Delegasi Pekerjaan
                                </h4>
                            </div>
                            <div class="card-body">
                                @foreach ($application->delegations as $applicationDelegationIndex => $applicationDelegation)
                                    <table class="table table-bordered table-hover table-vcenter table-special mb-0 mt-{{ $applicationDelegationIndex == 0 ? '0' : '3' }}">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Informasi Proyek # {{ $applicationDelegationIndex + 1 }}
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <b class="mt-2 d-flex" style="align-items: center">
                                                        <span style="width: 7.5px; height: 7.5px; background-color: {{ $applicationDelegation->project->weight->flag }}; margin-right: 10px;" class="d-inline-block"></span> {{ $applicationDelegation->project->name }}
                                                    </b>
                                                    <div>
                                                        <small>
                                                            {{ $applicationDelegation->project->description }}
                                                        </small>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-md-4 mb-2">
                                                            <div>
                                                                <small>
                                                                    <b>Bobot</b>
                                                                </small>
                                                            </div>
                                                            @if ($applicationDelegation->project->weight_id)
                                                                ({{ $applicationDelegation->project->weight->classification }}) {{ $applicationDelegation->project->weight->name }}
                                                            @endif
                                                        </div>
                                                        <div class="col-md-4 mb-2">
                                                            <div>
                                                                <small>
                                                                    <b>Manajer</b>
                                                                </small>
                                                            </div>
                                                            {{ $applicationDelegation->project->manager_id ? $applicationDelegation->project->manager->name : '-' }}
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <thead>
                                            <tr>
                                                <th>
                                                    Delegasi Proyek # {{ $applicationDelegationIndex + 1 }}
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">
                                                            Karyawan Delegasi
                                                        </label>
                                                        <p class="form-control mb-0">
                                                            {{ $applicationDelegation->project->manager->name }} ({{ $applicationDelegation->project->manager->position }}) {{ $applicationDelegation->project->manager->division_id ? '- ' . $applicationDelegation->project->manager->division->name : '' }}
                                                        </p>
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label class="form-label">
                                                            Posisi Yang Didelegasikan
                                                        </label>
                                                        <p class="form-control mb-0">
                                                            {{ $applicationDelegation->position }}
                                                        </p>
                                                    </div>
                                                    <div class="form-group mb-0">
                                                        <label class="form-label">
                                                            Lingkup Pekerjaan Yang Didelegasikan
                                                        </label>
                                                        <p class="form-control mb-0">
                                                            {{ $applicationDelegation->scope }}
                                                        </p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                @endforeach
                            </div>
                        </div>
                    @endif
                    
                    <div class="card card-comment mb-3">
                        <div class="card-header">
                            <h4 class="card-title">
                                Data Komentar
                            </h4>
                        </div>
                        <div class="table-responsive m-0">
                            <table class="table card-table table-hover table-vcenter table-special text-nowrap">
                                <thead>
                                    <tr>
                                        <th>
                                            Tanggal
                                        </th>
                                        <th>
                                            Proses
                                        </th>
                                        <th>
                                            Nama
                                        </th>
                                        <th>
                                            Posisi
                                        </th>
                                        <th>
                                            Komentar
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($application->histories as $applicationHistory)
                                        <tr>
                                            <td>
                                                {{ date('d F Y', strtotime($applicationHistory->created_at)) }}, 
                                                Pukul {{ date('H:i', strtotime($applicationHistory->created_at)) }}
                                            </td>
                                            <td>
                                                {{ $applicationHistory->process }}
                                            </td>
                                            <td>
                                                {{ $applicationHistory->user->name }}
                                            </td>
                                            <td>
                                                {{ $applicationHistory->position }}
                                            </td>
                                            <td>
                                                {{ $applicationHistory->comment }}
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