<?php

namespace App\Http\Controllers;

use App\SensorData; 
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\SensorDataResources;
use App\Solution;

class SensorDataController extends Controller
{
    public function create(Request $request)
    {
        // Create Sensor
        $sensor = new SensorData();
        $sensor->fill($request->all());
        $sensor->name = $request->name;
        $sensor->solution_id = $request->solution_id;
        $sensor->value = $request->value;
        $sensor->threshold =  empty($request->threshold) ? "1000" : $request->threshold;
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request->min_value) ? "0" : $request->min_value ;
        $sensor->max_value = empty($request->max_value) ? "1000" : $request->max_value;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
        
        // Increment the number of sensors
        $solution = Solution::find($sensor->solution_id);
        $solution->sensor_number = ($solution->sensor_number +1);
        $solution->save();

        return response()->json(new SensorDataResources($sensor), 201);
    }

    // Will updating solution if sensor is missing create
    public function createSensorFromScratch( $request, $id){
        $sensor = new SensorData();

        $sensor->name = $request["name"];
        $sensor->solution_id = $id ;
        $sensor->value = $request["value"];
        $sensor->threshold =  empty($request["threshold"]) ? "1000" : $request["threshold"] ;
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request["min_value"]) ? "0" : $request["min_value"] ;
        $sensor->max_value = empty($request["max_value"]) ? "1000" : $request["max_value"] ;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
        
        return $sensor;
    }

    // Update will not replace the old one but change the falir (most recent and place a new regist in bd)
    public function update(Request $request){
        
        // Update Sensor based On name
        $sensors = SensorData::where('solution_id', $request->solution_id)->where('name', $request->name);
        $sensors->update(array('most_recent' => 0));
        $sensorCreated = $this->createSensorFromScratch($request, $request->solution_id);
         
        return response()->json(new SensorDataResources($sensorCreated), 201);
    }

    // Delete Sensor Based on name and solution
    public function delete($solution_id, $name)
    {
        $sensor = SensorData::where('solution_id', $solution_id)->where('name', $name)->delete();
        $solution = Solution::find($solution_id);
        $solution->sensor_number = ($solution->sensor_number -1);
        $solution->save();
        return response()->json(null, 204);
    }
    
    // Get All
    public function getAllSensors(){
        return response()->json(SensorData::All(), 200);
    }

    // Solution id and Name
    public function getIndividualSensor($solution_id, $name){
        return response()->json(SensorData::where('solution_id',$solution_id)->where('name',$name)->get(), 200);
    }

    // Deprecated - Solution id and Sensor Id 
    public function getIndividualSensorBySolutionAndById($solution_id, $id){
        return response()->json(SensorData::where('solution_id',$solution_id)->where('id',$id)->firstOrFail(), 200);
    }

    // Get all the Sensors marked as most Recent
    public function getAllMostRecentSensor(){
        $sensor = SensorData::where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }

    // Deprecated - For a given id get the most Recent 
    public function getIndividualMostRecentSensor($id){
        $sensor = SensorData::where('id',$id)->where("most_recent", "=", 1)->get();
        return response()->json( $sensor, 200);
    }

    public function getMostRecentSensorDataBySolution($solution_id){
        $sensor = SensorData::where("solution_id", "=", $solution_id)->where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }
}
