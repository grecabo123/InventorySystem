<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    

    public function Login (Request $request){

        $validate = Validator::make($request->all(), [
            "username"          =>          "required",
            "password"          =>          "required",
        ]);

        if($validate->fails()) {
            return response()->json([
                "status"            =>          501,
                "error"             =>          $validate->messages(),
            ]);
        }
        else{

        }
    }
}
