<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblProductTravelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_product_travel', function (Blueprint $table) {
            $table->id();
            $table->text('description');
            $table->bigInteger('quantity');
            $table->tinyInteger('status')->default(0); // 0-pending, 1-OK, 2-On Travel
            $table->tinyInteger('type_of_request')->default(0); // 1-Transfer, 2-Distribute
            $table->unsignedBigInteger('product_fk');
            $table->foreign('product_fk')->references('id')->on('tbl_product')->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('store_fk');
            $table->foreign('store_fk')->references('id')->on('tbl_stores')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_product_travel');
    }
}
