<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use App\Models\Product;
use App\Models\Brand;
use App\Models\Category;



class EloquentController extends Controller
{
    function getData(Request $request)
    {

        $data = User::with('profile')->get();

        return $data;
    }
}
