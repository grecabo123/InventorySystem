<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblTransactionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_transaction', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_id');
            $table->string('product_name');
            $table->string('product_brand');
            $table->string('product_model');
            $table->string('product_serial');
            $table->bigInteger('quantity');
            $table->double('price_product',20,2);
            $table->double('total_price',20,2);
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
        Schema::dropIfExists('tbl_transaction');
    }
}
