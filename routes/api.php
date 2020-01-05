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
/*
Route::get('sensors', 'SensorsControllerAPI@index');
Route::get('sensor/{id}', 'SensorsControllerAPI@getSensor');
Route::post('create', 'SensorDataController@create');
Route::patch('update', 'SensorsControllerAPI@update');*/
Route::delete('delete/{id}', 'SensorsControllerAPI@delete');


// ---------- Login ----------

Route::post('login', 'LoginControllerAPI@login');
Route::post('register', 'UserControllerApi@store');


Route::post('login', 'LoginControllerAPI@login');
 
Route::middleware('auth:api')->post('logout', 'LoginControllerAPI@logout');

// ---------- SensorData ----------

// Get

// All sensors marked as most recent
Route::get('sensorData', 'SensorDataController@getAllMostRecentSensor');
//Route::get('sensorData/{id}', 'SensorDataController@getIndividualMostRecentSensor');


// All the Sensors 
Route::get('sensorData/history', 'SensorDataController@getAllSensors');
Route::get('sensorData/history/solution/{id}/sensor/{name}', 'SensorDataController@getIndividualSensor');

Route::get('sensorData/solution/{solution_id}/sensor/{id}', 'SensorDataController@getIndividualSensorBySolutionAndById');


// Sensor By solution
Route::get('sensorData/solution/{id}', 'SensorDataController@getMostRecentSensorDataBySolution');

// Post
Route::post('sensorData', 'SensorDataController@create');
Route::post('sensorData/update', 'SensorDataController@update');
Route::post('sensorData/delete/solution/{id}/sensor/{name}', 'SensorDataController@delete');




// ---------- Solutions ----------

// Get
Route::get('solution', 'SolutionsController@getAll');
Route::get('solution/sensorData', 'SolutionsController@getAllWithSensorData');
Route::get('solution/{id}', 'SolutionsController@getIndividual');


Route::get('solution/user/{user_id}', 'SolutionsController@getSolutionFromUser');

// Post
Route::post('solution', 'SolutionsController@create');
Route::post('solution/simple', 'SolutionsController@createWithoutSensors');
Route::post('solution/update', 'SolutionsController@update');
Route::post('solution/delete/{id}', 'SolutionsController@delete');


Route::post('solution/force/water/{token}', 'SolutionsController@forceWater');
Route::post('solution/force/fan/{token}', 'SolutionsController@forceFan');