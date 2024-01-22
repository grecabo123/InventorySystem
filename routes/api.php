<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\LogsController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\ManagerController;

Route::post('Login',[AuthController::class, 'Login']);
Route::get('Logs/{id}',[LogsController::class, 'Logs']);
Route::get('Manager', [ManagerController::class, 'Manager']);

// Logs


// Admin
Route::middleware(['auth:sanctum', 'isAPIAdmin'])->group(function() {
    Route::get('/checking',function() {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });
    Route::get('ListEmployee',[AdminController::class ,'ListEmployee']);
    Route::post('AddEmployee',[AdminController::class ,'AddEmployee']);
    Route::put('UpdateStatus',[AdminController::class ,'UpdateStatus']);
    Route::post('CreateStore',[AdminController::class ,'CreateStore']);
    Route::get('GetStore',[AdminController::class, 'GetStore']);
    Route::put('AssignManager',[AdminController::class, 'AssignManager']);
    Route::post('AddProduct',[AdminController::class ,'AddProduct']);
    Route::get('ProductDisplay',[AdminController::class, 'ProductDisplay']);
    Route::put('UpdateData',[AdminController::class, 'UpdateData']);

}); 

Route::middleware(['auth:sanctum', 'isAPIUser'])->group(function() {
    Route::get('/check',function() {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });

    Route::post('AddEmployee',[UserController::class, 'AddEmployee']);
    Route::get('DisplayEmployee/{id}',[UserController::class, 'DisplayEmployee']);
}); 


Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout',[AuthController::class, 'Logout']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
