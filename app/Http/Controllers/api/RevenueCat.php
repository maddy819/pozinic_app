<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\UsersPlan;

class RevenueCat extends Controller 
{
    public function revenueCatWebHook(Request $request) {
        try {
            $user = User::findOrFail($request->event['original_app_user_id']);

            if(!empty($user)) {
                $userPlan = $user->usersPlan()->get();

                if($request->event['type'] == 'INITIAL_PURCHASE') {
                    $planData = array(
                        'plan_id' => $request->event['product_id'],
                        'plan_start' => date("Y-m-d", $request->event['purchased_at_ms'] / 1000), 
                        'plan_end' => date("Y-m-d", $request->event['expiration_at_ms'] / 1000),
                        'price' => $request->event['price_in_purchased_currency'],
                        'currency' => $request->event['currency'],
                        'status' => 'Active',
                        'cancel_reason' => NULL,
                        'expiration_reason' => NULL,
                        'transaction_id' => $request->event['original_transaction_id'],
                        'type' => $request->event['type'],
                        'store' => $request->event['store'],
                    );

                    if($userPlan->isEmpty()) {
                        return $user->usersPlan()->create($planData);
                    } else {
                        return UsersPlan::where('user_id', $user->id)->update($planData);
                    }
                } 
                
                if($request->event['type'] == 'RENEWAL') {
                    $planData = array(
                        'plan_start' => date("Y-m-d", $request->event['purchased_at_ms'] / 1000), 
                        'plan_end' => date("Y-m-d", $request->event['expiration_at_ms'] / 1000),
                        'price' => $request->event['price_in_purchased_currency'],
                        'currency' => $request->event['currency'],
                        'status' => 'Active',
                        'cancel_reason' => NULL,
                        'expiration_reason' => NULL,
                        'transaction_id' => $request->event['original_transaction_id'],
                        'type' => $request->event['type'],
                        'store' => $request->event['store'],
                    );

                    return UsersPlan::where('user_id', $user->id)->update($planData);
                }

                if($request->event['type'] == 'EXPIRATION') {
                    $planData = array(
                        'status' => 'Expired',
                        'expiration_reason' => $request->event['expiration_reason'],
                        'transaction_id' => $request->event['original_transaction_id'],
                        'type' => $request->event['type']
                    );

                    return UsersPlan::where('user_id', $user->id)->update($planData);
                }

                if($request->event['type'] == 'CANCELLATION') {
                    $planData = array(
                        'status' => 'Canceled',
                        'cancel_reason' => $request->event['cancel_reason'],
                        'transaction_id' => $request->event['original_transaction_id'],
                        'type' => $request->event['type'],
                    );

                    return UsersPlan::where('user_id', $user->id)->update($planData);
                }
            } else {
                throw new Exception("User not found..!!", 404);
            }
            
        } catch(\Illuminate\Database\QueryException $e){ 
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }  
    }

}
