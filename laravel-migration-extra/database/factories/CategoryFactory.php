<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker;

class CategoryFactory extends Factory
{
    public function definition() : array
    {
        $faker = Faker::create("en_US");
        return [
            "category_name" => $faker->word(),
            "category_img" => $faker->imageUrl()
        ];
    }
}
