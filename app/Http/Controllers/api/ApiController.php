<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use App\Splits;
use App\Programs;
use App\Workouts;
use App\Exercises;
use App\UserQuestionAnswer;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\UserSaved;
use App\UserFavourite;
use App\UserRecent;
use App\Plans;
use App\Category;
use App\UserPlaylist;
use App\PlaylistSaved;
use App\ExerciseWorkout;
use Carbon\Carbon;
use Illuminate\Support\Str;
use DB;
use Illuminate\Mail\Message;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;

class ApiController extends Controller
{
    public $loginAfterSignUp = true;

    /**
     * @group  Authorization
     *
     * APIs for user login
     * 
     * @bodyParam  email string required The email of the user. Example: example@domain.com
     * @bodyParam  type string required The login type of the user. Example: social/normal
     * @bodyParam  password string The password of the user.
     * 
     * @response  {
     *  "success": true,
     *  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MjMwNjk4MjYsImV4cCI6MTYyMzA3MzQyNiwibmJmIjoxNjIzMDY5ODI2LCJqdGkiOiJYVTI3QmI4NzNKRG5jRDF2Iiwic3ViIjo3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.42v5UZxaw-qDFj1zrRMqF01QbNPJzt0eD_gZpg9tsFo"
     * }
     * 
     * @response  401 {
     *  "success": false,
     *  "message": "Invalid Email or Password."
     * }   
     *  
     * @response  400 {
     *  "success": false,
     *  "message": "Bad Request."
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * }     
     * 
     */

    public function login(Request $request) {
        try {
            $token = null;

            if($request->type == "social") {
                if(empty($request->email)) {
                    return response()->json(['success' => false, 'message' => 'Bad Request.'], 500);
                }
                $user = User::where('email', $request->email)->first();

                if(empty($user)) {
                    $userData = array('email' => $request->email, 'user_type' => 'customer', 'type' => $request->type, 'email_verified_at' => date('Y-m-d H:i:s'));
                    $user = User::create($userData);
                }

                if (!$token = JWTAuth::fromUser($user)) {
                    return response()->json(['success' => false, 'message' => 'Invalid Email or type.'], 401);
                }
            } else if($request->type == "normal") {
                $input = $request->only('email', 'password');

                if (!$token = JWTAuth::attempt($input)) {
                    return response()->json(['success' => false, 'message' => 'Invalid Email or Password.'], 401);
                }
            } else {
                return response()->json(['success' => false, 'message' => 'Bad Request.'], 400);
            }

            $user = User::with(['usersPlan' => function($query) {
                $query->where('status', 'Active');
            }])->where('email', $request->email)->get();
            
            $onboarding_status = $user->pluck('onboarding_status')->first();
            $plan = $user->first()->usersPlan;
            return response()->json(['success' => true, 'onboarding_status' => $onboarding_status, 'subscription_status' => (!empty($plan->id)) ? 1 : 0, 'token' => $token]);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Authorization
     *
     * APIs for user registration
     * 
     * @bodyParam  name string required The name of the user. Example: jhon doe
     * @bodyParam  email string required The email of the user. Example: example@domain.com
     * @bodyParam  image blob the image of the user.
     * @bodyParam  type string required The login type of the user. Example: social/normal
     * @bodyParam  password string The password of the user.
     * 
     * @response  {
     *  "success": true,
     *  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MjMwNjk4MjYsImV4cCI6MTYyMzA3MzQyNiwibmJmIjoxNjIzMDY5ODI2LCJqdGkiOiJYVTI3QmI4NzNKRG5jRDF2Iiwic3ViIjo3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.42v5UZxaw-qDFj1zrRMqF01QbNPJzt0eD_gZpg9tsFo"
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to register user."
     * } 
     * 
     * @response  400 {
     *  "success": false,
     *  "message": "Bad Request."
     * } 
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * }     
     *   
     */

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:60'],
            'email' => ['required', 'email'],
            'type' => ['required', 'string'],
            'password' => ['string']
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
        }

