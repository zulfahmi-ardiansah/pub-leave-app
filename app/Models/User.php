<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;
    
    public function division ()
    {
        return $this->belongsTo(Division::class, 'division_id', 'id');
    }
    
    public function roles() {
        return $this->hasMany(UserRole::class, 'user_id', 'id');
    }
}
