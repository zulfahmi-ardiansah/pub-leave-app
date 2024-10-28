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
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="icon text-default">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M12 7a5 5 0 1 1 -4.995 5.217l-.005 -.217l.005 -.217a5 5 0 0 1 4.995 -4.783z" />
                    </svg>
                    Persetujuan Delegasi Cuti
                @elseif ($application->status == 1)
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