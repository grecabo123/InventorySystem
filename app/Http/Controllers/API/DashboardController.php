<?php

namespace App\Http\Controllers\API;

use App\Models\EmployeeData;
use App\Models\User;
use App\Models\Stores;
use App\Models\Products;
use App\Models\StoreProduct;
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

    public function SalesInformation($id){

        $store_name = Stores::find($id);

        $total_earn = TransactionLogs::selectRaw('sum(total_price) as total')
        ->where('store_fk',$id)
            ->get();

        $product = StoreProduct::where('store_fk',$id)->get();
        $stock = StoreProduct::where('store_fk',$id)
            ->where('pcs', '>',0)
                ->get();
        $out = StoreProduct::where('store_fk',$id)
            ->where('pcs', '<=',0)
                    ->get();
                
        return response()->json([
            "status"                =>          200,
            "amount"                =>          $total_earn[0]->total,
            "all"                   =>          $product->count(),
            "stock"                 =>          $stock->count(),
            "name"                  =>          $store_name->store_name,
            "out"                   =>          $out->count(),
        ]);        
    }

    public function ListofSoldItem($id){

        $data = TransactionLogs::leftjoin('tbl_customer_info','tbl_customer_info.tbl_transaction','=','tbl_transaction.id')
            ->where('tbl_transaction.store_fk',$id)
                ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function ListofEmployee($id){
        $employee = EmployeeData::where('store_fk',$id)->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $employee,
        ]);
    }

    public function ListofSoldItemGroup($id){

        $data = TransactionLogs::selectRaw('product_name, sum(total_price) as total_price')
            ->where('store_fk',$id)
                ->groupBy('product_name')
                    ->get();
        
        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }
}
