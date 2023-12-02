<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Log, Session;

class createPersonController extends Controller {
    function createNewPerson(Request $request){
        $name = $request->input("name");
        $email = $request->input("email");
        $age = $request->input("age");
        $city = $request->input("city");

        // Implementing Session -- put(), get(), forget(), pull(), flush()
        Session::put("userName", $name);
        Session::put("userEmail", $email);
        Session::put("userAge", $age);
        Session::put("userCity", $city);
        
        Log::info("Session Created Successfully...");

        Session::forget("userAge");

        return response([
            "status"=> "success",
            "message"=> Session::all()
        ], 200);
    }
}