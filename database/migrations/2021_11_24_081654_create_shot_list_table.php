<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShotListTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shot_list', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('name',150)->nullable();
            $table->string('slug',150)->unique();
            $table->text('image_url',1000)->nullable();
            $table->text('description',5000)->nullable();
            $table->enum('is_lock',['0','1'])->default('0');
            $table->enum('is_pin',['0','1'])->default('0');
            $table->integer('sort_order')->nullable();
            $table->enum('status',['1','0'])->default('1');
            $table->integer('total_scene')->default(0);
            $table->integer('total_completed_scene')->default(0);
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
        Schema::dropIfExists('shot_list');
    }
}
