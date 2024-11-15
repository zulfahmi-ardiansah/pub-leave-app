<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Division,
    User,
    UserRole,
    UserLeaveSlotCalculation,
    UserLeaveSlot,
    Role
};

class UserController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"] = "Karyawan";
            
            try {
                if ($request->get("submit-form")) {
                    $data["user"] = $request->get("id") ? User::find($request->get("id")) : null;
                    $data["divisionList"] = Division::orderBy("name", "ASC")->get();
                    $data["roleList"] = Role::whereNotIn('code', ['PML', 'DVL', 'PML'])
                                            ->orderBy("id", "ASC")
                                            ->get();

                    if ($data["user"]) {
                        $userLeaveSlotCalculationList = UserLeaveSlotCalculation::where('id', 0)
                                                                                    ->where('year', date('Y'))
                                                                                    ->where('leave_code', 'YAR')
                                                                                    ->where('user_id', $data["user"]->id)
                                                                                    ->get();
                        foreach($userLeaveSlotCalculationList as $userLeaveSlotCalculation) {
                            $userLeaveSlot = new UserLeaveSlot();
                            $userLeaveSlot->leave_id = $userLeaveSlotCalculation->leave_id;
                            $userLeaveSlot->user_id = $userLeaveSlotCalculation->user_id;
                            $userLeaveSlot->year = $userLeaveSlotCalculation->year;
                            $userLeaveSlot->days = $userLeaveSlotCalculation->slot;
                            $userLeaveSlot->save();
                        }
                        $data["userLeaveSlotCalculationList"] = UserLeaveSlotCalculation::where('id', '!=', 0)
                                                                                        ->where('expired_at', '>', date('Y-m-d'))
                                                                                        ->where('leave_code', 'YAR')
                                                                                        ->where('user_id', $data["user"]->id)
                                                                                        ->get();
                    }
                    
                    return view("master.user.form", $data);
                } else if ($request->get("submit-process")) {
                    $user = $request->get("id") ? User::find($request->get("id")) : null;
                    $user = $user ? $user : new User();
                    $user->emp = $request->get("emp");
                    $user->name = $request->get("name");
                    $user->email = $request->get("email");
                    $user->position = $request->get("position");
                    $user->address = $request->get("address");
                    $user->phone = $request->get("phone");
                    $user->mobile = $request->get("mobile");
                    $user->division_id = $request->get("division_id");
                    if ($request->get("password")) {
                        $user->password   =   bcrypt($request->get("password"));
                    }
                    $user->save();

                    foreach ($user->roles as $userRole) {
                        $userRole->delete();
                    }
                    
                    foreach ($request->get('role') as $roleId) {
                        $userRole = new UserRole();
                        $userRole->user_id = $user->id;
                        $userRole->role_id = $roleId;
                        $userRole->save();
                    }

                    foreach ($request->get('slots') as $dayIndex => $slotId) {
                        $userLeaveSlot = UserLeaveSlot::find($slotId);
                        $userLeaveSlot->days = $request->get('days')[$dayIndex];
                        $userLeaveSlot->save();
                    }

                    return redirect(url("/master/user"))->with("success", "Data berhasil disimpan !");
                } else if ($request->get("submit-delete")) {
                    $user = $request->get("id") ? User::find($request->get("id")) : null;
                    if ($user) {
                        $user->deleted_at = date("Y-m-d H:i:s");
                        $user->save();
                    }
                    return redirect(url("/master/user"))->with("success", "Data berhasil dihapus !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/user"))->with("error", "Terjadi kesalahan ! ");
            }
            
            $data["divisionList"] = Division::whereNull("deleted_at")
                                            ->get();
            $data["userList"] = User::whereNull("deleted_at")
                                    ->where("id", "!=", 1)
                                    ->where(function ($query) {
                                        if (isset($_GET['keyword'])) {
                                            $query->where('name', 'like', '%' . strip_tags($_GET['keyword']) . '%')
                                                ->orWhere('emp', 'like', '%' . strip_tags($_GET['keyword']) . '%')
                                                ->orWhere('position', 'like', '%' . strip_tags($_GET['keyword']) . '%')
                                                ->orWhere('email', 'like', '%' . strip_tags($_GET['keyword']) . '%');
                                        }
                                    })
                                    ->where(function ($query) {
                                        if (isset($_GET['division_id']) && $_GET['division_id']) {
                                            $query->where('division_id', strip_tags($_GET['division_id']));
                                        }
                                    })
                                    ->orderBy("emp", "ASC")
                                    ->paginate(15)
                                    ->withQueryString();
            return view("master.user.list", $data);
        }
}
