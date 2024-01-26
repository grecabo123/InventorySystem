<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblBranchToBranchTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_branch_to_branch', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('quantity');
            $table->tinyInteger('status');
            $table->unsignedBigInteger('product_fk');
            $table->foreign('product_fk')->references('id')->on('tbl_product')->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('from_store_fk');
            $table->foreign('from_store_fk')->references('id')->on('tbl_stores')->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedBigInteger('to_store_fk');
            $table->foreign('to_store_fk')->references('id')->on('tbl_stores')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('tbl_branch_to_branch');
    }
}
