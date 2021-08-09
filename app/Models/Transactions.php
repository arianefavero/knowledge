<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// Biblioteca para geração de UUID
use App\Models\Traits\HasUniqueIdentifier;



class Transactions extends Model
{

    use HasFactory;
    use HasUniqueIdentifier;

    protected $casts = ['id' => 'string'];

    protected $fillable = [
        'wallet_origin',
        'wallet_destiny',
        'transaction_value',
        'description',
        'type_id'
    ];

    // Relacionamentos

    public function wallet()
    {
        return $this->hasOne(Wallet::class, 'wallet_origin', 'wallet_destiny');
    }

    public function type()
    {
        return $this->hasOne(Type::class, 'type_id');
    }


}
