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
    @if (isset($type))
        <div class="card-body">
            <div class="form-group mb-0">
                <label class="form-label">
                    Komentar Proses <sup class="text-danger"><b>*</b></sup>
                </label>
                <textarea name="comment" required="" class="form-control" maxlength="255"></textarea>
            </div>
        </div>
    @endif
</div>