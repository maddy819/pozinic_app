<?php

namespace App\Imports;

use App\Nutrition;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class NutritionImport implements ToCollection, WithHeadingRow
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
            '*.calorierangeone' => ['required', 'numeric'],
            '*.calorierangetwo' => ['required', 'numeric'],
            '*.instructions' => ['required', 'string'],
        ]);

        //dd($rows->toArray());

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                if(!empty($row['instructions'])) {
                    $instructions = array_filter(array_map('trim', explode(".", $row['instructions'])));
                    $ins = "<ul>";

                    foreach($instructions as $inst) {
                        $ins .= "<li>".$inst."</li>";
                    }

                    $ins .= "</ul>";
                } else {
                    $ins = NULL;
                }

                $nCount = Nutrition::get()->count();
            
                if($nCount > 0) {
                    $last = Nutrition::latest('id')->first()->id;
                    $code = "POZNUT".($last + 1);
                } else {
                    $code = "POZNUT1";
                }

                $nutrition = array(
                    'code' => $code,
                    'title' => $row['title'],
                    'slug' => Str::slug(trim($row['title'])),
                    'calorie_range_1' => $row['calorierangeone'],
                    'calorie_range_2' => $row['calorierangetwo'],
                    'instructions' => $ins
                );

                $nut = Nutrition::create($nutrition);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Nutritions Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
