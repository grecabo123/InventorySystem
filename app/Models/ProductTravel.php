<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductTravel extends Model
{
    use HasFactory;

    protected $table = "tbl_product_travel";

    protected $fillable = [
        "description",
        "quantity",
        "product_fk",
        "store_fk",
    ];
}
