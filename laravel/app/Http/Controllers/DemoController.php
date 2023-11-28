<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DemoController extends Controller
{
    function checkRequest(Request $request){
        return view("demo.demo");
    }

    function injectResponse(Request $request){
        return "You Should Not Be Supposed to See This!";
    }
}
