@extends('layouts.client', ['page_title'=>'NewsPage'])
@section('content')
    <div class="body-wrapper">
        <div class="canle">
            <div class="section-mid">
                <div>
                    <div class="news-wrapper">
                        <ul style="padding-left:0px;">
                            @foreach($posts as $post)
                                <li class="clearfix">
                                    <div class="another-left">
                                        <a  class="another">
                                            <img src="{{  asset('storage/'.$post->url_img) }}">
                                        </a>
                                    </div>
                                    <div class="another-right">
                                        <div class="another-type">
                                            <a href="{{ route('view.cate', ['id'=>$cate->id]) }}">
                                                {{ $cate->name }}
                                            </a>
                                        </div>
                                        <div class="another-title">
                                            <h4>
                                                <a href="{{ url('view') }}/{{ $post->id }}">
                                                    {{ $post->title }}
                                                </a>
                                            </h4>
                                        </div>
                                        <span class="another-desc">
                                    {{ $post->description }}
                                </span>
                                        <div class="another-time">
                                            {{ $post->user->name }}
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
