<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('programs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code');
            $table->string('good_for');
            $table->string('type');
            $table->string('image');
            $table->string('focus_area');
            $table->string('duration');
            $table->string('video');
            $table->string('level');
            $table->string('frequency');
            $table->string('equipments');
            $table->string('length');
            $table->string('splits');
            $table->longtext('description');
            $table->longtext('instructions');
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
        Schema::dropIfExists('programs');
    }
}
