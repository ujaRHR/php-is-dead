<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class formController extends Controller
{
    function getFormData(Request $request){
        return view('form');
    }
    
    function handleFormData(Request $request){
        $name = $request->input("name");
        $email = $request->input("email");
        $image = $request->file("image");
        $imagePath = $image->getClientOriginalName();
        $image->move(public_path("images"), $imagePath);
        
        return view('response', ['name'=> $name, 'email'=> $email,'imagePath'=> $imagePath]);
    }
}