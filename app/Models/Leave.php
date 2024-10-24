<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Leave extends Model
{
    use HasFactory;

    public function slots() {
        return $this->hasMany(LeaveSlot::class, 'leave_id', 'id');
    }

    public function getMaxDays() {
        switch ($this->code) {
            case 'YAR':
                return \DB::select("
                        select 
                            coalesce(sum(ls.days), 0) as total 
                        from 
                            leave_slots ls 
                        join 
                            leaves l on ls.leave_id = l.id and l.code = 'YAR' 
                        where 
                            ls.year = year(now())
                    ")[0]->total;
                break;
            case 'TGT':
                return \DB::select("
                        select 
                            coalesce(sum(h.ended_at - h.started_at + 1), 0) as total 
                        from 
                            holidays h 
                        where 
                            h.is_public = 1 and year(started_at) = year(now())
                    ")[0]->total;
                break;
            default:
                return $this->max_days;
                break;
        }
    }
}
