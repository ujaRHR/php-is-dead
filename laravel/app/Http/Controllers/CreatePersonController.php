<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class createPersonController extends Controller
{
    function createNewPerson(Request $request){
        $name = $request->input("name");
        $email = $request->input("email");
        $age = $request->input("age");
        $city = $request->input("city");

        return response([
            "name"=> $name,
            "email"=> $email,
            "age"=> $age,
            "city"=> $city
        ], 200);
    }
}