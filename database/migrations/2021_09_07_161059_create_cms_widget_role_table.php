<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCmsWidgetRoleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cms_widget_role', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cms_widget_id')->constrained('cms_widgets')->onDelete('cascade');
            $table->foreignId('cms_role_id')->constrained('cms_roles')->onDelete('cascade');
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
        Schema::dropIfExists('cms_widget_role');
    }
}
