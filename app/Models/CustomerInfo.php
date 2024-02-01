<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerInfo extends Model
{
    use HasFactory;

    protected $table = "tbl_customer_info";

    protected $fillable =[
        'tbl_transaction',
        'customer_name',
        'customer_address',
        'description',
    ];
}
