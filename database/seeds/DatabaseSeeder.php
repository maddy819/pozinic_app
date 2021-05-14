<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Settings;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();
        Settings::truncate();
        $setting = array(
            'title' => 'Poznic App',
            'email' => 'vickya819@gmail.com',
            'logo' => 'creative.jpeg',
            'favicon' => 'creative.jpeg',
            'contact' => '9713879633',
            'website' => 'http://www.poznic.com',
            'description' => 'Poznic App',
            'tags' => 'Poznic App, Fitness, Exercise, workout',
            'address' => 'Sneh Nagar, Bhopal'
        );

        Settings::create($setting);

        User::truncate();
        $admin = User::create([
            'name' => 'admin',
            'email' => 'admin@gmail.com',
            'user_type' => 'admin',
            'mobile' => '9713879633',
            'password' => bcrypt('admin123'),
            'email_verified_at' => NOW()
        ]); 


    }
}
