<?php

namespace App\Imports;

use App\Workouts;
use App\Splits;
use App\SplitWorkout;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class SplitWorkoutImport implements ToCollection, WithHeadingRow
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

                $sw = SplitWorkout::where('split_id', request('spid'))->where('duration', request('duration'))->whereRaw("((starting_day = ".$row['start']." or starting_day = ".$row['end'].") or (ending_day = ".$row['start']." or ending_day = ".$row['end']."))")->get()->count();

                if($sw > 0) {
                    return redirect()->back()->with('error', 'Selected day already full..!!');
                }
    
                $total_workout_days = ($row['end'] - $row['start']) + 1;
                $split = Splits::find(request('spid'));
                $splitWorkoutDays = SplitWorkout::where('split_id', request('spid'))->where('duration', request('duration'))->sum('total_days');
    
                if($split->no_of_days < ($splitWorkoutDays + $total_workout_days)) {
                    return redirect()->back()->with('error', 'workout days becomes greater than split set number of days..!!');
                }
    
                $splitWorkoutData = array('split_id' => request('spid'), 'workout_id' => $wk->id, 'duration' => request('duration'), 'starting_day' => $row['start'], 'ending_day' => $row['end'], 'total_days' => $total_workout_days);

                if(SplitWorkout::create($splitWorkoutData)) {
                    $upd_workout_days = $splitWorkoutDays + $total_workout_days;
                    Splits::where('id', request('spid'))->update(array('configured_days' => $upd_workout_days));
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
