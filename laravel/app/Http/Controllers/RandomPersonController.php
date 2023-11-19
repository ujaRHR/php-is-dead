<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\RateLimiter;

use Http;

class RandomPersonController extends Controller
{
    
    function randomUser(Request $request, $name = null)
    {
        $data = Http::get("https://random-data-api.com/api/v2/users")->json();

        $userInfo = [
            'firstName' => $data['first_name'],
            'lastName' => $data['last_name'],
            'email' => $data['email'],
            'dob' => $data['date_of_birth'],
            'avatar' => $data['avatar'],
            'profession' => $data['employment']['title'],
            'state' => $data['address']['state'],
            'country' => $data['address']['country'],
        ];

        return $userInfo;
    }
}
