<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Application;

use App\Utilities\NotificationUtilities;

class ReminderController extends Controller
{
    // Index
        function index() {
            $applicationList = Application::where('status', 99)
                                            ->get();
            foreach ($applicationList as $application) {
                NotificationUtilities::sendReminder($application);
            }
        }
}
