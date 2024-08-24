<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExercisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exercises', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('code');
            $table->string('slug');
            $table->biginteger('category_id');
            $table->string('duration')->nullable();
            $table->longtext('instructions');
            $table->longtext('description');
            $table->string('tip_video');
            $table->longtext('video_link');
            $table->string('reps')->nullable();
            $table->string('focus_area');
            $table->string('specific_muscles');
            $table->string('good_for');
            $table->string('type');
            $table->longtext('Notes');
            $table->string('level');
            $table->string('image');
            $table->string('tags');
            $table->timestamp('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(\DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exercises');
    }
}
