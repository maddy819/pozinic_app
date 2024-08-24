<?php

namespace App\Imports;

use App\Meal;
use App\Item;
use Illuminate\Support\Str;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use DB;

class ItemsImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows) {
        $array = $rows->toArray();
        $array = array_map('array_filter', $array);
        $array = array_filter($array);

        foreach($array as $a => $arr) {
            if (!array_key_exists("mealcode",$arr)) {
                unset($array[$a]);
            }
        }

        $validator = Validator::make($array, [
            '*.mealcode' => ['required', 'string'],
            '*.title' => ['required', 'string'],
            '*.quantity' => ['required', 'string']
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=> $validator->messages()->first()]);
        }

        DB::beginTransaction();
        
        try {
            foreach ($array as $row) {
                $mealCode = trim($row['mealcode']);
                $mealChk = Meal::where('code', $mealCode)->get()->first();

                if(empty($mealChk)) {
                    return redirect()->back()->with('error', 'Meal not found...!!');
                }

                $itemSlug = Str::slug(trim($row['title']));

                $itemData = array(
                    'meal_id' => $mealChk->id, 
                    'title' => $row['title'], 
                    'slug' => $itemSlug, 
                    'quantity' => $row['quantity']
                );

                $item = Item::create($itemData);
            }

            DB::commit();
            return redirect()->back()->with('success', 'Items Imported Successfully...');
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}