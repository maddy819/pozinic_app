<?php

namespace App\Imports;

use App\Programs;
use App\Equipments;
use App\FocusArea;
use App\GoodFor;
use App\Duration;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class ProgramsImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows) {
        $array = $rows->toArray();
        $array = array_map('array_filter', $array);
        $array = array_filter($array);

        foreach($array as $a => $arr) {
            if (!array_key_exists("title",$arr)) {
                unset($array[$a]);
            }
        }

        $validator = Validator::make($array, [
            '*.title' => ['required', 'string', 'max:60'],
            '*.goodfor' => ['required'],
            '*.noofdays' => ['required', 'numeric'],
            '*.focusarea' => ['required', 'string'],
            '*.duration' => ['required', 'string'],
            // '*.videolink' => ['required', 'string', 'url'],
            '*.level' => ['required', 'string'],
            '*.instructions' => ['required', 'string'],
            '*.equipments' => ['required', 'string']
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $pmCount = Programs::get()->count();

                if($pmCount > 0) {
                    $last = Programs::latest('id')->first()->id;
                    $code = "POZPM".($last + 1);
                } else {
                    $code = "POZPM1";
                }

                $duration = explode(",", $row['duration']);
                $focusarea = explode(",", $row['focusarea']);
                $goodfor = explode(",", $row['goodfor']);
                $levels = explode(",", $row['level']);
                $equipments = explode(",", $row['equipments']);

                $du = array();
                foreach($duration as $d) {
                    $dSlug = trim($d);
                    $duration = Duration::where('duration', $dSlug)->get()->first();

                    if(empty($duration)) {
                        return redirect()->back()->with('error', 'Duration- '.$dSlug.' not found...!!');
                    }

                    array_push($du, $dSlug);
                }

                $fc = array();
                foreach($focusarea as $fa) {
                    $faSlug = strtolower(trim($fa));
                    $focusArea = FocusArea::where("program", 1)->where('slug', $faSlug)->get()->first();

                    if(empty($focusArea)) {
                        return redirect()->back()->with('error', 'Focus Area- '.$faSlug.' not found...!!');
                    }

                    array_push($fc, $faSlug);
                }

                $gfg = array();
                foreach($goodfor as $gf) {
                    $gfSlug = strtolower(trim($gf));
                    $GoodFor = GoodFor::where('slug', $gfSlug)->get()->first();

                    if(empty($GoodFor)) {
                        return redirect()->back()->with('error', 'Good For- '.$gfSlug.' not found...!!');
                    }

                    array_push($gfg, $gfSlug);
                }

                if(count($levels) == 1) {
                    $levels[0] = strtolower($levels[0]);
                    if($levels[0] == "all") {
                        $levels = array('Beginner','Intermediate','Advanced');
                    }
                }

                $lv = array();
                foreach($levels as $level) {
                    $level = ucfirst(trim($level));
                    if(!in_array($level, array('Beginner', 'Intermediate', 'Advanced'))) {
                        return redirect()->back()->with('error', 'Level- '.$level.' not found...!!');
                    }

                    array_push($lv, $level);
                }

                $eqe = array();
                foreach($equipments as $eq) {
                    $eqSlug = strtolower(trim($eq));
                    $equipment = Equipments::where('slug', $eqSlug)->get()->first();

                    if(empty($equipment)) {
                        return redirect()->back()->with('error', 'Equipment- '.$eqSlug.' not found...!!');
                    }

                    array_push($eqe, $equipment->id);
                }

                $slug = Str::slug($row['title']);
                $chk = Programs::where('slug', $slug)->get();

                if(!empty($row['instructions'])) {
                    $instructions = array_filter(array_map('trim', explode("\n", $row['instructions'])));
                    $ins = "<ul>";

                    foreach($instructions as $inst) {
                        $ins .= "<li>".$inst."</li>";
                    }

                    $ins .= "</ul>";
                } else {
                    $ins = NULL;
                }

                if(!empty($row['breath'])) {
                    $breath = array_filter(array_map('trim', explode("\n", $row['breath'])));
                    $bre = "<ul>";

                    foreach($breath as $brea) {
                        $bre .= "<li>".$brea."</li>";
                    }

                    $bre .= "</ul>";
                } else {
                    $bre = NULL;
                }

                if(!$chk->isEmpty()) {
                    $program = array(
                        'title' => $row['title'],
                        'slug' => Str::slug($row['title']),
                        'good_for' => implode(",", $gfg),
                        'no_of_days' => $row['noofdays'],
                        'focus_area' => implode(",", $fc),
                        'duration' => implode(",", $du),
                        // 'video_link' => $row['videolink'],
                        'level' => implode(",", $lv),
                        'breath' => $bre,
                        'instructions' => $ins
                    );

                    $pmId = $chk->first();
                    Programs::where('slug', $slug)->update($program);
                    $pmId->equipments()->sync($eqe);
                } else {
                    $program = array(
                        'title' => $row['title'],
                        'code' => $code,
                        'slug' => Str::slug($row['title']),
                        'good_for' => implode(",", $gfg),
                        'no_of_days' => $row['noofdays'],
                        'focus_area' => implode(",", $fc),
                        'duration' => implode(",", $du),
                        // 'video_link' => $row['videolink'],
                        'level' => implode(",", $lv),
                        'breath' => $bre,
                        'instructions' => $ins
                    );
                    
                    $pm = Programs::create($program);
                    $pm->equipments()->attach($eqe);
                }
            }

            DB::commit();
            return redirect()->back()->with('success', 'Program Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
