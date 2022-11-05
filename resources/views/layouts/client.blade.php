@include('header')
<body>
@include('navbar')
@yield('content')
</body>
@include('sweetalert::alert')
@yield('after_scripts')
@include('footer')
