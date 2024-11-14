<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\{
    Application,
    Division,
    Leave
};

use DB;

class RecapitulationController extends Controller
{
    // Index
        function index(Request $request) {
            if ($request->get("submit-view")) {
                $data['application'] = Application::find($request->get("id"));
                return view('request.recapitulation.view', $data);
            }
            $data["divisionList"] = Division::whereNull("deleted_at")
                                            ->get();
            $data["leaveList"] = Leave::whereNotIn("code", ["TGT", "OVT"])
                                        ->orderBy("code", "ASC")
                                        ->get();
            $data['applicationList'] = Application::where('status', 99)
                                                ->where(function ($query) {
                                                    if (isset($_GET['started_at']) && isset($_GET['ended_at']) && $_GET['started_at'] && $_GET['ended_at']) {
                                                        $query->whereBetween(DB::raw('date(created_at)'), [strip_tags($_GET['started_at']), strip_tags($_GET['ended_at'])]);
                                                    } else if (isset($_GET['started_at']) && $_GET['started_at']) {
                                                        $query->where(DB::raw('date(created_at)'), '>=', strip_tags($_GET['started_at']));
                                                    } else if (isset($_GET['ended_at']) && $_GET['ended_at']) {
                                                        $query->where(DB::raw('date(created_at)'), '<=', strip_tags($_GET['ended_at']));
                                                    } else {
                                                        $query->whereBetween(DB::raw('date(created_at)'), [date('Y') . '-01-01', date('Y') . '-12-31']);
                                                    }
                                                })
                                                ->where(function ($query) {
                                                    if (isset($_GET['name'])) {
                                                        $query->whereRelation('requester', 'name', 'like', '%' . strip_tags($_GET['name']) . '%')
                                                            ->orWhereRelation('requester', 'emp', 'like', '%' . strip_tags($_GET['name']) . '%')
                                                            ->orWhereRelation('requester', 'position', 'like', '%' . strip_tags($_GET['name']) . '%')
                                                            ->orWhereRelation('requester', 'email', 'like', '%' . strip_tags($_GET['name']) . '%');
                                                    }
                                                })
                                                ->where(function ($query) {
                                                    if (isset($_GET['division_id']) && $_GET['division_id']) {
                                                        $query->whereRelation('requester', 'division_id', strip_tags($_GET['division_id']));
                                                    }
                                                })
                                                ->where(function ($query) {
                                                    if (isset($_GET['leave_id']) && $_GET['leave_id']) {
                                                        $query->where('leave_id', strip_tags($_GET['leave_id']));
                                                    }
                                                })
                                                ->orderBy('created_at', 'DESC')
                                                ->paginate(15)
                                                ->withQueryString();
            return view('request.recapitulation.list', $data);
        }
}
