<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Traits\HasUniqueIdentifier;


class Login extends Model
{
    use HasFactory;
    use HasUniqueIdentifier;

    protected $table = 'login_user';

    protected $casts = [
        'id' => 'string'
      ];
      

    protected $fillable = [
        'user_id',
        'email',
        'password'
    ];

        // relacionamentos

        public function users()
        {
            return $this->hasOne(Users::class, 'user_id');
        }

}
