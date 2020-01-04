<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;

use App\SensorData;
use App\Solution;
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\SolutionResources;

class SolutionsController extends Controller
{

    public function create(Request $request)
    {

        /*$request->validate([
            'name' => 'required|min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'required|ipv4',
            'value' => 'required',
            
        ]);*/

        // Shearch if it exists if it does update, if it dosn´t create
        try {
            $solution = Solution::where('token', $request->token)->firstOrFail();
            $solution->fill($request->all());
            $solution->sensor_number = count($request->sensorData);
            $solution->save();
        } catch (ModelNotFoundException $e) {
            return $this->createSolutionFromScratch($request);
        }

        foreach ($request->sensorData as $key => $sensorIndividual) {
            try {
                $sensors = SensorData::where('solution_id', $solution->id)->where('name', $sensorIndividual["name"]);
                $sensors->update(array('most_recent' => 0));
                app('App\Http\Controllers\SensorDataController')->createSensorFromScratch($sensorIndividual, $solution->id);
            } catch (ModelNotFoundException $e) {
                app('App\Http\Controllers\SensorDataController')->createSensorFromScratch($sensorIndividual, $solution->id);
            }
        }

        return response()->json(new SolutionResources($solution), 201);
    }

    public function createWithoutSensors(Request $request)
    {

        /*$request->validate([
            'name' => 'required|min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'required|ipv4',
            'value' => 'required',
            
        ]);*/

        try {
            $solution = Solution::where('token', $request->token)->firstOrFail();
            $solution->fill($request->all());
            $solution->save();
        } catch (ModelNotFoundException $e) {
            $solution = new Solution();
            $solution->fill($request->all());
            $solution->user_id = "51";
            $solution->vip = $request->vip;
            $solution->token = $request->token;
            $solution->state = $request->state;
            $solution->sensor_number = 0;
            $solution->created_at = Carbon::now()->toDateTimeString();;
            $solution->updated_at = Carbon::now()->toDateTimeString();;
            $solution->save();
        }

        
        return response()->json(new SolutionResources($solution), 201);
    }

    public function createSolutionFromScratch($request)
    {

        $solution = new Solution();
        $solution->fill($request->all()); // Fill the Details
        $solution->user_id = "51";
        $solution->vip = $request->vip;
        $solution->token = $request->token;
        $solution->state = $request->state;
        $solution->sensor_number = count($request->sensorData);
        $solution->created_at = Carbon::now()->toDateTimeString();
        $solution->updated_at = Carbon::now()->toDateTimeString();

        $solution->save();


        foreach ($request->sensorData as $key => $sensorIndividual) {
            $sensor = new SensorData();
            $sensor->fill($request->all());

            // Fill the Details
            $sensor->name =  $sensorIndividual["name"]; //$value.name ? "": "";
            $sensor->solution_id = $solution->id;
            $sensor->value = $sensorIndividual["value"];
            $sensor->min_value = $sensorIndividual["min_value"];
            $sensor->max_value = $sensorIndividual["max_value"];
            $sensor->most_recent = 1;
            $sensor->created_at = Carbon::now()->toDateTimeString();
            $sensor->updated_at = Carbon::now()->toDateTimeString();
            $sensor->save();
        }
        return response()->json(new SolutionResources($solution), 201);
    }

    public function update(Request $request)
    {

        /* $request->validate([
            'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'ipv4',
        ]);*/

        $solution = Solution::where('token', $request->token)->firstOrFail();
        $solution->update($request->all());
        $solution->user_id = "51";
        $solution->vip = $request->vip;
        $solution->token = $request->token;
        $solution->state = $request->state;
        $solution->save();

        return response()->json($solution, 200);
    }

    public function delete($token)
    {
        /* $request->validate([
            'name' => 'min:3|regex:/^[A-Za-záàâãéèêíóôõúçÁÀÂÃÉÈÍÓÔÕÚÇ ]+$/',
            'ip' => 'ipv4',
        ]);*/

        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->delete();
        return response()->json(null, 204);
    }


    public function getAll()
    {
        return  response()->json(Solution::All(), 200);
    }

    public function getAllWithSensorData()
    {
        return response()->json(SolutionResources::collection(Solution::All()), 200);
    }

    public function getIndividual($id)
    {
        //return response()->json(new SolutionResources(Solution::where('id', $id)->first()), 200);
        return response()->json(Solution::where('id', $id)->first(), 200);
    }

    public function getSolutionFromUser($user_id)
    {
        //return response()->json(new SolutionResources(Solution::where('id', $id)->first()), 200);
        return response()->json(Solution::where('user_id', $user_id)->get(), 200);
    }
}
