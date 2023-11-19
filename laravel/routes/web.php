<?php

use App\Http\Controllers\createPersonController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RandomPersonController;
use App\Http\Controllers\formController;


Route::get('/', function () {
    return view('welcome');
});


Route::get('/random/{name?}', [RandomPersonController::class, 'randomUser'])->whereAlphaNumeric('name');
Route::get('/form', [formController::class, 'getFormData']);
Route::post('/form', [formController::class, 'handleFormData']);