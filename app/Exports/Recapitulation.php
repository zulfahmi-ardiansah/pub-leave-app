<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class Recapitulation implements FromView, ShouldAutoSize
{
    function __construct($data) {
        $this->data = $data;
    }

    public function view(): View
    {
        return view('request.recapitulation.download', $this->data);
    }
}
