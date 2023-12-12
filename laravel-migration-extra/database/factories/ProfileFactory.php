<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Profile>
 */
class ProfileFactory extends Factory
{
    public function definition() : array
    {
        $faker = Faker::create();
        return [
            "first_name" => $faker->firstName,
            "last_name" => $faker->lastName,
            "mobile" => $faker->phoneNumber,
            "city" => $faker->city,
            "shipping_address"=> $faker->streetAddress,
            // "email"=> $faker->unique()->safeEmail,
        ];
    }
}
