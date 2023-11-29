<?php

use App\Http\Controllers\CreatePersonController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RandomPersonController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\DemoController;


Route::get('/', function () {
    return view('welcome');
});


Route::get('/random/{name?}', [RandomPersonController::class, 'randomUser'])->whereAlphaNumeric('name');
Route::get('/form', [formController::class, 'getFormData']);
Route::post('/form', [formController::class, 'handleFormData']);
Route::get('/date', [DemoController::class, 'timeAndDate']);

// Middleware
Route::get('/demo', [DemoController::class, 'checkRequest'])->middleware('throttle: 10, 1');
Route::get('/inject', [DemoController::class, 'injectResponse'])->middleware('inject');

// Middleware Group
Route::middleware(['country_blocker', 'throttle: 5, 1'])->group(function () {
    Route::get('/demo1', [DemoController::class, 'checkRequest']);
    Route::get('/demo2', [DemoController::class, 'checkRequest']);
    Route::get('/demo3', [DemoController::class, 'checkRequest'])->withoutMiddleware('throttle: 5, 1');
    Route::get('/demo4', [DemoController::class, 'checkRequest']);
    Route::get('/demo5', [DemoController::class, 'checkRequest']);
});