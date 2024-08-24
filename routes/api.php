<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('auth/login', 'api\ApiController@login');
Route::post('auth/register', 'api\ApiController@register');
Route::get('user/refresh/token', 'api\ApiController@refreshToken');
Route::post('user/forgot/password', 'api\ApiController@forgotPassword');
Route::get('user/logout', 'api\ApiController@logout');

Route::get('settings', 'admin\GeneralController@getSettings');
Route::get('faqs', 'admin\GeneralController@getFaqs');
Route::post('revenuecat/webhook', 'api\RevenueCat@revenueCatWebHook');

Route::middleware(['jwt.verify'])->group(function () {
    Route::get('featured/resources', 'api\ApiController@featuredResources');
    Route::post('user/questionset1/update', 'api\ApiController@updateQuestionSet1');
    Route::post('user/questionset2/update', 'api\ApiController@updateQuestionSet2');

    Route::post('user/playlist/create', 'api\ApiController@createPlaylist');
    Route::post('user/playlist/update', 'api\ApiController@updateUserPlaylist');
    Route::post('user/playlist/delete', 'api\ApiController@deleteUserPlaylist');
    Route::get('user/playlist/{playlist?}', 'api\ApiController@getAllPlaylist');

    Route::post('playlist/saved/exercises', 'admin\ExerciseController@playlistSavedExercises');
    Route::post('playlist/saved/workouts', 'admin\WorkoutsController@playlistSavedWorkouts');
    Route::post('playlist/saved/programs', 'admin\ProgramsController@playlistSavedPrograms');
    Route::post('playlist/saved/splits', 'admin\SplitsController@playlistSavedSplits');
    Route::post('playlist/saved/streches', 'admin\StrechController@playlistSavedStreches');

    Route::post('playlist/save/resource', 'api\ApiController@playlistSaveResource');
    Route::post('playlist/unsave/resource', 'api\ApiController@playlistUnsaveResource');

    Route::get('user/favourite/exercises', 'admin\ExerciseController@userFavouriteExercises');
    Route::get('user/favourite/workouts', 'admin\WorkoutsController@userFavouriteWorkouts');
    Route::get('user/favourite/programs', 'admin\ProgramsController@userFavouritePrograms');
    Route::get('user/favourite/splits', 'admin\SplitsController@userFavouriteSplits');
    Route::get('user/favourite/streches', 'admin\StrechController@userFavouriteStreches');

    Route::get('user/recent/exercises', 'admin\ExerciseController@userRecentExercises');
    Route::get('user/recent/workouts', 'admin\WorkoutsController@userRecentWorkouts');
    Route::get('user/recent/programs', 'admin\ProgramsController@userRecentPrograms');
    Route::get('user/recent/splits', 'admin\SplitsController@userRecentSplits');
    Route::get('user/recent/streches', 'admin\StrechController@userRecentStreches');

    Route::post('user/program/subscribe', 'admin\ProgramsController@userProgramSubscribe');
    Route::get('user/program/subscriptions', 'admin\ProgramsController@getUserProgramSubscriptions');
    Route::post('user/program/subscription/progress', 'admin\ProgramsController@userProgramSubscriptionProgress');
    Route::get('user/program/subscription/progress/{subscriptionId}', 'admin\ProgramsController@getUserProgramSubscriptionProgress');
    Route::get('user/program/subscription/reset/{subscriptionId}', 'admin\ProgramsController@resetUserProgramSubscriptionProgress');

    Route::post('user/split/subscribe', 'admin\SplitsController@userSplitSubscribe');
    Route::get('user/split/subscriptions', 'admin\SplitsController@getUserSplitSubscriptions');
    Route::post('user/split/subscription/progress', 'admin\SplitsController@userSplitSubscriptionProgress');
    Route::get('user/split/subscription/progress/{subscriptionId}', 'admin\SplitsController@getUserSplitSubscriptionProgress');
    Route::get('user/split/subscription/reset/{subscriptionId}', 'admin\SplitsController@resetUserSplitSubscriptionProgress');

    Route::post('user/favourite/resource', 'api\ApiController@userFavouriteResource');
    Route::post('user/recent/resource', 'api\ApiController@userRecentResource');
    Route::post('user/unfavourite/resource', 'api\ApiController@userUnfavouriteResource');

    Route::post('user/profile/update', 'api\ApiController@updateUserProfile');
    Route::post('user/profile/update/pic', 'api\ApiController@updatePic');
    Route::get('user/profile', 'api\ApiController@getAuthenticatedUser');
    Route::get('user/profile/delete', 'api\ApiController@deleteUserProfile');
    
    Route::get('blogs', 'admin\BlogsController@getBlogs');
    Route::post('blogs', 'admin\BlogsController@postBlogs');

    Route::post('contacts', 'admin\GeneralController@postContacts');

    Route::get('videos', 'admin\VideosController@getVideos');
    Route::post('videos', 'admin\GeneralController@postVideos');

    Route::get('nutritions', 'admin\NutritionController@getNutritions');
    Route::get('nutritions/single/{id}', 'admin\NutritionController@getSingleNutrition');

    Route::get('signup/questions', 'admin\QuestionsController@signupQuestions');

    Route::get('exercise/featured/category', 'admin\ExerciseController@getFeaturedCategoryExercise');
    Route::get('exercise/all/', 'admin\ExerciseController@getAllExercises');
    Route::get('exercise/single/{id}', 'admin\ExerciseController@getSingleExercise');

    Route::get('filter/exercise/', 'admin\FilterController@getExerciseFilter');
    Route::post('filter/exercise/', 'admin\FilterController@exerciseFilter');

    Route::get('filter/workout/', 'admin\FilterController@getWorkoutFilter');
    Route::post('filter/workout/', 'admin\FilterController@workoutFilter');

    Route::get('filter/split/', 'admin\FilterController@getsplitFilter');
    Route::post('filter/split/', 'admin\FilterController@splitFilter');

    Route::get('filter/program/', 'admin\FilterController@getprogramFilter');
    Route::post('filter/program/', 'admin\FilterController@programFilter');

    Route::get('filter/strech/', 'admin\FilterController@getStrechFilter');
    Route::post('filter/strech/', 'admin\FilterController@strechFilter');

    Route::post('filter/nutrition/', 'admin\NutritionController@nutritionFilter');

    Route::get('workouts/all/', 'admin\WorkoutsController@getAllWorkouts');
    //Route::get('workouts/single/{id}', 'admin\WorkoutsController@getSingleworkout');
    Route::get('workouts/duration/{id}', 'admin\WorkoutsController@getWorkoutDuration');
    Route::post('workouts/single/variation/{id}', 'admin\WorkoutsController@getSingleWorkoutByVariation');

    Route::get('programs/all/', 'admin\ProgramsController@getAllPrograms');
    Route::get('programs/single/{id}', 'admin\ProgramsController@getSingleProgram');
    Route::get('programs/duration/{id}', 'admin\ProgramsController@getProgramDuration');
    Route::get('programs/workouts/day/{id}/{day}/{duration}', 'admin\ProgramsController@getProgramWorkoutByDay');

    Route::get('splits/all/', 'admin\SplitsController@getAllSplits');
    Route::get('splits/single/{id}', 'admin\SplitsController@getSingleSplit');
    Route::get('splits/duration/{id}', 'admin\SplitsController@getSplitDuration');
    Route::get('splits/workouts/day/{id}/{day}/{duration}', 'admin\SplitsController@getSplitWorkoutByDay');

    Route::get('strech/all/', 'admin\StrechController@getAllStreches');
    Route::get('strech/single/{id}', 'admin\StrechController@getSingleStrech');

    Route::get('equipments/all/', 'admin\EquipmentsController@getAllEquipments');
});
