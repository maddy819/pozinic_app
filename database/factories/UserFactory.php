<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */
use App\User;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => "Admin",
        'user_type' => "admin",
        'email' => "admin@gmail.com",
        'mobile' => $faker->phoneNumber,
        'gender' => "male",
        'age' => $faker->numberBetween($min = 25, $max = 40),
        'state' => $faker->state,
        'city' => $faker->city,
        'constituency' => $faker->city,
        'voter_id' => $faker->numberBetween($min = 10000, $max = 90000),
        'phone_verified_at' => now(),
        'password' => Hash::make('admin123'), // password
        'remember_token' => Str::random(10),
    ];
});
