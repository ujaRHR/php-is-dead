<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class responseController extends Controller
{
    function checkResponse(Request $request){
        // Start Checking Response Code here...
        $response = $request->ip();
    }
}
