<?php

namespace App\Utilities;

use App\Mail\{
    DelegationMail
};

use Mail;

class NotificationUtilities
{

    static function sendDelegation($recipient, $application) {
        $recipient = env('MAIL_DUMMY_ADDRESS', $recipient);
        Mail::to($recipient)->send(new DelegationMail($application));
    }
    
}