<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\{
    Application
};

class HistoryController extends Controller
{
    // Index
        function index(Request $request) {
            if ($request->get("submit-view")) {
                $data['application'] = Application::find($request->get("id"));
                return view('request.history.view', $data);
            }
            $data['applicationList'] = Application::where('requester_id', session('user')->id)
                                                ->orderBy('id', 'DESC')
                                                ->get();
            return view('request.history.list', $data);
        }
}
