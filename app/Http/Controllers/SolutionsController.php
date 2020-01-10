<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;

use App\SensorData;
use App\Solution;
use App\User;
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\SolutionResources;
use App\Hub;

class SolutionsController extends Controller
{
    // Create new Solution, if it exists Update
    public function create(Request $request)
    {
        // Does it existe?
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

    // Create a solution with no sensors  
    public function createWithoutSensors(Request $request)
    {
        // Does it existe?
        try {
            $solution = Solution::where('token', $request->token)->firstOrFail();
            $solution->fill($request->all());
            $solution->save();
        } catch (ModelNotFoundException $e) {
            $solution = new Solution();
            $solution->fill($request->all());
            $solution->user_id = empty($request->user_id) ? -1 : $request->user_id;
            $solution->vip = empty($request->vip) ? 0 : $request->vip;
            $solution->token = $request->token;
            $solution->token_hub = $request->token_hub;
            $solution->terra = empty($request->terra) ? "Humida" : $request->terra;
            $solution->water_percentage =  empty($request->water_percentage) ? 1 : $request->water_percentage;
            $solution->fan_force =  empty($request->fan_force) == true ? 0 : $request->fan_force;
            $solution->water_force =  empty($request->water_force) == true ? 0 : $request->water_force;
            $solution->sensor_number = 0;
            $solution->created_at = Carbon::now()->toDateTimeString();;
            $solution->updated_at = Carbon::now()->toDateTimeString();
            $solution->save();
        }
        return response()->json(new SolutionResources($solution), 201);
    }

    public function createSolutionFromScratch($request)
    {
        $solution = new Solution();
        $solution->fill($request->all()); // Fill the Details
        $solution->user_id = empty($request->user_id) == true ? -1 : $request->user_id;
        $solution->vip = $request->vip;
        $solution->token = $request->token;
        $solution->token_hub = $request->token_hub;
        $solution->terra = empty($request->terra) == true ? "Humida" : $request->terra;
        $solution->water_percentage =  empty($request->water_percentage) ? 1 : $request->water_percentage;
        $solution->fan_force =  empty($request->fan_force) == true ? 0 : $request->fan_force;
        $solution->water_force =  empty($request->water_force) == true ? 0 : $request->water_force;
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
            $sensor->value = empty($sensorIndividual["value"]) ? 0 : $sensorIndividual["value"];
            $sensor->threshold = empty($sensorIndividual["threshold"]) ? 5 : $sensorIndividual["threshold"];
            $sensor->min_value = empty($sensorIndividual["min_value"]) ? 0 : $sensorIndividual["min_value"];
            $sensor->max_value = empty($sensorIndividual["max_value"]) ? 1000 : $sensorIndividual["max_value"];
            $sensor->most_recent = 1;
            $sensor->created_at = Carbon::now()->toDateTimeString();
            $sensor->updated_at = Carbon::now()->toDateTimeString();
            $sensor->save();
        }
        return response()->json(new SolutionResources($solution), 201);
    }

    public function update(Request $request)
    {
        $solution = Solution::where('token', $request->token)->firstOrFail();
        $solution->update($request->all());
        $solution->user_id = empty($request->user_id) == true ? -1 : $request->user_id;
        $solution->vip = $request->vip;
        $solution->token = $request->token;
        $solution->token_hub = $request->token_hub;
        $solution->terra = empty($request->terra) == true ? "Humida" : $request->terra;
        $solution->water_percentage =  empty($request->water_percentage) ? 1 : $request->water_percentage;
        $solution->fan_force =  empty($request->fan_force) == true ? 0 : $request->fan_force;
        $solution->water_force =  empty($request->water_force) == true ? 0 : $request->water_force;
        $solution->save();

        return response()->json($solution, 200);
    }

    public function delete($token)
    {

        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->delete();
        return response()->json(null, 204);
    }

    public function forceFan($token)
    {
        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->fan_force = 1;
        $solution->save();
        sleep(15);
        $solution->fan_force = 0;
        $solution->save();
        return  response()->json($solution, 200);
    }

    public function forceWater($token)
    {
        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->water_force = 1;
        $solution->save();
        sleep(15);
        $solution->water_force = 0;
        $solution->save();
        return  response()->json($solution, 200);
    }


    public function updateFanForce(Request $request, $token)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
            return response()->json($solution, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
        $solution->fan_force = $request->fan_force;
        $solution->save();
        return  response()->json(Solution::All(), 200);
    }

    public function updateWaterForce(Request $request, $token)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
            return response()->json($solution, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
        $solution->water_force = $request->water_force;
        $solution->save();
        return  response()->json($solution, 200);
    }


    public function updateWater($token, $percentage)
    {
        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->water_percentage = ($solution->water_percentage - $percentage) < 0 ? 0 : $solution->water_percentage - $percentage;
        $solution->save();
        return  response()->json($solution, 200);
    }

    public function addSolutionToUser($id, $token)
    {
        $solution = Solution::where('token', $token)->firstOrFail();
        $solution->user_id = $id;
        $solution->save();
        return  response()->json($solution, 200);
    }

    // Get all
    public function getAll()
    {
        return  response()->json(Solution::All(), 200);
    }

    // Get All with sensorData
    public function getAllWithSensorData()
    {
        return response()->json(SolutionResources::collection(Solution::All()), 200);
    }

    // Get Solutions with sensorData by Token
    public function getByTokenWithSensorData($token)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
            return response()->json(SolutionResources::make($solution), 200);
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
    }

    // Get solution by token
    public function getIndividualByToken($token)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
            return response()->json($solution, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
    }

    // Get All solution from respectiv user
    public function getSolutionFromUser($user_id)
    {
        return response()->json(Solution::where('user_id', $user_id)->get(), 200);
    }

    public function getHubFromUser($id)
    {
        $hubs = Hub::where('user_id', $id)->get();
        $solutions = [];
        foreach ($hubs as $key => $hub) {
            $solution = Solution::where('token_hub', $hub->token_hub)->get();
            foreach ($solution as  $key => $objecto) {
                array_push($solutions, $objecto);
            }
        }
        if (empty($solutions)) {
            $solutions = [];
            return response()->json($solutions, 404);
        }
        return response()->json(array_unique($solutions), 200);
    }

    public function getSolutionWithHubToken($hub_token)
    {
        return response()->json(Solution::where('token_hub', $hub_token)->get(), 200);
    }

    // Deprecated
    public function getIndividual($id)
    {
        try {
            $solution = Solution::where('id', $id)->firstOrFail();
            return response()->json($solution, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that id", 404);
        }
    }
}
