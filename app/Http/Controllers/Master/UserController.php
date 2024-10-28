<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Division,
    User,
    UserRole,
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
                    $data["roleList"] = Role::where('code', '!=', 'PML')
                                            ->orderBy("id", "ASC")
                                            ->get();
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
                    $user->division_id = $request->get("division_id");
                    if ($request->get("password")) {
                        $user->password   =   bcrypt($request->get("password"));
                    }
                    $user->save();

                    if (count($user->roles) == 0){
                        $userRole = new UserRole();
                        $userRole->role_id = 1;
                        $userRole->user_id = $user->id;
                        $userRole->save();
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

            $data["userList"] = User::whereNull("deleted_at")
                                    ->where("id", "!=", 1)
                                    ->orderBy("emp", "ASC")
                                    ->get();
            return view("master.user.list", $data);
        }
}
