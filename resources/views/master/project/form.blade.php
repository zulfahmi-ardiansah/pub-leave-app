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
            <form action="" method="POST" enctype="multipart/form-data">
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
                                        Manajer <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <div class="input-group">
                                        <input name="manager" type="text" class="form-control" readonly required>
                                        <input name="manager_id" type="hidden">
                                        <button class="btn" type="button" data-user-selector-target-name="manager" data-user-selector-target-value="manager_id" data-user-selector>Pilih Karyawan</button>
                                    </div>
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
                            </div>
                        </div>
                        <div class="d-block">
                            <button name="submit-process" value="submit-process" class="btn btn-primary w-100">
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
        
    @if (!(is_null($project)))
        <script>
            $('[name="code"]').val("{{ $project->code }}");
            $('[name="name"]').val("{{ $project->name }}");
            $('[name="description"]').val("{{ $project->description }}");
            $('[name="started_at"]').val("{{ $project->started_at }}");
            $('[name="ended_at"]').val("{{ $project->ended_at }}");
            $('[name="weight_id"]').val("{{ $project->weight_id }}");
            $('[name="manager"]').val("{{ $project->manager->name }} ({{ $project->manager->position }}) {{ $project->manager->division_id ? '- ' . $project->manager->division->name : '' }}");
        </script>
    @endif
@stop