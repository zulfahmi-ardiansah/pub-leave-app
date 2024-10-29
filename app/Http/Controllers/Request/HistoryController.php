<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\{
    Application
};

use DB;

class HistoryController extends Controller
{
    // Index
        function index(Request $request) {
            if ($request->get("submit-view")) {
                $data['application'] = Application::find($request->get("id"));
                return view('request.history.view', $data);
            }
            $data['applicationList'] = Application::where('requester_id', session('user')->id)
                                                ->where(function ($query) {
                                                    if (isset($_GET['started_at']) && isset($_GET['ended_at']) && $_GET['started_at'] && $_GET['ended_at']) {
                                                        $query->whereBetween(DB::raw('date(created_at)'), [strip_tags($_GET['started_at']), strip_tags($_GET['ended_at'])]);
                                                    } else if (isset($_GET['started_at']) && $_GET['started_at']) {
                                                        $query->where(DB::raw('date(created_at)'), '>=', strip_tags($_GET['started_at']));
                                                    } else if (isset($_GET['ended_at']) && $_GET['ended_at']) {
                                                        $query->where(DB::raw('date(created_at)'), '<=', strip_tags($_GET['ended_at']));
                                                    }
                                                })
                                                ->orderBy('id', 'DESC')
                                                ->paginate(10)
                                                ->withQueryString();
            return view('request.history.list', $data);
        }
}
