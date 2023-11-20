<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class responseController extends Controller{

    function actualResponse(Request $request) {
        
        $domain = $_SERVER['SERVER_NAME'];

        return response([
            "status" => "success",
            "domain" => $domain,
            "message" => "informations fetched successfully.",
        ], 200)
            ->withHeaders([
                "Content-Type" => "application/json",
                "Any-Header-Info" => "Header-Info-Type"
            ])
            ->cookie(
                "access_token",
                "DEMO_TOKEN_VALUE",
                10,
                "/",
                $_SERVER['SERVER_NAME'],
                false,
                false
            );
    }

    function checkResponse(Request $request) {
        // If the Secondary method is on the same controller, then no need to redirect!
        return $this->actualResponse($request);
    }
}