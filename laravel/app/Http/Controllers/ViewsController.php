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
}
