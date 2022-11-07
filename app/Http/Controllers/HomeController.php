<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\Models\Post;
use App\Models\User;
use Ramsey\Collection\Collection;

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
        $category = Category::all();
        $res = Post::with('category', 'user')->get();
        $biggest = $res->slice(0,1);
        $second = $res->slice(2, 2);
        $third = $res->slice(4, 1);
        $forth = $res->slice(5, 4);
        $hotnews = $res->slice(10, 4);
        $posts = $res->slice(15);
        return view('index', ['posts' => $res, 'second' => $second, 'third' => $third, 'forth' => $forth, 'hotnews'=> $hotnews, 'biggest'=>$biggest, 'category'=>$category]);
    }
    public function view_cate($id){
        $allcate = Category::all();
        $posts = Post::with('category')->where('cate_id', $id)->get();
        return view('postbycate', ['category' => $allcate, 'posts' => $posts]);
    }
    public function view_post($id)
    {
        $allcomments = Comment::with('user')->where('post_id', $id)->get();
        $comments_can_edit = collect(new Comment());
        $comments_cant_edit = collect(new Comment());
        if(Auth::check()){
            $user_id =  Auth::user()->id;
            foreach($allcomments as $comment){
                if($comment->user_id == $user_id){
                    $comments_can_edit->add($comment);
                }
                else {
                    $comments_cant_edit->add($comment);
                }
            }
        } else {
            $comments_cant_edit = null;
            $comments_cant_edit = $allcomments;
        }
        $post = Post::find($id);
        $author = User::find($post->author_id);
        $category = Category::find($post->cate_id);
        $allcate = Category::all();

        return view('post', [
            'comments_can_edit'=>$comments_can_edit,
            'comments_cant_edit'=>$comments_cant_edit,
            'post'=>$post,
            'author'=>$author,
            'cate'=>$category,
            'category' => $allcate,
        ]);
    }
}
