<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\{
    User,
    RepHeader
};

class HomeController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"] = "Beranda";
            return view("home.index", $data);
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
