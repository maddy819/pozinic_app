<?php

namespace App\Imports;

use App\Nutrition;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class Nutritions implements ToCollection, WithHeadingRow
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
            '*.benefits' => ['required', 'string'],
            '*.instructions' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', $validator->messages()->first());
        }

        foreach ($array as $row) {
            $slug = Str::slug($row['title']);
            $chk = Nutrition::where('slug', $slug)->get();

            $nutrition = array(
                'title' => $row['title'],
                'slug' => $slug,
                'calorie_range_1' => $row['calorierangeone'],
                'calorie_range_2' => $row['calorierangetwo'],
                'benefits' => $row['benefits'],
                'instructions' => $row['instructions']
            );

            if(!$chk->isEmpty()) {
                $nuId = $chk->first();
                Nutrition::where('slug', $slug)->update($nutrition);
            } else {
                $nut = Nutrition::create($nutrition);
            }
        }
    }
}