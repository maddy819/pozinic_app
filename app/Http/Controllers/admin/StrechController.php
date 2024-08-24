<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\StrechesImport;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use App\Category;
use App\Strech;
use App\FocusArea;
use App\GoodFor;
use App\Muscles;
use App\UserPlaylist;
use File;
use JWTAuth;
use DB;

class StrechController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $streches = Strech::all();
        $focusAreas = FocusArea::all();
        $goodFors = GoodFor::all();
        $muscles = Muscles::all();
        $pageTitle = 'Streches';
        return view('admin.streches', compact('setting', 'streches', 'pageTitle', 'focusAreas', 'goodFors', 'muscles'));
    }

    public function store_strech(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'based_on' => ['required'],
            'duration' => ['required_if:based_on,duration'],
            'instruction' => ['required', 'string'],
            'reps' => ['required_if:based_on,reps'],
            'good_for' => ['required', 'array', 'min:1'],
            'focus_area' => ['required', 'array','min:1'],
            'specific_muscles' => ['array', 'min:1'],
            'level' => ['required', 'array', 'min:1'],
            'image' => ['image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'equipments' => ['required', 'array', 'min:1'],
            'video_link' => ['required', 'string', 'url'],
            'tip_video' => ['required', 'string', 'url'],
            'type' => ['required', 'array', 'min:1'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(preg_match("/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/", request('tip_video'), $output_array)) {
            $videoId = $output_array[5];
        }

        $url = "https://vimeo.com/api/oembed.json?url=".urlencode("https://vimeo.com/".$videoId);
        $curl = curl_init();
        curl_setopt_array($curl, array(CURLOPT_URL => $url, CURLOPT_RETURNTRANSFER => true));
        $response = curl_exec($curl);

        if (curl_errno($curl)) {
            $error_msg = curl_error($curl);
        }

        curl_close($curl);

        if (isset($error_msg)) {
            $videoMeta['thumbnail_url'] = NULL;
        } else {
            $videoMeta = json_decode($response, true);
        }

        if(request('level')[0] == "ALL") {
            $levels = implode(',',array('Beginner','Intermediate','Advanced'));
        } else {
            $levels = implode(',',request('level'));
        }
        
        if(request('save') == "Post Strech") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/streches/images/', $imagefilename);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $stCount = Strech::get()->count();
            
            if($stCount > 0) {
                $last = Strech::latest('id')->first()->id;
                $code = "POZST".($last + 1);
            } else {
                $code = "POZST1";
            }

            $strechData = array('title' => request('title'), 'based_on' => request('based_on'), 'code' => $code, 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'category_id' => request('category'), 'instructions' => request('instruction'), 'image' => $imagefilename, 'description' => request('description'), 'reps' => request('reps'), 'focus_area' => implode(',',request('focus_area')), 'specific_muscles' => implode(',',request('specific_muscles')), 'good_for' => implode(',',request('good_for')), 'level' => $levels, 'tags' => request('tags'), 'video_link' => request('video_link'), 'type' => implode(',', request('type')), 'tip_video' => request('tip_video'), 'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL);

            $strech = Strech::create($strechData);

            if($strech) {
                $strech->equipments()->attach(request('equipments'));
                return response()->json(['success'=>'Strech Posted Successfully.']);
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
                $image->move('uploads/streches/images/', $new_image);
            }

            $strechData = array('title' => request('title'), 'based_on' => request('based_on'), 'duration' => request('duration'), 'slug' => Str::slug(request('title')), 'category_id' => request('category'), 'instructions' => request('instruction'), 'image' => $new_image, 'description' => request('description'), 'reps' => request('reps'), 'focus_area' => implode(',',request('focus_area')), 'specific_muscles' => implode(',',request('specific_muscles')), 'good_for' => implode(',',request('good_for')), 'level' => $levels, 'tags' => request('tags'), 'video_link' => request('video_link'), 'type' => implode(',', request('type')), 'tip_video' => request('tip_video'), 'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL);

            $res1 = Strech::where('id', $id)->update($strechData);

            if($res1) {
                $strech = Strech::find($id);
                $strech->equipments()->sync(request('equipments'));
                return response()->json(['success' => 'Strech Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function importStreches(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => ['required', 'mimes:csv,txt,xls,xlsx'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Please upload a valid CSV file..!');
        }

        $import = Excel::import(new StrechesImport, request()->file('file'));

        if($import) {
            return redirect()->back()->with('success', 'Streches Imported Successfully..!');
        }

        return redirect()->back()->with('error', 'Error in Importing..!');
    }

    public function edit_strech(Request $request) {
        $stId = request('stId');
        $strech = Strech::with('equipments')->where('id', $stId)->get()->first();
        return \Response::json($strech);
    }

    public function deleteStrech(Request $request) {
        $ids = explode(",", request('id'));

        foreach($ids as $id) {
            $strech = Strech::find($id);
            $res = Strech::where('id', $id)->delete();
            $destinationPath = public_path("uploads/streches/images/".$strech['image']);
            File::delete($destinationPath);
        }
        
        return redirect()->back()->with('success', 'Strech Deleted Successfully...');
    }

    /**
     * @group  Strech
     * 
     * @authenticated
     *
     * API for getting All strech
     * 
     * @response  {
     *  "streches": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/streches/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/strech/all?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/strech/all?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/strech/all",
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

    public function getAllStreches(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $streches = Strech::select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->where('visible', 1)->with(array('equipments' => function($query) {
                $query->select('name');
            }))->paginate(10); 

            foreach($streches as $k => $st) {
                $focus_area = explode(',', $st['focus_area']);
                $specific_muscles = explode(',', $st['specific_muscles']);
                $good_for = explode(',', $st['good_for']);
                $type = explode(',', $st['type']);
                $tags = explode(',', $st['tags']);
                $st['focus_area'] = $focus_area;
                $st['specific_muscles'] = $specific_muscles;
                $st['good_for'] = $good_for;
                $st['type'] = $type;
                $st['tags'] = $tags;
            }

            if($streches->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Streches not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'streches' => $streches], 200);
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
     * @group  Strech
     * 
     * @authenticated
     *
     * API for getting single streches
     * 
     * @urlParam  id required The ID of the strech.
     * 
     * @response  {
     *  "success": true,
     *  "strech": {
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "code": "FBB21",
     *      "slug": "full-body-blaster",
     *      "category_id": 2,
     *      "duration": "10:30",
     *      "instructions": "<p>fvadfadfa</p>",
     *      "description": "<p>fadsfadfda</p>",
     *      "video_link": "https://docs.google.com/spreadsheets/d/1pL55jhFOqmZrCguW79clLSf6IJYHeCPyP7VVEFIXNRM/edit#gid=0",
     *      "reps": "5",
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "Notes": null,
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg",
     *      "tags": "exercise,health,nutrition",
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
     *  "message": "Strech Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getSingleStrech(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $strech = Strech::with('category', 'equipments')->where('id', request('id'))->where('visible', 1)->get()->first(); 

            if(empty($strech)) {
                return response()->json(['success' =>  false, 'message' => 'Strech not found.'], 404);
            }

            $focus_area = explode(',', $strech['focus_area']);
            $specific_muscles = explode(',', $strech['specific_muscles']);
            $good_for = explode(',', $strech['good_for']);
            $type = explode(',', $strech['type']);
            $tags = explode(',', $strech['tags']);
            // $instructions = strip_tags(preg_replace('/\s+/', '', $strech['instructions']));
            // $description = strip_tags(preg_replace('/\s+/', '', $strech['description']));
            $strech['focus_area'] = $focus_area;
            $strech['specific_muscles'] = $specific_muscles;
            $strech['good_for'] = $good_for;
            $strech['type'] = $type;
            $strech['tags'] = $tags;
            // $strech['instructions'] = $instructions;
            // $strech['description'] = $description;
            
            if(empty($strech)) {
                return response()->json(['success' =>  false, 'message' => 'Strech not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'strech' => $strech], 200);
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
     * @group  playlist
     * 
     * @authenticated
     *
     * API for getting Saved streches
     * 
     * @bodyParam  playlistId integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "exercises": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/streches?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/streches?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/playlist/saved/streches",
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
     *  "message": "Exercise Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function playlistSavedStreches(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'playlistId' => ['required', 'numeric'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' =>  false, 'message' => $validator->messages()->first()], 404);
            }
            
            $playlist = UserPlaylist::find(request('playlistId'));

            if(empty($playlist)) { 
                return response()->json(['success' =>  false, 'message' => 'Playlist not found.'], 404);
            }
            
            $savedStreches = $playlist->savedStreches()->paginate(10);

            foreach($savedStreches as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['level'] = $level;
            }

            if($savedStreches->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Streches not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'streches' => $savedStreches], 200);
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
     * @group  Strech
     * 
     * @authenticated
     *
     * API for getting Favourite streches
     * 
     * @response  {
     *  "streches": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/streches?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/streches?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/favourite/streches",
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

    public function userFavouriteStreches(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $favouriteStreches = $user->favouriteStreches()->groupBy('strech_id')->paginate(10);

            foreach($favouriteStreches as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['level'] = $level;
            }

            if($favouriteStreches->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Streches not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'streches' => $favouriteStreches], 200);
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
     * @group  Strech
     * 
     * @authenticated
     *
     * API for getting recent streches
     * 
     * @response  {
     *  "streches": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "Full Body Blaster",
     *      "based_on": "reps",
     *      "duration": "10:30",
     *      "reps": 5,
     *      "focus_area": "Full Body",
     *      "specific_muscles": "Core, Shoulders",
     *      "good_for": "vdzvz",
     *      "type": "warmup,exercise",
     *      "level": "Advanced",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/exercises/images/1623067648.jpg"
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/streches?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/streches?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com/api/user/recent/streches",
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

    public function userRecentStreches(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $recentStreches = $user->recentStreches()->groupBy('strech_id')->paginate(10);

            foreach($recentStreches as $k => $ex) {
                $focus_area = explode(',', $ex['focus_area']);
                $specific_muscles = explode(',', $ex['specific_muscles']);
                $good_for = explode(',', $ex['good_for']);
                $type = explode(',', $ex['type']);
                $tags = explode(',', $ex['tags']);
                $level = explode(',', $ex['level']);
                $ex['focus_area'] = $focus_area;
                $ex['specific_muscles'] = $specific_muscles;
                $ex['good_for'] = $good_for;
                $ex['type'] = $type;
                $ex['level'] = $level;
            }

            if($recentStreches->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Streches not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'streches' => $recentStreches], 200);
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