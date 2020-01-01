<?php

namespace App\Http\Controllers;

use App\SensorData; 
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\SensorDataResources;

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
        $sensor->min_value = $request->min_value;
        $sensor->max_value = $request->max_value;
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
         $this->createSensorFromScratch($request, $$request->solution_id);
    }

    public function createSensorFromScratch( $request, $id){
        $sensor = new SensorData();

        $sensor->name = $request->name;
        $sensor->solution_id = $id;
        $sensor->value = $request->value;
        $sensor->most_recent = 1;
        $sensor->min_value = $request->min_value;
        $sensor->max_value = $request->max_value;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
    }

    public function delete($id)
    {
       /* $request->validate([
            'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'ipv4',
        ]);*/

        $sensor = SensorData::findOrFail($id);
        $sensor->delete();
        return response()->json(null, 204);
    }
    
    public function getAll(){
        return response()->json(SensorData::All(), 201);
    }

    public function getIndividual($id){
        return response()->json(new SensorDataResources(SensorData::where('id',$id)->first()), 201);
    }
}
