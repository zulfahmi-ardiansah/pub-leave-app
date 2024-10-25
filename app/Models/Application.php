<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;
    
    public function leave ()
    {
        return $this->belongsTo(Leave::class, 'leave_id', 'id');
    }
    
    public function requester ()
    {
        return $this->belongsTo(User::class, 'requester_id', 'id');
    }
    
    public function delegations() {
        return $this->hasMany(ApplicationDelegation::class, 'application_id', 'id');
    }
    
    public function histories() {
        return $this->hasMany(ApplicationHistory::class, 'application_id', 'id');
    }
}
