<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApplicationLeaveSlot extends Model
{
    use HasFactory;
    
    public function userLeaveSlot ()
    {
        return $this->belongsTo(UserLeaveSlot::class, 'user_leave_slot', 'id');
    }
}
