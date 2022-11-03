<!DOCTYPE html>
<html lang="en">
@include('admin.header')
<body class="">
@include('admin.sidebar')
<div class="main-content">
@include('admin.navbar')
@yield('content')
</div>
@yield('comments')
@include('admin.footer')
@include('sweetalert::alert')
</body>
@include('admin.script')
@yield('after_scripts')
</html>

