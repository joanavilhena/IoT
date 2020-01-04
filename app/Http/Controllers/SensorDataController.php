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
        /*$request->validate([
            'name' => 'required|min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'required|ipv4',
            'value' => 'required',
            
        ]);*/
        
        $sensor = new SensorData();
        $sensor->fill($request->all());

        $sensor->name = $request->name;
        $sensor->solution_id = $request->solution_id;
        $sensor->value = $request->value;
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request->min_value) ? "0" : $request->min_value ;
        $sensor->max_value = empty($request->max_value) ? "1000" : $request->max_value;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
        return response()->json(new SensorDataResources($sensor), 201);
    }

    // Update will not replace the old one but change the falir (most recent and place a new regist in bd)
    public function update(Request $request){
    
        /* $request->validate([
             'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
             'ip' => 'ipv4',
         ]);*/
        
        $sensors = SensorData::where('solution_id', $request->solution_id)->where('name', $request->name);
        $sensors->update(array('most_recent' => 0));
        $sensorCreated = $this->createSensorFromScratch($request, $request->solution_id);
         
        return response()->json(new SensorDataResources($sensorCreated), 201);
    }

    public function createSensorFromScratch( $request, $id){
        $sensor = new SensorData();

        $sensor->name = $request["name"];
        $sensor->solution_id = $id ;
        $sensor->value = $request["value"];
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request["min_value"]) ? "0" : $request["min_value"] ;
        $sensor->max_value = empty($request["max_value"]) ? "1000" : $request["max_value"] ;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
        return $sensor;
    }

    public function delete($solution_id, $name)
    {
       /* $request->validate([
            'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'ipv4',
        ]);*/
        $sensor = SensorData::where('solution_id', $solution_id)->where('name', $name)->delete();
        $solution = Solution::find($solution_id);
        $solution->sensor_number = ($solution->sensor_number -1);
        $solution->save();
        return response()->json(null, 204);
    }
    
    public function getAllSensors(){
        return response()->json(SensorData::All(), 200);
    }

    public function getIndividualSensor($solution_id, $name){
        return response()->json(SensorData::where('solution_id',$solution_id)->where('name',$name)->get(), 200);
    }

    public function getIndividualSensorBySolutionAndById($solution_id, $id){
        return response()->json(SensorData::where('solution_id',$solution_id)->where('id',$id)->firstOrFail(), 200);
    }

    public function getAllMostRecentSensor(){
        $sensor = SensorData::where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }

    public function getIndividualMostRecentSensor($id){
        $sensor = SensorData::where('id',$id)->where("most_recent", "=", 1)->get();
        return response()->json( $sensor, 200);
    }

    public function getMostRecentSensorDataBySolution($id){
        $sensor = SensorData::where("solution_id", "=", $id)->where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }
}
