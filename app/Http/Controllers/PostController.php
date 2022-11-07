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
use RealRashid\SweetAlert\Facades\Alert;
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
            $this->validator($request);
            $post = new Post;
            $imageUrl = $this->storeImage($request);
            $post->url_img=$imageUrl;
            $post->title = $request->title;
            $post->description = $request->description;
            $post->body = $request->body;
            $post->cate_id = $request->category;
            $post->author_id = Auth::user()->id;
            $flag = $post->save();
            if ($flag == true) {
                alert()->success('Post Created', 'Successfully');
                return redirect()->route('home');
            } else {
                alert()->error("Post didn't create", 'Something went wrong!');
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
                alert()->success('Post Deleted', 'Successfully');
            } else {
                alert()->error("Post didn't delete", 'Something went wrong!');
            }
        }
        else  alert()->error("Bạn không được xóa bài viết này", 'Something went wrong!');
        return redirect('home');
    }
    public function edit(Request $request, $id){
        $item = Post::find($id);
        if(Gate::allows('edit-post', $item)){
            $cates = Category::all();
            if($request->isMethod('GET')) {
                return view('admin.edit', ['item' => $item, 'cates' => $cates]);
            }
            if($request->isMethod('POST')){
                $imageUrl = $this->storeImage($request);
                $item->url_img = $imageUrl;
                $item->title = $request->title;
                $item->description = $request->description;
                $item->body = $request->body;
                $item->cate_id = $request->category;
                $flag = $item->save();
                if($flag == true) {
                    alert()->success('Post Edited', 'Successfully');
                    return redirect('/home');
                } else {
                    alert()->error("Post didn't edit", 'Something went wrong!');
                }
            }
        }
        else {
            alert()->error("Bạn không được chỉnh sửa bài viết này", 'Something went wrong!');
            return redirect('/home');
        }
    }

    protected function validator(Request $request){
        return $request->validate([
            'title' => ['required', 'min:3', 'max:150', 'unique:posts'],
            'description'=> ['required', 'min:3','max:255'],
            'body' => ['required', 'min:10']
        ],[
            'title.required' => 'Không được để trống tiêu đề',
            'title.min' => 'Tiêu đề quá ngắn',
            'title.max' => 'Tên đề quá dài',
            'title.unique' => 'Tiêu đề đã tồn tại',
            'description.required' => 'Không được để trống mô tả',
            'description.min' => 'Mô tả quá ngắn',
            'description.max' => 'Mô tả quá dài',
            'body.required' => 'Không được để trống nội dung bài viết',
            'body.min' => 'Nội dung bài viết quá ngắn'
        ]);
    }
    protected function storeImage(Request $request) {
        $path = $request->file('photo')->store('public/img');
        return substr($path, strlen('public/'));
    }

}
