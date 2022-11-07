<div class = "header-wrapper">
    <div class="top-header">
        <div class="canle">
            <ul class="channelvn">
                <li class="link_other_page">
                    <a href="http://gamek.vn/" title="Kênh thông tin mới nhất về Game trong nước và thế giới" target="_blank" rel="nofollow">Gamek</a>
                </li>
                <li class="link_other_page">
                    <a href="http://kenh14.vn/" title="Kênh tin tức giải trí - Xã hội " target="_blank" rel="nofollow">Kenh14</a>
                </li>
                <li class="link_other_page">
                    <a href="http://cafebiz.vn/" target="_blank" title="CafeBiz - Thông tin kinh doanh - Doanh nhân" rel="nofollow">Cafebiz</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="bottom-header">
        @include('menu')
        <div class="canle">
            <h1>
                <a href="{{ url('view') }}" title="Trang thông tin dành cho tín đồ công nghệ" class="logo-genk">
                    <img src="https://static.mediacdn.vn/genk/web_images/logogenk.svg" alt="Logo" style="width: 100%">
                </a>
            </h1>
            <ul class="menu-list">
                @if(isset($category))
                @foreach($category as $cate)
                <li class="menu-li">
                    <a href="{{ route('view.cate', ['id' => $cate->id]) }}">{{ $cate->name }}</a>
                </li>
                @endforeach
                    <li class="menu-li expand-icon" id="expandicon">
                        <div class="container" onclick="myFunction(this)">
                            <div class="bar1"></div>
                            <div class="bar2"></div>
                            <div class="bar3"></div>
                        </div>
                    </li>
                @else
                    <li class="menu-li">
                        <a href="{{ route('home') }}">Home</a>
                    </li>
                @endif
                @if(Auth::check())
                    <li class="menu-li">
                        <a href="{{ route('home') }}">
                        {{ Auth::user()->name }}
                        </a>
                    </li>
                    <li class="menu-li">
                        <a href="{{ route('logout') }}" onclick="event.preventDefault();
                 document.getElementById('logout-form').submit();">Đăng Xuất</a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </li>
                @else
                <li class="menu-li">
                    <a href="{{ route('login') }}">Đăng nhập</a>
                </li>
                <li class="menu-li">
                    <a href="{{ route('register') }}">Đăng ký</a>
                </li>
                @endif
            </ul>
        </div>
    </div>
</div>
