<?php

namespace App\Imports;

use App\Exercises;
use App\Equipments;
use App\FocusArea;
use App\GoodFor;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class ExercisesImport implements ToCollection, WithHeadingRow
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
            '*.tipvideo' => ['required', 'string', 'url'],
            '*.videolink' => ['required', 'string', 'url'],
            '*.focusarea' => ['required', 'string'],
            '*.goodfor' => ['required', 'string'],
            '*.type' => ['required', 'string'],
            '*.level' => ['required', 'string'],
            '*.equipments' => ['required', 'string']
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $exCount = Exercises::get()->count();

                if($exCount > 0) {
                    $last = Exercises::latest('id')->first()->id;
                    $code = "POZEX".($last + 1);
                } else {
                    DB::statement("SET foreign_key_checks=0");
                    Exercises::truncate();
                    DB::statement("SET foreign_key_checks=1");
                    $code = "POZEX1";
                }

                if(preg_match("/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([0-9]{6,11})[?]?.*/", $row['tipvideo'], $output_array)) {
                    $videoId = $output_array[5];
                }

                $url = "https://vimeo.com/api/oembed.json?url=".urlencode("https://vimeo.com/".$videoId);
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

                $based_on = strtolower($row['basedon']);
                $focusarea = explode(",", $row['focusarea']);
                $goodfor = explode(",", $row['goodfor']);
                $types = explode(",", $row['type']);
                $levels = explode(",", $row['level']);
                $equipments = explode(",", $row['equipments']);

                $fc = array();
                foreach($focusarea as $fa) {
                    $faSlug = strtolower(trim($fa));
                    $focusArea = FocusArea::where("exercise", 1)->where('slug', $faSlug)->get()->first();

                    if(empty($focusArea)) {
                        return redirect()->back()->with('error', 'Focus Area '.$faSlug.' not found...!!');
                    }

                    array_push($fc, $faSlug);
                }

                $gfg = array();
                foreach($goodfor as $gf) {
                    $gfSlug = strtolower(trim($gf));
                    $GoodFor = GoodFor::where('slug', $gfSlug)->get()->first();

                    if(empty($GoodFor)) {
                        return redirect()->back()->with('error', 'Good For '.$gfSlug.' not found...!!');
                    }

                    array_push($gfg, $gfSlug);
                }

                if(count($types) == 1) {
                    $types[0] = strtolower($types[0]);
                    if($types[0] == "all") {
                        $types = array('exercise', 'warmup', 'poststrech');
                    }
                }
                
                $tp = array();
                foreach($types as $type) {
                    $type = strtolower(trim($type));
                    if(!in_array($type, array('exercise', 'warmup', 'poststrech'))) {
                        return redirect()->back()->with('error', 'Type '.$type.' not found...!!');
                    }

                    array_push($tp, $type);
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
                        return redirect()->back()->with('error', 'Level '.$level.' not found...!!');
                    }

                    array_push($lv, $level);
                }

                $eqe = array();
                foreach($equipments as $eq) {
                    $eqSlug = strtolower(trim($eq));
                    $equipment = Equipments::where('slug', $eqSlug)->get()->first();

                    if(empty($equipment)) {
                        return redirect()->back()->with('error', 'Equipment '.$eqSlug.' not found...!!');
                    }

                    array_push($eqe, $equipment->id);
                }

                $slug = Str::slug($row['title']);
                $chk = Exercises::where('slug', $slug)->get();

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
                    $exercise = array(
                        'title' => $row['title'],
                        'based_on' => (isset($row['basedon'])) ? $row['basedon'] : NULL,
                        'slug' => Str::slug($row['title']),
                        'duration' => (isset($row['duration'])) ? $row['duration'] : NULL,
                        'instructions' => $ins,
                        'breath' => $bre,
                        'tip_video' => $row['tipvideo'],
                        'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL,
                        'video_link' => $row['videolink'],
                        'reps' => (isset($row['reps'])) ? $row['reps'] : NULL,
                        'focus_area' => implode(",", $fc),
                        'good_for' => implode(",", $gfg),
                        'type' => implode(",", $tp),
                        'level' => implode(",", $lv)
                    );

                    $exId = $chk->first();
                    Exercises::where('slug', $slug)->update($exercise);
                    $exId->equipments()->sync($eqe);
                } else {
                    $exercise = array(
                        'title' => $row['title'],
                        'based_on' => (isset($row['basedon'])) ? $row['basedon'] : NULL,
                        'code' => $code,
                        'slug' => Str::slug($row['title']),
                        'duration' => (isset($row['duration'])) ? $row['duration'] : NULL,
                        'instructions' => $ins,
                        'breath' => $bre,
                        'tip_video' => $row['tipvideo'],
                        'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL,
                        'video_link' => $row['videolink'],
                        'reps' => (isset($row['reps'])) ? $row['reps'] : NULL,
                        'focus_area' => implode(",", $fc),
                        'good_for' => implode(",", $gfg),
                        'type' => implode(",", $tp),
                        'level' => implode(",", $lv)
                    );
                    $exe = Exercises::create($exercise);
                    $exe->equipments()->attach($eqe);
                }
            }

            DB::commit();
            return redirect()->back()->with('success', 'Exercise Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
