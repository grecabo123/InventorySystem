<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\AcitivityLogs;
use App\Models\BranchToBranch;
use App\Models\EmployeeData;
use App\Models\ProductTravel;
use App\Models\Reports;
use App\Models\StoreProduct;
use App\Models\Stores;
use App\Models\StoresAddress;
use Illuminate\Http\Request;

class UserController extends Controller
{
    //

    public function AddEmployee (Request $request){
        $user = Stores::where('user_fk',$request->user_id)->first();
        
        if($user) {

            $data = new EmployeeData;
            
            $data->employee = $request->employee;
            $data->email = $request->email;
            $data->store_fk = $user->id;
            $data->role = $request->role == 4 ? 4 : 3;
            $data->save();

            $logs = new AcitivityLogs;

            $logs->desc = "Register Employee"." ".$request->employee;
            $logs->user_fk = $request->user_id;
            $logs->save();

            return response()->json([
                "status"            =>              200,
            ]);
        }
    }

    public function DisplayEmployee($id) {

        $store_id = Stores::where('user_fk',$id)->first();

        if($store_id){
            $data = EmployeeData::where('store_fk',$store_id->id)->get();
    
            return response()->json([
                "status"            =>              200,
                "data"              =>              $data,
            ]);
        }

    }

    public function ProductMonitor($id){

        $store_id = Stores::where('user_fk',$id)->first();

        $data = ProductTravel::join('tbl_employee','tbl_employee.store_fk','=','tbl_product_travel.store_fk')
        ->join('tbl_product','tbl_product.id','=','tbl_product_travel.product_fk')
            ->join('tbl_stores','tbl_stores.id','=','tbl_product_travel.store_fk')
                ->selectRaw('tbl_product_travel.product_fk,tbl_product_travel.id,tbl_product_travel.status,tbl_product_travel.type_of_request,tbl_product_travel.description,
                tbl_employee.employee,tbl_product.product,tbl_product_travel.created_at,
                tbl_stores.store_name,tbl_product_travel.quantity,tbl_product_travel.store_fk')
                ->where('tbl_stores.id', $store_id->id)
                    ->where('tbl_employee.role',4)
                        ->where('tbl_product_travel.status',2)
                    ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
            "id"                =>          $store_id->id,
        ]);
    }

    public function UpdateStatusProduct(Request $request){
        $data = ProductTravel::find($request->travel_id);

        if($data){
            $data->status = 1;
            $data->update();

            if($request->status == 1){

                $store = new StoreProduct;
                $store->store_fk = $request->store_fk;
                $store->product_fk = $request->product;
                $store->pcs = $request->pcs;
                $store->status = 1;
                $store->save();
            }
            else{
                $reports = new Reports;
                $reports->status_report = $request->status;
                $reports->description = $request->desc;
                $reports->product_fk = $request->product;
                $reports->store_fk = $request->store_fk;
                $reports->save();
            }

            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function MonitorStocks($id){
        $store_id = Stores::where('user_fk',$id)->first();

        if($store_id){
            
            $data = StoreProduct::join('tbl_product','tbl_product.id','=','tbl_stor_product.product_fk')
                ->selectRaw('tbl_stor_product.status,tbl_stor_product.pcs,tbl_product.product,tbl_product.brand,
                tbl_product.model,tbl_product.serial_num')
                    ->where('tbl_stor_product.store_fk',$store_id->id)
                        ->get();

            return response()->json([
                "status"            =>          200,
                "data"              =>          $data,
            ]);
        }
    }

    public function ProductStoreData($id){
        $store = Stores::where('user_fk',$id)->first();

        if($store){

            $product = StoreProduct::join('tbl_product','tbl_product.id','=','tbl_stor_product.product_fk')
                ->selectRaw('tbl_product.product,tbl_product.brand,tbl_product.model,tbl_stor_product.pcs,tbl_stor_product.status,tbl_stor_product.id,
                tbl_stor_product.product_fk')
                    ->where('tbl_stor_product.store_fk',$store->id)
                        ->get();

            return response()->json([
                "status"            =>          200,
                "data"              =>          $product,
            ]);
        }
    }

    public function TransferBranch(Request $request){

        $data = Stores::where('user_fk',$request->user_fk)->first();

        if($data) {

            $find_product = StoreProduct::where('store_fk',$data->id)
            ->where('product_fk',$request->product_id)->first();

            if($find_product){

                $find_product->pcs = $find_product->pcs - $request->pcs;
                $find_product->update();

                $branch = new BranchToBranch;
                $branch->product_fk = $request->product_id;
                $branch->from_store_fk = $data->id;
                $branch->to_store_fk = $request->to_branch;
                $branch->quantity = $request->pcs;
                $branch->status = 2;
                $branch->save();
    
                return response()->json([
                    "status"            =>          200,
                ]);
            }
        }
    }
    public function GetStoreList($id){
        $data = Stores::join('tbl_store_adr','tbl_store_adr.store_fk','=','tbl_stores.id')
        ->leftjoin('users','users.id','=','tbl_stores.user_fk')
        ->selectRaw('tbl_stores.store_name,tbl_stores.created_at,tbl_stores.id,tbl_store_adr.region,tbl_store_adr.province,
        tbl_store_adr.city,tbl_store_adr.streets,tbl_store_adr.brgy,tbl_store_adr.zipcode,users.first_name,users.middle_name,users.last_name')
            ->where('tbl_stores.user_fk','!=',$id)
            ->orWhereNull('tbl_stores.user_fk')
            ->get();

    return response()->json([
        "status"            =>          200,
        "data"              =>          $data,
    ]);
    }
}
