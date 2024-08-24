<?php

namespace App\Imports;

use App\Workouts;
use App\Programs;
use App\ProgramWorkout;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class ProgramWorkoutImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows) {
        $array = $rows->toArray();
        $array = array_map('array_filter', $array);
        $array = array_filter($array);

        foreach($array as $a => $arr) {
            if (!array_key_exists("wkcode",$arr)) {
                unset($array[$a]);
            }
        }

        $validator = Validator::make($array, [
            '*.wkcode' => ['required'],
            '*.start' => ['required', 'numeric'],
            '*.end' => ['required', 'numeric']
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $wk = Workouts::where('code', trim($row['wkcode']))->get()->first();

                if(empty($wk)) {
                    return redirect()->back()->with('error', 'workout with code:'.$row['wkcode'].' not found..!!');
                }

                if($row['start'] > $row['end']) {
                    return redirect()->back()->with('error', 'starting day must be small than ending day..!!');
                }

                $pw = ProgramWorkout::where('program_id', request('pmid'))->where('duration', request('duration'))->whereRaw("((starting_day = ".$row['start']." or starting_day = ".$row['end'].") or (ending_day = ".$row['start']." or ending_day = ".$row['end']."))")->get()->count();

                if($pw > 0) {
                    return redirect()->back()->with('error', 'Selected day already full..!!');
                }
    
                $total_workout_days = ($row['end'] - $row['start']) + 1;
                $program = Programs::find(request('pmid'));
                $programWorkoutDays = ProgramWorkout::where('program_id', request('pmid'))->where('duration', request('duration'))->sum('total_days');
                
                if($program->no_of_days < ($programWorkoutDays + $total_workout_days)) {
                    return redirect()->back()->with('error', 'workout days becomes greater than program set number of days..!!');
                }
    
                $programWorkoutData = array('program_id' => request('pmid'), 'workout_id' => $wk->id, 'duration' => request('duration'), 'starting_day' => $row['start'], 'ending_day' => $row['end'], 'total_days' => $total_workout_days);
                
                if(ProgramWorkout::create($programWorkoutData)) {
                    $upd_workout_days = $programWorkoutDays + $total_workout_days;
                    Programs::where('id', request('pmid'))->update(array('configured_days' => $upd_workout_days));
                } else {
                    return redirect()->back()->with('error', 'Some error occoured. plz try again..!!');
                }
            }

            DB::commit();
            return redirect()->back()->with('success', 'workouts Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
