<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stores extends Model
{
    use HasFactory;

    protected $table = "tbl_stores";

    protected $fillable = [
        "store_name",
        "image",
        "user_fk",
    ];
}
