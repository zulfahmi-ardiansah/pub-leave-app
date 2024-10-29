<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Leave,
    LeaveSlot
};

class LeaveController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"]  = "Jatah Cuti";
            
            try {
                if ($request->get("submit-form")) {
                    $data["leave"] = Leave::find($request->get("id"));
                    return view("master.leave.form", $data);
                } else if ($request->get("submit-process")) {
                    $leave = Leave::find($request->get("id"));
                    $leave = $leave ? $leave : new Leave();
                    $leave->description = $request->get("description");
                    if ($request->get('expired_at_month')) {
                        $leave->expired_at = $request->get("expired_at_month") . '-' . $request->get("expired_at_day");
                    } else {
                        $leave->expired_at = null;
                    }
                    $leave->max_days = $request->get("max_days");
                    $leave->save();

                    if ($request->get('year')) {
                        for ($index = 0; $index < count($request->get('year')) ; $index++) { 
                            if ($request->get('year')[$index]) {
                                $leaveSlot = LeaveSlot::where('year', $request->get('year')[$index])
                                                        ->where('leave_id', $leave->id)
                                                        ->first();
                                $leaveSlot = $leaveSlot ? $leaveSlot : new LeaveSlot();
                                $leaveSlot->year = $request->get('year')[$index];
                                $leaveSlot->days = $request->get('days')[$index];
                                $leaveSlot->leave_id = $leave->id;
                                $leaveSlot->save();
                            }
                        }
                    }

                    return redirect(url("/master/leave"))->with("success", "Data berhasil disimpan !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/leave"))->with("error", "Terjadi kesalahan ! ");
            }

            $data["leaveList"] = Leave::where("code", "!=", "OVT")
                                        ->orderBy("code", "ASC")
                                        ->get();
            return view("master.leave.list", $data);
        }
}
