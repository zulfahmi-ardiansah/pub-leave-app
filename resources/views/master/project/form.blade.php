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
                        Proyek
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
                @if (!(is_null($project)))
                    <input type="hidden" name="id" value="{{ $project->id }}">
                @endif
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Kode <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="code" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Nama <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="name" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Deskripsi <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="description" required="" class="form-control" maxlength="255"></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Bobot <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <select name="weight_id" required="true" class="form-control">
                                        <option value="">
                                            Pilih Bobot
                                        </option>
                                        @foreach ($weightList as $weight)
                                            <option value="{{ $weight->id }}">
                                                {{ $weight->classification }} - {{ $weight->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Tanggal Mulai <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input name="started_at" type="date" class="form-control" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Tanggal Berakhir <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input name="ended_at" type="date" class="form-control" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Manajer <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div>
                                        <div class="input-group">
                                            <button class="btn" type="button" data-user-selector-target-name="manager" data-user-selector-target-value="manager_id" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                                            <input name="manager" type="text" class="form-control" readonly required>
                                            <input name="manager_id" type="hidden">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Anggota <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div>
                                        <div class="input-group">
                                            <button class="btn" type="button" data-user-selector-target-name="member[0]" data-user-selector-target-value="member_id[0]" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                                            <input name="member[0]" type="text" class="form-control" readonly required>
                                            <input name="member_id[0]" type="hidden">
                                        </div>
                                    </div>
                                    <div class="member-extend"></div>
                                    <button type="button" class="btn btn-sm btn-default mt-2" data-member-add>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                                        Tambah
                                    </button>
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

    <script>
        let totalMember = 1;
    </script>
        
    @if (!(is_null($project)))
        <script>
            $('[name="code"]').val("{{ $project->code }}");
            $('[name="name"]').val("{{ $project->name }}");
            $('[name="description"]').val("{{ $project->description }}");
            $('[name="started_at"]').val("{{ $project->started_at }}");
            $('[name="ended_at"]').val("{{ $project->ended_at }}");
            $('[name="weight_id"]').val("{{ $project->weight_id }}");
            $('[name="manager_id"]').val("{{ $project->manager_id }}");
            $('[name="manager"]').val("{{ $project->manager->name }} ({{ $project->manager->position }}) {{ $project->manager->division_id ? '- ' . $project->manager->division->name : '' }}");
            totalMember += {{ count($project->members) }};
        </script>
        @if (count($project->members))
            @foreach ($project->members as $projectMemberIndex => $projectMember)
                @if ($projectMemberIndex == 0)
                    <script>
                        $('[name="member[0]"]').val('{{ $projectMember->user->name }} ({{ $projectMember->user->position }}) {{ $projectMember->user->division_id ? '- ' . $projectMember->user->division->name : '' }}');
                        $('[name="member_id[0]"]').val('{{ $projectMember->user_id }}');
                    </script>
                @else
                    <script>
                        $('.member-extend').append(`
                            <div class="mt-2">
                                <div class="input-group">
                                    <button class="btn" type="button" data-user-selector-target-name="member[{{ $projectMemberIndex }}]" data-user-selector-target-value="member_id[{{ $projectMemberIndex }}]" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                                    <input name="member[{{ $projectMemberIndex }}]" type="text" class="form-control" value="{{ $projectMember->user->name }} ({{ $projectMember->user->position }}) {{ $projectMember->user->division_id ? '- ' . $projectMember->user->division->name : '' }}" readonly required>
                                    <input name="member_id[{{ $projectMemberIndex }}]" value="{{ $projectMember->user_id }}" type="hidden">
                                    <button onclick="$($(this).parent().parent()).remove();" class="btn btn-danger" type="button">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon m-0" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="4" y1="7" x2="20" y2="7" /><line x1="10" y1="11" x2="10" y2="17" /><line x1="14" y1="11" x2="14" y2="17" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                    </button>
                                </div>
                            </div>
                        `);
                    </script>
                @endif
            @endforeach
        @endif
    @endif

    <script>
        $('[data-member-add]').click(function () {
            $('.member-extend').append(`
                <div class="mt-2">
                    <div class="input-group">
                        <button class="btn" type="button" data-user-selector-target-name="member[${totalMember}]" data-user-selector-target-value="member_id[${totalMember}]" onclick="userSelectorModal(this)">Pilih Karyawan</button>
                        <input name="member[${totalMember}]" type="text" class="form-control" readonly required>
                        <input name="member_id[${totalMember}]" type="hidden">
                        <button onclick="$($(this).parent().parent()).remove();" class="btn btn-danger" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon m-0" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="4" y1="7" x2="20" y2="7" /><line x1="10" y1="11" x2="10" y2="17" /><line x1="14" y1="11" x2="14" y2="17" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                        </button>
                    </div>
                </div>
            `);
            totalMember++;
        });
    </script>
@stop