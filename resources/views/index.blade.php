@extends('layouts.client', ['page_title'=>'NewsPage'])
@section('content')
<div class="body-wrapper">
    <div class="canle">
        <div class="section-top">
            <div class="flx justifySB">
                <div class="bigLeft">
                    @foreach($biggest as $item)
                    <div class="newsbox">
                        <a class="thumb">
                            <i style="background-image: url('{{ asset('storage/'.$item->url_img) }}')"></i>
                            <!-- <img src="https://genk.mediacdn.vn/zoom/540_336/139269124445442048/2022/10/7/avatar1665127028857-16651270291311895952947.jpg"> -->
                        </a>
                        <div class="newstotal">
                            <h2>
                                <a href="{{ url('view') }}/{{ $item->id }}">
                                    {{ $item->title }}
                                </a>
                            </h2>
                        </div>
                    </div>
                    @endforeach
                    <ul class="list-news-top flx justifySB">
                        @foreach($second as $item)
                        <li>
                            <div class="newsbox">
                                <a class="thumb secondthumb">
                                    <i style="background-image: url('{{ asset('storage/'.$item->url_img) }}')"></i>
                                </a>
                            </div>
                            <div class="newstotal">
                                <h3>
                                    <a href="{{ url('view') }}/{{ $item->id }}" title={{ $item->title }} class="news_title">{{ $item->title }}</a>
                                </h3>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>
                <div class="bigRight">

                    <div class="bigRightLeft">
                        @foreach($third as $item)
                        <div class="newsbox">
                            <a href="{{ url('view') }}/{{ $item->id }}" title={{ $item->title }} class="thumb">
                                <i style="background-image: url('{{ asset('storage/'.$item->url_img) }}')"></i>
                            </a>
                        </div>
                        <div class="newstotal">
                            <h3>
                                <a href="{{ url('view') }}/{{ $item->id }}" title={{ $item->title }} class="news_title" >{{ $item->title }}</a>
                            </h3>
                        </div>
                        @endforeach
                        <ul class="news-top-right">
                            @foreach($forth as $item)
                            <li>
                                <div class="newsbox flx">
                                    <a href="{{ url('view') }}/{{ $item->id }}" title={{ $item->title }} class="thumb">
                                        <i style="background-image: url('{{ asset('storage/'.$item->url_img) }}')"></i>
                                    </a>
                                    <div class="newstotal">
                                        <h3>
                                            <a href="{{ url('view') }}/{{ $item->id }}" class="news_title smallthumb">{{ $item->title }}</a>
                                        </h3>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="bigRightRight" style="width:200px;"></div>

                </div>
            </div>
        </div>
        <div class="hotnews">
            <h3 class="hotnews-label">
                <a>Đáng chú ý</a>
            </h3>
            <div class="hotnews-wrapper">
                <div class="hotnews">
                    <ul class="list-hotnews">
                        @foreach($hotnews as $item)
                        <li class="hotnews-item">
                            <div class="newsbox midthumb">
                                <a href="{{ url('view') }}/{{ $item->id }}" class="thumb">
                                    <i style="background-image: url('{{ asset('storage/'.$item->url_img) }}')"></i>
                                </a>
                                <div class="newstotal">
                                    <a href=# class="news-type">{{ $item->category->name }}</a>
                                    <h4>
                                        <a href="{{ url('view') }}/{{ $item->id }}" class="news_title">{{ $item->title }}</a>
                                    </h4>
                                </div>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
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
                                    <a href="{{ route('view.cate', ['id'=>$post->category->id]) }}">
                                        {{ $post->category->name }}
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



