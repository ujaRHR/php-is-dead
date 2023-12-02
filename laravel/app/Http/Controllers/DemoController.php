<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Log;

class DemoController extends Controller
{
    function checkRequest(Request $request){
        return view("demo.demo");
    }

    function injectResponse(Request $request){
        return "You Should Not Be Supposed to See This!";
    }


    function timeAndDate(Request $request){
        $date = Carbon::now();
        $Upcomingdate = Carbon::now()->addMinutes(50)->format("H:i:s");

        Log::emergency("Date is working fine...");
        return $date . " <----After 50 Mins----> " . $Upcomingdate;
    }
}
