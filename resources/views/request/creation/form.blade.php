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
                        Pengajuan Izin Cuti
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
            <form action="" class="validate" method="POST" enctype="multipart/form-data">
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h4 class="card-title">
                                    Data Pengajuan
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Jenis <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div style="border-radius: 4px; border: 1px solid #dadcde; border-top: 0px;">
                                        @foreach ($leaveList as $leaveIndex => $leave)
                                            <label class="form-check" style="display: flex; margin: 0px; padding: 10px 15px; align-items: center; border-top: 1px solid #dadcde; {{ $leaveSlotMap[$leave->id] ? '' : 'background: #eef3f6;'  }}">
                                                @if ($leaveSlotMap[$leave->id])
                                                    <input name="leave_id" value="{{ $leave->id }}" required="true" class="form-check-input m-0 me-2" type="radio">
                                                @else
                                                    <input disabled="true" class="form-check-input m-0 me-2" type="radio">
                                                @endif
                                                <div style="padding-left: 5px;">
                                                    <b>{{ $leave->name }} </b>
                                                    <div>
                                                        <small>{{ $leave->description }}</small>
                                                    </div>
                                                    <div>
                                                        <small>
                                                            @if (in_array($leave->code, ['TGT', 'YAR', 'OVT']))
                                                                @if ($leaveSlotMap[$leave->id])
                                                                    Jatah Cuti Tersisa <b>{{ $leaveSlotMap[$leave->id] }} Hari</b>
                                                                @else
                                                                    <b class="text-danger">Tidak Ada</b> Jatah Cuti Yang Dapat Digunakan
                                                                @endif
                                                            @else
                                                                Jatah Cuti Maksimal <b>{{ $leave->max_days }} Hari</b>
                                                            @endif
                                                        </small>
                                                    </div>
                                                </div>
                                            </label>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Tanggal <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <input name="started_at" type="date" class="form-control" required="true">
                                        </div>
                                        <div class="col-md-2 text-muted text-center py-2">
                                           Sampai Dengan (s/d)
                                        </div>
                                        <div class="col-md-5">
                                            <input name="ended_at" type="date" class="form-control" required="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Durasi <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div class="input-group">
                                        <input name="days" type="text" required="true" class="form-control form-control-readonly">
                                        <button disabled="true" class="btn">
                                            Hari
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Keperluan <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="purpose" required="" class="form-control" maxlength="255"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        @if (count($user->projects))
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        Data Delegasi Pekerjaan
                                    </h4>
                                </div>
                                <div class="card-body">
                                    @foreach ($user->projects as $userProjectIndex => $userProject)
                                        <table class="table table-bordered table-hover table-vcenter table-special mb-0 mt-{{ $userProjectIndex == 0 ? '0' : '3' }}">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Informasi Proyek # {{ $userProjectIndex + 1 }}
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <b class="mt-2 d-flex" style="align-items: center">
                                                            <span style="width: 7.5px; height: 7.5px; background-color: {{ $userProject->project->weight->flag }}; margin-right: 10px;" class="d-inline-block"></span> {{ $userProject->project->name }}
                                                        </b>
                                                        <div>
                                                            <small>
                                                                {{ $userProject->project->description }}
                                                            </small>
                                                        </div>
                                                        <div class="row mt-2">
                                                            <div class="col-md-4 mb-2">
                                                                <div>
                                                                    <small>
                                                                        <b>Bobot</b>
                                                                    </small>
                                                                </div>
                                                                @if ($userProject->project->weight_id)
                                                                    ({{ $userProject->project->weight->classification }}) {{ $userProject->project->weight->name }}
                                                                @endif
                                                            </div>
                                                            <div class="col-md-4 mb-2">
                                                                <div>
                                                                    <small>
                                                                        <b>Manajer</b>
                                                                    </small>
                                                                </div>
                                                                {{ $userProject->project->manager_id ? $userProject->project->manager->name : '-' }}
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Delegasi Proyek # {{ $userProjectIndex + 1 }}
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="form-group mb-3">
                                                            <label class="form-label">
                                                                Karyawan Delegasi <sup class="text-danger"><b>*</b></sup>
                                                            </label>
                                                            <div class="input-group">
                                                                <button class="btn" type="button" data-user-selector-target-name="delegation[{{ $userProjectIndex }}]" data-user-selector-target-value="delegation_id[{{ $userProjectIndex }}]" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                                                                <input name="delegation[{{ $userProjectIndex }}]" type="text" class="form-control" readonly required>
                                                                <input name="delegation_id[{{ $userProjectIndex }}]" type="hidden">
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-0">
                                                            <label class="form-label">
                                                                Pekerjaan Yang Didelegasikan <sup class="text-danger"><b>*</b></sup>
                                                            </label>
                                                            <textarea name="delegation_task[{{ $userProjectIndex }}]" required="" class="form-control" maxlength="255"></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    @endforeach
                                </div>
                            </div>
                        @endif
                        <div class="d-block">
                            <button disabled="true" type="submit" name="submit-process" value="submit-process" class="btn btn-primary w-100">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="10" y1="14" x2="21" y2="3" /><path d="M21 3l-6.5 18a0.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a0.55 .55 0 0 1 0 -1l18 -6.5" /></svg>
                                Simpan
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@stop