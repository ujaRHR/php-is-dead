<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class DBQueryController extends Controller
{

    function DBQuery(Request $request)
    {
        // get all users
        $data = DB::table("profiles")->get();

        // get single row
        $data = DB::table("profiles")->where("id", 15)->first();

        // limit data
        $data = DB::table("users")
            ->limit(10)
            ->get();

        // get selected columns & multiple rows
        $data = DB::table("profiles")
            ->select("email", "first_name", "last_name", "mobile")
            ->where("city", "Dextermouth")
            ->get();

        // order by
        $data = DB::table("users")
            ->orderBy("id", "desc")
            ->get();
        
        // Chunking Data
        $data = DB::table("profiles")
            ->orderBy("id", "asc")
            ->chunk(5, function($profiles){
                foreach($profiles as $profile){
                    echo $profile->email . "<br>";
                }
            });

        // Aggregates
        $data = DB::table("profiles")
            ->


        // return $data; }

}
