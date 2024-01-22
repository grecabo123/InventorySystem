<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\AcitivityLogs;
use App\Models\EmployeeData;
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
        $data = EmployeeData::where('store_fk',$store_id->id)->get();

        return response()->json([
            "status"            =>              200,
            "data"              =>              $data,
        ]);
    }
}
