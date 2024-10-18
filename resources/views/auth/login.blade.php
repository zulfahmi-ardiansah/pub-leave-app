<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Masuk - Elma</title>
    @include("include.css")
</head>

<body class="antialiased border-top-wide border-primary d-flex flex-column">
    <div class="page page-center">
        <div class="container-tight py-4">
            <div class="text-center mb-4">
                <a href="."><img src="{{ asset('/assets/img/logo/logo-and-text.svg') }}" height="50" alt=""></a>
            </div>
            <form class="card card-md" action="" method="POST" autocomplete="off">
                {{ csrf_field() }}
                <div class="card-body">
                    <h2 class="card-title text-center mb-4"><b>Masuk ke akun anda</b></h2>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input name="email" autocomplete="off" required="true" type="email" class="form-control">
                    </div>
                    <div class="mb-2">
                        <label class="form-label">
                            Kata Sandi
                        </label>
                        <div class="input-group input-group-flat">
                            <input name="password" autocomplete="off" required="true" type="password" class="form-control">
                            <span class="input-group-text px-2" style="border-left: 2px solid #dadcde; cursor: pointer;" onclick="showPassword(this)">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-open" width="24" height="24"
                                    viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <circle cx="12" cy="12" r="2" />
                                    <path d="M22 12c-2.667 4.667 -6 7 -10 7s-7.333 -2.333 -10 -7c2.667 -4.667 6 -7 10 -7s7.333 2.333 10 7" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-close d-none" width="24" height="24" 
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" 
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                    <path d="M10.585 10.587a2 2 0 0 0 2.829 2.828" />
                                    <path d="M16.681 16.673a8.717 8.717 0 0 1 -4.681 1.327c-3.6 0 -6.6 -2 -9 -6c1.272 -2.12 2.712 -3.678 4.32 -4.674m2.86 -1.146a9.055 9.055 0 0 1 1.82 -.18c3.6 0 6.6 2 9 6c-.666 1.11 -1.379 2.067 -2.138 2.87" />
                                    <path d="M3 3l18 18" /></svg>
                            </span>
                        </div>
                    </div>
                    <div class="form-footer">
                        <button name="submit-process" value="submit-process" type="submit" class="btn btn-primary w-100">Masuk</button>
                    </div>
                </div>
            </form>
            <div class="text-center text-muted mt-3">
                Ditujukan untuk penggunaan internal <b class="text-primary">Konsultan XYZ</b>
            </div>
        </div>
    </div>
    
    @include("include.js")
</body>

</html>
