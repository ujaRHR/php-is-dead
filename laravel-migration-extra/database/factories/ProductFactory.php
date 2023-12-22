<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker;
use App\Models\Brand;
use App\Models\Category;

class ProductFactory extends Factory
{
    public function definition() : array
    {
        $faker    = Faker::create("en_US");
        $brand    = Brand::pluck("id");
        $category = Category::pluck("id");

        return [
            "title" => $faker->word(),
            "short_des" => $faker->sentence(10),
            "price" => $faker->randomFloat(2, 10, 99),
            "discount" => $faker->boolean(),
            "discount_price" => $faker->randomFloat(2, 0, 10),
            "image" => $faker->imageUrl(),
            "stock" => $faker->boolean(1),
            "star" => $faker->randomNumber(1, 5),
            "remark" => $faker->randomElement(['new', 'top', 'trending', 'hot', 'upcoming', 'special']),
            "category_id" => $faker->randomElement($category),
            "brand_id" => $faker->randomElement($brand)

        ];
    }
}
