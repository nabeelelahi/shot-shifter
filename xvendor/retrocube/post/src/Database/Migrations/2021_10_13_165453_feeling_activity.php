<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class FeelingActivity extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feeling_activity', function (Blueprint $table) {
            $table->id();
            $table->string('title',100);
            $table->string('slug',100)->unique();
            $table->text('image_url',1000)->nullable();
            $table->text('description')->nullable();
            $table->enum('status',['1','0'])->default('1');
            $table->timestamps();
            $table->softDeletes($column = 'deleted_at', $precision = 0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('feeling_activity');
    }
}
