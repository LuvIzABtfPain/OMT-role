<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use App\Policies\PostPolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
class PostController extends Controller
{
        public function __construct()
    {
        $this->middleware('auth');
    }


    public function index(){
        $posts = Post::all();

        return view('post',['posts'=>$posts]);
    }
    public function add_post(Request $request)
    {
        $this->authorize('create', Post::class);
        if($request->isMethod('post')) {
            $post = new Post;
            $post->title = $request->title;
            $post->description = $request->description;
            $post->body = $request->body;
            $post->cate_id = $request->category;
            $post->author_id = Auth::user()->id;
            $flag = $post->save();
            if ($flag == true) {
                return redirect()->route('home');
            } else {
                echo 'that bai';
            }
        }
        if($request->method('get')){
            $cates = Category::all();
            return view('admin.add', ['cates'=>$cates]);
        }
    }

    public function read($id){
            $item = Post::find($id);
            $this->authorize('read', $item);
            $cate = $item->category->name;
            $author = $item->user->name;
            $comments = Comment::with('user')->where('post_id', $id)->get();
            return view('admin.post', ['item' => $item, 'cate' => $cate, 'author' => $author, 'comments'=>$comments]);
    }
    public function delete($id){
        $item = Post::find($id);
        if(Auth::user()->can('delete', $item)) {
            $flag = $item->delete();
            if ($flag == true) {
                return redirect('home');
            } else {
                echo 'xoa that bai';
            }
        }
        else abort('403');
    }
    public function edit(Request $request, $id){
        $item = Post::find($id);
        if(Gate::allows('edit-post', $item)){
            $cates = Category::all();
            if($request->isMethod('GET')) {
                return view('admin.edit', ['item' => $item, 'cates' => $cates]);
            }
            if($request->isMethod('POST')){

                $item->title = $request->title;
                $item->description = $request->description;
                $item->body = $request->body;
                $item->cate_id = $request->category;
                $flag = $item->save();
                if($flag == true) {
                    return redirect('/home');
                } else {
                    echo 'update that bai';
                }
            }
        }
        else abort('403');

    }

}
