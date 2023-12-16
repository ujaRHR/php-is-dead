<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker;

class BrandFactory extends Factory
{
    public function definition() : array
    {
        $faker = Faker::create("en_US");
        return [
            "brand_name" => $faker->company(),
            "brand_img" => $faker->imageUrl(),
        ];
    }
}
