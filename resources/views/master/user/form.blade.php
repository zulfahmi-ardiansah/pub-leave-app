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
                        Karyawan
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
                @if (!(is_null($user)))
                    <input type="hidden" name="id" value="{{ $user->id }}">
                @endif
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Kode <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="emp" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Nama <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="name" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Posisi <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="position" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Divisi <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <select name="division_id" required="true" class="form-control">
                                        <option value="">
                                            Pilih Divisi
                                        </option>
                                        @foreach ($divisionList as $division)
                                            <option value="{{ $division->id }}">
                                                {{ $division->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Email <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="email" type="email" class="form-control" maxlength="100" required="true">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Telp <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input autocomplete="off" name="phone" type="text" class="form-control" maxlength="100" required="true">
                                </div>
                                @if (is_null($user))
                                    <div class="form-group mb-3">
                                        <label class="form-label">
                                            Kata Sandi <sup class="text-danger"><b>*</b></sup>
                                        </label>
                                        <input autocomplete="off" name="password" required="" type="password" maxlength="255" class="form-control">
                                    </div>
                                @endif
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Alamat <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="address" required="" class="form-control" maxlength="255"></textarea>
                                </div>
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Role <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <input type="hidden" name="role[]" value="1">
                                    @foreach ($roleList as $role)
                                        <div>
                                            <label class="form-check">
                                                <input name="role[]" value="{{ $role->id }}" <?= $role->id == 1 ? 'checked disabled' : '' ?> class="form-check-input" type="checkbox">
                                                <span class="form-check-label">{{ $role->name }}</span>
                                            </label>
                                        </div>
                                    @endforeach
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
        
    @if (!(is_null($user)))
        <script>
            $('[name="emp"]').val("{{ $user->emp }}");
            $('[name="name"]').val("{{ $user->name }}");
            $('[name="email"]').val("{{ $user->email }}");
            $('[name="phone"]').val("{{ $user->phone }}");
            $('[name="position"]').val("{{ $user->position }}");
            $('[name="address"]').val("{{ $user->address }}");
            $('[name="division_id"]').val("{{ $user->division_id }}");
        </script>
        @foreach ($user->roles as $userRole)
            <script>
                $('[name="role[]"][value="{{ $userRole->role_id }}"]').attr('checked', true);
            </script>
        @endforeach
    @endif
@stop