<?php

namespace App\Http\Controllers\Request;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Application,
    ApplicationHistory,
    UserLeaveSlot
};

use App\Utilities\NotificationUtilities;

class ApprovalController extends Controller
{
    // Index
        function index(Request $request) {
            if ($request->get("submit-form")) {
                $data['application'] = Application::find($request->get("id"));
                if ($data['application']->status == 2) {
                    $data['application']->current_manager_id = session('user')->id;
                }
                $data['type'] = 'form';
                return view('request.approval.form', $data);
            } else if ($request->get("submit-process")) {
                $application = Application::find($request->get("id"));
                $applicationStatus = $application->status;

                if ($request->get("approval")) {
                    $application->current_user_id = null;

                    if ($applicationStatus == 2) {
                        foreach ($application->delegations as $applicationDelegation) {
                            if (!($applicationDelegation->is_manager_approved)) {
                                if ($applicationDelegation->project->manager_id == session('user')->id) {
                                    $applicationDelegation->is_manager_approved = 1;
                                    $applicationDelegation->save();
                                } else if (!($application->current_user_id)) {
                                    $application->current_user_id = $applicationDelegation->project->manager_id;
                                    $application->save();
                                }
                            }
                        }
    
                        if (!($application->current_user_id)) {
                            $application->status = 3;
                            $application->current_user_id = $application->requester->division->head_id;
                            $application->save();
                        }
                    } else {
                        $application->status = 99;
                        $application->is_head_approved = 1;
                        $application->save();
                    }
                } else {
                    $application->status = 0;
                    $application->current_user_id = null;
                    $application->save();

                    foreach ($application->leaveSlots as $applicationLeaveSlot) {
                        $userLeaveSlot = UserLeaveSlot::find($applicationLeaveSlot->user_leave_slot_id);
                        $userLeaveSlot->days += $applicationLeaveSlot->days;
                        $userLeaveSlot->save();
                    }
                }
                
                $applicationHistory = new ApplicationHistory();
                $applicationHistory->user_id = session('user')->id;
                $applicationHistory->comment = $request->get('comment');
                $applicationHistory->application_id = $application->id;
                $applicationHistory->process = 'Persetujuan Cuti';
                $applicationHistory->position = ($applicationStatus == 2 ? 'Manajer Proyek' : 'Kepala Divisi');
                $applicationHistory->created_at = date('Y-m-d H:i:s');
                $applicationHistory->updated_at = date('Y-m-d H:i:s');
                $applicationHistory->save();
                
                NotificationUtilities::sendProcess($application);

                return redirect(url("/request/approval"))->with("success", "Pengajuan berhasil " . ($request->get('approval') ? 'disetujui' : 'ditolak') . " !");
            }
            $data['applicationList'] = Application::where('current_user_id', session('user')->id)
                                                ->whereIn('status', [2, 3])
                                                ->orderBy('id', 'DESC')
                                                ->paginate(15);
            return view('request.approval.list', $data);
        }
}
