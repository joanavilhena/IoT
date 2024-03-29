<?php

namespace App\Http\Controllers;

use App\Http\Resources\Sensor;
use App\SensorData;
use \Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Resources\SensorDataResources;
use App\Solution;
use App\Hub;

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
        $sensor->threshold =  empty($request->threshold) ? "5" : $request->threshold;
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request->min_value) ? "30" : $request->min_value;
        $sensor->max_value = empty($request->max_value) ? "1000" : $request->max_value;
        $sensor->created_at     = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();

        // Increment the number of sensors
        $solution = Solution::find($sensor->solution_id);
        $solution->sensor_number = ($solution->sensor_number + 1);
        $solution->save();

        return response()->json(new SensorDataResources($sensor), 201);
    }

    // Will updating solution if sensor is missing create
    public function createSensorFromScratch($request, $id)
    {
        $sensor = new SensorData();

        $sensor->name = $request["name"];
        $sensor->solution_id = $id;
        $sensor->value = $request["value"];
        $sensor->threshold =  empty($request["threshold"]) ? "5" : $request["threshold"];
        $sensor->most_recent = 1;
        $sensor->min_value = empty($request["min_value"]) ? "30" : $request["min_value"];
        $sensor->max_value = empty($request["max_value"]) ? "1000" : $request["max_value"];
        $sensor->created_at     = Carbon::now()->toDateTimeString();;
        $sensor->updated_at = Carbon::now()->toDateTimeString();;
        $sensor->save();

        return $sensor;
    }

    // Update will not replace the old one but change the falir (most recent and place a new regist in bd)
    public function update(Request $request)
    {
        try {
            $solution = Solution::where('token', $request->token)->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
        // Update Sensor based On name
        $sensors = SensorData::where('solution_id', $solution->id)->where('name', $request->name);
        $sensors->update(array('most_recent' => 0));
        $sensorCreated = $this->createSensorFromScratch($request, $solution->id);

        return response()->json(new SensorDataResources($sensorCreated), 201);
    }

    public function updateWithToken(Request $request, $token)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
        $sensors = SensorData::where('solution_id', $solution->id)->where('id', $request->id);
        $sensors->update(array('most_recent' => 0));

        try {
            $sensor = SensorData::where('solution_id', $solution->id)->where('id', $request->id)->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return response()->json("No Sensor with that token", 404);
        }
        $sensorCreated = new SensorData();
        $sensorCreated->name =  empty($request->name) ?  $sensor->name : $request->name;
        $sensorCreated->solution_id =  empty($request->solution_id) ?  $sensor->solution_id : $request->solution_id;
        $sensorCreated->value = empty($request->value) ?  $sensor->value : $request->value;
        $sensorCreated->threshold =  empty($request->threshold) ?  $sensor->threshold : $request->threshold;
        $sensorCreated->most_recent = 1;
        $sensorCreated->min_value = empty($request->min_value) ?  $sensor->min_value : $request->min_value;
        $sensorCreated->max_value = empty($request->max_value) ?  $sensor->max_value : $request->max_value;
        $sensorCreated->created_at     = Carbon::now()->toDateTimeString();;
        $sensorCreated->updated_at = Carbon::now()->toDateTimeString();;
        $sensorCreated->save();

        return response()->json(new SensorDataResources($sensorCreated), 201);
    }

    // Delete Sensor Based on name and solution
    public function delete($solution_id, $name)
    {
        $sensor = SensorData::where('solution_id', $solution_id)->where('name', $name)->delete();
        $solution = Solution::find($solution_id);
        $solution->sensor_number = ($solution->sensor_number - 1);
        $solution->save();
        return response()->json(null, 204);
    }

    // Get All
    public function getAllSensors()
    {
        return response()->json(SensorData::All(), 200);
    }

    public function getAllSensorsFromUser($id)
    {
        $hubs = Hub::where('user_id', $id)->get();
        $solutionsID = [];
        foreach ($hubs as $key => $hub) {
            $solution = Solution::where('token_hub', $hub->token_hub)->get();
            foreach ($solution as  $key => $objecto) {
                array_push($solutionsID, $objecto->id);
            }
        }
        if (empty($solutionsID)) {
            $solutionsID = [];
            return response()->json($solutionsID, 404);
        }
        $sensor = [];
        foreach ($solutionsID as  $key => $id) {
            $sensorArray =  SensorData::where("solution_id", $id)->get();
            foreach ($sensorArray as  $key => $objecto) {
                array_push($sensor, $objecto);
            }
        }
        return response()->json(array_unique($sensor), 200);
    }


    // Solution id and Name
    public function getIndividualSensor($solution_id, $name)
    {
        return response()->json(SensorData::where('solution_id', $solution_id)->where('name', $name)->get(), 200);
    }

    // Deprecated - Solution id and Sensor Id 
    public function getIndividualSensorBySolutionAndById($solution_id, $id)
    {
        return response()->json(SensorData::where('solution_id', $solution_id)->where('id', $id)->firstOrFail(), 200);
    }

    // Deprecated - Solution id and Sensor Id 
    public function getIndividualSensorBySolutionTokenAndById($token, $id)
    {
        try {
            $solution = Solution::where('token', $token)->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return response()->json("No Solution with that token", 404);
        }
        return response()->json(SensorData::where('solution_id', $solution->id)->where('id', $id)->firstOrFail(), 200);
    }

    // Get all the Sensors marked as most Recent
    public function getAllMostRecentSensor()
    {
        $sensor = SensorData::where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }



    // Get all the Sensors marked as most Recent BY user (Not optimized at all)
    public function getAllMostRecentSensorFromUser($id)
    {
        $hubs = Hub::where('user_id', $id)->get();
        $solutionsID = [];
        foreach ($hubs as $key => $hub) {
            $solution = Solution::where('token_hub', $hub->token_hub)->get();
            foreach ($solution as  $key => $objecto) {
                array_push($solutionsID, $objecto->id);
            }
        }
        if (empty($solutionsID)) {
            $solutionsID = [];
            return response()->json($solutionsID, 404);
        }
        $sensor = [];
        foreach ($solutionsID as  $key => $id) {
            $sensorArray =  SensorData::where("most_recent", "=", 1)->where("solution_id", $id)->get();
            foreach ($sensorArray as  $key => $objecto) {
                array_push($sensor, $objecto);
            }
        }
        return response()->json(array_unique($sensor), 200);
    }


    // Deprecated - For a given id get the most Recent 
    public function getIndividualMostRecentSensor($id)
    {
        $sensor = SensorData::where('id', $id)->where("most_recent", "=", 1)->get();
        return response()->json($sensor, 200);
    }

    public function getMostRecentSensorDataBySolution($solution_id)
    {
        $sensor = SensorData::where("solution_id", "=", $solution_id)->where("most_recent", "=", 1)->get();

        return response()->json($sensor, 200);
    }
}
