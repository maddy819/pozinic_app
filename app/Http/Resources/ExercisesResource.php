<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ExercisesResource extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id, 
            'title' => $this->title, 
            'based_on' => $this->based_on, 
            'duration' => $this->duration, 
            'reps' => $this->reps, 
            'focus_area' => explode(',', $this->focus_area), 
            'specific_muscles' => explode(',', $this->specific_muscles), 
            'good_for' => explode(',', $this->good_for), 
            'type' => explode(',', $this->type), 
            'level' => explode(',', $this->level), 
            'image' => $this->image
        ];
    }
}
