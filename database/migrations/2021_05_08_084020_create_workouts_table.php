<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWorkoutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workouts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code');
            $table->string('title');
            $table->string('slug');
            $table->string('duration');
            $table->longtext('instructions');
            $table->longtext('description');
            $table->string('type');
            $table->string('warm_ups');
            $table->string('post_streches');
            $table->string('focus_area');
            $table->string('level');
            $table->string('image');
            $table->string('equipments');
            $table->string('good_for');
            $table->string('calories_burned');
            $table->longtext('video_link');
            $table->string('tags');
            $table->integer('visible');
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
        Schema::dropIfExists('workouts');
    }
}
