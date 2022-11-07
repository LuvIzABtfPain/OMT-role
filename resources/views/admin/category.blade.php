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
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="mb-0">Categories</h3>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <!-- Projects table -->
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th>Tools</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($cates as $cate)
                                <tr>
                                    <th scope="row">
                                        {{ $cate->id }}
                                    </th>
                                    <td class="catename">{{ $cate->name }}</td>
                                    <td class="cateicon">
                                            <a href=# onclick="editCate(this); return false;" data-id='{{ $cate->id }}'
                                               class="btn btn-primary btn-sm">
                                                <svg class="svg-inline--fa fa-pen-to-square" aria-hidden="true"
                                                     focusable="false" data-prefix="fas" data-icon="pen-to-square"
                                                     role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                     data-fa-i2svg="">
                                                    <path fill="currentColor"
                                                          d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.8 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"></path>
                                                </svg>
                                                <!-- <span class="fa fa-edit"></span> Font Awesome fontawesome.com -->
                                            </a>
                                            <a href="{{ url('admin/delete_cate/' . $cate->id) }}"
                                               class="btn btn-danger btn-sm del-post-list" data-name="{{ $cate->name }}">
                                                <svg class="svg-inline--fa fa-trash" aria-hidden="true"
                                                     focusable="false" data-prefix="fas" data-icon="trash" role="img"
                                                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
                                                     data-fa-i2svg="">
                                                    <path fill="currentColor"
                                                          d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"></path>
                                                </svg>
                                                <!-- <span class="fa fa-trash"></span> Font Awesome fontawesome.com -->
                                            </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card shadow" style="margin-top: 15px; padding:10px;">
                    <form action="{{ route('add.cate') }}" method="post">
                        {!! csrf_field() !!}
                        <div class="form-group">
                            <label class="float-left">Click change button on which row you want to change or click add button to add new category</label>
                            <input type="text" class="float-left" id="cate_name" name="name" style="margin-right: 8px; margin-left:8px;">
                            <button type="submit" id="btn_add" class="btn-success float-right" style="border-radius: 4px;">Add</button>
                            <button type="button" id="btn_cancel" class="btn-danger float-right" onclick="cancelEdit();return false;" style="display:none; border-radius: 4px;">Cancel</button>
                            <button type="button" id="btn_change" class="btn-info float-right" style="display:none; border-radius: 4px; margin-right:8px;">Change</button>
                        </div>
                    </form>
                </div>
                @foreach($errors->all() as $error)
                    <div style="color:red;">{{$error}}</div>
                @endforeach
            </div>
@endsection
@section('after_scripts')
    <script>
                function editCate(element){
                $name = $(element).parents('td.cateicon').siblings('td.catename').html();
                $data_id = $(element).attr('data-id');
                $('#btn_add').hide();
                $('#btn_change, #btn_cancel').show();
                $('#cate_name').val($name);
                $('#btn_change').attr('data-id', $data_id);
                $('#btn_change').attr('data-name', $name);
                }
                function cancelEdit(){
                    $('#btn_change, #btn_cancel').hide();
                    $('#btn_add').show();
                    $('#cate_name').val(null);
                }

                //delete
                $('a.btn-danger').on("click", function (e){
                    e.preventDefault();
                    $name = $(this).attr("data-name");
                    $url = $(this).attr("href");
                    Swal.fire({
                        title: 'Are you sure delete this?',
                        text: $name,
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = $url;
                        }
                    })
                });

                $("#btn_change").on("click",function(){
                    $name = $('#cate_name').val();
                    $id = $(this).attr("data-id");
                    if($name == ''){
                        Swal.fire('Không được để trống');
                    }
                    else if($name == $(this).attr("data-name")){
                        Swal.fire('Chưa có thay đổi nào');
                    }
                    else {
                    $.ajax({
                        url: "http://alllaravel.test/admin/edit_cate",
                        type: "GET",
                        data: {
                            name: $name,
                            id: $id,
                        },
                        success: function (result) {
                            location.reload();
                        },
                        error: function(){
                            swal("edit that bai");
                        }
                    });
                    }
                });
    </script>
@endsection
