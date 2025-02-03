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
                        Pengajuan Cuti
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
                {{ csrf_field() }}
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
                                        Jenis Cuti <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div style="border-radius: 4px; border: 1px solid #dadcde; border-top: 0px;">
                                        @foreach ($leaveList as $leaveIndex => $leave)
                                            <label class="form-check" style="display: flex; margin: 0px; padding: 10px 15px; align-items: center; border-top: 1px solid #dadcde; {{ $leaveSlotMap[$leave->id] ? '' : 'background: #eef3f6;'  }}">
                                                @if ($leaveSlotMap[$leave->id])
                                                    <input data-code="{{ $leave->code }}" data-slot="{{ $leaveSlotMap[$leave->id] != -999 ? $leaveSlotMap[$leave->id] : $leave->max_days }}" name="leave_id" value="{{ $leave->id }}" required="true" class="form-check-input m-0 me-2" type="radio">
                                                @else
                                                    <input disabled="true" class="form-check-input m-0 me-2" type="radio">
                                                @endif
                                                <div style="padding-left: 5px;">
                                                    @if ($leave->code == 'SCK')
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icons-tabler-outline icon-tabler-heartbeat">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path d="M19.5 13.572l-7.5 7.428l-2.896 -2.868m-6.117 -8.104a5 5 0 0 1 9.013 -3.022a5 5 0 1 1 7.5 6.572" />
                                                            <path d="M3 13h2l2 3l2 -6l1 3h3" />
                                                        </svg>
                                                    @elseif ($leave->code == 'PRG')
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icons-tabler-outline icon-tabler-baby-carriage">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path d="M8 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                                            <path d="M18 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                                                            <path d="M2 5h2.5l1.632 4.897a6 6 0 0 0 5.693 4.103h2.675a5.5 5.5 0 0 0 0 -11h-.5v6" />
                                                            <path d="M6 9h14" />
                                                            <path d="M9 17l1 -3" />
                                                            <path d="M16 14l1 3" />
                                                        </svg>
                                                    @else 
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icons-tabler-outline icon-tabler-calendar-smile">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                            <path
                                                                d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12zm12 -4v4m-8 -4v4m-4 4h16m-9.995 3h.01m3.99 0h.01" />
                                                            <path d="M10.005 17a3.5 3.5 0 0 0 4 0" />
                                                        </svg>
                                                    @endif
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
                                        Tanggal Cuti <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <input name="started_at" type="text" class="form-control form-control-readonly" required="true">
                                        </div>
                                        <div class="col-md-2 text-muted text-center py-2">
                                           Sampai Dengan (s/d)
                                        </div>
                                        <div class="col-md-5">
                                            <input name="ended_at" type="text" class="form-control form-control-readonly" required="true">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Durasi Cuti <sup class="text-danger"><b>*</b></sup>
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
                                        Keperluan Cuti <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="purpose" required="" class="form-control" maxlength="255"></textarea>
                                </div>
                                <div class="form-group mt-3">
                                    <label class="form-label">
                                        Lampiran Pendukung <sup class="text-danger d-none"><b>*</b></sup>
                                    </label>
                                    <input name="attachment" type="file" class="form-control">
                                    <div>
                                        <small class="d-none">
                                            * Pengajuan melebihi durasi yang maksimal yang ditentukan wajib mencantumkan lampiran.
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        @if (count($user->projects))
                            <div class="card card-delegation mb-3">
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
                                                        <input type="hidden" name="delegation_project_id[{{ $userProjectIndex }}]" value="{{ $userProject->project->id }}">
                                                        <div class="form-group mb-3">
                                                            <label class="form-label">
                                                                Karyawan Delegasi <sup class="text-danger"><b>*</b></sup>
                                                            </label>
                                                            <div class="input-group">
                                                                <button class="btn" type="button" data-user-selector-target-name="delegation[{{ $userProjectIndex }}]" data-user-selector-target-value="delegation_id[{{ $userProjectIndex }}]" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                                                                <input name="delegation[{{ $userProjectIndex }}]" type="text" class="form-control required" readonly >
                                                                <input name="delegation_id[{{ $userProjectIndex }}]" type="hidden">
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-3">
                                                            <label class="form-label">
                                                                Posisi Yang Didelegasikan <sup class="text-danger"><b>*</b></sup>
                                                            </label>
                                                            <input name="delegation_position[{{ $userProjectIndex }}]" type="text" class="form-control" maxlength="100" required="true" value="{{ $user->position }}">
                                                        </div>
                                                        <div class="form-group mb-0">
                                                            <label class="form-label">
                                                                Lingkup Pekerjaan Yang Didelegasikan <sup class="text-danger"><b>*</b></sup>
                                                            </label>
                                                            <textarea name="delegation_scope[{{ $userProjectIndex }}]" class="form-control required" maxlength="255"></textarea>
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
                            <div class="card-body">
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Komentar Proses <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="comment" required="" class="form-control" maxlength="255"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="d-block">
                            <button type="submit" name="submit-process" value="submit-process" class="btn btn-primary w-100">
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
    
    <?php
        $dates = [];

        foreach ($holidayList as $holiday) {
            $started_at = $holiday->started_at;
            $ended_at = $holiday->ended_at;
    
            do {
                $dates[] = $started_at;
                $started_at = date('Y-m-d', strtotime($started_at . ' 1 days'));
            } while ($started_at <= $ended_at);
        }
    ?>

    <script>
        let holidayDates = [
            @foreach ($dates as $date)
                "{{ $date }}",
            @endforeach
        ];

        $('[name="days"]').on('change', function () {
            $(this).valid();
            
            $($('[name="attachment"]').parent().find('sup')).addClass('d-none');
            $($('[name="attachment"]').parent().find('small')).addClass('d-none');
            $('[name="attachment"]').removeClass('required');

            if ($(this).val() >= $('[name="leave_id"]:checked').attr('data-slot') && $('[name="leave_id"]:checked').attr('data-code') == 'SCK') {
                $($('[name="attachment"]').parent().find('sup')).removeClass('d-none');
                $($('[name="attachment"]').parent().find('small')).removeClass('d-none');
                $('[name="attachment"]').addClass('required');   
            }

            $('[name="attachment"]').valid();
        });

        $('[name="started_at"]').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            daysOfWeekDisabled: [0, 6],
            startDate: '{{ date("Y-m-d") }}',
            datesDisabled: holidayDates,
        }).on('changeDate', function (selected) {
            $('[name="ended_at"]').val($('[name="started_at"]').val());
            $('[name="ended_at"]').datepicker('setStartDate', $('[name="started_at"]').val());

            $('[name="days"]').val(1);
            $('[name="days"]').trigger('change');

            $('[name="started_at"]').valid();
            $('[name="ended_at"]').valid();
        });
        
        $('[name="ended_at"]').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            daysOfWeekDisabled: [0, 6],
            startDate: '{{ date("Y-m-d") }}',
            datesDisabled: holidayDates,
        }).on('changeDate', function (selected) {
            let startedAt = moment($('[name="started_at"]').val(), 'YYYY-MM-DD');
            let endedAt = moment($('[name="ended_at"]').val(), 'YYYY-MM-DD');

            let days = 0;
            do {
                if (startedAt.isoWeekday() !== 6 && startedAt.isoWeekday() !== 7 && !holidayDates.includes(startedAt.format('YYYY-MM-DD'))) {
                    days++;
                }
                startedAt = startedAt.add(1, 'days');
            } while (startedAt.isSameOrBefore(endedAt));

            $('[name="days"]').val(days);
            $('[name="days"]').trigger('change');
            
            $('[name="started_at"]').valid();
            $('[name="ended_at"]').valid();
        });

        $('[name="leave_id"]').on('change', function () {
            let startedAt = moment();

            $('[name="days"]').attr('max', $(this).attr('data-slot'));

            switch ($(this).attr('data-code')) {
                case 'SCK':
                    $('[name="days"]').removeAttr('max');
                    break;
                case 'YAR':
                    startedAt = startedAt.add(7, 'days');
                    break;
                case 'PRG':
                    startedAt = startedAt.add(1, 'months');
                    break;
                default:
                    break;
            }

            $('[name="started_at"]').val(startedAt.format('YYYY-MM-DD'));
            $('[name="started_at"]').datepicker('setStartDate', startedAt.format('YYYY-MM-DD'));
            $('[name="started_at"]').trigger('changeDate');
        });
    </script>
@stop