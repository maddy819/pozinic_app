<?php

namespace App\Imports;

use App\Strech;
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

class StrechesImport implements ToCollection, WithHeadingRow
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
            '*.basedon' => ['required'],
            '*.duration' => ['required_if:*.basedon,*.duration'],
            '*.instructions' => ['required', 'string'],
            '*.tipvideo' => ['required', 'string', 'url'],
            '*.videolink' => ['required', 'string', 'url'],
            '*.reps' => ['required_if:*.basedon,*.reps'],
            '*.focusarea' => ['required', 'string','min:1'],
            '*.goodfor' => ['required', 'string', 'min:1'],
            '*.type' => ['required', 'string', 'min:1'],
            '*.level' => ['required', 'string', 'min:1'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $stCount = Strech::get()->count();

                if($stCount > 0) {
                    $last = Strech::latest('id')->first()->id;
                    $code = "POZST".($last + 1);
                } else {
                    $code = "POZST1";
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

                $focusarea = explode(",", $row['focusarea']);
                $goodfor = explode(",", $row['goodfor']);
                $types = explode(",", $row['type']);
                $levels = explode(",", $row['level']);
                $equipments = explode(",", $row['equipments']);

                $fc = array();
                foreach($focusarea as $fa) {
                    $faSlug = strtolower(trim($fa));
                    $focusArea = FocusArea::where('slug', $faSlug)->get()->first();

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
                    $type = trim($type);
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
                $chk = Strech::where('slug', $slug)->get();

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

                $strech = array(
                    'title' => $row['title'],
                    'based_on' => $row['basedon'],
                    'code' => $code,
                    'slug' => Str::slug($row['title']),
                    'duration' => $row['duration'],
                    'instructions' => $ins,
                    'tip_video' => $row['tipvideo'],
                    'tip_video_thumbnail' => ($videoMeta) ? $videoMeta['thumbnail_url'] : NULL,
                    'video_link' => $row['videolink'],
                    'reps' => $row['reps'],
                    'focus_area' => implode(",", $fc),
                    'good_for' => implode(",", $gfg),
                    'type' => implode(",", $tp),
                    'level' => implode(",", $lv)
                );

                if(!$chk->isEmpty()) {
                    $stId = $chk->first();
                    Strech::where('slug', $slug)->update($strech);
                    $stId->equipments()->sync($eqe);
                } else {
                    $strc = Strech::create($strech);
                    $strc->equipments()->attach($eqe);
                }
            }

            DB::commit();
            return redirect()->back()->with('success', 'Streches Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }   
    }
}
