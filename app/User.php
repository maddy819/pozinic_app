<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Twilio\Rest\Client;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'user_type', 'password', 'mobile', 'gender', 'age', 'state', 'constituency', 'city', 'voter_id', 'member_before', 'approved'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'phone_verified_at' => 'datetime',
    ];

    public static function sendAndUpdateOtp($user) {
        $otp = rand(100000, 999999);
        $data = array(
            "Account" => array(
                'User' => "Charanjeet",
                "Password" => "123@charanjeet",
                'SenderId' => "AALERT",
                "Channel" => "Trans",
                "DCS" => "0",
                "flashsms" => "0",
                "route" => "4",
                "SchedTime" => NULL,
                "GroupId" => NULL,
            ),
            'Messages' => array(
                ['Number' => $user->mobile, 'Text' => "Your JDU App One Time Password is ".$otp],
            )
        );

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "http://sms.mishtel.net/api/mt/SendSMS",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_HTTPHEADER => array(
                "content-type: application/json",
            ),
            CURLOPT_POSTFIELDS => json_encode($data)
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);
        $response = json_decode($response,true);
        if($response['ErrorMessage'] == "Done") {
            $res1 = self::where('id', $user->id)->update(['otp' => $otp]);
            return true;
        } else {
            return true;
        }
    }
}
