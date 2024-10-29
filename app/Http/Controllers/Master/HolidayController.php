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
                } else if ($request->get("submit-integrate")) {
                    $holidayRawList = json_decode(file_get_contents("https://raw.githubusercontent.com/gerinsp/dayoff-API/refs/heads/master/data/" . date("Y") . ".json"));
                    
                    foreach ($holidayRawList as $holidayRaw) {
                        $holiday = Holiday::where("started_at", $holidayRaw->tanggal)->where("name", $holidayRaw->keterangan)->first();
                        $holiday = $holiday ? $holiday : new Holiday();
                        $holiday->name = $holidayRaw->keterangan;
                        $holiday->started_at = $holidayRaw->tanggal;
                        $holiday->ended_at = $holidayRaw->tanggal;
                        $holiday->is_public = str_contains(strtolower($holiday->name), "cuti bersama");
                        $holiday->save();
                    }

                    return redirect(url("/master/holiday"))->with("success", "Data berhasil tersinkronisasi !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/holiday"))->with("error", "Terjadi kesalahan ! ");
            }
            
            $data["holidayList"] = Holiday::orderBy("started_at", "ASC")
                                            ->where(function ($query) {
                                                if (isset($_GET['keyword'])) {
                                                    $query->where('name', 'like', '%' . strip_tags($_GET['keyword']) . '%');
                                                }
                                                if (isset($_GET['year'])) {
                                                    $query->whereYear('started_at', strip_tags($_GET['year']));
                                                } else {
                                                    $query->whereYear('started_at', 2024);
                                                }
                                            })
                                            ->paginate(10)
                                            ->withQueryString();
            return view("master.holiday.list", $data);
        }
}
