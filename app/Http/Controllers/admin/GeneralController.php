<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Settings;
use DataTables;
use App\Faq;
use App\Contact;
use JWTAuth;
use File;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class GeneralController extends Controller
{
    public function index() {
        $setting = Settings::all()->first();
        $pageTitle = "Faq's";
        $faqs = Faq::all();
        return view('admin.faq', compact('setting', 'pageTitle', 'faqs'));
    }

    public function store_faq(Request $request) {
        $validator = Validator::make($request->all(), [
            'question' => ['required', 'string'],
            'answer' => ['required', 'string']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        if(request('save') == "Post Faq") {
            $faqData = array('question' => request('question'), 'answer' => request('answer'));
            $faq = Faq::create($faqData);

            if($faq) {
                return response()->json(['success'=>'Faq Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');

            $faqData = array('question' => request('question'), 'answer' => request('answer'));
            $res1 = Faq::where('id', $id)->update($faqData);

            if($res1) {
                return response()->json(['success' => 'Faq Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_faq(Request $request) {
        $fid = request('fid');
        $faq = Faq::where('id', $fid)->get()->first();
        return \Response::json($faq);
    }

    public function delete_faq(Request $request) {
        $id = request('id');
        $res = Faq::where('id', $id)->delete();
        if($res) {
            return redirect()->back()->with('success', 'Faq Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    public function contacts() {
        $setting = Settings::all()->first();
        $pageTitle = "Contacts";
        return view('admin.contacts', compact('setting', 'pageTitle'));
    }

    public function allContacts(Request $request) {
        if ($request->ajax()) {
            $data = Contact::select('id', 'name', 'email', 'type', 'subject', 'description');
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('type', function(Contact $contact) {
                    return ($contact->type == 0) ? "One On One" : "Nutrition Consultation";
                })
                ->addColumn('action', function(Contact $contact){

                    $btn = '<div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#" onclick="delete_contact('.$contact->id.')">Delete Contact</a>
                                </div>
                            </div>';
       
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        
        return view('admin.blogs');
    }

    public function delete_contact(Request $request) {
        $id = request('id');
        $res = Contact::where('id', $id)->delete();
        if($res) {
            return redirect()->back()->with('success', 'Contact Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    /**
     * @group  Faq
     * 
     * API for getting All faq's 
     * 
     * @authenticated
     * 
     * @response  {
     *  "faqs": {
     *    "current_page": 1,
     *    "data": [{
     *      "id": 1,
     *      "question": "What is Lorem Ipsum?",
     *      "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 
     *      "created_at": "2021-05-13 06:56:08",
     *      "updated_at": "2021-06-07 12:07:28" 
     *    }],
     *    "first_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/faqs?page=1",
     *    "from": 1,
     *    "last_page": 1,
     *    "last_page_url": "https://phpstack-250897-1931063.cloudwaysapps.com//api/faqs?page=1",
     *    "next_page_url": null,
     *    "path": "https://phpstack-250897-1931063.cloudwaysapps.com//api/faqs",
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
     *  "message": "Faqs Not Found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getFaqs(Request $request) {
        try {
            $faqs = Faq::paginate();

            if($faqs->isEmpty()) {
                return response()->json(['success' =>  false, "message" => "FAQ's not found."], 404);
            } else {
                return response()->json(['success' =>  true, 'faqs' => $faqs], 200);
            }
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Contacts
     * 
     * APIs for saving contacts 
     *
     * @authenticated
     * 
     * @bodyParam  name string required The name of the contact.
     * @bodyParam  email string required The email of the contact.
     * @bodyParam  subject string required The subject of the contact.
     * @bodyParam  description longtext required The description of the contact.
     * 
     * @response  {
     *  "success": true,
     *  "message": "Contact posted successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to post contact."
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

    public function postContacts(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'name' => ['required', 'string', 'max:60'],
                'email' => ['required', 'email', 'max:60'],
                'type' => ['required', 'numeric'],
                'subject' => ['required', 'string'],
                'description' => ['required', 'string']
            ]);

            if ($validator->fails()) {
                return response()->json(['error'=> $validator->messages()->first()]);
            }

            $contactData = array('name' => request('name'), 'email' => request('email'), 'type' => request('type'), 'subject' => request('subject'), 'description' => request('description'));

            $res = Contact::create($contactData);

            if($res) {
                return response()->json(['success' =>  true, 'message' => 'Contact posted successfully.'], 200);
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

    /**
     * @group  Settings
     *
     * APIs for getting app settings
     * 
     * @response  {
     *  "setting": {
     *    "id": 1,
     *    "title": "Poznic App",
     *    "email": "vickya819@gmail.com",
     *    "logo": "1626201264.jpg",
     *    "favicon": "1625904857.png",
     *    "contact": 9713879633,
     *    "website": "http://www.poznic.com",
     *    "description": "Poznic App",
     *    "tags": "Poznic App, Fitness, Exercise, workout",
     *    "address": "Sneh Nagar, Bhopal",
     *    "privacy_policy": "<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Where does it come from?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>",
     *    "terms_condition": "<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">Where can I get some?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>",
     *    "created_at": "2021-05-13 04:42:43",
     *    "updated_at": "2021-08-17 15:55:33"
     *  },
     *  "success": true
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Settings not found."
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     *  
     */

    public function getSettings(Request $request) {
        try {
            $setting = Settings::all()->first();

            if($setting) {
                return response()->json(['success' =>  true, 'setting' =>  $setting], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Settings not found.'], 404);
            }
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
}