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
              <div class="row">
                <div class="col-6">
                  <form class="form-inline" action="{{ route('admin-import-nutrition-meal') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Meals</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-meal">Post Nutrition Meal</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                    <th>Code</th>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Time</th>
                        <th>Suggestions</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($nutritionMeals as $nm)
                    <tr>
                    <td>{{ $nm->code }}</td>
                        <td>{{ $nm->title }}</td>
                        <td>{{ $nm->slug }}</td>
                        <td>{{ $nm->time }}</td>
                        <td>{!! $nm->suggestions !!}</td>
                        <td>
                            <div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a title="Edit Nutrition" class="dropdown-item" href="#" onclick="edit_meal({{ $nm->id }})">Edit Meal</a>
                                    <a title="Delete Meal" class="dropdown-item" href="{{ route('admin-delete-nutrition-meal', [$nm->id]) }}" onclick="return confirm('Are you sure?')">Delete Meal</a>
                                    <a title="View Items" class="dropdown-item" href="{{ route('admin-view-nutrition-meal-items', [$nm->id]) }}">View Items</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                    <th>Code</th>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Time</th>
                        <th>Suggestions</th>
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
    <div class="modal modal-primary fade" id="modal-meal" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Meal in {{ $nutrition->title }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="meals_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category">Title:</label>
                                    <input type="hidden" name="nid" class="form-control" id="nid" value="{{ $nutrition->id }}">
                                    <input type="hidden" name="mlid" class="form-control" id="mlid">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Time:</label>
                                    <input type="text" name="time" class="form-control" id="time" placeholder="Time">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="title">Suggestions:</label>
                                    <textarea name="suggestions" class="form-control" id="suggestions" placeholder="Suggestions"></textarea>
                                </div>

                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Meal">
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
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    $('#suggestions').summernote({
      height: 100,
      placeholder: 'suggestions',
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
  });

  $("#meals_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#meals_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-nutrition-meal') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#meals_post').trigger('reset');
            $('#suggestions').summernote('reset');
            $('#modal-meal').modal('hide');
            window.setTimeout(function(){location.reload()},1500)
            Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 3000 });
          } else {
            Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 3000 });
            $('#send_form').val('Post Item');
          }
        },
        error: function(error) {
          console.log(error);
          Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
        }
      });
    }
  });

  function edit_meal(nmId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-nutrition-meal') }}",
      data: { _token: _token, nmId: nmId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $('#meals_post').trigger('reset');
        $("#mlid").val(detail.id);
        $("#title").val(detail.title);
        $("#time").val(detail.time);
        $("#suggestions").summernote('code', detail.suggestions);
        $('#send_form').attr({value: "Update Meal"});
        $("#modal-meal").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection
