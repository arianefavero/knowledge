<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WalletController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TransactionController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function () {
    Route::get('users', [UserController::class, 'index']);
    Route::get('getUsers', [UserController::class, 'getUser']);
    Route::post('insertUsers', [UserController::class, 'insertUser']);
    Route::get('consultaSaldo', [WalletController::class, 'index']);
    Route::post('transferencia', [TransactionController::class, 'transfer']);




});
