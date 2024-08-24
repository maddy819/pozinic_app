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
                  <form class="form-inline" action="{{ route('admin-import-nutrition-meal-item') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Items</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-items">Post Nutrition Item</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($mealItems as $mi)
                    <tr>
                        <td>{{ $mi->title }}</td>
                        <td>{{ $mi->slug }}</td>
                        <td>{{ $mi->quantity }}</td>
                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_item({{ $mi->id }})"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                <a class="btn btn-xs btn-danger" href="{{ route('admin-delete-nutrition-meal-item', [$mi->id]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Title</th>
                        <th>Slug</th>
                        <th>Quantity</th>
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
    <div class="modal modal-primary fade" id="modal-items" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Item in {{ $nutrition->title }}-{{ $meal->title }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="items_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div id="first-row">
                          <div class="row">
                            <div class="col-xl-11 col-lg-11 col-md-12 col-sm-12">
                              <label for="title">Items:</label>
                              <div class="row">
                                <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                                  <input type="hidden" name="meal_id" id="meal_id" value="{{ $meal->id }}">
                                  <input type="text" name="title[]" class="form-control" placeholder="Title" required>
                                </div>

                                <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                                  <input type="text" name="quantity[]" class="form-control" placeholder="Quantity" required>
                                </div>
                              </div>
                            </div>
                            <div class="col-xl-1 col-lg-1 col-md-12 col-sm-12">
                              <label for="title">&nbsp;</label>
                              <div class="row">
                                <div class="form-group">
                                  <button type="button" class="btn btn-icon btn-success" onclick="appendRow()"> <i class="fa fa-plus-circle" aria-hidden="true"></i> </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Item">
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

    <div class="modal modal-primary fade" id="modal-update-items" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Update Item in {{ $nutrition->title }}-{{ $meal->title }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                  <form id="items_update" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                    <div class="row">
                      <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                        <label for="position">Title:</label>
                        <input type="hidden" name="item_id" id="item_id">
                        <input type="text" name="title" id="upd_title" class="form-control" placeholder="Title" required>
                      </div>

                      <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                        <label for="position">Quantity:</label>
                        <input type="text" name="quantity" id="upd_quantity" class="form-control" placeholder="Quantity" required>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input type="submit" id="send_form_upd" name="save" class="btn btn-primary" value="Update Item">
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

    <div id="blank-row" style="display: none;">
      <div class="row student-row">
          <div class="col-xl-11 col-lg-11 col-md-12 col-sm-12">
              <div class="row">
                <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                  <input type="text" name="title[]" class="form-control" placeholder="Title" required>
                </div>

                <div class="form-group col-xl-6 col-lg-6 col-md-12 col-sm-12">
                  <input type="text" name="quantity[]" class="form-control" placeholder="Quantity" required>
                </div>
              </div>
          </div>
          <div class="col-xl-1 col-lg-1 col-md-12 col-sm-12">
              <div class="row">
                  <div class="form-group">
                      <button type="button" class="btn btn-icon btn-danger" onclick="removeRow(this)"> <i class="fa fa-minus-circle" aria-hidden="true"></i> </button>
                  </div>
              </div>
          </div>
      </div>
    </div>

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

  });

  $("#items_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#items_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-nutrition-meal-item') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#items_post').trigger('reset');
            $('#modal-items').modal('hide');
            window.setTimeout(function(){location.reload()},1500)
            Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 3000 });
          } else {
            Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 3000 });
            $('#send_form').val('Post Item');
          }
        },
        error: function(error) {
          console.log(error);
          $('#send_form').val('Post Item');
          Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
        }
      });
    }
  });

  $("#items_update").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#items_update')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-nutrition-meal-item') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#items_update').trigger('reset');
            $('#modal-update-items').modal('hide');
            window.setTimeout(function(){location.reload()},1500)
            Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 3000 });
          } else {
            Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 3000 });
            $('#send_form_upd').val('Update Item');
          }
        },
        error: function(error) {
          console.log(error);
          $('#send_form_upd').val('Update Item');
          Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
        }
      });
    }
  });

  function edit_item(itId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-nutrition-meal-item') }}",
      data: { _token: _token, itId: itId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $('#items_update').trigger('reset');
        $("#item_id").val(detail.id);
        $("#upd_title").val(detail.title);
        $("#upd_quantity").val(detail.quantity);
        $('#send_form_upd').attr({value: "Update Item"});
        $("#modal-update-items").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection
