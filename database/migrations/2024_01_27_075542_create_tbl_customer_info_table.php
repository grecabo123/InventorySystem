<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblCustomerInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_customer_info', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tbl_transaction');
            $table->foreign('tbl_transaction')->references('id')->on('tbl_transaction')->onDelete('cascade')->onUpdate('cascade');
            $table->string('customer_name');
            $table->string('customer_address');
            $table->text('description');
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
        Schema::dropIfExists('tbl_customer_info');
    }
}
