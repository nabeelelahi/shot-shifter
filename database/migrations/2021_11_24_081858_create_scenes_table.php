<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScenesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('scenes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shot_list_id')->constrained('shot_list')->onDelete('cascade');
            $table->string('size',150)->nullable();
            $table->string('title',150)->nullable();
            $table->string('slug',150)->unique();
            $table->text('image_url',5000)->nullable();
            $table->text('description',5000)->nullable();
            $table->string('angle',150)->nullable();
            $table->string('lens',150)->nullable();
            $table->string('internal_external',150)->nullable();
            $table->string('sun_time',150)->nullable();
            $table->text('location',1000)->nullable();
            $table->text('location_pin',1000)->nullable();
            $table->string('cast',150)->nullable();
            $table->string('wardrobe',150)->nullable();
            $table->string('props',150)->nullable();
            $table->string('action',150)->nullable();
            $table->string('speed',150)->nullable();
            $table->string('sound',150)->nullable();
            $table->string('timepicker',150)->nullable();
            $table->string('lines_dialogue_english',150)->nullable();
            $table->string('lines_dialogue_foreign',150)->nullable();
            $table->string('camera',150)->nullable();
            $table->enum('is_complete',['1','0'])->default('0');
            $table->integer('sort_order')->nullable();
            $table->enum('status',['1','0'])->default('1');
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
        Schema::dropIfExists('scenes');
    }
}
