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
                        Jatah Cuti
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
                <input type="hidden" name="id" value="{{ $leave->id }}">
                <div class="row row-cards">
                    <div class="col-12">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Kode
                                    </label>
                                    <input type="text" class="form-control" maxlength="100" readonly="true" disabled="true" value="<?= $leave->code ?>">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        Nama
                                    </label>
                                    <input type="text" class="form-control" maxlength="100" readonly="true" disabled="true" value="<?= $leave->name ?>">
                                </div>
                                <div class="form-group mb-0">
                                    <label class="form-label">
                                        Deskripsi <sup class="text-danger"><b>*</b></sup>
                                    </label>
                                    <textarea name="description" required="" class="form-control" maxlength="255"><?= $leave->description ?></textarea>
                                </div>
                                @if (in_array($leave->code, ['PRG', 'SCK']))
                                    <div class="form-group mt-3">
                                        <label class="form-label">
                                            Jatah <sup class="text-danger"><b>*</b></sup>
                                        </label>
                                        <div class="input-group">
                                            <input name="max_days" type="number" class="form-control" maxlength="100" value="<?= $leave->max_days ?>">
                                            <button disabled="true" class="btn">
                                                Hari
                                            </button>
                                        </div>
                                        <div class="mt-2">
                                            <small>
                                                * Jatah cuti merupakan jatah cuti per-pengajuan.
                                            </small>
                                        </div>
                                        @if ($leave->code == 'SCK')
                                            <div>
                                                <small>
                                                    * Jatah cuti digunakan sebagai validasi untuk mewajibkan surat dokter.
                                                </small>
                                            </div>
                                        @endif
                                    </div>
                                @elseif ($leave->code == 'TGT')
                                    <div class="form-group mt-3">
                                        <label class="form-label">
                                            Jatah
                                        </label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" maxlength="100" readonly="true" disabled="true" value="<?= $leave->getMaxDays() ?>">
                                            <button disabled="true" class="btn">
                                                Hari
                                            </button>
                                        </div>
                                        <div class="mt-2">
                                            <small>
                                                * Jatah cuti yang ditampilkan adalah jatah cuti untuk tahun {{ date('Y') }}.
                                            </small>
                                        </div>
                                        <div>
                                            <small>
                                                * Jatah cuti didapatkan dari kalkulasi jumlah hari cuti bersama pada data hari libur.
                                            </small>
                                        </div>
                                        <div>
                                            <small>
                                                * Untuk menambahkan hari cuti bersama, masuk ke dalam menu <b><a href="{{ url('/master/holiday') }}">data hari libur</a></b>.
                                            </small>
                                        </div>
                                    </div>
                                @elseif ($leave->code == 'YAR')
                                    <div class="form-group mt-3">
                                        <label class="form-label">
                                            Kadaluwarsa <sup class="text-danger"><b>*</b></sup>
                                        </label>
                                        <div class="input-group">
                                            <button disabled="true" class="btn">
                                                Tanggal
                                            </button>
                                            <input name="expired_at_day" max="31" min="1" type="number" class="form-control" required="true">
                                            <button disabled="true" class="btn">
                                                Bulan
                                            </button>
                                            <select name="expired_at_month" class="form-control" required="true">
                                                <option value="">Pilih Bulan</option>
                                                <option value="1">Januari</option>
                                                <option value="2">Februari</option>
                                                <option value="3">Maret</option>
                                                <option value="4">April</option>
                                                <option value="5">Mei</option>
                                                <option value="6">Juni</option>
                                                <option value="7">Juli</option>
                                                <option value="8">Agustus</option>
                                                <option value="9">September</option>
                                                <option value="10">Oktober</option>
                                                <option value="11">November</option>
                                                <option value="12">Desember</option>
                                            </select>
                                        </div>
                                    </div>
                                    <script>
                                        $('[name="expired_at_day"]').val('{{ explode("-", $leave->expired_at)[1] }}');
                                        $('[name="expired_at_month"]').val('{{ explode("-", $leave->expired_at)[0] }}');
                                    </script>
                                    <div class="form-group mt-3">
                                        <label class="form-label">
                                            Jatah <sup class="text-danger"><b>*</b></sup>
                                        </label>
                                        <table class="table table-bordered table-hover table-vcenter table-special mb-0">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Tahun
                                                    </th>
                                                    <th>
                                                        Jumlah Hari
                                                    </th>
                                                    <th class="w-1">
                                                        Aksi
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="slot">
                                                @foreach ($leave->slots as $leaveSlot)
                                                    <tr>
                                                        <td>
                                                            <input name="year[]" value="{{ $leaveSlot->year }}" type="number" class="form-control" required="true" readonly="true">
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <input name="days[]" value="{{ $leaveSlot->days }}" type="number" class="form-control" required="true">
                                                                <button disabled="true" class="btn">
                                                                    Hari
                                                                </button>
                                                            </div>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                            <thead>
                                                <tr>
                                                    <td colspan="3">
                                                        <button type="button" class="btn btn-sm btn-default mt-2" data-slot-add>
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                                                            Tambah
                                                        </button>
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <script>
                                        $('[data-slot-add]').click(function () {
                                            $('#slot').append(`
                                                <tr>
                                                    <td>
                                                        <input name="year[]" type="number" class="form-control" required="true">
                                                    </td>
                                                    <td>
                                                        <div class="input-group">
                                                            <input name="days[]" type="number" class="form-control" required="true">
                                                            <button disabled="true" class="btn">
                                                                Hari
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button onclick="$($(this).parent().parent()).remove();" class="btn btn-danger" type="button">
                                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon m-0" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="4" y1="7" x2="20" y2="7" /><line x1="10" y1="11" x2="10" y2="17" /><line x1="14" y1="11" x2="14" y2="17" /><path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" /><path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
                                                        </button>
                                                    </td>
                                                </tr>
                                            `);
                                        });
                                    </script>
                                @endif
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
@stop