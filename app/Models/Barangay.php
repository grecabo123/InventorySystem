<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barangay extends Model
{
    use HasFactory;
    
    protected $table = "tbl_brgy";

    protected $fillable = [
        "brgy_name",
        "user_brgy_fk",
    ];
}
