<?php

namespace App\Models\Traits;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Ramsey\Uuid\Uuid;
// Biblioteca para geração de UUID



trait HasUniqueIdentifier
{

    public static function boot()
    {
        parent::boot();

        static::creating(function (Model $model) 
        {
            $model->setKeyType('string');
            $model->setIncrementing(false);
            $model->setAttribute($model->getKeyName(), (string) Str::uuid());
        });
    }

}