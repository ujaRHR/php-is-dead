<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller
{
    function demoBasics(Request $request) {
        $imagePath = public_path("images/") . "cat.jpg";

        return response()->file($imagePath);
    }
}
