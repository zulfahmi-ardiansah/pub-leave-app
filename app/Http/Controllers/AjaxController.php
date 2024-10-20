<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\{
    Division,
    User,
    UserRole,
    Role
};

class AjaxController extends Controller
{
    // User
        public function user() {
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
                                    ->orderBy("emp", "ASC")
                                    ->limit("5")
                                    ->get();
            return view("ajax.user", $data);
        }
}
