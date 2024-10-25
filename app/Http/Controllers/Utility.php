<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Utility
{
    // Upload File
        public static function uploadFile (Request $request, string $name, $customFolder = 'media/', $customName = false)
        {
            $file = $request->file($name);
            $newName = false;
            if ($file != false) {
                $storageUrl =   "storage/files/" .  $customFolder . date("Y") . "-" . date("m") . "-" . date("d") . "/";
                $newName    =  date("His") . "_" . ($customName ? $customName . '.' . $file->getClientOriginalExtension() : $file->getClientOriginalName());
                $file->move(public_path($storageUrl), $newName);
                $newName    = $storageUrl . $newName;
            }
            return $newName;
        }
}
