@extends('layouts.client')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8" style="margin-top: 150px;">
            <div class="card">
                <div class="card-header">{{ __('Xác nhận Email') }}</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('Một đường link xác nhận email đã được gửi.') }}
                        </div>
                    @endif

                    {{ __('Trước khi tiếp tục, vui lòng check link xác nhận trong email.') }}
                    {{ __('Nếu bạn chưa nhận được trong email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('Click để gửi lại link') }}</button>.
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
