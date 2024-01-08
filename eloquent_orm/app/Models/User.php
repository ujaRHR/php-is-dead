<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Profile;

class User extends Model
{
    use HasFactory;

    function profile(){
        return $this->hasOne(Profile::class, 'email', 'id');
    }

}