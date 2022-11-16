<html>
<p>Dear {{ $user->name }}</p>
<br>
<p>Bạn có bỏ lỡ?</p>
<h2>Bài viết hot nhất ngày hôm nay: <a href="{{ url('/view/$post->id') }}">{{ $post->name }}</a></h2>
<img src="{{ $message->embed(asset($post->img_url)) }}">
<h3>{{ $post->description }}</h3>
</html>
