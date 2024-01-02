<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EloquentController;


Route::get('/data', [EloquentController::class, 'getData']);