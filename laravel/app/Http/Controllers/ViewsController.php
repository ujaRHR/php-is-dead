<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ViewsController extends Controller
{
    function homePage(Request $request){
        return view("portfolio.home");
    }

    function aboutPage(Request $request){
        return view("portfolio.about");
    }

    function projectsPage(Request $request){
        return view("portfolio.projects");
    }

    function contactPage(Request $request){
        return view("portfolio.contact");
    }

    function contactPageInfo(Request $request){
        $name = $request->input('name');
        $email = $request->input('email');
        $details = $request->input('details');
        
        $data = [
            'name'=> $name,
            'email'=> $email,
            'details'=> $details
        ];
        
        return $data;
    }
}
