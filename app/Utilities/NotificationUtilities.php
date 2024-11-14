<?php

namespace App\Utilities;

use App\Mail\{
    DelegationMail,
    ApprovalMail,
    RejectMail,
    AcceptMail,
};

use Mail;

class NotificationUtilities
{

    static function sendProcess($application) {
        $recipient = null;
        $mail = null;

        switch ($application->status) {
            case 1:
                $recipient = env('MAIL_DUMMY_ADDRESS', $application->current->email);
                $mail = new DelegationMail($application);
                break;
            case 2:
            case 3:
                $recipient = env('MAIL_DUMMY_ADDRESS', $application->current->email);
                $mail = new ApprovalMail($application);
                break;
            case 0:
                $recipient = env('MAIL_DUMMY_ADDRESS', $application->requester->email);
                $mail = new RejectMail($application);
                break;
            case 99:
                $recipient = env('MAIL_DUMMY_ADDRESS', $application->requester->email);
                $mail = new AcceptMail($application);
                break;
        }

        if ($recipient && $mail) {
            Mail::to($recipient)->send($mail);
        }
    }
    
}