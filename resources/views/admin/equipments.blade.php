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
            <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-equipment">Post Equipment</a>
            </div>
            <div class="card-body">
              @if(Session::has('success'))
                  <div class="alert alert-success alert-dismissible">
                      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      {{Session::get('success')}}
                  </div>
              @endif

              @if(Session::has('error'))
                  <div class="alert alert-success alert-dismissible">
                      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      {{Session::get('error')}}
                  </div>
              @endif
              <table id="example1" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Weight</th>
                    <th>Description</th>
                    <th>created At</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($equipments as $eq)
                  <tr>
                    <td>{{ $eq->name }}</td>
                    <td>{{ $eq->weight }}</td>
                    <td>{!! $eq->description !!}</td>
                    <td>{{ $eq->created_at->diffForHumans() }}</td>
                    <td>
                      <form action="javascript:void(0)">@csrf
                          <a class="btn btn-xs btn-primary" href="#" onclick="edit_equipment({{ $eq->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                      </form>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Name</th>
                    <th>Weight</th>
                    <th>Description</th>
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
    <div class="modal modal-primary fade" id="modal-equipment" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Equipment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="equipment_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Name:</label>
                                    <input type="hidden" name="id" id="id">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Name" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Weight:</label>
                                    <input type="text" name="weight" class="form-control" id="weight" placeholder="Weight" required>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description" required></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Equipment">
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

    $('#description').summernote({
      height: 100,
      placeholder: 'Description',
      dialogsInBody: true,
      toolbar: [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul','ol','paragraph']],
          ["view", ["fullscreen", "codeview"]]
      ],
    });
  });

  $("#equipment_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });
      $('#send_form').val('Sending..');

      var form = $('#equipment_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-equipments') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          $('#send_form').val('Submitted');
          //console.log(response);
          if(response.success) {
            $('#equipment_post').trigger('reset');
            $('#description').summernote('reset');
            $('#modal-equipment').modal('hide');
            window.setTimeout(function(){location.reload()},1000)
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

  function edit_equipment(eqId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-equipment') }}",
      data: { _token: _token, eqId: eqId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $("#id").val(detail.id);
        $("#name").val(detail.name);
        $("#description").summernote('code', detail.description);
        $("#weight").val(detail.weight);
        $('#send_form').attr({value: "Update Equipment"});
        $("#modal-equipment").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection

