@extends("layout.default")

@section("content")
    <div class="container-xl">
        <div class="page-header text-white d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-pretitle text-white">
                        Beranda
                    </div>
                    <h2 class="page-title">
                        Selamat Datang !
                    </h2>
                </div>
                <div class="col-auto ms-auto d-print-none">
                    <a href="{{ url('/report/create') }}" class="btn btn-primary mt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="12" y1="5" x2="12" y2="19" /><line x1="5" y1="12" x2="19" y2="12" /></svg>
                        <span class="d-none d-md-inline-block">Buat&nbsp;</span>Pengajuan
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-12">
                    <div class="card" style="height: calc(24rem + 10px)">
                        <div class="card-header">
                            <h3 class="card-title">Pengajuanmu</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop