<div class="nav-item dropdown d-none d-md-flex me-3 mt-2">
    <a href="#" class="nav-link px-0" data-bs-toggle="dropdown" tabindex="-1" aria-label="Show notifications">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
            <path d="M10 5a2 2 0 1 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6" />
            <path d="M9 17v1a3 3 0 0 0 6 0v-1" /></svg>
        @if (count($applicationList))
            <span class="badge bg-red"></span>
        @endif
    </a>
    <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card" style="width: 350px; max-width: 100vw;">
        <div class="card">
            <div class="card-header d-block">
                <div class="row">
                    <div class="col-10">
                        <h4 class="mb-0 mr-2" style="margin-top: 2.5px;"> 
                            Menunggu Persetujuanmu
                        </h4>
                    </div>
                    <div class="col-2" style="text-align: right;">
                        @if (count($applicationList))
                            <span class="badge bg-red text-red-fg">
                                {{ count($applicationList) }}
                            </span>
                        @endif
                    </div>
                </div>
            </div>
            <div class="list-group list-group-flush list-group-hoverable">
                @if (count($applicationList))
                    @foreach ($applicationList as $application)
                        <div class="list-group-item">
                            <div class="row align-items-center">
                                <div class="col">
                                    <a href="#" class="text-body d-block">
                                        {{ $application->requester->name }}
                                    </a>
                                    <div class="d-block text-secondary text-truncate mt-n1">
                                        @if ($application->status == 1)
                                            Persetujuan Delegasi Cuti
                                        @elseif ($application->status == 2)
                                            Persetujuan Cuti Oleh Manajer Proyek
                                        @elseif ($application->status == 3)
                                            Persetujuan Cuti Oleh Kepala Divisi
                                        @endif
                                        <small class="d-block">
                                            {{ date('d M Y', strtotime($application->started_at)) }} s/d 
                                            {{ date('d M Y', strtotime($application->ended_at)) }}
                                        </small>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <form class="d-inline-block" action="{{ $application->status > 1 ? url('/request/approval') : url('/request/delegation') }}" method="POST">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="id" value="{{ $application->id }}">
                                        <button type="submit" name="submit-form" value="submit-form" class="btn btn-default p-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-eye m-0">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                                <path d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" />
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col">
                                <span class="text-mute">
                                    Tidak Ada Pengajuan
                                </span>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>