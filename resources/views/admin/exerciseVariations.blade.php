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
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-variation">Post Variation</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>duration</th>
                        <th>reps</th>
                        <th>Rest Duration</th>
                        <th>Created At</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($exerciseVariation as $ev)
                    <tr>
                        <td>{{ $ev->variation_name }}</td>
                        <td>{{ $ev->duration }}</td>
                        <td>{{ $ev->reps }}</td>
                        <td>{{ $ev->rest_duration }}</td>
                        <td>{{ date('F d, Y', strtotime($ev->created_at)) }}</td>
                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_variation({{ $ev->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>duration</th>
                        <th>reps</th>
                        <th>Rest Duration</th>
                        <th>Created At</th>
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
    <div class="modal modal-primary fade" id="modal-variation" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Variations</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="variation_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category">Variation Name:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="hidden" name="exCode" class="form-control" id="exCode" value="{{ $exercise->code }}">
                                    <input type="text" class="form-control" name="variation_name" id="variation_name" placeholder="Variation Name">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <input type="text" name="duration" data-inputmask='"mask": "99:99"' data-mask class="form-control" class="form-control" id="duration" placeholder="Duration" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="number" name="reps" class="form-control" id="reps" placeholder="Reps" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category" class="filterable">Rest Duration:</label>
                                    <input type="text" name="rest_duration" data-inputmask='"mask": "99:99"' data-mask class="form-control" id="rest_duration" placeholder="Rest Duration" required>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Variation">
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

    $('#equipments').select2({
      placeholder: 'Select an equipment',
      multiple: true,
      width: '100%'
    });

    $('#description').summernote({
      height: 100,
      placeholder: 'Description',
    });

    $('#instruction').summernote({
      height: 100,
      placeholder: 'Instruction',
    });

    $('#duration').inputmask('mm:ss', { 'placeholder': 'mm:ss' });
    $('#rest_duration').inputmask('mm:ss', { 'placeholder': 'mm:ss' });
  });

  $("#variation_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#variation_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-exercises-variation') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          //console.log(response);
          if(response.success) {
            $('#variation_post').trigger('reset');
            $('#modal-variation').modal('hide');
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

  function edit_variation(evId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-exercise-variation') }}",
      data: { _token: _token, evId: evId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $("#id").val(detail.id);
        $("#variation_name").val(detail.variation_name);
        $("#exCode").val(detail.exercise_code);
        $("#duration").val(detail.duration);
        $("#reps").val(detail.reps);
        $("#rest_duration").val(detail.rest_duration);
        $('#send_form').attr({value: "Update Variation"});
        $("#modal-variation").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection
