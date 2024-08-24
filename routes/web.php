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

Route::get('/clear-cache', function() {
    $exitCode = Artisan::call('config:cache');
    return redirect('/login');
 });

Route::get('/', function () {
    return redirect('/login');
});

Auth::routes(['verify' => true]);
Route::get('/home', 'HomeController@index')->name('home');

Route::middleware(['web','verified', 'customer'])->group(function() {
    Route::group(['prefix' => 'customer'], function() {
        Route::get("/verified", function() {
            return View::make("verified");
        });
    });
});

Route::middleware(['web','verified', 'admin', 'throttle:60,1'])->group(function() {
    //Route::group(['prefix' => 'admin'], function() {
        Route::get('/dashboard', 'admin\AdminDashboard@index')->name('admin-dashboard');

        Route::group(['prefix' => 'users'], function() {
            Route::get('/', 'admin\UsersController@index')->name('admin-users');
            Route::get('/all', 'admin\UsersController@users' )->name('all-users');
            Route::get('/view/playlists/{id}', 'admin\UsersController@viewPlaylists' )->name('users-view-playlists');
            Route::get('/playlist/saved/resources/{id}', 'admin\UsersController@userPlaylistSavedResources' )->name('users-playlist-saved-resources');
            Route::get('/favourite/resources/{id}', 'admin\UsersController@favouriteResources' )->name('users-favourite-resources');
            Route::get('/recent/resources/{id}', 'admin\UsersController@recentResources' )->name('users-recent-resources');
            Route::get('/program/subscriptions/{id}', 'admin\UsersController@userProgramSubscriptions' )->name('users-program-subscriptions');
            Route::get('/active/plan/{id}', 'admin\UsersController@activePlan' )->name('users-active-plan');
        });

        Route::group(['prefix' => 'blogs'], function() {
            Route::get('/', 'admin\BlogsController@index')->name('admin-blogs');
            Route::post('/', 'admin\BlogsController@store_blog')->name('admin-store-blog');
            Route::get('/all', 'admin\BlogsController@blogs' )->name('all-blogs');
            Route::post('/edit', 'admin\BlogsController@edit_blog')->name('admin-edit-blog');
            Route::get('/delete/{id}', 'admin\BlogsController@delete_blog')->name('admin-delete-blog');
        });

        Route::group(['prefix' => 'videos'], function() {
            Route::get('/', 'admin\VideosController@index')->name('admin-videos');
            Route::post('/', 'admin\VideosController@store_video')->name('admin-store-video');
            Route::get('/all', 'admin\VideosController@videos' )->name('all-videos');
            Route::post('/edit', 'admin\VideosController@edit_video')->name('admin-edit-video');
            Route::get('/delete/{id}', 'admin\VideosController@delete_video')->name('admin-delete-video');
        });

        Route::group(['prefix' => 'categories'], function() {
            Route::get('/', 'admin\CategoriesController@index')->name('admin-categories');
            Route::post('/', 'admin\CategoriesController@store_category')->name('admin-store-categories');
            Route::post('/edit', 'admin\CategoriesController@edit_category')->name('admin-edit-category');
            Route::get('/delete/{id}', 'admin\CategoriesController@delete_category')->name('admin-delete-categories');
        });

        Route::group(['prefix' => 'focus-area'], function() {
            Route::get('/', 'admin\FilterController@index')->name('admin-focus-area');
            Route::post('/', 'admin\FilterController@storeFocusArea')->name('admin-store-focus-area');
            Route::post('/edit', 'admin\FilterController@editFocusArea')->name('admin-edit-focus-area');
            Route::get('/delete/{id}', 'admin\FilterController@deleteFocusArea')->name('admin-delete-focus-area');
        });

        Route::group(['prefix' => 'good-for'], function() {
            Route::get('/', 'admin\FilterController@showGoodFor')->name('admin-good-for');
            Route::post('/', 'admin\FilterController@storeGoodFor')->name('admin-store-good-for');
            Route::post('/edit', 'admin\FilterController@editGoodFor')->name('admin-edit-good-for');
            Route::get('/delete/{id}', 'admin\FilterController@deleteGoodFor')->name('admin-delete-good-for');
        });

        Route::group(['prefix' => 'muscles'], function() {
            Route::get('/', 'admin\FilterController@showMuscles')->name('admin-muscles');
            Route::post('/', 'admin\FilterController@storeMuscles')->name('admin-store-muscles');
            Route::post('/edit', 'admin\FilterController@editMuscles')->name('admin-edit-muscles');
            Route::get('/delete/{id}', 'admin\FilterController@deleteMuscles')->name('admin-delete-muscles');
        });

        Route::group(['prefix' => 'durations'], function() {
            Route::get('/', 'admin\FilterController@showDurations')->name('admin-durations');
            Route::post('/', 'admin\FilterController@storeDurations')->name('admin-store-durations');
            Route::post('/edit', 'admin\FilterController@editDurations')->name('admin-edit-durations');
            Route::get('/delete/{id}', 'admin\FilterController@deleteDurations')->name('admin-delete-durations');
        });

        Route::group(['prefix' => 'equipments'], function() {
            Route::get('/', 'admin\EquipmentsController@index')->name('admin-equipments');
            Route::post('/', 'admin\EquipmentsController@store_equipment')->name('admin-store-equipments');
            Route::post('/edit', 'admin\EquipmentsController@edit_equipment')->name('admin-edit-equipment');
            Route::get('/delete/{id}', 'admin\EquipmentsController@deleteEquipment')->name('admin-delete-equipment');
        });

        Route::group(['prefix' => 'exercises'], function() {
            Route::get('/', 'admin\ExerciseController@index')->name('admin-exercises');
            Route::post('/', 'admin\ExerciseController@store_exercise')->name('admin-store-exercises');
            Route::post('/edit', 'admin\ExerciseController@edit_exercise')->name('admin-edit-exercise');
            Route::get('/delete/{id}', 'admin\ExerciseController@deleteExercise')->name('admin-delete-exercise');
            Route::post('/import', 'admin\ExerciseController@importExercises')->name('admin-import-exercises');

            Route::group(['prefix' => 'variations'], function() {
                Route::get('/{exercise}', 'admin\ExerciseController@variation')->name('admin-exercises-variation');
                Route::post('/store', 'admin\ExerciseController@storeVariation')->name('admin-store-exercises-variation');
                Route::post('/edit', 'admin\ExerciseController@edit_variation')->name('admin-edit-exercise-variation');
            });
        });

        Route::group(['prefix' => 'streches'], function() {
            Route::get('/', 'admin\StrechController@index')->name('admin-streches');
            Route::post('/', 'admin\StrechController@store_strech')->name('admin-store-streches');
            Route::post('/edit', 'admin\StrechController@edit_strech')->name('admin-edit-strech');
            Route::get('/delete/{id}', 'admin\StrechController@deleteStrech')->name('admin-delete-strech');
            Route::post('/import', 'admin\StrechController@importStreches')->name('admin-import-streches');
        });

        Route::group(['prefix' => 'workouts'], function() {
            Route::get('/', 'admin\WorkoutsController@index')->name('admin-workouts');
            Route::post('/', 'admin\WorkoutsController@store_workout')->name('admin-store-workouts');
            Route::post('/edit', 'admin\WorkoutsController@edit_workout')->name('admin-edit-workout');
            Route::get('/delete/{id}', 'admin\WorkoutsController@deleteWorkout')->name('admin-delete-workout');
            Route::post('/import', 'admin\WorkoutsController@importWorkouts')->name('admin-import-workouts');
            Route::get('/featured/{wkid}/{duration}', 'admin\WorkoutsController@makeFeatured')->name('admin-workout-make-featured');

            Route::group(['prefix' => 'exercises'], function() {
                Route::post('/', 'admin\WorkoutsController@workoutExercisesImport')->name('admin-workout-exercises-import');
                Route::get('/{wkid}/{duration}', 'admin\WorkoutsController@exercises')->name('admin-workout-exercises-variation');
                Route::post('/import', 'admin\WorkoutsController@importWorkoutsExercises')->name('admin-import-workout-exercises');
                Route::post('/store', 'admin\WorkoutsController@storeExercise')->name('admin-store-workout-exercises');
                Route::post('/store/category', 'admin\WorkoutsController@storeCategory')->name('admin-store-workout-category');
                Route::post('/edit', 'admin\WorkoutsController@edit_exercise')->name('admin-edit-workout-exercise');
                Route::get('/delete/{id}/{wkid}/{duration}', 'admin\WorkoutsController@delete_workout_exercise')->name('admin-delete-workout-exercise');
                Route::post('/variation/list', 'admin\WorkoutsController@exercisesVariationList')->name('admin-workout-exercises-variation-list');
            });

            Route::group(['prefix' => 'warmups'], function() {
                Route::post('/store', 'admin\WorkoutsController@storeWarmups')->name('admin-store-workout-warmups');
            });

            Route::group(['prefix' => 'poststreches'], function() {
                Route::post('/store', 'admin\WorkoutsController@storePoststreches')->name('admin-store-workout-poststreches');
            });
        });

        Route::group(['prefix' => 'programs'], function() {
            Route::get('/', 'admin\ProgramsController@index')->name('admin-programs');
            Route::post('/', 'admin\ProgramsController@store_program')->name('admin-store-program');
            Route::post('/edit', 'admin\ProgramsController@edit_program')->name('admin-edit-program');
            Route::get('/delete/{id}', 'admin\ProgramsController@deleteProgram')->name('admin-delete-program');
            Route::post('/import', 'admin\ProgramsController@importPrograms')->name('admin-import-programs');

            Route::group(['prefix' => 'workouts'], function() {
                Route::get('/{prid}/{duration}', 'admin\ProgramsController@workouts')->name('admin-program-workouts-variation');
                Route::post('/store', 'admin\ProgramsController@storeWorkout')->name('admin-store-program-workout');
                Route::post('/import', 'admin\ProgramsController@importWorkout')->name('admin-import-program-workout');
                Route::post('/edit', 'admin\ProgramsController@editProgramWorkout')->name('admin-edit-program-workout');
                Route::get('/delete/{id}/{prid}/{duration}', 'admin\ProgramsController@deleteProgramWorkout')->name('admin-delete-program-workout');
            });
        });

        Route::group(['prefix' => 'splits'], function() {
            Route::get('/', 'admin\SplitsController@index')->name('admin-splits');
            Route::post('/', 'admin\SplitsController@store_split')->name('admin-store-split');
            Route::post('/edit', 'admin\SplitsController@edit_split')->name('admin-edit-split');
            Route::get('/delete/{id}', 'admin\SplitsController@deleteSplit')->name('admin-delete-split');
            Route::post('/import', 'admin\SplitsController@importSplits')->name('admin-import-splits');

            Route::group(['prefix' => 'workouts'], function() {
                Route::get('/{spid}/{duration}', 'admin\SplitsController@workouts')->name('admin-split-workouts-variation');
                Route::post('/store', 'admin\SplitsController@storeWorkout')->name('admin-store-split-workout');
                Route::post('/import', 'admin\SplitsController@importWorkout')->name('admin-import-split-workout');
                Route::post('/edit', 'admin\SplitsController@editSplitWorkout')->name('admin-edit-split-workout');
                Route::get('/delete/{id}/{spid}/{duration}', 'admin\SplitsController@deleteSplitWorkout')->name('admin-delete-split-workout');
            });
        });


        Route::group(['prefix' => 'nutrition'], function() {
            Route::get('/', 'admin\NutritionController@index')->name('admin-nutrition');
            Route::post('/', 'admin\NutritionController@store_nutrition')->name('admin-store-nutrition');
            Route::post('/edit', 'admin\NutritionController@edit_nutrition')->name('admin-edit-nutrition');
            Route::get('/delete/{id}', 'admin\NutritionController@delete_nutrition')->name('admin-delete-nutrition');
            Route::post('/import', 'admin\NutritionController@importNutritions')->name('admin-import-nutritions');
            
            Route::group(['prefix' => 'meal'], function() {
                Route::get('/view/{nutrition}', 'admin\NutritionController@viewNutritionMeals')->name('admin-view-nutrition-meals');
                Route::post('/store', 'admin\NutritionController@storeNutritionMeal')->name('admin-store-nutrition-meal');
                Route::post('/edit', 'admin\NutritionController@editNutritionMeal')->name('admin-edit-nutrition-meal');
                Route::get('/delete/{id}', 'admin\NutritionController@deleteNutritionMeal')->name('admin-delete-nutrition-meal');
                Route::post('/import', 'admin\NutritionController@importNutritionMeal')->name('admin-import-nutrition-meal');

                Route::group(['prefix' => 'item'], function() {
                    Route::get('/view/{meal}', 'admin\NutritionController@viewNutritionMealItems')->name('admin-view-nutrition-meal-items');
                    Route::post('/store', 'admin\NutritionController@storeNutritionMealItem')->name('admin-store-nutrition-meal-item');
                    Route::post('/edit', 'admin\NutritionController@editNutritionMealItem')->name('admin-edit-nutrition-meal-item');
                    Route::get('/delete/{id}', 'admin\NutritionController@deleteNutritionMealItem')->name('admin-delete-nutrition-meal-item');
                    Route::post('/import', 'admin\NutritionController@importNutritionMealItem')->name('admin-import-nutrition-meal-item');
                });
            });
        });
        
        Route::group(['prefix' => 'signup'], function() {
            Route::group(['prefix' => 'questions'], function() {
                Route::get('/', 'admin\QuestionsController@index')->name('admin-questions');
                Route::post('/', 'admin\QuestionsController@store_question')->name('admin-store-questions');
                Route::post('/edit', 'admin\QuestionsController@edit_question')->name('admin-edit-question');
                Route::get('/delete/{id}', 'admin\QuestionsController@delete_question')->name('admin-delete-question');
            });
        });
        
        Route::group(['prefix' => 'faq'], function() {
            Route::get('/', 'admin\GeneralController@index')->name('admin-faq');
            Route::post('/', 'admin\GeneralController@store_faq')->name('admin-store-faq');
            Route::post('/edit', 'admin\GeneralController@edit_faq')->name('admin-edit-faq');
            Route::get('/delete/{id}', 'admin\GeneralController@delete_faq')->name('admin-delete-faq');
        });
        

        Route::group(['prefix' => 'contact'], function() {
            Route::get('/', 'admin\GeneralController@contacts')->name('admin-contact');
            Route::get('/all', 'admin\GeneralController@allContacts' )->name('all-contact');
            Route::get('/delete/{id}', 'admin\GeneralController@delete_contact')->name('admin-delete-contact');
        });

        Route::group(['prefix' => 'settings'], function() {
            Route::get('/', 'admin\SettingController@index')->name('admin-settings');
            Route::post('/update', 'admin\SettingController@update')->name('admin-settings-update');
        });

        Route::group(['prefix' => 'plan'], function() {
            Route::get('/', 'admin\PlansController@index')->name('admin-plan');
            Route::post('/', 'admin\PlansController@store_plan')->name('admin-store-plan');
            Route::post('/edit', 'admin\PlansController@edit_plan')->name('admin-edit-plan');
            Route::get('/delete/{id}', 'admin\PlansController@delete_plan')->name('admin-delete-plan');
        });

        Route::group(['prefix' => 'change-password'], function() {
            Route::get('/', 'admin\ChangePasswordController@index')->name('admin-change-password');
            Route::post('/', 'admin\ChangePasswordController@changePassword')->name('admin.change.password');
        });
    //});
});