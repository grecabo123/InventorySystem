<?php

namespace App\Http\Controllers\API;

use App\Models\AcitivityLogs;
use App\Models\Products;
use App\Models\ProductTravel;
use App\Models\StoreProduct;
use App\Models\Stores;
use App\Models\StoresAddress;
use App\Models\User;
use App\Models\Address;
use App\Models\Barangay;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function RegisterManager (Request $request) {

        $validator = Validator::make($request->all(), [
            "fname"                 =>          "required",
            // "mname"                 =>          "required",
            "lname"                 =>          "required",
            "email"                 =>          "required|unique:users,email|email",
            "username"              =>          "required",
            "region"                =>          "required",
            "province"              =>          "required",
            "city"                  =>          "required",
            "street"                =>          "required",
            "brgy"                  =>          "required",
            "zip"                   =>          "required",
        ]);

        if($validator->fails()) {
            return response()->json([
                "error"         =>          $validator->messages(),
            ]);
        }
        else{
            $user = new User;
            
            $user->first_name  = $request->fname;
            $user->middle_name  = $request->mname;
            $user->last_name  = $request->lname;
            $user->email  = $request->email;
            $user->username  = $request->username;
            $user->secret  = $request->username;
            $user->role  = $request->role == 2 ? 2 : 3;
            $user->status = 1;
            $user->password = Hash::make($request->username);
            $user->save();

            $brgy = new Barangay;
            $brgy->brgy_name = $request->brgy;
            $brgy->user_brgy_fk = $user->id;
            $brgy->save();

            $address = new Address;
            $address->zipcode = $request->zip;
            $address->city = $request->city;
            $address->streets = $request->street;
            $address->region = $request->region;
            $address->province = $request->province;
            $address->user_adr_fk = $user->id;

            $address->save();

            return response()->json([
                "status"            =>          200,
            ]);
        }        
    }

    public function ListEmployee () {

        $data = User::join('tbl_brgy','tbl_brgy.user_brgy_fk','=','users.id')
            ->join('tbl_address','tbl_address.user_adr_fk','=','users.id')
                ->selectRaw('users.id,users.first_name,users.middle_name,users.status,users.email,users.last_name,users.username,
                tbl_brgy.brgy_name,tbl_address.zipcode,tbl_address.city,tbl_address.streets,tbl_address.region,
                tbl_address.province')
                    ->where('role',2)
                        ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function UpdateStatus (Request $request) {

        $data = User::find($request->id);
        if($data){
            $data->status = $request->status == 1 ? 0 : 1;

            $data->update();

            return response()->json([
                "status"                =>          200,
            ]);
        }
    }

    public function CreateStore(Request $request){

        $validate = Validator::make($request->all(), [
            "branch"                =>          "required",
            "region"                =>          "required",
            "province"              =>          "required",
            "city"                  =>          "required",
            "streets"               =>          "required",
            "brgy"                  =>          "required",
            "zipcode"               =>          "required",
        ]);

        if($validate->fails()) {
            return response()->json([
                "error"             =>      $validate->messages(),
            ]);
        }
        else{
            $store = new Stores;

            $store->store_name = $request->branch;
            $store->save();

            $store_adr = new StoresAddress;
            $store_adr->region = $request->region;
            $store_adr->province = $request->province;
            $store_adr->city = $request->city;
            $store_adr->streets = $request->streets;
            $store_adr->brgy = $request->brgy;
            $store_adr->zipcode = $request->zipcode;
            $store_adr->store_fk = $store->id;
            $store_adr->save();

            $logs = new AcitivityLogs;
            $logs->desc = "Create Store"." ".$request->branch;
            $logs->user_fk = $request->user_fk;
            $logs->save();

            return response()->json([
                "status"            =>          200,

            ]);
        }
    }

    public function GetStore(){
        $data = Stores::join('tbl_store_adr','tbl_store_adr.store_fk','=','tbl_stores.id')
            ->leftjoin('users','users.id','=','tbl_stores.user_fk')
            ->selectRaw('tbl_stores.store_name,tbl_stores.created_at,tbl_stores.id,tbl_store_adr.region,tbl_store_adr.province,
            tbl_store_adr.city,tbl_store_adr.streets,tbl_store_adr.brgy,tbl_store_adr.zipcode,users.first_name,users.middle_name,users.last_name')
                ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }
    public function AssignManager(Request $request){
        // $data = 

        $user = User::where('email',$request->name)->first();

        // $user = User::select('*')->whereIn('email',explode(',',$request->name))->pluck('id');
        $data = Stores::find($request->store_id);

        if($data){
            $data->user_fk = $user->id;
            $data->update();
            return response()->json([
                "status"            =>          200,
            ]);
        }
    }

    public function AddProduct(Request $request){
        
        $product = new Products;

        $product->product = $request->product;
        $product->brand = $request->brand;
        $product->model = $request->model;
        $product->description = $request->desc;
        $product->quantity = $request->pcs;
        $product->price = $request->price;
        $product->serial_num = $request->serial;
        $product->status = 1;

        if($request->hasFile('files')){
            $file = $request->file('files');
            $extension = $file->getClientOriginalExtension();
            $filename = md5(time()).".".$extension;
            $file->move('Uploads/Files/',$filename);
            $product->image =  "Uploads/Files/".$filename;                
        }

        $product->save();

        return response()->json([
            "status"                =>          200,
        ]);

    }

    public function ProductDisplay() {
        $data = Products::all();

        return response()->json([
            "status"                =>          200,
            "data"                  =>          $data,
        ]);
    }

    public function UpdateData (Request $request) {
        $data = Products::find($request->id);

        if($data){
            $data->product = $request->product;
            $data->brand = $request->brand;
            $data->model = $request->model;
            $data->serial_num = $request->serial_num;
            $data->quantity = $request->quantity;
            $data->price = $request->price;
            $data->update();
            return response()->json([
                "status"            =>          200,
            ]);
        }
    }
    public function DistributeProduct(Request $request){
        $product = Products::find($request->product_id);
        if($product){
            $product->quantity = $product->quantity - $request->pcs;
            $product->update();

            $store_product = ProductTravel::where('product_fk',$request->product_id)
                ->where('store_fk',$request->store_id)
                ->whereNotIn('status', [1, 3])
                    ->first();
            if($store_product){
                $store_product->quantity = $store_product->quantity + $request->pcs;
                $store_product->update();
            }
            else{
                $new_product = new ProductTravel;
                $new_product->description = $request->description;
                $new_product->store_fk = $request->store_id;
                $new_product->product_fk = $request->product_id;
                $new_product->quantity = $request->pcs;
                $new_product->status = 2;
                $new_product->type_of_request = 2;
                $new_product->save();
            }
            $logs = new AcitivityLogs;
            $logs->desc = "Distribute Item". " ".$product->product. " "."To". " ".$request->store_name." ".$request->pcs;
            $logs->user_fk = $request->user_fk;
            $logs->save();

            return response()->json([
                "status"            =>          200,
            ]);
        }
    }
    public function TranferMonitor(){

        $data = ProductTravel::join('tbl_employee','tbl_employee.store_fk','=','tbl_product_travel.store_fk')
            ->join('tbl_product','tbl_product.id','=','tbl_product_travel.product_fk')
                ->join('tbl_stores','tbl_stores.id','=','tbl_product_travel.store_fk')
                    ->selectRaw('tbl_product_travel.status,tbl_product_travel.type_of_request,tbl_product_travel.description,
                    tbl_employee.employee,tbl_product.product,tbl_product_travel.created_at,
                    tbl_stores.store_name,tbl_product_travel.quantity')
                    ->where('tbl_employee.role', 4)
                        ->where('tbl_product_travel.status',2)
                        ->get();

        return response()->json([
            "status"            =>          200,
            "data"              =>          $data,
        ]);
    }

    public function AccountUpdate(Request $request){

        $user_find = User::find($request->user_id);
        $brgy = Barangay::where('user_brgy_fk',$request->user_id)->first();
        $address = Address::where('user_adr_fk',$request->user_id)->first();

        if($user_find && $brgy && $address){
            $user_find->first_name = $request->fname;
            $user_find->middle_name = $request->mname;
            $user_find->last_name = $request->lname;
            $user_find->email = $request->email;
            $user_find->username = $request->username;
            $user_find->password = Hash::make($request->password);
            $user_find->update();

            $brgy->brgy_name = $request->brgy;
            $brgy->update();

            $address->zipcode = $request->zip;
            $address->city = $request->city;
            $address->streets = $request->street;
            $address->region = $request->region;
            $address->province = $request->province;
            $address->update();

            $logs = new AcitivityLogs;
            $logs->desc = "Account Updated"." ".$request->email;
            $logs->user_fk = $request->user_fk;
            $logs->save();

            return response()->json([
                "status"                =>          200,
            ]);

        }
    }
}