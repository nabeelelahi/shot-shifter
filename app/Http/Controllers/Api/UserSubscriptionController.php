<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserSubscription;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;

class UserSubscriptionController extends Controller
{

    public function __construct()
    {
        $this->__apiResource = 'Auth';
    }

    public function store(Request $request)
    {
        $param_rule['subscription_package_id'] = 'required|in:1';
        $param_rule['gateway_request']         = 'nullable|json';
        $param_rule['gateway_response']        = 'required|json';
        $param_rule['device_type']             = 'required|in:android,ios';

        $response = $this->__validateRequestParams($request->all(),$param_rule);
        if( $this->__is_error )
            return $response;

            $gateway_response = json_decode($request['gateway_response'],true);

            if( $request['device_type'] == 'android' ){
                $data_android =  json_decode($gateway_response['transactionReceipt'],true);
                $gateway_response['transactionId'] = $data_android['orderId'];
                $gateway_response['original_transaction_id'] = $gateway_response['purchaseToken'];
            }else{
                $gateway_response['transactionId'] = $gateway_response['transaction_id'];
                $gateway_response['original_transaction_id'] = $gateway_response['original_transaction_id'];
            }

            $checkSubscription = UserSubscription::checkSubscription($gateway_response['original_transaction_id']);

            if( isset($checkSubscription->id) )
            {
                if( $checkSubscription->user_id != $request['user']['id'] )
                {
                    if( $request['device_type'] == 'android' )
                        $data['message'] = 'This Google account is already associated with another user.';
                    else
                        $data['message'] = 'This Apple account is already associated with another user.';

                    return $this->__sendError('Error Message',['message' => $data['message']]);
                }

                if( $checkSubscription->gateway_transaction_id != $gateway_response['transactionId'] )
                {
                    $UserSubscription = UserSubscription::addUserSubscription($request->all());

                    $this->__is_collection  = false;
                    $this->__is_paginate    = false;

                    $user = $request['user'];
                    $user->subscription_expiry_date = $UserSubscription->subscription_expiry_date;
                    return $this->__sendResponse($user,200, 'User has been subscribe successfully');
                }

                if( strtotime(date('Y-m-d H:i:s'))  >= strtotime($checkSubscription->subscription_expiry_date) ){

                    \DB::table('user_subscription')
                        ->where('id',$checkSubscription->id)
                        ->update([
                            'status' => 'expired'
                        ]);

                    $data['message'] = 'Your subscription has been expired.';
                    return $this->__sendError('Error Message',['message' => $data['message']]);
                }
                else
                {
                    $this->__is_collection  = false;
                    $this->__is_paginate    = false;

                    $user = User::getUserByEmail($request->user->email);
                    return $this->__sendResponse($user,200, 'You have already subscribed to this package.');
                }

            }
            else
            {
                $UserSubscription = UserSubscription::addUserSubscription($request->all());

                $this->__is_collection  = false;
                $this->__is_paginate    = false;

                $user = $request['user'];
                $user->subscription_expiry_date = $UserSubscription->subscription_expiry_date;

                return $this->__sendResponse($user,200, 'User has been subscribe successfully');
            }
    }
}
