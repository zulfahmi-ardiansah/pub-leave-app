<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Division;

class DivisionController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"]  = "Divisi";
            
            try {
                if ($request->get("submit-form")) {
                    $data["division"] = $request->get("id") ? Division::find($request->get("id")) : null;
                    return view("master.division.form", $data);
                } else if ($request->get("submit-process")) {
                    $division = $request->get("id") ? Division::find($request->get("id")) : null;
                    $division = $division ? $division : new Division();
                    $division->name = $request->get("name");
                    $division->code = $request->get("code");
                    $division->description = $request->get("description");
                    $division->head_id = $request->get("head_id");
                    $division->save();

                    return redirect(url("/master/division"))->with("success", "Data berhasil disimpan !");
                } else if ($request->get("submit-delete")) {
                    $division = $request->get("id") ? Division::find($request->get("id")) : null;
                    if ($division) {
                        $division->deleted_at = date('Y-m-d H:i:s');
                        $division->save();
                    }

                    return redirect(url("/master/division"))->with("success", "Data berhasil dihapus !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/division"))->with("error", "Terjadi kesalahan ! ");
            }

            $data["divisionList"] = Division::whereNull("deleted_at")
                                            ->where(function ($query) {
                                                if (isset($_GET['keyword'])) {
                                                    $query->where('name', 'like', '%' . strip_tags($_GET['keyword']) . '%')
                                                        ->orWhere('code', 'like', '%' . strip_tags($_GET['keyword']) . '%')
                                                        ->orWhere('description', 'like', '%' . strip_tags($_GET['keyword']) . '%');
                                                }
                                            })
                                            ->orderBy("code", "ASC")
                                            ->get();
            return view("master.division.list", $data);
        }
}
