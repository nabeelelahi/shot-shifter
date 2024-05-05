<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShotlistUserPinTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shotlist_user_pin', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('shot_list_id');
            // Define other columns as needed
            $table->timestamps();
            
            // Define foreign key constraints if needed
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('shot_list_id')->references('id')->on('shot_list')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shotlist_user_pin');
    }
}
