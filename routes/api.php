<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:api')->post('logout', 'LoginControllerAPI@logout');

Route::get('sensors', 'SensorsControllerAPI@index');
Route::get('sensor/{id}', 'SensorsControllerAPI@getSensor');
Route::post('create', 'SensorDataController@create');
Route::patch('update', 'SensorsControllerAPI@update');
Route::delete('delete/{id}', 'SensorsControllerAPI@delete');


// Login

Route::post('login', 'LoginControllerAPI@login');
Route::post('register', 'LoginControllerAPI@register');

// SensorData

// Get
Route::get('sensorData', 'SensorDataController@getAll');
Route::get('sensorData/{id}', 'SensorDataController@getIndividual');

// Post
Route::post('sensorData', 'SensorDataController@create');

// Solutions

// Get
Route::get('solution', 'SolutionsController@getAll');
Route::get('solution/sensorData', 'SolutionsController@getAllWithSensorData');
Route::get('solution/{id}', 'SolutionsController@getIndividual');

// Post
Route::post('solution', 'SolutionsController@create');

