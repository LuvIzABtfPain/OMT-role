<!--

=========================================================
* Argon Dashboard - v1.1.2
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2020 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->

@extends('layouts.admin')
@section('content')
    <!-- Header -->
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
        <div class="container-fluid">
            <div class="header-body">
                <!-- Card stats -->

            </div>
        </div>
    </div>
    <div class="container-fluid mt--7">
        <div class="row mt-5">
            <div class="col-xl-12 mb-5 mb-xl-0">
                <div class="card shadow">
                    <div style="margin:25px;">
                        <h1>{{ $item->title }}</h1>
                        <img src="{{ asset('storage/'.$item->url_img) }}" style="max-width: 100%;">
                        <h2>{{ $item->description }}</h2>
                        <h3>Chuyên mục: {{ $cate }}</h3>
                        <p class="text-center">{!! html_entity_decode($item->body) !!}</p>
                        <small>Tác giả: {{ $author }}</small>
                    </div>
                    @endsection()
                    @section('comments')
                        <form method="POST" action="{{ route('post.comment', ['id' => $item['id']]) }}">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label for="comment">Comment</label>
                                <textarea class="form-control" id="comment" name="content" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success">
                                Bình luận
                            </button>
                        </form>

                        @foreach($comments as $comment)
                            <div class="card shadow" style="margin: 15px 0; padding: 0 10px;">
                                <form action="{{ route('ud.comment', ['id'=>$comment['id']]) }}" method="POST" class="delete">
                                    {!! csrf_field() !!}
                                <p class="text-left">{{ $comment->content }}</p>
                                <div>
                                <button type="button" class="btn btn-danger" style="width:85px; margin-bottom:10px;height:40px;">Xóa</button>
                                    <button type="submit" class="delbutton" value="delete" name="action" hidden></button>
                                <small class="float-right">{{ $comment->user->name }}</small>
                                </div>
                                </form>
                            </div>
                         @endforeach
@endsection
@section('after_scripts')
    <script>
        //delete
        $('.btn-danger').on("click", function (e){
            e.preventDefault();
            $delbutton = $(this).siblings('.delbutton');
            Swal.fire({
                title: 'Are you sure delete this?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $delbutton.trigger('click');
                }
            })
        });
    </script>
@endsection
