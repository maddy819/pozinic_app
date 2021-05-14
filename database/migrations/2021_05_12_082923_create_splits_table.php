<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSplitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('splits', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code');
            $table->string('repetatations');
            $table->string('equipments');
            $table->string('no_of_days');
            $table->string('level');
            $table->string('video');
            $table->string('good_for');
            $table->string('type');
            $table->string('focus_area');
            $table->string('duration');
            $table->longtext('instructions');
            $table->longtext('description');
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
        Schema::dropIfExists('splits');
    }
}
