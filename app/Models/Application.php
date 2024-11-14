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
    
    public function current ()
    {
        return $this->belongsTo(User::class, 'current_user_id', 'id');
    }
    
    public function delegations() {
        $delegations = $this->hasMany(ApplicationDelegation::class, 'application_id', 'id');
        if ($this->current_delegation_id) {
            $delegations->getQuery()->where('delegation_id', $this->current_delegation_id);
        }
        if ($this->current_manager_id) {
            $projects = Project::where('manager_id', $this->current_manager_id)->pluck('id')->toArray();
            $delegations->getQuery()->whereIn('project_id', $projects);
        }
        return $delegations;
    }
    
    public function histories() {
        return $this->hasMany(ApplicationHistory::class, 'application_id', 'id');
    }
    
    public function leaveSlots() {
        return $this->hasMany(ApplicationLeaveSlot::class, 'application_id', 'id');
    }
}
