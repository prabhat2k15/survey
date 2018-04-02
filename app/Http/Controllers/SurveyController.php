<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Question;
use App\Option;
use App\Answer;
use Auth;

class SurveyController extends Controller
{
     /**
     * Create a new survey controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function getQuestion(Request $request)
    {
        // dd($request);
        $question = Question::paginate(2);
        if($question->currentPage() > $question->lastPage()){
           return view('thankyou');
        }

        foreach($question as $q){
            $option[$q->id]=Option::where('questions_id',$q->id)->get();
        }
        return view('form')->with('question',$question)
                                 ->with('option',$option);
    }

    public function saveAnswer(Request $request)
    {
        foreach($request->request as $key => $choice){
            if($key=='_token' || $key=='page'){
                continue;
            }
            $answer=Answer::updateOrCreate(
                ['user_id' => Auth::user()->id, 'question_id' => $key],
                ['option_choice' => $choice]
            );
            $answer->question_id=$key;
            $answer->user_id= Auth::user()->id;
            $answer->option_choice=$choice;
            $answer->save();
        }        
        return redirect()->route('getques', ['page' => ($request->page+1)]);
    }
}