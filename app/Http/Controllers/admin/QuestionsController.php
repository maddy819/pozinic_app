<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Questions;
use App\Settings;
use App\Answers;
use Auth;
use File;

class QuestionsController extends Controller
{
    public function index() {
        $questions = Questions::orderBy('id', 'DESC')->get();
        $setting = Settings::all()->first();
        $pageTitle = 'Questions';
        return view('admin.questions', compact('pageTitle', 'setting', 'questions'));
    }

    public function store_question(Request $request) {
        $validator = Validator::make($request->all(), [
            'question' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        $answer = array_filter(request('answer'));

        if(count($answer) < 2) {
            return response()->json(['error'=> "At least provide 2 answers for a question"]);
        }

        $data = $request->all();
        $data['answer'] = array_filter($data['answer']);
        $data['answer_explanation'] = array_filter($data['answer_explanation']);
        $data['answer_id'] = array_filter($data['answer_id']);
        
        $question = array('question' => $data['question']);

        if(request('save') == "Post Question") {
            $res = Questions::create($question);

            if($res) {
                $answers_data = array();
                foreach($data['answer'] as $k => $answer) {
                    $d['question_id'] = $res->id;
                    $d['answer'] = $answer;
                    $d['answer_explanation'] = (isset($data['answer_explanation'][$k])) ? $data['answer_explanation'][$k] : NULL;

                    array_push($answers_data, $d);
                }

                Answers::insert($answers_data);
                return response()->json(['success'=>'Questions Posted Successfully.']);
            } else {
                return response()->json(['error'=>'Some error occoured. plz try again']);
            }
        } else {
            $id = request('id');
            $res1 = Questions::where('id', $id)->update($question);
            if($res1) {
                foreach($data['answer'] as $k => $answer) {
                    $answer_id = $data['answer_id'][$k];

                    $d['question_id'] = $id;
                    $d['answer'] = $answer;
                    $d['answer_explanation'] = (isset($data['answer_explanation'][$k])) ? $data['answer_explanation'][$k] : NULL;

                    Answers::where('id', $answer_id)->update($d);
                }

                return response()->json(['success' => 'Question Updated Successfully.']);
            } else {
                return response()->json(['error' => 'Some error occoured. plz try again']);
            }
        }
    }

    public function edit_question(Request $request) {
        $questId = request('questId');
        $question = Questions::with('answers')->where('id', $questId)->get()->first();
        return \Response::json($question);
    }

    public function delete_question(Request $request) {
        $id = request('id');
        $res = Questions::where('id', $id)->delete();
        if($res) {
            return redirect()->back()->with('success', 'Question Deleted Successfully...');
        } else { 
            return redirect()->back()->with('error', 'Some Error Occoured. Plz Try Again...');
        }
    }

    /**
     * @group  Signup Questions
     * 
     * @authenticated
     * 
     * APIs for getting signup questions
     * 
     * @response  {
     *  "success": true,
     *  "data": [{
     *      "id": 1,
     *      "question": "Endurance",
     *       "answers": [
     *           "A person's ability to exercise continuously for extended periods without having to use the restroom",
     *           "A person's ability to exercise continuously for extended periods without being hungry",
     *           "A person's ability to exercise continuously for extended periods without needing to think",
     *           "A person's ability to exercise continuously for extended periods without tiring"
     *       ]
     *   }]
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
     *  "message": "User Not Found."
     * }
     * 
     * @response  404 {
     *  "success": false,
     *  "message": "Questions not found."
     * }
     * 
     * @response  500 {
     *  "success": false,
     *  "message": "Internal server error."
     * } 
     * 
     */

    public function signupQuestions(Request $request) {
        try {
            if (! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['success' => false, 'message' => 'User Not Found.'], 404);
            }

            $questions = Questions::select('id', 'question')->with('answers')->orderBy('questions.id', 'DESC')->get();

            foreach($questions as $question) {
                foreach($question->answers as $answer) {
                    unset($answer->question_id);
                    unset($answer->id);
                    unset($answer->created_at);
                    unset($answer->updated_at);
                }  
            }

            if($questions->isEmpty()) {
                return response()->json(['success' =>  false, 'message' => 'Questions not found.'], 404);
            } else {
                return response()->json(['success' =>  true, 'data' => $questions], 200);
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