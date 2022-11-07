<div id="menu-expand" class="menu-expand-wrapper">
    <div class="canle">
        <ul class="menu-expand-list">
            @if(isset($category))
            @foreach($category as $item)
            <li class="menu-expand-item">
                <ul class="sub-menu-expand-list">
                    <li class="sub-menu-expand-item cate">
                        <a href="{{ route('view.cate', ['id' => $item->id]) }}">{{ $item->name }}</a>
                    </li>
{{--                    <li class="sub-menu-expand-item">--}}
{{--                        <a href="#">Điện thoại</a>--}}
{{--                    </li>--}}
{{--                    <li class="sub-menu-expand-item">--}}
{{--                        <a href="#">Máy tính bảng</a>--}}
{{--                    </li>--}}
                </ul>
            </li>
            @endforeach
            @endif
        </ul>
    </div>
</div>
