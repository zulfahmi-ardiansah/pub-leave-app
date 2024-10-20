<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    
    public function manager ()
    {
        return $this->belongsTo(User::class, 'manager_id', 'id');
    }
    
    public function weight ()
    {
        return $this->belongsTo(Weight::class, 'weight_id', 'id');
    }
}
