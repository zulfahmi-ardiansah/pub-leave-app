<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\{
    Project,
    ProjectMember,
    Weight,
    User
};

class ProjectController extends Controller
{
    // Index
        public function index (Request $request)
        {
            $data["title"]  = "Proyek";
            
            try {
                if ($request->get("submit-form")) {
                    $data["project"] = $request->get("id") ? Project::find($request->get("id")) : null;
                    $data["weightList"] = Weight::orderBy("point", "DESC")->get();
                    $data["userList"] = User::whereNull("deleted_at")->where("id", "!=", 1)->orderBy("emp", "ASC")->get();
                    return view("master.project.form", $data);
                } else if ($request->get("submit-process")) {
                    $project = $request->get("id") ? Project::find($request->get("id")) : null;
                    $project = $project ? $project : new Project();
                    $project->name = $request->get("name");
                    $project->code = $request->get("code");
                    $project->description = $request->get("description");
                    $project->started_at = $request->get("started_at");
                    $project->ended_at = $request->get("ended_at");
                    $project->weight_id = $request->get("weight_id");
                    $project->manager_id = $request->get("manager_id");
                    $project->save();
                    
                    foreach ($project->members as $projectMember) {
                        $projectMember->delete();
                    }

                    foreach ($request->get('member_id') as $memberId) {
                        if ($memberId) {
                            $projectMember = new ProjectMember();
                            $projectMember->project_id = $project->id;
                            $projectMember->user_id = $memberId;
                            $projectMember->save();
                        }
                    }

                    return redirect(url("/master/project"))->with("success", "Data berhasil disimpan !");
                } else if ($request->get("submit-delete")) {
                    $project = $request->get("id") ? Project::find($request->get("id")) : null;
                    if ($project) {
                        $project->deleted_at = date('Y-m-d H:i:s');
                        $project->save();
                    }

                    return redirect(url("/master/project"))->with("success", "Data berhasil dihapus !");
                }
            } catch (\Throwable $e) {
                return redirect(url("/master/project"))->with("error", "Terjadi kesalahan ! ");
            }

            $data["projectList"] = Project::whereNull("deleted_at")->orderBy("code", "ASC")->get();
            return view("master.project.list", $data);
        }
}
