<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'name',
        'url',
    ];
    public function posts(){
        return $this->hasMany(Post::class, 'cate_id', 'id');
    }
}
