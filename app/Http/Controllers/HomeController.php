<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\Models\Post;
use App\Models\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(Auth::check() && !(Auth::user()->isUser())) {
            $res = Post::with('user','category')->get();
            return view('admin.dashboard', ['posts' => $res]);
        } else {
            return redirect('view');
        }
    }

    public function view(){
        $res = Post::with('category', 'user')->get();
        return view('index', ['posts' => $res]);
    }

    public function view_post($id)
    {
        $comments = Comment::with('user')->where('post_id', $id)->get();
        $post = Post::find($id);
        $author = User::find($post->author_id);
        $category = Category::find($post->cate_id);

        return view('post', [
            'comments'=>$comments,
            'post'=>$post,
            'author'=>$author,
            'cate'=>$category
        ]);
    }
}
