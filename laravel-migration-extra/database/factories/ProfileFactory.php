<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker;
use App\Models\User as User;
use App\Models\Profile as Profile;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Profile>
 */
class ProfileFactory extends Factory
{
    public function definition() : array
    {
        $faker      = Faker::create('en_US');
        $userEmails = User::pluck('email')->toArray();
        static $index = 0;

        return [
            "first_name" => $faker->firstName,
            "last_name" => $faker->lastName,
            "mobile" => $faker->e164PhoneNumber(),
            "city" => $faker->city,
            "shipping_address" => $faker->streetAddress,
            "email" => $userEmails[$index++]
        ];
    }
}
