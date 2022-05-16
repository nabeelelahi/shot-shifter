<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class PostMedia extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('post_media', function (Blueprint $table) {
            $table->id();
            $table->foreignId('post_id')->constrained('posts')->onDelete('cascade');
            $table->string('filename',255);
            $table->string('original_name',255);
            $table->text('file_url',5000);
            $table->text('thumbnail_url',5000)->nullable();
            $table->string('mime_type',50);
            $table->enum('file_type',['image','video','audio','doc','pdf','xlx']);
            $table->string('driver',50)->default('local');
            $table->enum('media_type',['public','private'])->default('public');
            $table->text('meta')->nullable();
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
        Schema::dropIfExists('post_media');
    }
}
