<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>404 - Elma</title>
    @include("include.css")
</head>

<body class="antialiased border-top-wide border-primary d-flex flex-column">
    <div class="page page-center">
        <div class="container-tight py-4">
            <div class="text-center mb-4">
                <a href="."><img src="{{ asset('/assets/img/logo/logo-and-text.svg') }}" height="50" alt=""></a>
            </div>
            <div class="card card-md">
                <div class="card-body text-center">
                    <h1 class="mb-2">
                        404
                    </h1>
                    <p>
                        Halaman <b>tidak ditemukan</b> atau <b>belum dikembangkan</b>. Hubungi <a href="#">pengelola aplikasi</a> untuk informasi lebih lanjut.
                    </p>
                </div>
            </div>
            <div class="text-center text-muted mt-3">
                Ditujukan untuk penggunaan internal <b class="text-primary">Konsultan XYZ</b>
            </div>
        </div>
    </div>
    
    @include("include.js")
</body>

</html>