        try {
            // $plan = Plans::where('plan_type', 'trial')->orderBy('id', 'desc')->take(1)->get()->first();

            // if(empty($plan)) {
            //     return response()->json(['success' => false, 'message' => 'No plan is configured for registration.'], 404);
            // }
            
            // if($plan->plan_type != "trial") {
            //     return response()->json(['success' => false, 'message' => 'No trial plan exist for registration.'], 404);
            // }

            // if($plan->duration_type == "days") {
            //     $planData = array('plan_start' => date('Y-m-d'), 'plan_end' => date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$plan->duration.' days')));
            // } else {
            //     $planData = array('plan_start' => date('Y-m-d'), 'plan_end' => date('Y-m-d', strtotime(date('Y-m-d'). ' + '.$plan->duration.' months')));
            // }
            
            if($request->type == "social") {
                $user = User::where('email', $request->email)->where('user_type', 'customer')->get();

                if(!$user->isEmpty()){
                    if ($this->loginAfterSignUp) {
                        return $this->login($request);
                    }
                } else {
                    $userData = array('name' => $request->name, 'email' => $request->email, 'user_type' => 'customer', 'type' => $request->type, 'email_verified_at' => date('Y-m-d H:i:s'));
                    $user = User::create($userData);

                    if($user) {
                        //$res = $user->plans()->attach($plan->id, $planData);
                        
                        if ($this->loginAfterSignUp) {
                            return $this->login($request);
                        }
                    }
                }
            } else if($request->type == "normal") {
                $user = User::where('email', $request->email)->where('user_type', 'customer')->get();

                if(!$user->isEmpty()){
                    if ($this->loginAfterSignUp) {
                        return response()->json(['success' => false, 'token' => JWTAuth::fromUser($user), 'message' => "User Already Registered. Please Login."]);
                        //return $this->login($request);
                    }
                } else {
                    if($request->hasfile('image')){
                        $imagefile = $request->file('image');
                        $imageext = $imagefile->getClientOriginalExtension();
                        $imagefilename = time().'.'.$imageext;
                        $imagefile->move('uploads/users/', $imagefilename);
                    } else {
                        $imagefilename = 'default-placeholder.png';
                    }

                    $userData = array('name' => $request->name, 'email' => $request->email, 'image' => $imagefilename, 'type' => $request->type, 'user_type' => 'customer', 'password' => Hash::make($request->password), 'email_verified_at' => date('Y-m-d H:i:s'));
                    $user = User::create($userData);

                    if($user) {
                        //$res = $user->plans()->attach($plan->id, $planData);
                        $user->sendEmailVerificationNotification();
                        return response()->json(['success' => true, 'token' => JWTAuth::fromUser($user), 'message' => "User Registered Successfully."]);
                        // if ($this->loginAfterSignUp) {
                        //     return $this->login($request);
                        // }
                    } else { 
                        return response()->json(['success' =>  false, 'message' =>  "Unable to register user."], 404);
                    }
                }
            } else {
                return response()->json(['success' => false, 'message' => 'Bad Request.'], 400);
            }
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Authorization
     * 
     * APIs for logging out the user
     * 
     * @response  {
     *  "success": true,
     *  "message": "User has been logged out."
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
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
     */

    public function logout(Request $request) {
        try {
            JWTAuth::invalidate($request->token);
            return response()->json(['success' => true, 'message' => 'User has been logged out.'], 200);
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Authorization
     *
     * APIs for refreshing user token
     * 
     * @response  {
     *  "success": true,
     *  "refreshToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcGhwc3RhY2stMjUwODk3LTE5MzEwNjMuY2xvdWR3YXlzYXBwcy5jb21cL2FwaVwvdXNlclwvcmVmcmVzaFwvdG9rZW4iLCJpYXQiOjE2MjM4MzYxOTQsImV4cCI6MTYyMzg0MTgwNSwibmJmIjoxNjIzODM4MjA1LCJqdGkiOiJQUURDbGMxU01mbFhzdTFkIiwic3ViIjo2LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.Yf0zK9nAJFsTTQQtaztcYOJDqWp1h3HoTo6eqvXietg"
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
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
     */

    public function refreshToken(Request $request) {
        try {
            $refreshed = JWTAuth::refresh(JWTAuth::getToken());
            $user = JWTAuth::setToken($refreshed)->toUser();
            $request->headers->set('Authorization','Bearer '.$refreshed);
            return response()->json(['success' => true, 'refreshToken' => $refreshed], 200);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Authorization
     *
     * APIs for forgot password
     * 
     * @bodyParam  email string required The email of the user. Example: example@domain.com
     * 
     * @response  {
     *  "success": true,
     *  "message": "Password reset link sent to email."
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * }  
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "User not found."
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
     */

    public function forgotPassword(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'email' => ['required', 'email']
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $user = User::where('email', request('email'))->get();

            if (count($user) < 1) {
                return response()->json(['success' => false, 'message' => "User not found."], 404);
            }

            $credentials = ['email' => request('email')];
            $response = Password::sendResetLink($credentials, function (Message $message) {
                $message->subject($this->getEmailSubject());
            });

            return response()->json(['success' =>  true, 'message' =>  'Password reset link sent to email.'], 200);
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     * 
     * @authenticated
     *
     * APIs for getting authenticated user
     * 
     * @response  {
     *  "success": true,
     *  "user": {
     *    "id": 6,
     *    "name": "shubham agrawal",
     *    "user_type": "customer",
     *    "email": "vickya819@gmail.com",
     *    "mobile": "9713879633",
     *    "gender": "male",
     *    "age": "32",
     *    "level": "beginner",
     *    "height": "5.6",
     *    "weight": "67",
     *    "fitness_goal": "body building",
     *    "email_verified_at": null,
     *    "type": "Core, Shoulders",
     *    "created_at": "2021-05-13 06:56:08",
     *    "updated_at": "2021-06-07 12:07:28"
     *  }
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "User Not Found."
     * } 
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Token Absent."
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
     */

    public function getAuthenticatedUser() {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            return response()->json(['success' => true, 'data' => $user, 'subscription' => $user->usersPlan], 200);
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for updating user gender
     * 
     * @bodyParam  gender string required The gender of the user. Example: male
     * @bodyParam  age string required The age of the user. Example: 32
     * @bodyParam  level string required The fitness level of the user. Example: "Beginner" 
     * @bodyParam  height string required The height of the user. Example: 5.6
     * @bodyParam  weight string required The weight of the user. Example: 67
     * @bodyParam  goal string required The goal of the user. Example: body building
     * 
     * @response  {
     *  "success": true,
     *  "message": "Question Set 1 updated successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "User Not Found."
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

    public function updateQuestionSet1(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'gender' => ['required', 'string', 'max:60'],
                'age' => ['required', 'string'],
                'level' => ['required', 'string'],
                'height' => ['required', 'string', 'max:60'],
                'weight' => ['required', 'string', 'max:60'],
                'goal' => ['required', 'string'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $data = array('age' => $request->age, 'gender' => $request->gender, 'level' => $request->level, 'height' => $request->height, 'weight' => $request->weight, 'fitness_goal' => $request->goal);
            $res = User::where('id', $user->id)->update($data);
            return response()->json(['success' =>  true, 'message' =>  'Question Set 1 updated successfully.'], 200);

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for updating user gender
     * 
     * @bodyParam  questions array required The questions attempt by the user. Example: [1, 2]
     * @bodyParam  answers array required The answers given by the user. Example: ["A person's ability to exercise continuously for extended periods without needing to think", "Extreme tiredness, typically resulting from mental or physical exertion or illness"]
     * 
     * @response  {
     *  "success": true,
     *  "message": "Question Set 2 updated successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "User Not Found."
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

    public function updateQuestionSet2(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            // $validator = Validator::make($request->all(), [
            //     'questions' => ['required', 'array', 'min:1'],
            //     'answers' => ['required', 'array', 'min:1']
            // ]);

            // if ($validator->fails()) {
            //     return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            // }

            if(isset($request->questions) && !empty($request->questions)) {
                $questions = request('questions');
                $answers = request('answers');

                $quests = array();

                foreach($questions as $k => $question) {
                    UserQuestionAnswer::where('user_id', $user->id)->where('question_id', $question)->delete();
                    $quest['user_id'] = $user->id;
                    $quest['question_id'] = $question;
                    $quest['answer'] = $answers[$k];

                    array_push($quests, $quest);
                }

                $res = UserQuestionAnswer::insert($quests);
            } 

            User::where('id', $user->id)->update(['onboarding_status' => 1]);
            return response()->json(['success' =>  true, 'message' =>  'Question Set 2 updated successfully.'], 200);

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }


    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for updating user profile
     * 
     * @bodyParam  name string The name of the user. Example: shubham agrawal
     * @bodyParam  mobile string The mobile of the user. Example: 9713879633
     * @bodyParam  gender string The gender of the user. Example: male
     * @bodyParam  age string The age of the user. Example: 32
     * @bodyParam  level string The level of the user. Example: beginner
     * @bodyParam  height string The height of the user. Example: 5.6
     * @bodyParam  weight string The weight of the user. Example: 55
     * @bodyParam  goal string The goal of the user. Example: bodybulding
     * 
     * @response  {
     *  "success": true,
     *  "message": "User Profile updated successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to update User profile."
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

    public function updateUserProfile(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'name' => ['nullable', 'string', 'max:60'],
                'mobile' => ['nullable', 'numeric'],
                'gender' => ['nullable', 'string', 'max:60'],
                'age' => ['nullable', 'string', 'max:60'],
                'level' => ['nullable', 'string', 'max:60'],
                'height' => ['nullable', 'string', 'max:60'],
                'weight' => ['nullable', 'string', 'max:60'],
                'goal' => ['nullable', 'string'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $data = array();

            if(isset($request->name) && !empty($request->name)) {
                $data['name'] = $request->name;
            }

            if(isset($request->mobile) && !empty($request->mobile)) {
                $data['mobile'] = $request->mobile;
            }

            if(isset($request->gender) && !empty($request->gender)) {
                $data['gender'] = $request->gender;
            }

            if(isset($request->age) && !empty($request->age)) {
                $data['age'] = $request->age;
            }

            if(isset($request->level) && !empty($request->level)) {
                $data['level'] = $request->level;
            }

            if(isset($request->height) && !empty($request->height)) {
                $data['height'] = $request->height;
            }

            if(isset($request->weight) && !empty($request->weight)) {
                $data['weight'] = $request->weight;
            }

            if(isset($request->goal) && !empty($request->goal)) {
                $data['fitness_goal'] = $request->goal; 
            }

            $res = User::where('id', $user->id)->update($data);

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'User Profile updated successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to update User profile.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for deleting user profile
     * 
     * @response  {
     *  "success": true,
     *  "message": "User Profile deleted successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to delete User profile."
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

    public function deleteUserProfile(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $programSubscribed = $user->subscriptions()->exists();

            if($programSubscribed) {
                foreach ($user->subscriptions as $subscription) {
                    $userProgramProgress = $subscription->userProgress()->exists();

                    if($userProgramProgress) {
                        $subscription->userProgress()->delete();
                    }
                }

                $user->subscriptions()->delete();
            }

            $splitSubscribed = $user->splitSubscriptions()->exists();

            if($splitSubscribed) {
                foreach ($user->splitSubscriptions as $splitSubscription) {
                    $userSplitProgress = $splitSubscription->userSplitProgress()->exists();

                    if($userSplitProgress) {
                        $splitSubscription->userSplitProgress()->delete();
                    }
                }

                $user->splitSubscriptions()->delete();
            }

            $userPlan = $user->usersPlan()->exists();

            if($userPlan) {
                $user->usersPlan()->delete();
            }

            UserFavourite::where('user_id', $user->id)->delete();
            UserRecent::where('user_id', $user->id)->delete();

            $userPlaylists = $user->userPlaylist()->exists();

            if($userPlaylists) {
                foreach ($user->userPlaylist as $userPlaylist) {
                    PlaylistSaved::where('playlist_id', $userPlaylist->id)->delete();
                }

                $user->userPlaylist()->delete();
            }

            $user->delete();

            return response()->json(['success' =>  true, 'message' =>  'User Profile deleted successfully.'], 200);
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for updating user pic
     * 
     * @bodyParam  image blob required The image of the user.
     * 
     * @response  {
     *  "success": true,
     *  "message": "User pic updated successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to update User pic."
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

    public function updatePic(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'image' => ['required', 'image', 'mimes:jpg,png,jpeg,gif,svg']
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            if($request->hasfile('image')){
                $imagefile = $request->file('image');
                $imageext = $imagefile->getClientOriginalExtension();
                $imagefilename = time().'.'.$imageext;
                $imagefile->move('uploads/users/', $imagefilename);
                $pathToImage = public_path('uploads/users/'.$imagefilename);
                $mime = mime_content_type($pathToImage);
                $output = new \CURLFile($pathToImage, $mime, $imagefilename);
                $data = ["files" => $output];
                
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, 'http://api.resmush.it/?qlty=80');
                curl_setopt($ch, CURLOPT_POST,1);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                $result = curl_exec($ch);
                if (curl_errno($ch)) {
                    $result = curl_error($ch);
                }
                curl_close ($ch);
                
                $arr_result = json_decode($result);
                
                // store the optimized version of the image
                $ch = curl_init($arr_result->dest);
                $fp = fopen($pathToImage, 'wb');
                curl_setopt($ch, CURLOPT_FILE, $fp);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_exec($ch);
                curl_close($ch);
                fclose($fp);
            } else {
                $imagefilename = 'default-placeholder.png';
            }

            $userData = array('image' => $imagefilename);
            $res = User::where('id', $user->id)->update($userData);

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'User pic updated successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to update User pic.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * APIs for creating playlist
     * 
     * @bodyParam  title string required The title of the playlist.
     * 
     * @response  {
     *  "success": true,
     *  "message": "Playlist created successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to create playlist."
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

    public function createPlaylist(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            // $validator = Validator::make($request->all(), [
            //     'title' => ['required', 'unique:user_playlists,title'],
            // ]);

            $validator = Validator::make($request->all(), [
                'title' => ['required'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' =>  true, 'message' =>  $validator->messages()->first()], 400);
            }

            $res = $user->userPlaylist()->create(['title' => $request->title, 'slug' => Str::slug($request->title)]);

            $playlist = UserPlaylist::find($res->id);

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'Playlist created successfully.', 'playlist' => $playlist], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to create playlist.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * APIs for updating user playlist
     * 
     * @bodyParam  id int required The id of the user playlist. Example: 1
     * @bodyParam  title string required The title of the user playlist. Example: My playlist
     * 
     * @response  {
     *  "success": true,
     *  "message": "User playlist updated successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to update User playlist."
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

    public function updateUserPlaylist(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'id' => ['required', 'numeric'],
                'title' => ['required', 'string', 'max:60'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $data = array();

            if(isset($request->title) && !empty($request->title)) {
                $data['title'] = $request->title;
                $data['slug'] = Str::slug($request->title);
            }

            $res = UserPlaylist::where('id', $request->id)->update($data);

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'User playlist updated successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to update User playlist.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * APIs for deleting user playlist
     * 
     * @bodyParam  id int required The id of the user playlist. Example: 1
     * 
     * @response  {
     *  "success": true,
     *  "message": "User playlist deleted successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to delete User playlist."
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

    public function deleteUserPlaylist(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $validator = Validator::make($request->all(), [
                'id' => ['required', 'numeric'],
            ]);

            if ($validator->fails()) {
                return response()->json(['success' => false, 'message' => $validator->messages()->first()], 400);
            }

            $res = UserPlaylist::where('id', $request->id)->delete();

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'User playlist deleted successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to delete User playlist.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * API for getting all or single user playlist
     * 
     * @authenticated
     * 
     * @urlParam  playlist int The ID of the playlist. 
     * 
     * @response  {
     *  "data": [{
     *      "id": 1,
     *      "user_id": 41,
     *      "title": "My Playlist",
     *      "slug": "my-playlist"
     *      "created_at": "2021-09-05 11:44:59",
     *      "updated_at": "2021-09-05 11:44:59",
     *  }],
     *  "success": true
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
     *  "message": "No playlist found."
     * }   
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function getAllPlaylist(Request $request, UserPlaylist $playlist = NULL) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }
            
            if(!empty($playlist)) {
                return response()->json(['success' =>  true, 'data' => $playlist], 200);
            } else {
                $playlist = $user->userPlaylist;

                if($playlist->isEmpty()) {
                    return response()->json(['success' =>  false, 'message' => 'No playlist found.'], 404);
                } else {
                    return response()->json(['success' =>  true, 'data' => $playlist], 200);
                }
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * APIs for saving resources
     * 
     * @bodyParam  exercise_id integer The exercise id of the exercise. Example: 1
     * @bodyParam  workout_id integer The workout id of the workout. Example: 2
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * @bodyParam  split_id integer The split id of the split. Example: 3
     * @bodyParam  strech_id integer The strech id of the strech. Example: 3
     * @bodyParam  playlist_id integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "success": true,
     *  "message": "resource saved successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to save resource."
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

    public function playlistSaveResource(Request $request) {
         try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise_id = request('exercise_id');
            $workout_id = request('workout_id');
            $program_id = request('program_id');
            $split_id = request('split_id');
            $strech_id = request('strech_id');
            $playlist_id = request('playlist_id');

            if(isset($exercise_id)) {
                $res = PlaylistSaved::select(DB::raw('group_concat(exercise_id) as exercises'))->where('playlist_id', $playlist_id)->get()->first();
                $exercises = explode(',', $res->exercises);
                if(!in_array($exercise_id, $exercises)) {
                    $data = array('playlist_id' => $playlist_id, 'exercise_id' => request('exercise_id'));
                    $res = PlaylistSaved::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'exercise saved successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to save exercise.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'exercise already saved.'], 200);
                }
            } else if(isset($workout_id)) {
                $res = PlaylistSaved::select(DB::raw('group_concat(workout_id) as workouts'))->where('playlist_id', $playlist_id)->get()->first();
                $workouts = explode(',', $res->workouts);
                if(!in_array($workout_id, $workouts)) {
                    $data = array('playlist_id' => $playlist_id, 'workout_id' => request('workout_id'));
                    $res = PlaylistSaved::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'workout saved successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to save workout.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'workout already saved.'], 200);
                }
            } else if(isset($program_id)) {
                $res = PlaylistSaved::select(DB::raw('group_concat(program_id) as programs'))->where('playlist_id', $playlist_id)->get()->first();
                $programs = explode(',', $res->programs);
                if(!in_array($program_id, $programs)) {
                    $data = array('playlist_id' => $playlist_id, 'program_id' => request('program_id'));
                    $res = PlaylistSaved::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'program saved successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to save program.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'program already saved.'], 200);
                }
            } else if(isset($split_id)) {
                $res = PlaylistSaved::select(DB::raw('group_concat(split_id) as splits'))->where('playlist_id', $playlist_id)->get()->first();
                $splits = explode(',', $res->splits);
                if(!in_array($split_id, $splits)) {
                    $data = array('playlist_id' => $playlist_id, 'split_id' => request('split_id'));
                    $res = PlaylistSaved::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'split saved successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to save split.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'split already saved.'], 200);
                }
            } else if(isset($strech_id)) {
                $res = PlaylistSaved::select(DB::raw('group_concat(strech_id) as streches'))->where('playlist_id', $playlist_id)->get()->first();
                $streches = explode(',', $res->streches);
                if(!in_array($strech_id, $streches)) {
                    $data = array('playlist_id' => $playlist_id, 'strech_id' => request('strech_id'));
                    $res = PlaylistSaved::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'strech saved successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to save strech.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'strech already saved.'], 200);
                }
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Bad Request.'], 400);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
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
     * APIs for removing saved resources
     * 
     * @bodyParam  exercise_id integer The exercise id of the exercise. Example: 1
     * @bodyParam  workout_id integer The workout id of the workout. Example: 2
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * @bodyParam  split_id integer The split id of the split. Example: 3
     * @bodyParam  strech_id integer The strech id of the strech. Example: 3
     * @bodyParam  playlist_id integer required The id of the playlist. Example: 1
     * 
     * @response  {
     *  "success": true,
     *  "message": "resource removed successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to remove saved resource."
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

    public function playlistUnsaveResource(Request $request) {
         try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise_id = request('exercise_id');
            $workout_id = request('workout_id');
            $program_id = request('program_id');
            $split_id = request('split_id');
            $strech_id = request('strech_id');
            $playlist_id = request('playlist_id');

            if(isset($exercise_id)) {
                $res = PlaylistSaved::where('exercise_id', $exercise_id)->where('playlist_id', $playlist_id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'exercise removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove saved exercise.'], 404);
                }
            } else if(isset($workout_id)) {
                $res = PlaylistSaved::where('workout_id', $workout_id)->where('playlist_id', $playlist_id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'workout removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove saved workout.'], 404);
                }
            } else if(isset($program_id)) {
                $res = PlaylistSaved::where('program_id', $program_id)->where('playlist_id', $playlist_id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'program removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove saved program.'], 404);
                }
            } else if(isset($split_id)) {
                $res = PlaylistSaved::where('split_id', $split_id)->where('playlist_id', $playlist_id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'split removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove saved split.'], 404);
                }
            } else if(isset($strech_id)) {
                $res = PlaylistSaved::where('strech_id', $strech_id)->where('playlist_id', $playlist_id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'strech removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove saved strech.'], 404);
                }
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Bad Request.'], 400);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for favouriting resources
     * 
     * @bodyParam  exercise_id integer The exercise id of the exercise. Example: 1
     * @bodyParam  workout_id integer The workout id of the workout. Example: 2
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * @bodyParam  split_id integer The split id of the split. Example: 3
     * @bodyParam  strech_id integer The split id of the split. Example: 3 
     * 
     * @response  {
     *  "success": true,
     *  "message": "resource favourited successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to favourite resource."
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

    public function userFavouriteResource(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise_id = request('exercise_id');
            $workout_id = request('workout_id');
            $program_id = request('program_id');
            $split_id = request('split_id');
            $strech_id = request('strech_id');

            if(isset($exercise_id)) {
                $res = UserFavourite::select(DB::raw('group_concat(exercise_id) as exercises'))->where('user_id', $user->id)->get()->first();
                $exercises = explode(',', $res->exercises);
                if(!in_array($exercise_id, $exercises)) {
                    $data = array('user_id' => $user->id, 'exercise_id' => request('exercise_id'));
                    $res = UserFavourite::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'exercise favourited successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to favourite exercise.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'exercise already favourited.'], 200);
                }
            } else if(isset($workout_id)) {
                $res = UserFavourite::select(DB::raw('group_concat(workout_id) as workouts'))->where('user_id', $user->id)->get()->first();
                $workouts = explode(',', $res->workouts);
                if(!in_array($workout_id, $workouts)) {
                    $data = array('user_id' => $user->id, 'workout_id' => request('workout_id'));
                    $res = UserFavourite::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'workout favourited successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to favourite workout.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'workout already favourited.'], 200);
                }
            } else if(isset($program_id)) {
                $res = UserFavourite::select(DB::raw('group_concat(program_id) as programs'))->where('user_id', $user->id)->get()->first();
                $programs = explode(',', $res->programs);
                if(!in_array($program_id, $programs)) {
                    $data = array('user_id' => $user->id, 'program_id' => request('program_id'));
                    $res = UserFavourite::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'program favourited successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to favourite program.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'program already favourited.'], 200);
                }
            } else if(isset($split_id)) {
                $res = UserFavourite::select(DB::raw('group_concat(split_id) as splits'))->where('user_id', $user->id)->get()->first();
                $splits = explode(',', $res->splits);
                if(!in_array($split_id, $splits)) {
                    $data = array('user_id' => $user->id, 'split_id' => request('split_id'));
                    $res = UserFavourite::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'split favourited successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to favourite split.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'split already favourited.'], 200);
                }
            } else if(isset($strech_id)) {
                $res = UserFavourite::select(DB::raw('group_concat(strech_id) as streches'))->where('user_id', $user->id)->get()->first();
                $streches = explode(',', $res->streches);
                if(!in_array($strech_id, $streches)) {
                    $data = array('user_id' => $user->id, 'strech_id' => request('strech_id'));
                    $res = UserFavourite::create($data);

                    if($res) {
                        return response()->json(['success' =>  true, 'message' =>  'strech favourited successfully.'], 200);
                    } else {
                        return response()->json(['success' =>  false, 'message' =>  'Unable to favourite strech.'], 404);
                    }
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'strech already favourited.'], 200);
                }
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Bad Request.'], 400);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for removing favourite resources
     * 
     * @bodyParam  exercise_id integer The exercise id of the exercise. Example: 1
     * @bodyParam  workout_id integer The workout id of the workout. Example: 2
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * @bodyParam  split_id integer The split id of the split. Example: 3
     * @bodyParam  strech_id integer The split id of the split. Example: 3 
     * 
     * @response  {
     *  "success": true,
     *  "message": "resource removed successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to remove favourite resource."
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

    public function userUnfavouriteResource(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise_id = request('exercise_id');
            $workout_id = request('workout_id');
            $program_id = request('program_id');
            $split_id = request('split_id');
            $strech_id = request('strech_id');

            if(isset($exercise_id)) {
                $res = UserFavourite::where('exercise_id', $exercise_id)->where('user_id', $user->id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'exercise removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove favourite exercise.'], 404);
                }
            } else if(isset($workout_id)) {
                $res = UserFavourite::where('workout_id', $workout_id)->where('user_id', $user->id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'workout removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove favourite workout.'], 404);
                }
            } else if(isset($program_id)) {
                $res = UserFavourite::where('program_id', $program_id)->where('user_id', $user->id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'program removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove favourite program.'], 404);
                }
            } else if(isset($split_id)) {
                $res = UserFavourite::where('split_id', $split_id)->where('user_id', $user->id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'split removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove favourite split.'], 404);
                }
            } else if(isset($strech_id)) {
                $res = UserFavourite::where('strech_id', $strech_id)->where('user_id', $user->id)->delete();

                if($res) {
                    return response()->json(['success' =>  true, 'message' =>  'strech removed successfully.'], 200);
                } else {
                    return response()->json(['success' =>  false, 'message' =>  'Unable to remove favourite strech.'], 404);
                }
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Bad Request.'], 400);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  User management
     *
     * @authenticated
     * 
     * APIs for recent resources
     * 
     * @bodyParam  exercise_id integer The exercise id of the exercise. Example: 1
     * @bodyParam  workout_id integer The workout id of the workout. Example: 2
     * @bodyParam  program_id integer The program id of the program. Example: 4
     * @bodyParam  split_id integer The split id of the split. Example: 3
     * @bodyParam  strech_id integer The split id of the split. Example: 3
     * 
     * @response  {
     *  "success": true,
     *  "message": "Recent resource saved successfully."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Unable to save recent resource."
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

    public function userRecentResource(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $exercise_id = request('exercise_id');
            $workout_id = request('workout_id');
            $program_id = request('program_id');
            $split_id = request('split_id');
            $strech_id = request('strech_id');

            if(isset($exercise_id)) {
                $res = UserRecent::select(DB::raw('group_concat(exercise_id) as exercises'))->where('user_id', $user->id)->get()->first();
                $exercises = explode(',', $res->exercises);
                if(!in_array($exercise_id, $exercises)) {
                    $data = array('user_id' => $user->id, 'exercise_id' => request('exercise_id'));
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'Recent resource already saved.'], 200);
                }
            } else if(isset($workout_id)) {
                $res = UserRecent::select(DB::raw('group_concat(workout_id) as workouts'))->where('user_id', $user->id)->get()->first();
                $workouts = explode(',', $res->workouts);
                if(!in_array($workout_id, $workouts)) {
                    $data = array('user_id' => $user->id, 'workout_id' => request('workout_id'));
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'Recent resource already saved.'], 200);
                }
            } else if(isset($program_id)) {
                $res = UserRecent::select(DB::raw('group_concat(program_id) as programs'))->where('user_id', $user->id)->get()->first();
                $programs = explode(',', $res->programs);
                if(!in_array($program_id, $programs)) {
                    $data = array('user_id' => $user->id, 'program_id' => request('program_id'));
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'Recent resource already saved.'], 200);
                }
            } else if(isset($split_id)) {
                $res = UserRecent::select(DB::raw('group_concat(split_id) as splits'))->where('user_id', $user->id)->get()->first();
                $splits = explode(',', $res->splits);
                if(!in_array($split_id, $splits)) {
                    $data = array('user_id' => $user->id, 'split_id' => request('split_id'));
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'Recent resource already saved.'], 200);
                }
            } else if(isset($strech_id)) {
                $res = UserRecent::select(DB::raw('group_concat(strech_id) as streches'))->where('user_id', $user->id)->get()->first();
                $splits = explode(',', $res->streches);
                if(!in_array($strech_id, $splits)) {
                    $data = array('user_id' => $user->id, 'strech_id' => request('strech_id'));
                } else {
                    return response()->json(['success' =>  true, 'message' =>  'Recent resource already saved.'], 200);
                }
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Bad Request.'], 400);
            }

            $res = UserRecent::create($data);

            if($res) {
                return response()->json(['success' =>  true, 'message' =>  'Recent resource saved successfully.'], 200);
            } else {
                return response()->json(['success' =>  false, 'message' =>  'Unable to save recent resource.'], 404);
            }
        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * @group  Featured
     *
     * @authenticated
     * 
     * APIs for featured resources
     * 
     * @response {
     *  "success": true,
     *  "exercises": {},
     *  "workouts": {},
     *  "programs": {},
     *  "splits": {}
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

    public function featuredResources(Request $request) {
        try {
            $featuredCategory = Category::select(DB::raw('group_concat(id) as ids'), DB::raw('group_concat(name) as names'), DB::raw('group_concat(featured_for) as fors'),)->where('featured', 1)->get()->first();

            if(empty($featuredCategory['ids'])) {
                return response()->json(['success' =>  false, 'message' => 'Category not found.'], 404);
            }
            
            $categoryIds = explode(',', $featuredCategory['ids']);
            $categoryNames = explode(',', $featuredCategory['names']);
            $categoryFors = explode(',', $featuredCategory['fors']);

            $data = array();

            foreach($categoryIds as $m => $catId) {
                $data[$m]['title'] = $categoryNames[$m];

                if($categoryFors[$m] == "1") {
                    $data[$m]['type'] = "exercise";

                    $exercises = Exercises::select('id', 'title', 'based_on', 'duration', 'reps', 'focus_area', 'specific_muscles', 'good_for', 'type', 'level', 'image')->with(array('equipments' => function($query) {
                        $query->select('name');
                    }))->where('category_id', $categoryIds[$m])->get();

                    foreach($exercises as $k => $ex) {
                        $focus_area = explode(',', $ex['focus_area']);
                        $specific_muscles = explode(',', $ex['specific_muscles']);
                        $good_for = explode(',', $ex['good_for']);
                        $type = explode(',', $ex['type']);
                        $level = explode(',', $ex['level']);
                        $ex['focus_area'] = $focus_area;
                        $ex['specific_muscles'] = $specific_muscles;
                        $ex['good_for'] = $good_for;
                        $ex['type'] = $type;
                        $ex['level'] = $level;
                    }

                    $data[$m]['data'] = $exercises;
                } 

                if($categoryFors[$m] == 2) {
                    $data[$m]['type'] = "workout";
                    $catId = $categoryIds[$m];

                    // $workouts = ExerciseWorkout::where('category_id', $categoryIds[$m])->with(['workout' => function($query) {
                    //     $query->select('id','title');
                    // }])->groupBy('workout_id')->get();

                    $workouts = Workouts::select('id', 'title', 'duration', 'focus_area', 'level', 'image', 'good_for', 'calories_burned')->with(['equipments' => function($q1) {
                        $q1->select('name');
                    }, 'exWk' => function($q2) use ($catId) {
                        $q2->where('exercise_workout.category_id', $catId);
                    }])->where('visible', 1)->where('workouts.category_id', $catId)->get();

                    foreach($workouts as $k => $wk) {
                        $focus_area = explode(',', $wk['focus_area']);
                        $duration = explode(',', $wk['duration']);
                        $good_for = explode(',', $wk['good_for']);
                        $level = explode(',', $wk['level']);
                        $wk['level'] = $level;
                        $wk['focus_area'] = $focus_area;
                        $wk['duration'] = $duration;
                        $wk['good_for'] = $good_for;
                    }

                    $data[$m]['data'] = $workouts;
                }

                if($categoryFors[$m] == 3) {
                    $data[$m]['type'] = "program";

                    $programs = Programs::select('id', 'title', 'image', 'good_for', 'no_of_days', 'configured_days', 'focus_area', 'duration', 'level')->with(array('equipments' => function($query) {
                        $query->select('name');
                    }))->where('visible', 1)->where('category_id', $categoryIds[$m])->get(); 

                    foreach($programs as $k => $pm) {
                        $focus_area = explode(',', $pm['focus_area']);
                        $good_for = explode(',', $pm['good_for']);
                        $level = explode(',', $pm['level']);
                        $pm['focus_area'] = $focus_area;
                        $pm['good_for'] = $good_for;
                        $pm['level'] = $level;
                    }

                    $data[$m]['data'] = $programs;
                }

                if($categoryFors[$m] == 4) {
                    $data[$m]['type'] = "split";

                    $splits = Splits::select('id', 'title', 'image', 'focus_area', 'good_for', 'no_of_days', 'type', 'duration', 'level')->with(array('equipments' => function($query) {
                        $query->select('name');
                    }))->where('visible', 1)->where('category_id', $categoryIds[$m])->get(); 

                    foreach($splits as $k => $sp) {
                        $focus_area = explode(',', $sp['focus_area']);
                        $good_for = explode(',', $sp['good_for']);
                        $level = explode(',', $sp['level']);
                        $sp['focus_area'] = $focus_area;
                        $sp['good_for'] = $good_for;
                        $sp['level'] = $level;
                    }

                    $data[$m]['data'] = $splits;
                }
            }
            
            if(empty($data)) {
                return response()->json(['success' =>  false, 'message' => 'Exercises not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'data' => $data], 200);
            }

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
        } catch(Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
}
