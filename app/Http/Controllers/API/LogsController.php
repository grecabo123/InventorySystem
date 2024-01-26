<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Models\AcitivityLogs;
use App\Http\Controllers\Controller;

class LogsController extends Controller
{
    //

    public function Logs($id){

        $data = AcitivityLogs::where('user_fk',$id)
        ->orderBy('created_at','DESC')->get();

        return response()->json([
            "status"                =>              200,
            "data"                  =>              $data,
        ]);
    }
}
