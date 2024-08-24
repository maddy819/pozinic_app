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
            <!-- /.card-header -->
            <div class="card-header">
              <div class="row">
                <div class="col-6">
                  <form class="form-inline" action="{{ route('admin-import-nutritions') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Nutrition</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-nutrition">Post Nutrition</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <table id="example1" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Code</th>
                    <th>Title</th>
                    <th>Slug</th>
                    <th>Calorie Range</th>
                    <th>Image</th>
                    <th>created At</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($nutritions as $nt)
                  <tr>
                    <td>{{ $nt->code }}</td>
                    <td>{{ $nt->title }}</td>
                    <td>{{ $nt->slug }}</td>
                    <td>{{ $nt->calorie_range_1 }} - {{ $nt->calorie_range_2 }}</td>
                    <td>
                      @if($nt->image)
                        @if(file_exists('uploads/nutrition/images/'.$nt->image))
                          <img width="40" src="{{ asset('uploads/nutrition/images/'.$nt->image) }}" alt="{{ $nt->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $nt->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $nt->title }}"/>
                      @endif
                    </td>
                    <td>{{ $nt->created_at->diffForHumans() }}</td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a title="Edit Nutrition" class="dropdown-item" href="{{ route('admin-view-nutrition-meals', [$nt->id]) }}">View Meals</a>
                          <a title="Edit Nutrition" class="dropdown-item" href="#" onclick="edit_nutrition({{ $nt->id }})">Edit Nutrition</a>
                          <a title="Delete Nutrition" class="dropdown-item" href="{{ route('admin-delete-nutrition', [$nt->id]) }}" onclick="return confirm('Are you sure?')">Delete Nutrition</a>
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
                    <th>Calorie Range</th>
                    <th>Image</th>
                    <th>created At</th>
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
    <div class="modal modal-primary fade" id="modal-nutrition" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Nutrition List</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="nutrition_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <input type="hidden" name="id" id="id">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Calorie Range:</label>
                                    <select name="calorie_range" class="form-control" id="calorie_range" required>
                                      <option value="1100-1350">1100 - 1350</option>
                                      <option value="1351-1600">1351 - 1600</option>
                                      <option value="1601-1850">1601 - 1850</option>
                                      <option value="1851-2100">1851 - 2100</option>
                                      <option value="2101-2350">2101 - 2350</option>
                                      <option value="2351-2600">2351 - 2600</option>
                                      <option value="2601-2900">2601 - 2900</option>
                                      <option value="2901-3200">2901 - 3200</option>
                                      <option value="3201-3500">3201 - 3500</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control"  id="image">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="title">Instructions:</label>
                                    <textarea name="instruction" class="form-control" id="instruction" placeholder="Instructions" required></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Nutrition">
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
  var blank_field = $('#blank-row').html();

  function appendRow() {
      $('#first-row').append(blank_field);
  }

  function removeRow(elem) {
      $(elem).closest('.student-row').remove();
  }

  $(function () {
    $("#example1").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    $('#instruction').summernote({
      height: 100,
      placeholder: 'Instruction',
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

    $('#modal-nutrition').on('hidden.bs.modal', function (e) {
      $('#nutrition_post').trigger('reset');
      $('#calorie_range').val([]).change();
      $('#instruction').summernote('reset');
    })

  });

  $("#nutrition_post").validate({
    ignore: ".ql-container *",
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#nutrition_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-nutrition') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#nutrition_post').trigger('reset');
            $('#instruction').summernote('reset');
            $('#modal-nutrition').modal('hide');
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

  function edit_nutrition(ntId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-nutrition') }}",
      data: { _token: _token, ntId: ntId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $('#nutrition_post').trigger('reset');
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#old_image").val(detail.image);
        $("#instruction").summernote('code', detail.instructions);
        $('#send_form').attr({value: "Update Nutrition"});
        $("#modal-nutrition").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection

