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
    public function getData(Request $request)
    {

        // $profile = User::find(2)->profile;
        // $user = Profile::find(2)->user;
        // $profile = User::with("profile")->find(6);

        // $brand = Product::find(2)->brand;
        // $product = Category::find(2)->products;
        // $category = Product::find(3)->category;

        $productDetail = Product::with("category")->get();

        return $productDetail;




    }
}
