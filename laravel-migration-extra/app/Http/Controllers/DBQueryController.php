<?php

namespace App\Http\Controllers;

use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\Request;
use DB;
use PhpParser\Builder;

class DBQueryController extends Controller
{

    function DBQuery(Request $request)
    {
        // get all users
        $data = DB::table("profiles")->get();

        // get single row
        $data = DB::table("profiles")->where("id", 15)->first();

        // limit datause PhpParser\Builder;
        $data = DB::table("users")
            ->limit(10)
            ->get();

        // Select Columns
        $data = DB::table("profiles")
            ->select("first_name", "last_name", "mobile")
            ->get();

        // Select only unique items
        $data = DB::table("profiles")
            ->select("first_name", "last_name", "mobile")
            ->distinct()
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
            ->chunk(5, function ($profiles) {
                foreach ($profiles as $profile) {
                    // echo $profile->email . "<br>";
                }
            });

        // Aggregates
        $data = DB::table("products")
            ->select("title", "price")
            ->orderBy("discount_price", "desc")
            ->get();

        $data = DB::table("products")
            ->select("title", "price", "discount_price")
            ->where("price", "<", "50")
            ->max("price");

        // Joining Table
        $data = DB::table("products")
            ->select("title", "price", "discount_price", "remark", "category_name", "brand_name")
            ->join("categories", "products.category_id", "=", "categories.id")
            ->join("brands", "products.brand_id", "=", "brands.id")
            ->get();

        $data = DB::table("profiles")
            ->select("first_name", "last_name", "otp", "mobile", "city", "shipping_address")
            ->join("users", "profiles.email", "=", "users.email")
            ->get();

        // Raw Expressions
        $data = DB::table("products")
            // ->select("title", "price", "remark")
            ->select(DB::raw("title as product_name"), "price", "remark")
            ->get();

        $data = DB::table("products")
            ->selectRaw("title, price * ? as price_with_tax", [1.50])
            ->get();

        $data = DB::table("products")
            ->selectRaw("title as product_name, price, remark, discount_price")
            ->whereRaw("price > IF(remark != 'top', ?, 50)", [60])
            ->get();

        $data = DB::table("products")
            ->get();


        // Join with JoinClause
        $data = DB::table("products")
            ->join('categories', function (JoinClause $join) {
                $join->on('products.category_id', '=', 'categories.id')
                    ->where('categories.id', '>', 2);
            })
            ->get();

        $data = DB::table("users")
            ->join("profiles", function (JoinClause $join) {
                $join->on("users.email", "=", "profiles.email")
                    ->where('city', '=', 'Casperstad');
            })
            ->get();

        // whereBetween
        $data = DB::table('products')
            ->select('id', 'title', 'price', 'remark')
            ->whereBetween('price', [40, 50])
            ->get();


        $data = DB::table('users')
            ->join("profiles", function (JoinClause $join) {
                $join->on("users.email", "=", "profiles.email")
                    ->where('city', '=', 'Casperstad');
            })
            ->latest('users.created_at')
            ->first();


        // skip & take
        $data = DB::table('profiles')
            ->select('id', DB::raw("CONCAT(first_name, ' ', last_name) as fullname"), 'email')
            ->skip(4)
            ->take(5)
            ->get();

        



        return $data;
    }

}
