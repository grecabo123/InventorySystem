<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reports extends Model
{
    use HasFactory;

    protected $table = "tbl_reports";

    protected $fillable = [
        "status_report",
        "description",
        "product_fk",
        "store_fk",
    ];
}
