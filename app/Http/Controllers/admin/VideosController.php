<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use DataTables;
use App\Video;
use JWTAuth;
use File;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class VideosController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Videos';
        return view('admin.videos', compact('setting', 'pageTitle'));
    }

    public function videos(Request $request) {
        if ($request->ajax()) {
            $data = Video::select('id', 'title', 'thumbnail', 'order', 'tags');
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('thumbnail', function(Video $video) {
                    if(empty($video->thumbnail)) {
                        return NULL;
                    } else {
                        return '<img src="'.$video->thumbnail.'" width="100" height="100">';
                    }
                })
                ->addColumn('action', function(Video $video){

                    $btn = '<div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#" onclick="edit_video('.$video->id.')">Edit Video</a>
                                    <a class="dropdown-item" href="#" onclick="delete_video('.$video->id.')">Delete Video</a>
                                </div>
                            </div>';
       
                    return $btn;
                })
                ->rawColumns(['thumbnail', 'action'])
                ->make(true);
        }
        
        return view('admin.blogs');
    }

    public function store_video(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'url' => ['required'],
            'type' => ['required'],
            'order' => ['required', 'numeric']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('type') == "youtube") {
            $url = "https://www.youtube.com/oembed?format=json&url=".request('url');
        } else {
            if(preg_match("/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/", request('url'), $output_array)) {
                $videoId = $output_array[5];
            }

            $url = "https://vimeo.com/api/oembed.json?url=".urlencode("https://vimeo.com/".$videoId);
        }

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

        if(request('save') == "Post Video") {
            $videoData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'url' => request('url'), 'thumbnail' => ($videoMeta) ?$videoMeta['thumbnail_url'] : NULL, "type" => request('type'), 'order' => request('order'), 'description' => request('description'), 'tags' => request('tags'));

            $video = Video::create($videoData);

            if($video) {
                return response()->json(['success'=>'Video Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $videoData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'url' => request('url'), 'thumbnail' => ($videoMeta) ?$videoMeta['thumbnail_url'] : NULL, "type" => request('type'), 'order' => request('order'), 'description' => request('description'), 'tags' => request('tags'));

            $res1 = Video::where('id', $id)->update($videoData);

            if($res1) {
                return response()->json(['success' => 'Video Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_video(Request $request) {
        $vId = request('vId');
        $video = Video::where('id', $vId)->get()->first();
        return \Response::json($video);
    }

    public function delete_video(Request $request) {
        $id = request('id');
        $res = Video::where('id', $id)->delete();
        if($res) {
            return redirect()->back()->with('success', 'Video Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    /**
     * @group  Videos
     * 
     * API for getting All videos
     * 
     * @authenticated
     * 
     * @response  {
     *  "videos": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "What is Lorem Ipsum?",
     *      "slug": "what-is-lorem-ipsum",
     *      "url": "https://www.youtube.com/embed/yJehD2NEetw",
     *      "thumbnail": "https://i.ytimg.com/vi/AGnRVWiDHco/hqdefault.jpg",
     *      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 
     *      "tags": "exercise,health,nutrition", 
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28" 
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/videos?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com/api/videos?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/videos",
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
     *  "message": "Videos Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getVideos(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $videos = Video::orderBy('order', 'asc')->paginate();

            if($videos->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Videos not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'videos' => $videos], 200);
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
     * @group  Videos
     * 
     * APIs for saving videos
     *
     * @authenticated
     * 
     * @bodyParam  title string required The title of the blog.
     * @bodyParam  video blob required The video file.
     * @bodyParam  description longtext required The description of the blog.
     * @bodyParam  tags string The tags of the blog.
     * 
     * @response  {
     *  "success": true,
     *  "message": "Video posted successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to post blog."
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
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     *  
     */

    public function postVideos() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'title' => ['required', 'string', 'max:60'],
                'video' => ['required', 'mimes:mp4,mov,ogg,qt', 'max:20000'],
                'description' => ['string'],
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            if($request->hasfile('video')){
                $videofile = $request->file('video');
                $videoext = $videofile->getClientOriginalExtension();
                $videofilename = time().'.'.$videoext;
                $videofile->move('uploads/videos/', $videofilename);
            } else {
                $videofilename = 'default-placeholder.png';
            }

            $videoData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'video' => $videofilename, 'description' => request('description'), 'tags' => request('tags'));

            $video = Video::create($videoData);

            if($video) {
                return response()->json(['success'=>'Video Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
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
}