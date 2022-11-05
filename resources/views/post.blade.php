@extends('layouts.client', ['page_title'=>'NewsPage'])
@section('content')
    <div class="body-wrapper">
        <div class="canle">
            <div style="margin-top: 50px;">
                <img src="{{ asset('img') }}/{{ $post->url_img ?? 'anh7' }}.webp" style="max-width: 100%;">
                <h2>{{ $post->title }}</h2>
                <h4 style="padding-top:10px;">{{ $cate->name }}</h4>
                <div style="padding-top:10px;">Tác giả: {{ $author->name }}</div>
                <h3 style="padding-top:10px;">{{ $post->description }}</h3>
                <p>{!! html_entity_decode($post->body) !!}</p>
            </div>
            <h3>
                Comments
            </h3>
            <form method="POST" action="{{ route('post.comment', ['id' => $post['id']]) }}">
                {!! csrf_field() !!}
            <div style="padding-top:15px;">
                <textarea name="content" class="form-control" row="5" placeholder="Viết bình luận" style="border-radius: 4px;"></textarea>
            </div>
            <button type="submit" class="btn-success" style="margin-top:8px; margin-bottom: 14px; border-radius: 4px;">Thêm bình luận</button>
            </form>
            <div class="comments">
                @if($comments_can_edit !=  null)
                @foreach($comments_can_edit as $comment)
                <div class="comment">
                    <form action="{{ route('ud.comment', ['id'=>$comment['id']]) }}" method="POST">
                        {!! csrf_field() !!}
                        <p>{{ $comment->content }}</p>
                        <small style="float:right;">
                            {{ $comment->updated_at ?? $comment->created_at }}
                        </small>
                        <textarea name="content" style="width:100%;" hidden>{{ $comment->content }}</textarea>
                        <div>
                            <button type="button" class="btn btn-info bt1" value="update" onclick="calledit(this);">Chỉnh sửa</button>
                            <button type="submit" class="btn btn-success bt2" hidden value="update" name="action">Lưu</button>
                            <button type="button" class="btn btn-danger bt3" onclick="rollbackedit(this);"hidden>Hủy</button>
                            <button type="button" class="btn btn-danger bt4" onclick="calldelete(this); return false;">Xóa</button>
                            <button type="submit" class="btn btn-danger bt5" hidden value="delete" name="action"></button>
                        </div>
                    </form>
                </div>
                @endforeach
                @endif
                @foreach($comments_cant_edit as $comment)
{{--                    @if(Auth::check() && ((Auth::user()->id == $comment->user_id)))--}}
{{--                                <div>--}}
{{--                                    <form action="{{ route('ud.comment', ['id'=>$comment['id']]) }}" method="POST">--}}
{{--                                        {!! csrf_field() !!}--}}
{{--                                        <textarea name="content" class="form-control" style="border-radius: 4px;text-align:left;">{{ $comment->content }}</textarea>--}}
{{--                                        <button class="btn-danger float-right" type="submit" name="action" value="delete" style="border-radius:4px; margin:5px;margin-right:0;">Xóa</button>--}}
{{--                                        <button class="btn-info float-right" type="submit" name="action" value="update" style="border-radius:4px; margin:5px;">Chỉnh sửa</button>--}}
{{--                                    </form>--}}
{{--                                </div>--}}
{{--                    @else--}}
                    <div class="comment">
                        <p>
                        {{ $comment->content }}
                        </p>
                        <small>
                            Người đăng: {{ $comment->user->name }}
                        </small>
                    </div>
{{--                    @endif--}}
                @endforeach
            </div>
        </div>
    </div>
@endsection
@section('after_scripts')
    <script>
        function calledit(element) {
            $dad = $(element).parents('.comment');
            $(element).attr("hidden", true);
            $dad.find('.bt2, .bt3, textarea').removeAttr('hidden');
            $dad.find('.bt4, p').attr("hidden", true);
            $dad.find('textarea').focus();
        }
        function rollbackedit(element) {
            $dad = $(element).parents('.comment');
            $(element).attr("hidden", true);
            $dad.find('.bt1, .bt4, p').removeAttr('hidden');
            $dad.find('.bt2, textarea').attr("hidden", true);
        }
        function calldelete(element){
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $(element).parents('.comment').find('.bt5').trigger("click");
                }
            })
        }
    </script>
@endsection
