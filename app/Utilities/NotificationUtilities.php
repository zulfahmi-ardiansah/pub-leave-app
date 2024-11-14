<?php

namespace App\Utilities;

use App\Mail\{
    DelegationMail,
    ApprovalMail,
    RejectMail,
    AcceptMail,
};

use Twilio\Rest\Client;

use Mail, Log;

class NotificationUtilities
{

    static function sendProcess($application) {
        try {
            $whatsappRecipient = null;
            $whatsappMessage = null;
    
            $emailRecipient = null;
            $emailEnvelope = null;
    
            switch ($application->status) {
                case 1:
                    $emailRecipient = env('MAIL_DUMMY_ADDRESS', $application->current->email);
                    $emailEnvelope = new DelegationMail($application);
    
                    $whatsappRecipient = env('TWILIO_DUMY_WHATSAPP_NUMBER', $application->current->mobile);
                    $whatsappMessage = view('mail.delegation', ['isWhatsapp' => true, 'application' => $application]);
                    break;
                case 2:
                case 3:
                    $emailRecipient = env('MAIL_DUMMY_ADDRESS', $application->current->email);
                    $emailEnvelope = new ApprovalMail($application);
                    
                    $whatsappRecipient = env('TWILIO_DUMY_WHATSAPP_NUMBER', $application->current->mobile);
                    $whatsappMessage = view('mail.approval', ['isWhatsapp' => true, 'application' => $application]);
                    break;
                case 0:
                    $emailRecipient = env('MAIL_DUMMY_ADDRESS', $application->requester->email);
                    $emailEnvelope = new RejectMail($application);
                    
                    $whatsappRecipient = env('TWILIO_DUMY_WHATSAPP_NUMBER', $application->requester->mobile);
                    $whatsappMessage = view('mail.reject', ['isWhatsapp' => true, 'application' => $application]);
                    break;
                case 99:
                    $emailRecipient = env('MAIL_DUMMY_ADDRESS', $application->requester->email);
                    $emailEnvelope = new AcceptMail($application);
                    
                    $whatsappRecipient = env('TWILIO_DUMY_WHATSAPP_NUMBER', $application->requester->mobile);
                    $whatsappMessage = view('mail.accept', ['isWhatsapp' => true, 'application' => $application]);
                    break;
            }
    
            if ($emailRecipient && $emailEnvelope) {
                Mail::to($emailRecipient)->send($emailEnvelope);
            }
            
            if ($whatsappRecipient && $whatsappMessage) {
                $whatsappClient = new Client(env('TWILIO_ACCOUNT_SID'), env('TWILIO_AUTH_TOKEN'));
                $whatsappClient->messages->create("whatsapp:" . $whatsappRecipient, [
                    'from' => "whatsapp:" . env('TWILIO_WHATSAPP_NUMBER'),
                    'body' => str_replace('<br>', '', $whatsappMessage),
                ]);
            }
        } catch (\Exception $exception) {
            Log::error($exception->getMessage());
        }
    }
    
}