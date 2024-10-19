<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Holiday;

class HolidayController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"]  = "Hari Libur";
            try {
                if ($request->get("submit-form")) {
                    $data["holiday"] = $request->get("id") ? Holiday::find($request->get("id")) : null;
                    return view("master.holiday.form", $data);
                } else if ($request->get("submit-process")) {
                    $holiday = $request->get("id") ? Holiday::find($request->get("id")) : null;
                    $holiday = $holiday ? $holiday : new Holiday();
                    $holiday->name = $request->get("name");
                    $holiday->is_public = $request->get("is_public");
                    $holiday->started_at = $request->get("started_at");
                    $holiday->ended_at = $request->get("ended_at");
                    $holiday->save();
                    return redirect(url("/master/holiday"))->with("success", "Data berhasil disimpan !");
                } else if ($request->get("submit-delete")) {
                    $holiday = $request->get("id") ? Holiday::find($request->get("id")) : null;
                    if ($holiday) {
                        $holiday->delete();
                    }
                    return redirect(url("/master/holiday"))->with("success", "Data berhasil dihapus !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/holiday"))->with("error", "Terjadi kesalahan ! ");
            }
            $data["holidayList"] = Holiday::orderBy("started_at", "DESC")->get();
            return view("master.holiday.list", $data);
        }
}
