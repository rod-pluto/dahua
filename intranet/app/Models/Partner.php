<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
    protected $fillable = [
        'user_id',
        'company',
        'message',
        'cellphone',
        'looking_for',
        'status',
    ];

    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
