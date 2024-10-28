<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApplicationDelegation extends Model
{
    use HasFactory;

    public function project ()
    {
        return $this->belongsTo(Project::class, 'project_id', 'id');
    }

    public function delegation ()
    {
        return $this->belongsTo(User::class, 'delegation_id', 'id');
    }
}
