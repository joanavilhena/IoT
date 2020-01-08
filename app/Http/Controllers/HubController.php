<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Hub;

class HubController extends Controller
{

    public function create(Request $request)
    {
        $hub = new Hub();
        $hub->fill($request->all());
        $hub->user_id = $request->user_id;
        $hub->token_hub = $request->token_hub;
        $hub->save();
        
        return response()->json($hub, 201);
    }
    
    // Get all
    public function getAll()
    {
        return  response()->json(Hub::All(), 200);
    }
}
