<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
use Exception;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;

class JwtMiddleware extends BaseMiddleware
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            
            // if(count($user->plans) <= 0) {
            //     return response()->json(['success' => false, 'message' => 'No subscription found for the user..!!'], 402);
            // } 

            // if($user->plans->last()->pivot->plan_end == date('Y-m-d')) {
            //     return response()->json(['success' => false, 'message' => 'Your '.$user->plans->last()->name.' plan is expired on '.date("F j, Y", strtotime($user->plans->last()->pivot->plan_end)).'. Please Renew it to continue..!!' ], 402);
            // }
        } catch (Exception $e) {
            if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException){
                return response()->json(['success' => false, 'message' => $e->getMessage()], 403);
            } else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException){
			    return response()->json(['status' => false, 'message' => $e->getMessage()], 401);
		    } else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenBlacklistedException){
			    return response()->json(['status' => false, 'message' => $e->getMessage()], 400);
		    } else{
                return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
            }
        }

        return $next($request);
    }
}