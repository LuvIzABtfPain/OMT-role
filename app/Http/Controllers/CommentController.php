<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Auth;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function post_comment(Request $request, $id){
        $this->validator($request);
        $comment = new Comment;
        $comment->user_id = Auth::user()->id;
        $comment->post_id = $id;
        $comment->content = $request['content'];
        $comment->save();
        return redirect()->route('view.post', ['id'=>$id]);
    }
    public function ud_comment(Request $request, $id){
        $comment = Comment::find($id);
        if($request->action == 'update'  && Auth::user()->can('update-comment', $comment)){
            $this->validator($request);
            $comment->content = $request['content'];
            $comment->save();
        }
        elseif ($request->action == 'delete' && Auth::user()->can('delete-comment', $comment)){
            $comment->delete();
        } else {
            alert("Bạn không có quyền xóa/chỉnh sửa comment này");
        }
        return redirect()->back();
    }
    protected function validator(Request $request){
        return $request->validate([
            'content' => ['required', 'string', 'min:3', 'max:255',],
        ],[
            'content.required' => 'Không được để trống',
            'content.min' => 'Comment quá ngắn',
            'content.max' => 'Comment quá dài',
        ]);
    }
}
