<html>
<p>Dear {{ $author->name }}</p>
<br>
<p>Bài của bạn đã đạt được {{ $post->view_count }} views</p>
<h2>Bài viết <a href="{{ url('/view/$post->id') }}">{{ $post->name }}</a></h2>
<img src="{{ $message->embed(asset($post->img_url)) }}">
<h3>{{ $post->description }}</h3>
</html>
