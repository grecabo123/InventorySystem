<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblStorProductTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_stor_product', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('store_fk');
            $table->foreign('store_fk')->references('id')->on('tbl_stores')->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('product_fk');
            $table->foreign('product_fk')->references('id')->on('tbl_product')->onDelete('cascade')->onUpdate('cascade');
            $table->bigInteger('pcs');
            $table->tinyInteger('status')->default(0);
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
        Schema::dropIfExists('tbl_stor_product');
    }
}
