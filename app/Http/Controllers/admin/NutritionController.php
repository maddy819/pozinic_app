<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\NutritionImport;
use App\Imports\MealsImport;
use App\Imports\ItemsImport;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\ExerciseVariations;
use App\Settings;
use App\User;
use App\Nutrition;
use App\Item;
use App\Meal;
use File;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class NutritionController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $nutritions = Nutrition::all();
        $pageTitle = 'Nutrition';
        return view('admin.nutrition', compact('setting', 'nutritions', 'pageTitle'));
    }

    public function store_nutrition(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'instruction' => ['required', 'string'],
            'calorie_range' => ['required', 'string'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        $calorie_range = explode('-', request('calorie_range'));

        if(request('save') == "Post Nutrition") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/nutrition/images/', $imagefilename);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $nCount = Nutrition::get()->count();
            
            if($nCount > 0) {
                $last = Nutrition::latest('id')->first()->id;
                $code = "POZNUT".($last + 1);
            } else {
                $code = "POZNUT1";
            }

            $nutritionData = array('code' => $code, 'title' => request('title'), 'slug' => Str::slug(request('title')), 'calorie_range_1' => $calorie_range[0], 'calorie_range_2' => $calorie_range[1], 'instructions' => request('instruction'), 'image' => $imagefilename);

            $nutrition = Nutrition::create($nutritionData);

            if($nutrition) {
                return response()->json(['success'=>'Nutrition List Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            if(empty($request->file('image'))) {
                $new_image = request('old_image');
            } else {
                if(!empty(request('old_image'))) {
                    File::delete(request('old_image'));
                }
    
                $image = $request->file('image');
                $ext_image =  $image->getClientOriginalExtension();
                $new_image = time().'.'.$ext_image;
                $image->move('uploads/nutrition/images/', $new_image);
            }

            $nutritionData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'calorie_range_1' => $calorie_range[0], 'calorie_range_2' => $calorie_range[1],  'instructions' => request('instruction'), 'image' => $new_image);

            $res1 = Nutrition::where('id', $id)->update($nutritionData);

            if($res1) {
                return response()->json(['success' => 'Nutrition Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_nutrition(Request $request) {
        $ntId = request('ntId');
        $nutrition = Nutrition::where('id', $ntId)->get()->first();
        return \Response::json($nutrition);
    }

    public function delete_nutrition(Request $request) {
        $id = request('id');
        $nutrition = Nutrition::find($id);
        Meal::whereIn('id', array_values($nutrition->meals->pluck('id')->toArray()))->delete();
        Item::whereIn('id', array_values($nutrition->items->pluck('id')->toArray()))->delete();
        $res = Nutrition::where('id', $id)->delete();
        
        if($res) {
            $destinationPath = public_path("uploads/nutrition/images/".$nutrition['image']);
            File::delete($destinationPath);
            return redirect()->back()->with('success', 'Nutrition Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    public function importNutritions(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new NutritionImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Nutritions Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    public function viewNutritionMeals(Nutrition $nutrition) {
        $setting = Settings::all()->first();
        $nutritionMeals = $nutrition->meals;
        $pageTitle = $nutrition->title.' Meals List';
        return view('admin.nutrition_meals', compact('nutrition', 'nutritionMeals', 'pageTitle', 'setting'));
    }

    public function storeNutritionMeal(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'time' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Meal") {
            $mCount = Meal::get()->count();
            
            if($mCount > 0) {
                $last = Meal::latest('id')->first()->id;
                $code = "POZMEAL".($last + 1);
            } else {
                $code = "POZMEAL1";
            }

            $mealData = array('nutrition_id' => request('nid'), 'code' => $code, 'title' => request('title'), 'slug' => Str::slug(request('title')), 'time' => request('time'), 'suggestions' => request('suggestions'));
            $res = Meal::create($mealData);

            if($res) {
                return response()->json(['success'=>'Meal Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $mlid = request('mlid');
            $mealData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'time' => request('time'), 'suggestions' => request('suggestions'));

            $res1 = Meal::where('id', $mlid)->update($mealData);

            if($res1) {
                return response()->json(['success' => 'Meal Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function editNutritionMeal(Request $request) {
        $nmId = request('nmId');
        $meal = Meal::where('id', $nmId)->get()->first();
        return \Response::json($meal);
    }

    public function deleteNutritionMeal(Request $request) {
        $id = request('id');
        $res = Meal::where('id', $id)->delete();

        if($res) {
            return redirect()->back()->with('success', 'Meal Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    public function importNutritionMeal(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new MealsImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Meals Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    public function viewNutritionMealItems(Meal $meal) {
        $setting = Settings::all()->first();
        $nutrition = $meal->nutrition;
        $mealItems = $meal->items;
        $pageTitle = $nutrition->title.' '.$meal->title.' Items List';
        return view('admin.nutrition_meal_items', compact('nutrition', 'meal', 'mealItems', 'pageTitle', 'setting'));
    }

    public function storeNutritionMealItem(Request $request) {
        if(request('save') == "Post Item") {
            $validator = Validator::make($request->all(), [
                'title' => ['required', 'array', 'min:1'],
                'quantity' => ['required', 'array', 'min:1']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            $items = array();

            foreach(request('title') as $k => $it) {
                $items[$k]['meal_id'] = request('meal_id');
                $items[$k]['title'] = $it;
                $items[$k]['slug'] = Str::slug($it);
                $items[$k]['quantity'] = request('quantity')[$k];
            }

            $res = Item::insert($items);

            if($res) {
                return response()->json(['success'=>'Item Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $validator = Validator::make($request->all(), [
                'title' => ['required', 'string', 'max:60'],
                'quantity' => ['required', 'string', 'max:60']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            $item_id = request('item_id');

            $itemData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'quantity' => request('quantity'));

            $res1 = Item::where('id', $item_id)->update($itemData);

            if($res1) {
                return response()->json(['success' => 'Item Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function deleteNutritionMealItem(Request $request) {
        $id = request('id');
        $res = Item::where('id', $id)->delete();

        if($res) {
            return redirect()->back()->with('success', 'Item Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    public function editNutritionMealItem(Request $request) {
        $itId = request('itId');
        $item = Item::where('id', $itId)->get()->first();
        return \Response::json($item);
    }

    public function importNutritionMealItem(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new ItemsImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Meal Items Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    /**
     * @group  Filters
     * 
     * @authenticated
     *
     * API for Filtering All nutrition
     * 
     * @bodyParam  calorie integer required The calorie for the nutrition.
     * 
     * @response  {
     *  "nutrition": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "grfsgrfsg",
     *      "slug": "grfsgrfsg",
     *      "calorie_range_1": "1100",
     *      "calorie_range_2": "1350",
     *      "benefits": "Full Body",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/streches/images/1623067648.jpg",
     *      "instructions": "fvadfadfa",
     *      "description": "fadsfadfda"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/nutrition?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/nutrition?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/filter/nutrition",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 4,
     *    "total": 4
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Strech Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function nutritionFilter(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $calorie = request('calorie');
            $nutritions = Nutrition::with('meals')->whereRaw('? between calorie_range_1 and calorie_range_2', [$calorie])->paginate(10);

            if($nutritions->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Nutrition list not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'nutrition' => $nutritions], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Nutritions
     * 
     * API for getting All nutritions 
     * 
     * @authenticated
     * 
     * @response  {
     *  "nutritions": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "code": "POZNUT1",
     *      "title": "Sample Eating Plan, Western Vegan",
     *      "slug": "sample-eating-plan-western-vegan",
     *      "calorie_range_1": 1100,
     *      "calorie_range_2": 1350,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/nutrition/1625928176.png", 
     *      "instructions": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28" 
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/nutritions",
     *    "per_page": 15,
     *    "prev_page_url": null,
     *    "to": 1,
     *    "total": 1
     *   },
     *   "success": true
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Nutritions Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getNutritions(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $nutritions = Nutrition::paginate();

            if($nutritions->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Nutritions not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'nutritions' => $nutritions], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => 'Token is Expired.'], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Nutritions
     * 
     * @authenticated
     *
     * API for getting single nutrition
     * 
     * @urlParam  id required The ID of the nutrition.
     * 
     * @response  {
     *  "success": true,
     *  "nutrition": {
     *      "id": 1,
     *      "code": "POZNUT1",
     *      "title": "Sample Eating Plan, Western Vegan",
     *      "slug": "sample-eating-plan-western-vegan",
     *      "calorie_range_1": 1100,
     *      "calorie_range_2": 1350,
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/nutrition/1625928176.png", 
     *      "instructions": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28" 
     *  }
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Token is Invalid."
     * }  
     * 
     * @response  403 {
     *  "success": false,
     *  "message": "Token is Expired."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Nutrition Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleNutrition(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $nutrition = Nutrition::with('meals')->where('id', request('id'))->get()->first(); 

            if(empty($nutrition)) {
                return response()->json(['success' =>  false, 'message' => 'Nutrition not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'nutrition' => $nutrition], 200);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public function paginate($items, $perPage, $page = null, $options = []) {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }
}