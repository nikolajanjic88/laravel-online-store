<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name',
        'description',
        'price',
        'slug',
        'is_featured'
    ];

    public function images()
    {
        return $this->hasMany(ProductImages::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function mainImage()
    {
        return $this->hasOne(ProductImages::class)->where('is_main', true);
    }

    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }

}
