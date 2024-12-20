<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\{
    User,
    Division,
    Project
};

class AuthController extends Controller
{
    // Login
        public function login (Request $request)
        {
            if ($request->get("submit-process")) {
                $user = User::where("email", $request->get("email"))->first();
                if ($user) {
                    if (\Hash::check($request->get("password"), $user->password)) {
                        $userRoleCode = ['EMP'];
                        if ($user->id == 1) {
                            $userRoleCode[] = 'HRS';
                        }
                        
                        $divisionCount = Division::where('head_id', $user->id)->count();
                        if ($divisionCount) {
                            $userRoleCode[] = 'DVL';
                        }

                        $projectCount = Project::where('manager_id', $user->id)->count();
                        if ($projectCount) {
                            $userRoleCode[] = 'PML';
                        }

                        foreach ($user->roles as $userRole) {
                            $userRoleCode[] = $userRole->role->code;
                        }

                        $user->role = array_unique($userRoleCode);
                        session()->put("user", $user);
                        
                        return redirect(url("/home"))->with("success", "Selamat datang di Temani !");
                    }
                }
                return redirect(url("/login"))->with("error", "Email atau kata sandi salah !");
            }
            return view("auth.login");
        }

    // Logout
        public function logout (Request $request)
        {
            session()->flush();
            return redirect(url("/login"));
        }
}
