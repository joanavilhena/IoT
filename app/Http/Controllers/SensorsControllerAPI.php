<?php

namespace App\Http\Controllers;

use App\Sensor;
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\Sensor as SensorResource;

class SensorsControllerAPI extends Controller
{
    public function index(){

        return SensorResource::collection(Sensor::paginate(10));
  
    }

    public function getSensor($id)
    {
        return new SensorResource(Sensor::where('id',$id)->first());
    }

    public function create(Request $request){
     
        $request->validate([
            'name' => 'required|min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'required|ipv4',
            'value' => 'required',
            
        ]);
     
        $sensor = new Sensor();
        $sensor->fill($request->all());

        $sensor->state = 1;
        $sensor->vip = 0;
        $sensor->minVal = $request->minValue;
        $sensor->maxVal = $request->maxValue;
        $sensor->save();
        //return response()->json($request);
        return response()->json(new SensorResource($sensor), 201);
    }


    public function update(Request $request){
    
        $request->validate([
            'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'ipv4',
        ]);
        
        $sensor = Sensor::findOrFail($request->id);
        
        $sensor->update($request->all());
        $sensor->save();
        //return response()->json($request);
        return response()->json(new SensorResource($sensor), 200);
      
    }

    public function delete($id)
    {
       
        $sensor = Sensor::findOrFail($id);
        $sensor->delete();
        return response()->json(null, 204);
    }
}
