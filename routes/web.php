<?php

use Illuminate\Support\Facades\Route;

use App\Http\Middleware\AuthMiddleware;
use App\Http\Controllers\{
    AuthController,
    HomeController,
};
use App\Http\Controllers\Master\{
    UserController,
    DivisionController
};

// Root
    Route::any("/", function () { return redirect("/login"); });

// Auth
    Route::any("/login", [AuthController::class, "login"]);
    Route::any("/logout", [AuthController::class, "logout"]);

// Logged User
    Route::middleware([AuthMiddleware::class])->group(function () {
        
        // Home
            Route::prefix("/home")->group(function () {
                Route::get("/", [HomeController::class, "index"]);
                Route::any("/password", [HomeController::class, "password"]);
            });

        // Master
            Route::prefix("/master")->group(function () {
                Route::any("/user", [UserController::class, "index"]);
                Route::any("/division", [DivisionController::class, "index"]);
            });

    });