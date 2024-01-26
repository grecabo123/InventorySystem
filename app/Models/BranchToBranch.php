<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BranchToBranch extends Model
{
    use HasFactory;
    protected $table = "tbl_branch_to_branch";

    protected $fillable = [
        "quantity",
        "status",
        "from_store_fk",
        "to_store_fk",
    ];
}
