<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// Biblioteca para geração de UUID
use App\Models\Traits\HasUniqueIdentifier;


class Users extends Model
{

    use HasFactory;
    use HasUniqueIdentifier;

    protected $casts = ['id' => 'string'];

    protected $fillable = [
        'first_name',
        'last_name',
        'document',
        'document_type',
        'created_at',
        'updated_at'
    ];

    public function login()
    {
        return $this->hasOne(Login::class, 'user_id');
    }

}
