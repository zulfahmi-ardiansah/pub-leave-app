<?php

use Illuminate\Support\Facades\Route;

use App\Http\Middleware\AuthMiddleware;
use App\Http\Controllers\{
    AuthController,
    HomeController,
    AjaxController
};
use App\Http\Controllers\Master\{
    UserController,
    HolidayController,
    ProjectController,
    DivisionController,
    LeaveController
};
use App\Http\Controllers\Request\{
    CreationController,
    ApprovalController,
    HistoryController,
    DelegationController
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
            Route::prefix("/ajax")->group(function () {
                Route::any("/user", [AjaxController::class, "user"]);
            });

        // Master
            Route::prefix("/master")->group(function () {
                Route::any("/user", [UserController::class, "index"]);
                Route::any("/division", [DivisionController::class, "index"]);
                Route::any("/holiday", [HolidayController::class, "index"]);
                Route::any("/project", [ProjectController::class, "index"]);
                Route::any("/leave", [LeaveController::class, "index"]);
            });
            
        // Master
            Route::prefix("/request")->group(function () {
                Route::any("/creation", [CreationController::class, "index"]);
                Route::any("/history", [HistoryController::class, "index"]);
                Route::any("/delegation", [DelegationController::class, "index"]);
                Route::any("/approval", [ApprovalController::class, "index"]);
            });

    });