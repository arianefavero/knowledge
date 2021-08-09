<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// Biblioteca para geração de UUID
use App\Models\Traits\HasUniqueIdentifier;


class Wallet extends Model
{

    use HasFactory;
    use HasUniqueIdentifier;

    protected $casts = ['id' => 'string'];

    protected $table = 'wallet';

    protected $fillable = [
        'id',
        'user_id',
        'value',
        'wallet'
    ];

    //Relacionamentos

    public function users()
    {
        return $this->hasOne(Users::class, 'user_id');
    }

}
