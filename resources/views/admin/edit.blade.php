<!--

=========================================================
* Argon Dashboard - v1.1.2
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2020 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->

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
                        <form role="form" action="{{ url('/admin/edit') }}/{{ $item->id }}" method="POST"
                              style="margin:25px;">
                            {!! csrf_field() !!}
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" id="title" name="title"
                                       value="{{ $item->title }}">
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input type="text" class="form-control" id="description" name="description"
                                       value="{{ $item->description }}">
                            </div>
                            <div class="form-group">
                                <label for="category">Select category</label>
                                <select class="form-control" id="category" name="category">
                                    @foreach($cates as $cate)
                                        @if($cate->id == $item->cate_id)
                                            <option value="{{ $cate->id }}" selected>{{ $cate->name }}</option>
                                        @else
                                            <option value="{{ $cate->id }}">{{ $cate->name }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="body">Body</label>
                                <textarea class="form-control ckeditor" id="body" name="body"
                                          rows="3">{!! html_entity_decode($item->body) !!}</textarea>
                            </div>
                            <button type="submit" class="btn btn-success">
                                Save post
                            </button>
                        </form>
                    </div>
                </div>
                <!-- Footer -->

                <!--   Core   -->
@endsection
