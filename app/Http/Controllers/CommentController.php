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
        $comment = new Comment;
        $comment->user_id = Auth::user()->id;
        $comment->post_id = $id;
        $comment->content = $request['content'];
        $comment->save();
        return redirect()->route('view.post', ['id'=>$id]);
    }
    public function ud_comment(Request $request, $id){
        $comment = Comment::find($id);
        if($request->action == 'update'){
            $comment->content = $request['content'];
            $comment->save();
        }
        elseif ($request->action == 'delete'){
            $comment->delete();
        } else {
            abort('403');
        }
        return redirect()->back();
    }
}
