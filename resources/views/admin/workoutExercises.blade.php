@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3 class="float-left">{{$pageTitle}}</h3>
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
                <div class="col-5">
                  <form class="form-inline" action="{{ route('admin-import-workout-exercises') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <input type="file" name="file" id="file">
                      <input type="hidden" name="duration" value="{{ $duration }}">
                      <input type="hidden" name="wkid" class="form-control" value="{{ $workout->id }}">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Exercises</button>
                    </div>
                  </form>
                </div>
                <div class="col-7">
                  <a class="btn btn-sm btn-primary float-right mr-1" href="#" onclick="getWorkoutDurations({{ json_encode($workout->duration) }})">Import Workout</a>
                  <a class="btn btn-sm btn-danger float-right mr-1" id="delete-all" href="#">Delete Exercises</a>
                  <a class="btn btn-sm btn-success float-right mr-1" href="#" data-toggle="modal" data-target="#modal-exercise">Exercise</a>
                  <a class="btn btn-sm btn-success float-right mr-1" href="#" data-toggle="modal" data-target="#modal-warmup">Warmup</a>
                  <a class="btn btn-sm btn-success float-right mr-1" href="#" data-toggle="modal" data-target="#modal-poststrech">Poststrech</a>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>S No.</th>
                        <th>Ex Code</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Based On</th>
                        <th>duration</th>
                        <th>reps</th>
                        <th>sets</th>
                        <th>Rest Duration</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                  @foreach($workoutexercises as $we)
                      
                    <tr>
                        <td>{{ $we->pivot->id }}</td>
                        <td>{{ $we->code }}</td>
                        <td>
                          @if($we->pivot->variation_name)
                            {{ $we->pivot->variation_name }}
                          @else 
                            {{ $we->title }}
                          @endif
                        </td>
                        <td>
                          {{ $we->type }}
                        </td>
                        <td>
                          @if($we->pivot->based_on)
                            {{ $we->pivot->based_on }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->ex_duration)
                            {{ $we->pivot->ex_duration }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->ex_reps)
                            {{ $we->pivot->ex_reps }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->sets)
                            {{ $we->pivot->sets }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->rest_duration)
                            {{ $we->pivot->rest_duration }}
                          @else
                            {{ $we->pivot->rest_duration }}
                          @endif
                        </td>
                        <td>
                        @php
                        $str = $we->pivot->id.','.$we->type;
                        @endphp
                          <a class="btn btn-xs btn-primary" href="#" onclick="edit_exercise({{ json_encode($str) }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                          <a title="Delete Exercise" class="btn btn-xs btn-danger" href="{{ route('admin-delete-workout-exercise', [$we->pivot->id, $we->pivot->workout_id, $duration]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                          <input type="hidden" name="workout_id" id="workout_id1" value="{{ $we->pivot->workout_id }}">
                          <input type="hidden" name="duration" id="duration1" value="{{ $duration }}">
                        </td>
                    </tr>
                  @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>S No.</th>
                        <th>Ex Code</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Based On</th>
                        <th>duration</th>
                        <th>reps</th>
                        <th>sets</th>
                        <th>Rest Duration</th>
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
    <div class="modal modal-primary fade" id="modal-exercise" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Exercise</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="exercise_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Select Exercise:</label>
                                    <select class="form-control exid" name="exid" id="exid">
                                        <option selected disabled>Select Exercise</option>
                                        @foreach($exercises as $ex)
                                            <option value="{{ $ex->id }}">{{ $ex->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Variation Name:</label>
                                    <input type="hidden" name="id" class="form-control id" id="id">
                                    <input type="hidden" name="duration" id="duration" value="{{ $duration }}">
                                    <input type="hidden" name="wkid" class="form-control" id="wkid" value="{{ $workout->id }}">
                                    <input type="text" class="form-control variation_name" name="variation_name" id="variation_name" placeholder="Variation Name">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Based On:</label>
                                    <select name="based_on" class="form-control based_on" id="based_on" onchange="basedOn()">
                                      <option selected disabled>Select Option</option>
                                      <option value="reps">Reps</option>
                                      <option value="duration">Duration</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="duration_element">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <select class="form-control ex_duration" name="ex_duration" id="ex_duration">
                                      <option selected disabled>Select Option</option>
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="reps_element">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="text" name="ex_reps" class="form-control ex_reps" id="ex_reps" placeholder="Reps">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Sets:</label>
                                    <input type="text" name="sets" class="form-control sets" id="sets" placeholder="Sets">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category" class="filterable">Rest Duration:</label>
                                    <input type="number" name="rest_duration" class="form-control rest_duration" id="rest_duration" placeholder="Rest Duration">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary send_form" value="Save">
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

    <div class="modal modal-primary fade" id="modal-warmup" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Warmup</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="warmup_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Select Warmup:</label>
                                    <select class="form-control exid" name="exid" id="exid">
                                        <option selected disabled>Select Warmup</option>
                                        @foreach($warmups as $wp)
                                            <option value="{{ $wp->id }}">{{ $wp->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Variation Name:</label>
                                    <input type="hidden" name="id" class="form-control id" id="id">
                                    <input type="hidden" name="duration" id="duration" value="{{ $duration }}">
                                    <input type="hidden" name="wkid" class="form-control" id="wkid" value="{{ $workout->id }}">
                                    <input type="text" class="form-control variation_name" name="variation_name" id="variation_name" placeholder="Variation Name">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Based On:</label>
                                    <select name="based_on" class="form-control based_on" id="based_on1" onchange="basedOn1()">
                                      <option selected disabled>Select Option</option>
                                      <option value="reps">Reps</option>
                                      <option value="duration">Duration</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="duration_element1">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <select class="form-control ex_duration" name="ex_duration" id="ex_duration">
                                      <option selected disabled>Select Option</option>
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="reps_element1">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="text" name="ex_reps" class="form-control ex_reps" id="ex_reps" placeholder="Reps">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Sets:</label>
                                    <input type="text" name="sets" class="form-control sets" id="sets" placeholder="Sets">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category" class="filterable">Rest Duration:</label>
                                    <input type="number" name="rest_duration" class="form-control rest_duration" id="rest_duration" placeholder="Rest Duration">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary send_form" value="Save">
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

    <div class="modal modal-primary fade" id="modal-poststrech" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Poststrech</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="poststrech_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Select Poststrech:</label>
                                    <select class="form-control exid" name="exid" id="exid">
                                        <option selected disabled>Select Poststrech</option>
                                        @foreach($poststreches as $ps)
                                            <option value="{{ $ps->id }}">{{ $ps->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Variation Name:</label>
                                    <input type="hidden" name="id" class="form-control id" id="id">
                                    <input type="hidden" name="duration" id="duration" value="{{ $duration }}">
                                    <input type="hidden" name="wkid" class="form-control" id="wkid" value="{{ $workout->id }}">
                                    <input type="text" class="form-control variation_name" name="variation_name" id="variation_name" placeholder="Variation Name">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Based On:</label>
                                    <select name="based_on" class="form-control based_on" id="based_on2" onchange="basedOn2()">
                                      <option selected disabled>Select Option</option>
                                      <option value="reps">Reps</option>
                                      <option value="duration">Duration</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="duration_element2">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <select class="form-control ex_duration" name="ex_duration" id="ex_duration">
                                      <option selected disabled>Select Option</option>
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4" id="reps_element2">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="text" name="ex_reps" class="form-control ex_reps" id="ex_reps" placeholder="Reps">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Sets:</label>
                                    <input type="text" name="sets" class="form-control sets" id="sets" placeholder="Sets">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category" class="filterable">Rest Duration:</label>
                                    <input type="number" name="rest_duration" class="form-control rest_duration" id="rest_duration" placeholder="Rest Duration">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary send_form" value="Save">
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

    <div class="modal modal-primary fade" id="modal-workout-duration" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Select Workout Duration</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="workout_duration" action="{{ route('admin-workout-exercises-import') }}" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-12">
                              <input type="hidden" id="wkid" name="wkid" value="{{ $workout->id }}">
                              <input type="hidden" id="wkid" name="importToDuration" value="{{ $duration }}">
                              <div class="form-group" id="show_durations"></div>

                              <div class="form-group">
                                  <button type="submit" id="send_form" name="save" class="btn btn-block btn-primary" value="Import Exercises">Import Exercises</button>
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

      var url = '{{ route("admin-delete-workout-exercise", [":id", ":wkid", ":duration"]) }}';
      var wkid = $("#workout_id1").val();
      var duration = $("#duration1").val();
      url = url.replace(':id', ids);
      url = url.replace(':wkid', wkid);
      url = url.replace(':duration', duration);
      window.location.href = url;
    });

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

    $('#modal-variation').on('hidden.bs.modal', function (e) {
      $('#variation_post').trigger('reset');
    });

    basedOn();
    basedOn1();
    basedOn2();
  });

  function basedOn() {
    var basedOn = $("#based_on").val();
    if(basedOn == "reps") {
      $("#reps_element").show();
      $("#duration_element").hide();
    } else {
      $("#reps_element").hide();
      $("#duration_element").show();
    }
  }

  function basedOn1() {
    var basedOn1 = $("#based_on1").val();
    if(basedOn1 == "reps") {
      $("#reps_element1").show();
      $("#duration_element1").hide();
    } else {
      $("#reps_element1").hide();
      $("#duration_element1").show();
    }
  }

  function basedOn2() {
    var basedOn2 = $("#based_on2").val();
    if(basedOn2 == "reps") {
      $("#reps_element2").show();
      $("#duration_element2").hide();
    } else {
      $("#reps_element2").hide();
      $("#duration_element2").show();
    }
  }

  $("#exercise_post").validate({
    submitHandler: function(form) { 
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#exercise_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-workout-exercises') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          //console.log(response);
          if(response.success) {
            $('#exercise_post').trigger('reset');
            $('#modal-exercise').modal('hide');
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

  $("#warmup_post").validate({
    submitHandler: function(form) { 
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#warmup_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-workout-exercises') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          console.log(response);
          if(response.success) {
            $('#warmup_post').trigger('reset');
            $('#modal-warmup').modal('hide');
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

  $("#poststrech_post").validate({
    submitHandler: function(form) { 
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#poststrech_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-workout-exercises') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          //console.log(response);
          if(response.success) {
            $('#poststrech_post').trigger('reset');
            $('#modal-poststrech').modal('hide');
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

  $("#poststrech_post").validate({
    submitHandler: function(form) { 
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#poststrech_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-workout-exercises') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          //console.log(response);
          if(response.success) {
            $('#poststrech_post').trigger('reset');
            $('#modal-poststrech').modal('hide');
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

  function edit_exercise(ev) {
    var evId = ev.split(',')[0];
    var evType = ev.split(',')[1]
    
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-workout-exercise') }}",
      data: { _token: _token, evId: evId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        var type = detail.exercise.type.split(',');
        //console.log(detail);
        $("#"+ evType + "_post").trigger('reset');
        $(".id").val(detail.id);
        $(".variation_name").val(detail.variation_name);
        $(".exid").val(detail.exercise_id).trigger('change');
        $('.exid').attr('readonly', true);
        $(".ex_duration").val(detail.ex_duration).trigger('change');
        $(".based_on").val(detail.based_on).trigger('change');
        $(".ex_reps").val(detail.ex_reps).trigger('change');
        $(".sets").val(detail.sets);
        $(".rest_duration").val(detail.rest_duration);
        $('.send_form').attr({value: "Update"});
        type.forEach((ty, index) => {
          if(evType == ty) {
            $("#modal-"+ evType).modal('show');
          }
        });
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }

  function getWorkoutDurations(durations) {
    var du = durations.split(',');
    $("#show_durations").html("");
    jQuery.each(du, function(index, item) {
      if(index == 0) {
        $("#show_durations").append("<div class='radio'><label><input type='radio' value='" + item + "' name='importFromDuration' checked='checked'> " + item + " Mins</label></div>");
      } else {
        $("#show_durations").append("<div class='radio'><label><input type='radio' value='" + item + "' name='importFromDuration'> " + item + " Mins</label></div>");
      }
    });
    
    $("#modal-workout-duration").modal('show');
  }

  function setCategory(category) {
    var workout_id = $("#wkid").val();
    var duration = $("#duration").val();
    var _token = $("input[name=_token]").val();
    
    $.ajax({
      url: "{{ route('admin-store-workout-category') }}",
      type: "POST",
      data: { _token: _token, category_id: category, workout_id: workout_id, duration: duration },
      cache: false,
      success: function( response ) {
        console.log(response);
        if(response.success) {
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
</script>
@endsection
