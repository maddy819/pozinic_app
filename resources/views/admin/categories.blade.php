@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{$pageTitle}}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('admin-dashboard') }}">Home</a></li>
              <li class="breadcrumb-item active">{{$pageTitle}}</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-category">Post Category</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Post Date</th>
                        <th>Featured</th>
                        <th>Featured For</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($categories as $cat)
                    <tr>
                        <td>{{ $cat->name }}</td>
                        <td>{{ $cat->slug }}</td>
                        <td>{{ date('F d, Y', strtotime($cat->created_at)) }}</td>

                        @if($cat->featured == 1)
                            <td><button class="btn btn-xs btn-success btn-block">Yes</button></td>
                        @else
                            <td><button class="btn btn-xs btn-danger btn-block">No</button></td>
                        @endif

                        @if($cat->featured_for == 1)
                            <td><button class="btn btn-xs btn-success btn-block">Exercise</button></td>
                        @elseif($cat->featured_for == 2)
                            <td><button class="btn btn-xs btn-danger btn-block">Workout</button></td>
                        @elseif($cat->featured_for == 3)
                            <td><button class="btn btn-xs btn-primary btn-block">Program</button></td>
                        @elseif($cat->featured_for == 4)
                            <td><button class="btn btn-xs btn-secondary btn-block">Split</button></td>
                        @else
                            <td></td>
                        @endif

                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_category({{ $cat->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                <a class="btn btn-xs btn-danger" href="{{ route('admin-delete-categories', [$cat->id]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Post Date</th>
                        <th>Featured</th>
                        <th>Featured For</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

    <!-- page script -->
    <div class="modal modal-primary fade" id="modal-category" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="category_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Title" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category" class="featured">Featured:</label>
                                    <select class="form-control featured" name="featured" id="featured" onchange="featuredFor()" required>
                                        <option selected disabled>Select Option</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="featured_for_element">
                                <div class="form-group">
                                    <label for="category" class="featured">Featured For:</label>
                                    <select class="form-control" name="featured_for" id="featured_for">
                                        <option selected disabled>Select Option</option>
                                        <option value="1">Exercise</option>
                                        <option value="2">Workout</option>
                                        <option value="3">Program</option>
                                        <option value="4">Split</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <!-- <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description"></textarea>
                                </div> -->

                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Category">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
@endsection

@section('script')

@if(Session::has('error'))
    <script>
      toastr.error('{{Session::get("error")}}');
    </script>
@endif

@if(Session::has('success'))
    <script>
      toastr.success('{{Session::get("success")}}');
    </script>
@endif

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, 
            "lengthChange": false, 
            "autoWidth": false, 
            "info": true,
            "lengthChange": true,
            "dom": 'Blfrtip',
            "buttons": ["selectAll","selectNone","copy", "csv", "excel", "pdf", "print", "colvis"]
        });

        $('#description').summernote({
            height: 100,
            placeholder: 'Description',
            lineHeights: ['0.38', '1.38'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18'],
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph', 'color']],
                ['table', ['table']],
                ['view', ['fullscreen', 'codeview', 'help']],
                ['height', ['height']]
            ]
        });

        $('#modal-category').on('hidden.bs.modal', function (e) {
            $('#category_post').trigger('reset');
            $('#description').summernote('reset');
        })

        featuredFor();
    });

    function featuredFor() {
        var featured = $("#featured").val();
        if(featured == "1") {
            $("#featured_for_element").show();
            $("#featured_for").attr('required', 'required');
        } else {
            $("#featured_for_element").hide();
            //$("#featured_for").removeAttr('required');​​​​​
        }
    }

    $("#category_post").validate({
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

            var form = $('#category_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-categories') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                    //console.log(response);
                    if(response.success) {
                        $('#category_post').trigger('reset');
                        $('#description').summernote('reset');
                        $('#modal-category').modal('hide');
                        window.setTimeout(function(){location.reload()},1500)
                        Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 1500 });
                    } else {
                        Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 1500 });
                    }
                },
                error: function(error) {
                    console.log(error);
                    Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
                }
            });
        }
    });

    function edit_category(catId) {
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-category') }}",
            data: { _token: _token, catId: catId },
            cache: false, 
            dataType: "json",
            success: function(detail){
                console.log(detail);
                $('#category_post').trigger('reset');
                $("#id").val(detail.id);
                $("#name").val(detail.name);
                $("#featured").val(detail.featured).trigger('reset');
                $("#featured_for").val(detail.featured_for).trigger('reset');
                $('#send_form').attr({value: "Update Category"});
                 $("#modal-category").modal('show');
                featuredFor();
            },
            error: function(error) {
                console.log(error);
                Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
            }
        });
    }
</script>
@endsection