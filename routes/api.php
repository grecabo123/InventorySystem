<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\LogsController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\ManagerController;
use App\Http\Controllers\API\DashboardController;

Route::post('Login',[AuthController::class, 'Login']);
Route::get('Manager', [ManagerController::class, 'Manager']);

Route::get('GetStore',[AdminController::class, 'GetStore']);

// Logs
Route::get('Logs/{id}',[LogsController::class, 'Logs']);

// Product Monitor


// Admin
Route::middleware(['auth:sanctum', 'isAPIAdmin'])->group(function() {
    Route::get('/checking',function() {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });
    Route::get('TranferMonitor',[AdminController::class, 'TranferMonitor']);
    Route::get('ListEmployee',[AdminController::class ,'ListEmployee']);
    Route::post('RegisterManager',[AdminController::class ,'RegisterManager']);
    Route::put('UpdateStatus',[AdminController::class ,'UpdateStatus']);
    Route::post('CreateStore',[AdminController::class ,'CreateStore']);
    Route::get('ProductDisplay',[AdminController::class, 'ProductDisplay']);
    Route::put('AssignManager',[AdminController::class, 'AssignManager']);
    Route::post('AddProduct',[AdminController::class ,'AddProduct']);
    Route::put('UpdateData',[AdminController::class, 'UpdateData']);
    Route::post('DistributeProduct',[AdminController::class, 'DistributeProduct']);
    Route::get('AllData',[DashboardController::class, 'AllData']);
    Route::get('SalesInformation/{id}',[DashboardController::class, 'SalesInformation']);
    Route::get('ListofSoldItem/{id}',[DashboardController::class, 'ListofSoldItem']);
    Route::get('ListofSoldItemGroup/{id}',[DashboardController::class, 'ListofSoldItemGroup']);
    Route::get('ListofEmployee/{id}',[DashboardController::class, 'ListofEmployee']);
    Route::put('AccountUpdate',[AdminController::class, 'AccountUpdate']);
    Route::put('StoreUpdate',[AdminController::class, 'StoreUpdate']);
    
}); 

Route::middleware(['auth:sanctum', 'isAPIUser'])->group(function() {
    Route::get('/check',function() {
        return response()->json([
            "status"        =>      200,
            "role"          =>      auth()->user()->role,
        ],200);
    });
    Route::get('StoreDetails/{id}',[UserController::class, 'StoreDetails']);
    Route::get('MonitorStocks/{id}',[UserController::class, 'MonitorStocks']);
    Route::get('ProductMonitor/{id}',[UserController::class, 'ProductMonitor']);
    Route::post('AddEmployee',[UserController::class, 'AddEmployee']);
    Route::put('UpdateStatusProduct',[UserController::class, 'UpdateStatusProduct']);
    Route::get('DisplayEmployee/{id}',[UserController::class, 'DisplayEmployee']);
    Route::get('ProductStoreData/{id}',[UserController::class, 'ProductStoreData']);
    Route::put('TransferBranch',[UserController::class, 'TransferBranch']);
    Route::get('GetStoreList/{id}',[UserController::class, 'GetStoreList']);
    Route::get('ProductMonitorList/{id}',[UserController::class, 'ProductMonitorListFrom']);
    Route::get('ProductReceived/{id}',[UserController::class, 'ProductReceived']);
    Route::put('ReceiveApproved',[UserController::class, 'ReceiveApproved']);
    Route::put('SubmitForm',[UserController::class, 'SubmitForm']);
    Route::get('TransactionLogs/{id}',[UserController::class, 'TransactionLogs']);
    Route::get('Dashboard/{id}',[UserController::class, 'Dashboard']);
}); 


Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout',[AuthController::class, 'Logout']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
