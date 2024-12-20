<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\{
    Application,
    User,
    RepHeader
};

class HomeController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"] = "Beranda";
            $data['applicationList'] = Application::where('requester_id', session('user')->id)
                                                ->orderBy('id', 'DESC')
                                                ->limit(5)
                                                ->get();
            $data['applicationApproveList'] = Application::where('current_user_id', session('user')->id)
                                                ->orderBy('id', 'DESC')
                                                ->limit(5)
                                                ->get();
            return view("home.index", $data);
        }

    // Notification
        public function notification (Request $request)
        {
            $data['applicationList'] = Application::where('current_user_id', session('user')->id)
                                                ->whereIn('status', [1, 2, 3])
                                                ->orderBy('id', 'DESC')
                                                ->limit(5)
                                                ->get();
            return view("home.notification", $data);
        }

    // Password
        public function password (Request $request)
        {
            $data["title"] = "Ganti Kata Sandi";
            if ($request->get("submit-process")) {
                if ($request->get("new_password") != $request->get("new_confirmation_password")) {
                    return redirect(url("/home/password"))->with("error", "Kata sandi baru tidak sesuai dengan konfirmasi kata sandi baru !");
                }
                if (!(\Hash::check($request->get("old_us_password"), session()->get("user")->us_password))) {
                    return redirect(url("/home/password"))->with("error", "Kata sandi lama tidak sesuai !");
                }
                
                $user = User::find(session()->get("user")->id);
                $user->us_password = bcrypt($request->get("new_password"));
                $user->save();
                session()->put("user", $user);
                
                return redirect(url("/home"))->with("success", "Kata sandi berhasil diubah !");
            }
            return view("home.password", $data);
        }
}
