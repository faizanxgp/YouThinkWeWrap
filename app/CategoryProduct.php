<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class CategoryProduct extends Model
{
    use Notifiable;

    protected $table = 'Category_Product';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id', 'product_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        '',
    ];

    public function categories() {
        return $this->belongsTo('App\Category');
    }

    public function products() {
        return $this->belongsTo('App\Product');
    }
}
