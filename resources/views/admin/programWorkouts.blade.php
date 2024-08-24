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
                  <form class="form-inline" action="{{ route('admin-import-program-workout') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                      <input type="hidden" name="duration" value="{{ $duration }}">
                      <input type="hidden" name="pmid" class="form-control" value="{{ $program->id }}">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Workouts</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <p class="float-left"><strong>Days Left :</strong> {{ $program->no_of_days - $programWorkoutsDays }} / {{ $program->no_of_days }} </p>
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-variation">Import Workout</a>
                  <a class="btn btn-sm btn-danger float-right mr-2" id="delete-all" href="#">Delete Workouts</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>S No.</th>
                        <th>Title</th>
                        <th>Duration</th>
                        <th>Image</th>
                        <th>Focus Area</th>
                        <th>Level</th>
                        <th>equipments</th>
                        <th>Starting Day</th>
                        <th>Ending Day</th>
                        <th>Total Days</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($programWorkouts as $pw)
                    <tr>
                        <td>{{ $pw->pivot->id }}</td>
                        <td>{{ $pw->title }}</td>
                        <td>{{ $pw->duration }}</td>
                        <td>
                            @if($pw->image)
                                @if(file_exists('uploads/workouts/images/'.$pw->image))
                                <img width="40" src="{{ asset('uploads/workouts/images/'.$pw->image) }}" alt="{{ $pw->title }}"/>
                                @else
                                <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pw->title }}"/>
                                @endif
                            @else
                                <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pw->title }}"/>
                            @endif
                        </td>
                        <td>{{ $pw->focus_area }}</td>
                        <td>{{ $pw->level }}</td>
                        <td>
                            @foreach($pw->equipments as $weq)
                                @if($loop->last)
                                    {{ $weq->name }}
                                @else
                                    {{ $weq->name.', ' }}
                                @endif
                            @endforeach
                        </td>
                        <td>{{ $pw->pivot->starting_day }}</td>
                        <td>{{ $pw->pivot->ending_day }}</td>
                        <td>{{ ($pw->pivot->ending_day - $pw->pivot->starting_day) + 1 }}</td>
                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_variation({{ $pw->pivot->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                <a class="btn btn-xs btn-danger" href="{{ route('admin-delete-program-workout', [$pw->pivot->id, Request::segment(3), Request::segment(4)]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                <input type="hidden" name="program_id" id="program_id1" value="{{ Request::segment(3) }}">
                                <input type="hidden" name="duration" id="duration1" value="{{ Request::segment(4) }}">
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>S No.</th>    
                        <th>Title</th>
                        <th>Duration</th>
                        <th>Image</th>
                        <th>Focus Area</th>
                        <th>Level</th>
                        <th>equipments</th>
                        <th>Starting Day</th>
                        <th>Ending Day</th>
                        <th>Total Days</th>
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
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Workout in {{ $program->title }} - Program Duration {{ $program->no_of_days }} Days</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="variation_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category">Select Workout:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="hidden" name="duration" id="duration" value="{{ $duration }}">
                                    <input type="hidden" name="pmid" class="form-control" id="pmid" value="{{ $program->id }}">
                                    <select class="form-control" name="wkid" id="wkid" required>
                                        <option selected disabled>Select Workout</option>
                                        @foreach($workouts as $wk)
                                            <option value="{{ $wk->id }}">{{ $wk->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Starting Day:</label>
                                    <input type="number" name="start" class="form-control" min="{{ isset($lastProgramWorkout->pivot->ending_day) ? $lastProgramWorkout->pivot->ending_day : 1 }}" id="start" placeholder="Starting Day" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Ending Day:</label>
                                    <input type="number" name="end" class="form-control" min="{{ isset($lastProgramWorkout->pivot->ending_day) ? $lastProgramWorkout->pivot->ending_day : 1 }}" id="end" placeholder="Ending Day" required>
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
    var table = $("#example1").DataTable({
      "responsive": true, 
      "select": true,
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
      "dom": 'Blfrtip',
      "buttons": ["selectAll","selectNone","copy", "csv", "excel", "pdf", "print", "colvis"]
    });

    $('#delete-all').click(function () {
      var ids = $.map(table.rows('.selected').data(), function (item) {
          return item[0]
      });

      if (!confirm('Are you sure?')) return false;

      if(jQuery.isEmptyObject(ids)){
        Swal.fire({ icon: 'error', title: 'No Item Selected...!!', showConfirmButton: false, timer: 1500 });
        return false;
      }

      var url = '{{ route("admin-delete-program-workout", [":id", ":prid", ":duration"]) }}';
      var prid = $("#program_id1").val();
      var duration = $("#duration1").val();
      url = url.replace(':id', ids);
      url = url.replace(':prid', prid);
      url = url.replace(':duration', duration);
      window.location.href = url;
    });

    $('#modal-variation').on('hidden.bs.modal', function (e) {
      $('#variation_post').trigger('reset');
    });
  });

  $("#variation_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#variation_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-program-workout') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#variation_post').trigger('reset');
            $('#modal-variation').modal('hide');
            window.setTimeout(function(){location.reload()},1500)
            Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 3000 });
          } else {
            Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 3000 });
            $('#send_form').val('Post Variation');
          }
        },
        error: function(error) {
          console.log(error);
          $('#send_form').val('Post Variation');
          Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
        }
      });
    }
  });

  function edit_variation(pwId) {
    //alert(pwId);
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-program-workout') }}",
      data: { _token: _token, pwId: pwId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail.workout_id);
        $('#variation_post').trigger('reset');
        $("#id").val(detail.id);
        $("#wkid").val(detail.workout_id).trigger('change');
        $('#wkid').attr('disabled', true);
        $("#start").val(detail.starting_day);
        $("#start").attr("min", "");
        $("#end").val(detail.ending_day);
        $("#end").attr("min", "");
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
