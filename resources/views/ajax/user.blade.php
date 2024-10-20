<div class="modal-body">
    <div class="input-group">
        <input type="text" name="keyword" value="{{ isset($_GET['keyword']) ? $_GET['keyword'] : '' }}" class="form-control" placeholder="Mencari Karyawan Lainnya?">
        <button data-user-selector-keyword class="btn btn-default">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" /><path d="M21 21l-6 -6" /></svg>
            Cari
        </button>
    </div>
</div>
@if (count($userList))
    <div class="modal-body text-center py-2">
        <small class="text-muted">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M15 15m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" /><path d="M18.5 18.5l2.5 2.5" /><path d="M4 6h16" /><path d="M4 12h4" /><path d="M4 18h4" /></svg>
            Menampilkan Hasil {{ count($userList) }} Karyawan Teratas
        </small>
    </div>
@endif
<div class="modal-body p-0">
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
                        Posisi
                    </th>
                    <th>
                        Bobot
                    </th>
                    <th>
                        Aksi
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($userList as $user)
                    <tr>
                        <td class="text-muted text-nowrap">
                            {{ $user->emp }}
                        </td>
                        <td class="text-nowrap">
                            {{ $user->name }}
                            <div>
                                <small>
                                    {{ $user->email }}
                                </small>
                            </div>
                        </td>
                        <td class="text-nowrap">
                            {{ $user->position }}
                            <div>
                                <small>
                                    {{ $user->division_id ? $user->division->name : "" }}
                                </small>
                            </div>
                        </td>
                        <td>
                            <?php
                                $userPoint = 0;
                                $weightPoint = 0;
                                foreach ($user->projects as $userProject) {
                                    $userPoint += $userProject->point;
                                }
                            ?>
                            {{ count($user->projects) }} Proyek
                            @if ($userPoint > 0)
                                <small>
                                    @foreach ($user->projects as $userProjectIndex => $userProject)
                                        @if ($userProject->point != $weightPoint)
                                            <?php $weightPoint = $userProject->point; ?>
                                            @if ($userProjectIndex != 0)
                                                </ul>
                                            </div>
                                            @endif
                                            <div class="mt-1">
                                                <span style=" width: 7.5px; height: 7.5px; background-color: {{ $userProject->project->weight->flag }};" class="d-inline-block"></span>
                                                {{ $userProject->project->weight->name }}
                                                <ul class="mb-0">
                                        @endif 
                                        <li>
                                            {{ $userProject->project->name }}
                                        </li>
                                    @endforeach
                                </small>
                            @endif
                        </td>
                        <td class="w-1">
                            <button class="btn btn-sm btn-default" data-user-selector-value="{{ $user->id }}" data-user-selector-name="{{ $user->name }} ({{ $user->position }}) {{ $user->division_id ? '- ' . $user->division->name : '' }}" data-user-selector-data>
                                Pilih
                            </button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

<script>
    $('[data-user-selector-keyword]').click(function () {
        $(".preloader").fadeIn(300);
        $.ajax({
            url: window.baseUrl + '/ajax/user?keyword=' + $('[name="keyword"]').val(),
            success: function (response) {
                $('#modal-user-selector .modal-inner').html(response);
                $(".preloader").delay(500).fadeOut(300);
            }
        });
    });

    $('[data-user-selector-data]').click(function () {
        $('[name="' + $('#modal-user-selector').attr('data-user-selector-target-name') + '"]').val($(this).attr('data-user-selector-name'));
        $('[name="' + $('#modal-user-selector').attr('data-user-selector-target-value') + '"]').val($(this).attr('data-user-selector-value'));
        $('#modal-user-selector').modal('hide');
    });
</script>