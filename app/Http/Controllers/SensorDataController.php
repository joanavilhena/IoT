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

        $sensor->name = "Oxigenio";
        $sensor->solution_id = 1;
        $sensor->state = 1;
        $sensor->value = 50;
        $sensor->most_recent = 1;
        $sensor->min_value = 10;
        $sensor->max_value = 100;
        $sensor->created_at	 = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();
        return response()->json(new SensorDataResources($sensor), 201);
    }

    public function update(Request $request){
    
        /* $request->validate([
             'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
             'ip' => 'ipv4',
         ]);*/
         
         $sensor = SensorData::findOrFail($request->id);
         
         $sensor->update($request->all());
         $sensor->save();
 
         return response()->json(new SolutionResources($sensor), 200);
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
