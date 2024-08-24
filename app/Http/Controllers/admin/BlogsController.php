<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use DataTables;
use App\Blogs;
use JWTAuth;
use File;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class BlogsController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = 'Blogs';
        return view('admin.blogs', compact('setting', 'pageTitle'));
    }

    public function blogs(Request $request) {
        if ($request->ajax()) {
            $data = Blogs::select('id', 'title', 'type', 'url', 'image', 'description', 'tags', 'visible');
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('image', function(Blogs $blog) {
                    if($blog->image) {
                        if(file_exists('uploads/blogs/'.$blog->image)) {
                            return '<img class="img" src="'.asset('uploads/blogs/'.$blog->image).'" height="50px" width="50px" />';
                        } else {
                            return '<img class="img" src="'.asset('uploads/default-placeholder.png').'" height="50px" width="50px" />';
                        }
                    } else {
                        return '<img class="img" src="'.asset('uploads/default-placeholder.png').'" height="50px" width="50px" />';
                    }
                })
                ->editColumn('description', function(Blogs $blog) {
                    return strip_tags($blog->description);
                })
                ->editColumn('visible', function(Blogs $blog) {
                    return ($blog->visible == 1) ? "<button class='btn btn-sm btn-success'>Enabled</button>" : "<button class='btn btn-sm btn-danger'>Disabled</button>";
                })
                ->addColumn('action', function(Blogs $blog){

                    $btn = '<div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#" onclick="edit_blog('.$blog->id.')">Edit Blog</a>
                                    <a class="dropdown-item" href="#" onclick="delete_blog('.$blog->id.')">Delete Blog</a>
                                </div>
                            </div>';
       
                    return $btn;
                })
                ->rawColumns(['image','visible','action'])
                ->make(true);
        }
        
        return view('admin.blogs');
    }

    public function store_blog(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:60'],
            'image' => ['required', 'image', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
            'type' => ['required', 'string', 'max:60'],
            'description' => ['required', 'string'],
            'url' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Blog") {
            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/blogs/', $imagefilename);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $blogData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'type' => request('type'), 'url' => request('url'), 'image' => $imagefilename, 'description' => request('description'), 'tags' => request('tags'), 'visible' => request('visible'));

            $blog = Blogs::create($blogData);

            if($blog) {
                return response()->json(['success'=>'Blog Posted Successfully.']);
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
                $image->move('uploads/blogs/', $new_image);
            }

            $blogData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'type' => request('type'), 'url' => request('url'), 'image' => $new_image, 'description' => request('description'), 'tags' => request('tags'), 'visible' => request('visible'));

            $res1 = Blogs::where('id', $id)->update($blogData);

            if($res1) {
                return response()->json(['success' => 'Blog Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_blog(Request $request) {
        $bId = request('bId');
        $blog = Blogs::where('id', $bId)->get()->first();
        return \Response::json($blog);
    }

    public function delete_blog(Request $request) {
        $id = request('id');
        $blog = Blogs::find($id);
        $res = Blogs::where('id', $id)->delete();
        if($res) {
            $destinationPath = public_path("uploads/blogs/".$blog['image']);
            File::delete($destinationPath);
            return redirect()->back()->with('success', 'Blog Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    /**
     * @group  Blogs
     * 
     * API for getting All blogs 
     * 
     * @authenticated
     * 
     * @response  {
     *  "blogs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "title": "What is Lorem Ipsum?",
     *      "slug": "what-is-lorem-ipsum",
     *      "type": "Nutrition",
     *      "url": "http://www.londatiga.net/it/programming/programming-programming-it/how-to-set-time-zone-on-php-and-mysql/",
     *      "image": "https://phpstack-250897-1931063.cloudwaysapps.com/uploads/blogs/1625928176.png", 
     *      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 
     *      "tags": "exercise,health,nutrition", 
     *      "visible": 1,
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28" 
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/blogs?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/blogs?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/blogs",
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
     *  "message": "Blogs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getBlogs(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $blogs = Blogs::paginate();

            if($blogs->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Blogs not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'blogs' => $blogs], 200);
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
     * @group  Blogs
     * 
     * APIs for saving blogs 
     *
     * @authenticated
     * 
     * @bodyParam  title string required The title of the blog.
     * @bodyParam  type string required The type of the blog.
     * @bodyParam  image blob The image of the blog.
     * @bodyParam  description longtext required The description of the blog.
     * @bodyParam  tags string The tags of the blog.
     * @bodyParam  visible integer required The visibility of the blog. Example: 1
     * 
     * @response  {
     *  "success": true,
     *  "message": "Blog posted successfully."
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

    public function postBlogs(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'title' => ['required', 'string', 'max:60'],
                'type' => ['required', 'string', 'max:60'],
                'description' => ['required', 'string'],
                'visible' => ['required']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/blogs/', $imagefilename);
            } else {
                $imagefileurl = url('uploads/default-placeholder.png');
            }

            $blogData = array('title' => request('title'), 'slug' => Str::slug(request('title')), 'type' => request('type'), 'image' => $imagefilename, 'description' => request('description'), 'tags' => request('tags'), 'visible' => request('visible'));

            $res = Blogs::create($blogData);

            if($res) {
                return response()->json(['success' =>  true, 'message' => 'Blog posted successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' => 'Unable to post blog.'], 404);
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