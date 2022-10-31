@extends('layouts.client', ['page_title'=>'NewsPage'])
@section('content')
    <div class="body-wrapper">
        <div class="canle">
            <div style="margin-top: 50px;">
                <img src="{{ asset('img') }}/{{ $post->url_img }}.webp" style="max-width: 100%;">
                <h2>{{ $post->title }}</h2>
                <h4 style="padding-top:10px;">{{ $cate->name }}</h4>
                <div style="padding-top:10px;">Tác giả: {{ $author->name }}</div>
                <h3 style="padding-top:10px;">{{ $post->description }}</h3>
                <p>{{ $post->body }}</p>
            </div>
            @if(Auth::check())
            <form method="POST" action="{{ route('post.comment', ['id' => $post['id']]) }}">
                {!! csrf_field() !!}
            <div style="padding-top:15px;">
                <textarea name="content" class="form-control" row="5" placeholder="Viết bình luận" style="border-radius: 4px;"></textarea>
            </div>
            <button type="submit" class="btn-success" style="float:right; margin-top:8px; margin-bottom: 14px; border-radius: 4px;">Thêm bình luận</button>
            </form>
            @endif
            <h3>
                Comments
            </h3>
            <div class="comments">
                @foreach($comments as $comment)
                    @if(Auth::check() && ((Auth::user()->id == $comment->user_id)))
                                <div>
                                    <form action="{{ route('ud.comment', ['id'=>$comment['id']]) }}" method="POST">
                                        {!! csrf_field() !!}
                                        <textarea name="content" class="form-control" style="border-radius: 4px;">
                                            {{ $comment->content }}
                                        </textarea>
                                        <button class="btn-danger float-right" type="submit" name="action" value="delete" style="border-radius:4px; margin:5px;margin-right:0;">Xóa</button>
                                        <button class="btn-info float-right" type="submit" name="action" value="update" style="border-radius:4px; margin:5px;">Chỉnh sửa</button>
                                    </form>
                                </div>
                    @else
                    <div class="comment">
                        <p>
                        {{ $comment->content }}
                        </p>
                        <small>
                            Người đăng: {{ $comment->user->name }}
                        </small>
                    </div>
                    @endif
                @endforeach
            </div>
        </div>
    </div>
@endsection

