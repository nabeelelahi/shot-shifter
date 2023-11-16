<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScheduleActivityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedule_activity', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('scene_id');
            $table->integer('shot_list_id');
            $table->string('http_verb');
            $table->string('action_name');
            $table->text('request_payload');
            $table->text('response');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schedule_activity');
    }
}
