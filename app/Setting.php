<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Setting extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'main_offer', 'category_offer', 'small_offer_1', 'small_offer_2',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

}