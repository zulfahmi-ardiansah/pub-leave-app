<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Leave,
    User
};

use DB;

class CreationController extends Controller
{
    // Index
        public function index() {
            $data["user"] = User::find(session('user')->id);
            $data["leaveList"] = Leave::where("code", "!=", "TGT")->orderBy("code", "ASC")->get();
            $data["leaveSlotList"] = DB::select("
                select
                    ulsc.leave_id,
                    sum(ulsc.slot) as slot
                from
                    user_leave_slot_calculations ulsc
                where 
                    ulsc.expired_at > now() and 
                    ulsc.user_id = " . session("user")->id . "
                group by 
                    ulsc.user_id,
                    ulsc.leave_id"
            );
            $data["leaveSlotMap"] = [];
            foreach ($data["leaveSlotList"] as $leaveSlot) {
                $data["leaveSlotMap"][$leaveSlot->leave_id] = $leaveSlot->slot;
            }
            foreach ($data["leaveList"] as $leave) {
                if (!(isset($data["leaveSlotMap"][$leave->id]))) {
                    $data["leaveSlotMap"][$leave->id] = 0;
                }
                if (!(in_array($leave->code, ['TGT', 'YAR', 'OVT']))) {
                    $data["leaveSlotMap"][$leave->id] = 1;
                }
            }
            return view("request.creation.form", $data);
        }
}
