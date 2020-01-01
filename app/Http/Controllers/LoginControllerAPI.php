<?php

namespace App\Http\Controllers;

use App\User; 
use Illuminate\Http\Request;

define('YOUR_SERVER_URL', 'http://iot.iot');
// Check "oauth_clients" table for next 2 values:
define('CLIENT_ID', '2');
define('CLIENT_SECRET','9lLP4JuS3mQUmVoGc2mJTx4ZYAJsrQxpqCrNulrn');


class LoginControllerAPI extends Controller
{
    public function login(Request $request)
    {
        $http = new \GuzzleHttp\Client;
        $response = $http->post(YOUR_SERVER_URL.'/oauth/token', [
        'form_params' => [
        'grant_type' => 'password',
        'client_id' => CLIENT_ID,
        'client_secret' => CLIENT_SECRET,
        'username' => $request->email,
        'password' => $request->password,
        'scope' => ''
        ],
        'exceptions' => false,
        ]);

        $errorCode= $response->getStatusCode();

        if ($errorCode=='200') {
            return json_decode((string) $response->getBody(), true);
        } else {
            return response()->json(
                ['msg'=>'User credentials are invalid'], $errorCode);
        }
    }

    function register(Request $request)
{
    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $request
     * @return \Illuminate\Contracts\Validation\Validator
     */
    $valid = validator($request->only('email', 'name', 'password'), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:6',
    ]);

    if ($valid->fails()) {
        $jsonError=response()->json($valid->errors()->all(), 400);
        return \Response::json($jsonError);
    }

    $data = request()->only('email','name','password');

    $user = User::create([
        'name' => $data['name'],
        'email' => $data['email'],
        'password' => bcrypt($data['password']),
    ]);

    // And created user until here.

    $client = Client::where('password_client', 1)->first();

    // Is this $request the same request? I mean Request $request? Then wouldn't it mess the other $request stuff? Also how did you pass it on the $request in $proxy? Wouldn't Request::create() just create a new thing?

    $request->request->add([
        'grant_type'    => 'password',
        'client_id'     => $client->id,
        'client_secret' => $client->secret,
        'username'      => $data['email'],
        'password'      => $data['password'],
        'scope'         => null,
    ]);

    // Fire off the internal request. 
    $token = Request::create(
        'oauth/token',
        'POST'
    );
    return \Route::dispatch($token);
}

    public function logout()
    {
        \Auth::guard('api')->user()->token()->revoke();
        \Auth::guard('api')->user()->token()->delete();
        return response()->json(['msg'=>'Token revoked'], 200);
    }
}
