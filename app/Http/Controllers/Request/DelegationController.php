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

class DelegationController extends Controller
{
    // Index
        function index(Request $request) {
            if ($request->get("submit-form")) {
                $data['application'] = Application::find($request->get("id"));
                $data['application']->current_delegation_id = session('user')->id;
                $data['type'] = 'form';
                NotificationUtilities::sendDelegation('', $data['application']);
                return view('request.delegation.form', $data);
            } else if ($request->get("submit-process")) {
                $application = Application::find($request->get("id"));

                if ($request->get("approval")) {
                    $application->current_user_id = null;

                    foreach ($application->delegations as $applicationDelegation) {
                        if (!($applicationDelegation->is_delegation_approved)) {
                            if ($applicationDelegation->delegation_id == session('user')->id) {
                                $applicationDelegation->is_delegation_approved = 1;
                                $applicationDelegation->save();
                            } else if (!($application->current_user_id)) {
                                $application->current_user_id = $applicationDelegation->delegation_id;
                                $application->save();
                            }
                        }
                    }
                    
                    if (!($application->current_user_id)) {
                        foreach ($application->delegations as $applicationDelegation) {
                            $application->status = 2;
                            $application->current_user_id = $applicationDelegation->project->manager_id;
                            $application->save();

                            break;
                        }
                    }

                    if (!($application->current_user_id)) {
                        $application->status = 3;
                        $application->current_user_id = $application->requester->division->head_id;
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
                $applicationHistory->process = 'Persetujuan Delegasi Cuti';
                $applicationHistory->position = 'Karyawan Delegasi';
                $applicationHistory->created_at = date('Y-m-d H:i:s');
                $applicationHistory->updated_at = date('Y-m-d H:i:s');
                $applicationHistory->save();

                return redirect(url("/request/delegation"))->with("success", "Pengajuan berhasil " . ($request->get('approval') ? 'disetujui' : 'ditolak') . " !");
            }
            $data['applicationList'] = Application::where('current_user_id', session('user')->id)
                                                ->where('status', 1)
                                                ->orderBy('id', 'DESC')
                                                ->paginate(10);
            return view('request.delegation.list', $data);
        }
}
