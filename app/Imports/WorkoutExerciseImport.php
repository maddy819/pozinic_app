<?php

namespace App\Imports;

use App\Exercises;
use App\ExerciseWorkout;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class WorkoutExerciseImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows) {
        $array = $rows->toArray();
        $array = array_map('array_filter', $array);
        $array = array_filter($array);

        foreach($array as $a => $arr) {
            if (!array_key_exists("excode",$arr)) {
                unset($array[$a]);
            }
        }

        //dd($array);

        $validator = Validator::make($array, [
            '*.excode' => ['required'],
            '*.basedon' => ['required', 'string'],
            '*.exduration' => ['required_if:*.basedon,duration'],
            '*.exreps' => ['required_if:*.basedon,reps']
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $r => $row) {
                $ex = Exercises::where('code', $row['excode'])->get()->first();
                
                // $chk = ExerciseWorkout::where('workout_id', request('wkid'))->where('exercise_id', $ex->id)->where('duration', request('duration'))->get();

                if(empty($ex)) {
                    return redirect()->back()->with('error', 'exercise with code:'.$row['excode'].' not found..!!');
                }
                
                $workoutExerciseData = array(
                    'workout_id' => (int)request('wkid'), 
                    'exercise_id' => $ex->id, 
                    'variation_name' => $row['variationname'], 
                    'duration' => (int)request('duration'), 
                    'sets' => $row['sets'], 
                    'based_on' => $row['basedon'], 
                    'ex_duration' => (isset($row['exduration'])) ? $row['exduration'] : NULL, 
                    'ex_reps' => (isset($row['exreps'])) ? $row['exreps'] : NULL,
                    'rest_duration' => (isset($row['restduration'])) ? $row['restduration'] : NULL
                );

                //dd($workoutExerciseData);

                ExerciseWorkout::create($workoutExerciseData);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Exercise Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
