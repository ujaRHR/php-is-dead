<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Models\Profile;

class ProfileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run() : void
    {

        for ($i=1; $i<=20; $i++){
            
            $faker = Faker::create();
            $profile = new Profile();

            $profile->user_id = $i;
            $profile->first_name = $faker->firstName;
            $profile->last_name = $faker->lastName;
            $profile->phone_number = $faker->phoneNumber();
            $profile->country = $faker->countryCode;
            $profile->age = $faker->numberBetween(18,60);
            $profile->birthdate = $faker->date("Y-m-d");
            $profile->zip_code = $faker->postcode;

            $profile->save();
            
        }
    
    }
}
