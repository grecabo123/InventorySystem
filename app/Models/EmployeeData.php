<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeData extends Model
{
    use HasFactory;

    protected $table = "tbl_employee";

    protected $fillable = [
        'employee',
        'email',
        'store_fk',
    ];
}
