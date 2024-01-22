<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    protected $table = "tbl_address";

    protected $fillable = [
        "zipcode",
        "city",
        "streets",
        "region",
        "province",
        "user_adr_fk",
    ];
}
