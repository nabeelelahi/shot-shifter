<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Post extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->default(0);
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->enum('privacy_type',['everyone','friends','friends_except','only_me'])->default('everyone');
            $table->string('slug',150)->unique();
            $table->string('title',150)->nullable();
            $table->text('description')->nullable();
            $table->string('font_style',100)->nullable();
            $table->string('font_color',100)->nullable();
            $table->enum('post_type',['post','feeling_activity'])->default('post');
            $table->integer('feeling_activity_id')->default(0);
            $table->integer('total_like')->default(0);
            $table->integer('total_dislike')->default(0);
            $table->integer('total_comment')->default(0);
            $table->integer('total_view')->default(0);
            $table->integer('total_share')->default(0);
            $table->integer('total_report')->default(0);
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
        Schema::dropIfExists('posts');
    }
}
