<?php

namespace App\Imports;

use App\Meal;
use App\Nutrition;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class MealsImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows) {
        $array = $rows->toArray();
        $array = array_map('array_filter', $array);
        $array = array_filter($array);

        foreach($array as $a => $arr) {
            if (!array_key_exists("nutritioncode",$arr)) {
                unset($array[$a]);
            }
        }

        $validator = Validator::make($array, [
            '*.nutritioncode' => ['required', 'string', 'max:60'],
            '*.title' => ['required', 'string', 'max:60'],
            '*.time' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $nutCode = trim($row['nutritioncode']);
                $nutChk = Nutrition::where('code', $nutCode)->get()->first();

                if(empty($nutChk)) {
                    return redirect()->back()->with('error', 'Nutrition not found...!!');
                }

                $mCount = Meal::get()->count();
            
                if($mCount > 0) {
                    $last = Meal::latest('id')->first()->id;
                    $code = "POZMEAL".($last + 1);
                } else {
                    $code = "POZMEAL1";
                }

                $mealSlug = Str::slug(trim($row['title']));
                
                if(!empty($row['suggestions'])) {
                    $suggestions = array_filter(array_map('trim', explode(".", $row['suggestions'])));
                    $sug = "<ul>";
    
                    foreach($suggestions as $sugg) {
                        $sug .= "<li>".$sugg."</li>";
                    }
    
                    $sug .= "</ul>";
                } else {
                    $sug = NULL;
                }
                
                
                $mealData = array(
                    'nutrition_id' => $nutChk->id,
                    'code' => $code,
                    'title' => $row['title'], 
                    'slug' => $mealSlug, 
                    'time' => $row['time'], 
                    'suggestions' => $sug
                );

                $meal = Meal::create($mealData);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Meals Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}