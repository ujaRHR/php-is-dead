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
Route::get('/demo', [DemoController::class, 'demoBasics']);