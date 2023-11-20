<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class responseController extends Controller
{
    function checkResponse(Request $request){

        return response([
            "status" => "success",
            "ip" => $request->ip(),
            "domain" => $_SERVER['SERVER_NAME']
        ]);
    }
}
