<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    use HasFactory;
    
    protected $table = "tbl_product";

    protected $fillable = [
        'product',
        'brand',
        'model',
        'image',
        'description',
        'serial_num',
        'quantity',
        'price',
    ];
}
