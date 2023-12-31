<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RandomPersonController;
use App\Http\Controllers\CreatePersonController;
use App\Http\Controllers\ResponseController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/random', [RandomPersonController::class, 'randomUser']);
Route::post('/create-person', [createPersonController::class, 'createNewPerson']);
Route::get('/response', [responseController::class, 'checkResponse'])->middleware('throttle: 20, 1');