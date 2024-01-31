<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Models\Stores;
use App\Models\Products;
use Illuminate\Http\Request;
use App\Models\TransactionLogs;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    //
    public function AllData(){
        $data = User::where('role','!=',1)->get();
        $products = Products::all();
        $stock = Products::where('quantity','>' ,0)->get();
        $out = Products::where('quantity',0)->get();
        $total_income = TransactionLogs::selectRaw('sum(total_price) as total')->get();
        $sold = TransactionLogs::selectRaw('sum(quantity) as product_pcs')->get();
        $stores = Stores::all();

        return response()->json([
            "status"            =>          200,
            "accounts"          =>          $data->count(),
            "product"           =>          $products->count(),
            "stocks"            =>          $stock->count(),
            "out"               =>          $out->count(),
            "total_income"      =>          $total_income[0]->total,
            "sold"              =>          $sold[0]->product_pcs,
            "stores"            =>          $stores->count(),
        ]);
    }
}
