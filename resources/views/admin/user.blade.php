@extends('layouts.admin')
@section('content')
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
                    <form role="form" action="{{ url('/admin/edit_user') }}/{{ $user->id }}" method="POST"
                          style="margin:25px;">
                        {!! csrf_field() !!}
                        <div class="form-group">
                            <label for="name">User</label>
                            <input type="text" class="form-control" id="name" name="name"
                                   value="{{ $user->name }}">
                        </div>
                        <div class="form-group">
                            <label for="category">Select role</label>
                            <select class="form-control" id="role" name="role">
                                @foreach($roles as $role)
                                    @if($role->id == $user->roles->first()->id)
                                        <option value="{{ $role->id }}" selected>{{ $role->name }}</option>
                                    @else
                                        <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <textarea class="form-control" id="email" name="email"
                                      rows="3">{{ $user->email }}</textarea>
                        </div>
                        <button type="submit" class="btn btn-success">
                            Save user
                        </button>
                    </form>
                </div>
            </div>
@endsection
