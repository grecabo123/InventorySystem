<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StoresAddress extends Model
{
    use HasFactory;


    protected $table = "tbl_store_adr";

    protected $fillable = [
        "region",
        "province",
        "city",
        "streets",
        "brgy",
        "zipcode",
    ];
}
