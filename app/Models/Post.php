<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = 'posts';
//    public $timestamps = false;
    protected $fillable = [
        'id',
        'title',
        'description',
        'body',
        'cate_id',
        'author_id',
        'img_url',
    ];
    public function user(){
        return $this->belongsTo(User::class, 'author_id', 'id');
    }
    public function category()
    {
        return $this->belongsTo(Category::class, 'cate_id', 'id');
    }
    public function comments(){
        return $this->hasMany(Comment::class, 'post_id','id');
    }
}
