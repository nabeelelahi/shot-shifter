<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class UserSubscription extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_subscriptions';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'subscription_package_id', 'gateway_transaction_id', 'gateway_original_transaction_id',
        'subscription_expiry_date', 'is_trial_period', 'device_type', 'status', 'created_at', 'updated_at',
        'deleted_at'
    ];

    public static function checkSubscription($original_transaction_id)
    {
        $query = self::where('gateway_original_transaction_id',$original_transaction_id)
                        ->orderBy('id','desc')
                        ->first();
        return $query;
    }

    public static function getUserSubscription($user_id)
    {
        $checkUserSubscription = self::where('user_id',$user_id)
                                      ->orderBy('id','desc')
                                      ->first();
        return $checkUserSubscription;
    }

    public static function addUserSubscription($params)
    {
        $gateway_response = json_decode($params['gateway_response'],true);

        if( $params['device_type'] == 'android' ){
            $data_android =  json_decode($gateway_response['transactionReceipt'],true);
            $gateway_response['transactionId'] = $data_android['orderId'];
            $gateway_response['original_transaction_id'] = $gateway_response['purchaseToken'];
        }
        else{
            $gateway_response['transactionId']           = $gateway_response['transaction_id'];
            $gateway_response['original_transaction_id'] = $gateway_response['original_transaction_id'];
        }
        //get package
        $package = Subscription::where('id',$params['subscription_package_id'])->first();
        // return $package->duration_unit;
        $params['payment_method'] = 'inapp_purchase';
        $params['total_amount']   = $package->amount;

        $query = self::where('user_id',$params['user']['id'])
                    ->where('subscription_package_id',$params['subscription_package_id'])
                    ->count();

        //check trial period
        $is_trial_period = $query == '0' ? '1' : '0';
        if( $is_trial_period == 1  && $package->trial_period > 0){
            $subscription_expiry_date = Carbon::now()->addDays($package->trial_period)->format('Y-m-d H:i:s');
        }else{
            if($package->duration_unit == 'days'){
                $subscription_expiry_date = Carbon::now()->addDays($package['duration'])->format('Y-m-d H:i:s');
            }else if($package->duration_unit == 'week'){
                    $subscription_expiry_date = Carbon::now()->addWeeks($package['duration'])->format('Y-m-d H:i:s');
            }else if($package->duration_unit == 'month'){
                $subscription_expiry_date = Carbon::now()->addMonths($package['duration'])->format('Y-m-d H:i:s');
            }else{
                $subscription_expiry_date = Carbon::now()->addYears($package['duration'])->format('Y-m-d H:i:s');
            }
        }
        self::where('user_id',$params['user']['id'])
            ->where('status','active')
            ->update([
                'status' => 'expired'
            ]);
        //add user subscription data
        $record = self::create([
                'gateway_transaction_id'   => $gateway_response['transactionId'],
                'gateway_original_transaction_id' => $gateway_response['original_transaction_id'],
                'subscription_package_id'  => $params['subscription_package_id'],
                'user_id'                  => $params['user']['id'],
                'subscription_expiry_date' => $subscription_expiry_date,
                'is_trial_period'          => ($package->trial_period == 0) ? '0' : $is_trial_period,
                'status'                   => 'active',
                'device_type'			   => $params['device_type'],
                'created_at'               => Carbon::now(),
            ]);

        //update user expiry date
        User::where('id',$params['user']['id'])
            ->update([
                'subscription_expiry_date' => $subscription_expiry_date
            ]);

        return $record;
    }
}
