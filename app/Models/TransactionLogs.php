<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionLogs extends Model
{
    use HasFactory;

    protected $table = "tbl_transaction";

    protected $fillable = [
        "invoice_id",
        "product_name",
        "product_brand",
        "product_model",
        "product_serial",
        "quantity",
        "price_product",
        "total_price",
        'store_fk',
    ];
}
