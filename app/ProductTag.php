<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class ProductTag extends Model
{
    use Notifiable;

    protected $table = 'product_tag';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'product_id', 'tag_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        '',
    ];

    public function tags() {
        return $this->belongsTo('App\Tag');
    }

    public function products() {
        return $this->belongsTo('App\Product');
    }
}
