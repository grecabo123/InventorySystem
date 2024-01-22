<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
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
            $user = User::where('email',$request->username)->first();
            if($user || Hash::check($request->password, $user->password)){   
                if($user->status == 1){
                    // Admin
                    if($user->role == 1){
                        $token = $user->createToken($user->email.'_Admin',['server:admin'])->plainTextToken;
                    }
                    else{
                        // user
                        $token = $user->createToken($user->email.'_User',['server:manager'])->plainTextToken;
                    }
                    return response()->json([
                        "status"            =>      200,
                        "role"              =>      $user->role,
                        "id"                =>      $user->id,
                        "token"             =>      $token,
                        "name"              =>      $user->name_user,
                        "message"           =>      "Logged In Successfuly",
                    ]);
                }
                else{
                    // check if the account is not verified
                    return response()->json([
                        "status"        =>          501,
                        "message"       =>          "Your Account is not verified",
                    ]);
                }
            }
            else{
                // Wrong input credintials
                return response()->json([
                    "status"        =>          504,
                    "message"       =>          "Wrong Credintials",
                ]);
                
            }
        }
    }

    public function Logout(){
        auth()->user()->tokens()->delete();

        return response()->json([
            "status"        =>      200,
            'message'       =>      "Logout Successfully",
        ]);
    }
}
