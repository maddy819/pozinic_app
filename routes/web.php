<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/login');
});

Auth::routes(['verify' => true]);

Route::middleware(['web', 'admin'])->group(function () {
    Route::group(['prefix' => 'admin'], function() {
        Route::get('/dashboard', 'admin\AdminDashboard@index')->name('admin-dashboard');

        Route::get('/equipments', 'admin\EquipmentsController@index')->name('admin-equipments');
        Route::post('/equipments', 'admin\EquipmentsController@store_equipment')->name('admin-store-equipments');
        Route::post('/equipment/edit', 'admin\EquipmentsController@edit_equipment')->name('admin-edit-equipment');

        Route::get('/exercises', 'admin\ExerciseController@index')->name('admin-exercises');
        Route::post('/exercises', 'admin\ExerciseController@store_exercise')->name('admin-store-exercises');
        Route::post('/exercises/edit', 'admin\ExerciseController@edit_exercise')->name('admin-edit-exercise');

        Route::get('/exercises/variations/{exercise}', 'admin\ExerciseController@variation')->name('admin-exercises-variation');
        Route::post('/exercises/variations/store', 'admin\ExerciseController@storeVariation')->name('admin-store-exercises-variation');
        Route::post('/exercises/variations/edit', 'admin\ExerciseController@edit_variation')->name('admin-edit-exercise-variation');

        Route::get('/workouts', 'admin\WorkoutsController@index')->name('admin-workouts');
        Route::post('/workouts', 'admin\WorkoutsController@store_workout')->name('admin-store-workouts');
        Route::post('/workout/edit', 'admin\WorkoutsController@edit_workout')->name('admin-edit-workout');

        Route::get('/settings', 'admin\SettingController@index')->name('admin-settings');
        Route::post('/settings/update', 'admin\SettingController@update')->name('admin-settings-update');

        Route::get('/change-password', 'admin\ChangePasswordController@index')->name('admin-change-password');
        Route::post('/change-password', 'admin\ChangePasswordController@changePassword')->name('admin.change.password');
    });
});