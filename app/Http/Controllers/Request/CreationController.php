<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\{
    Controller,
    Utility
};

use Illuminate\Http\Request;

use App\Models\{
    Application,
    ApplicationDelegation,
    ApplicationHistory,
    ApplicationLeaveSlot,
    Leave,
    Holiday,
    UserLeaveSlotCalculation,
    UserLeaveSlot,
    User
};

use DB;

class CreationController extends Controller
{
    // Index
        public function index(Request $request) {
            if ($request->get("submit-process")) {
                $application = new Application();
                $application->requester_id = session('user')->id;
                $application->leave_id = $request->get('leave_id');
                $application->started_at = $request->get('started_at');
                $application->ended_at = $request->get('ended_at');
                $application->days = $request->get('days');
                $application->purpose = $request->get('purpose');
                $application->status = 0;
                if ($request->file("attachment")) {
                    $application->attachment = Utility::uploadFile($request, "attachment", "request-");
                }
                $application->save();

                for ($index = 0; $index < count($request->get('delegation_project_id')); $index++) { 
                    $applicationDelegation = new ApplicationDelegation();
                    $applicationDelegation->delegation_id = $request->get('delegation_id')[$index];
                    $applicationDelegation->project_id = $request->get('delegation_project_id')[$index];
                    $applicationDelegation->scope = $request->get('delegation_scope')[$index];
                    $applicationDelegation->position = $request->get('delegation_position')[$index];
                    $applicationDelegation->is_delegation_approved = 0;
                    $applicationDelegation->is_manager_approved = 0;
                    $applicationDelegation->application_id = $application->id;
                    $applicationDelegation->save();
                }

                $applicationHistory = new ApplicationHistory();
                $applicationHistory->user_id = session('user')->id;
                $applicationHistory->comment = $request->get('comment');
                $applicationHistory->application_id = $application->id;
                $applicationHistory->process = 'Pengajuan Izin Cuti';
                $applicationHistory->created_at = date('Y-m-d');
                $applicationHistory->updated_at = date('Y-m-d');
                $applicationHistory->save();

                $leave = Leave::find($application->leave_id);
                if ($leave->code == 'YAR') {
                    $leaveRemainDays = $application->days;
                    $userLeaveSlotCalculationList = UserLeaveSlotCalculation::where('id', '!=', 0)
                                                                            ->where('expired_at', '>=', date('Y-m-d'))
                                                                            ->where('leave_code', 'YAR')
                                                                            ->where('user_id', session('user')->id)
                                                                            ->where('slot', '>', 0)
                                                                            ->orderBy('expired_at', 'ASC')
                                                                            ->get();
                    foreach($userLeaveSlotCalculationList as $userLeaveSlotCalculation) {
                        $userLeaveSlot = UserLeaveSlot::find($userLeaveSlotCalculation->id);
                        $userLeaveSlotDays = $userLeaveSlot->days;
                        $userLeaveSlot->days = $userLeaveSlot->days - $leaveRemainDays;
                        if ($userLeaveSlot->days < 0) {
                            $leaveRemainDays = abs($userLeaveSlot->days);
                            $userLeaveSlot->days = 0;
                        }
                        $userLeaveSlot->save();

                        $applicationLeaveSlot = new ApplicationLeaveSlot();
                        $applicationLeaveSlot->user_leave_slot_id = $userLeaveSlot->id;
                        $applicationLeaveSlot->days = $userLeaveSlotDays - $userLeaveSlot->days;
                        $applicationLeaveSlot->application_id = $application->id;
                        $applicationLeaveSlot->save();

                        if ($leaveRemainDays == 0) {
                            break;
                        }
                    }
                }

                return redirect(url("/request/creation"))->with("success", "Pengajuan berhasil dibuat !");
            }

            $data['userLeaveSlotCalculationList'] = UserLeaveSlotCalculation::where('id', 0)
                                                                            ->where('year', date('Y'))
                                                                            ->where('leave_code', 'YAR')
                                                                            ->where('user_id', session('user')->id)
                                                                            ->get();
            foreach($data['userLeaveSlotCalculationList'] as $userLeaveSlotCalculation) {
                $userLeaveSlot = new UserLeaveSlot();
                $userLeaveSlot->leave_id = $userLeaveSlotCalculation->leave_id;
                $userLeaveSlot->user_id = $userLeaveSlotCalculation->user_id;
                $userLeaveSlot->year = $userLeaveSlotCalculation->year;
                $userLeaveSlot->days = $userLeaveSlotCalculation->slot;
                $userLeaveSlot->save();
            }

            $data["user"] = User::find(session('user')->id);
            $data["leaveList"] = Leave::whereNotIn("code", ["TGT", "OVT"])
                                        ->orderBy("code", "ASC")
                                        ->get();
            $data["holidayList"] = Holiday::where("started_at", ">=", date("Y-m-d"))
                                        ->orderBy("started_at", "ASC")
                                        ->get();
            $data["leaveSlotList"] = DB::select("
                select
                    ulsc.leave_id,
                    sum(ulsc.slot) as slot
                from
                    user_leave_slot_calculations ulsc
                where 
                    ulsc.expired_at >= now() and 
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
                if ($leave->code != 'YAR') {
                    $data["leaveSlotMap"][$leave->id] = -999;
                }
            }

            return view("request.creation.form", $data);
        }
}
