@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1></h1>
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
              <h3 class="float-left">{{$pageTitle}}</h3>
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-variation">Post Exercise</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>duration</th>
                        <th>level</th>
                        <th>reps</th>
                        <th>sets</th>
                        <th>Rest Duration</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                  @foreach($workoutexercises as $we)
                      
                    <tr>
                        <td>
                          @if($we->pivot->variation_name)
                            {{ $we->pivot->variation_name }}
                          @else 
                            {{ $we->title }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->ex_duration)
                            {{ $we->pivot->ex_duration }}
                          @else 
                            {{ $we->duration }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->level)
                            {{ $we->pivot->level }}
                          @else 
                            {{ $we->level }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->reps)
                            {{ $we->pivot->reps }}
                          @else 
                            {{ $we->reps }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->sets)
                            {{ $we->pivot->sets }}
                          @else 
                            {{ $we->sets }}
                          @endif
                        </td>
                        <td>
                          @if($we->pivot->rest_duration)
                            {{ $we->pivot->rest_duration }}
                          @else 
                            {{ $we->rest_duration }}
                          @endif
                        </td>
                        <td>
                          <a class="btn btn-xs btn-primary" href="#" onclick="edit_variation({{ $we->pivot->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                          <a title="Delete Exercise" class="btn btn-xs btn-danger" href="{{ route('admin-delete-workout-exercise', [$we->pivot->id]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                  @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>duration</th>
                        <th>level</th>
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
    <div class="modal modal-primary fade" id="modal-variation" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary pt-reduced pb-reduced">
                    <h5 class="modal-title">Post New Exercise</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="variation_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category">Select Exercise:</label>
                                    <select class="form-control" name="exid" id="exid">
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
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="hidden" name="duration" id="duration" value="{{ $duration }}">
                                    <input type="hidden" name="wkid" class="form-control" id="wkid" value="{{ $workout->id }}">
                                    <input type="text" class="form-control" name="variation_name" id="variation_name" placeholder="Variation Name">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <select class="form-control" name="ex_duration" id="ex_duration" required>
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Level:</label>
                                    <select name="level" class="form-control" id="level" required>
                                      <option selected disabled>Select Level</option>
                                      <option value="Beginner">Beginner</option>
                                      <option value="Intermediate">Intermediate</option>
                                      <option value="Advanced">Advanced</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="number" name="reps" class="form-control" id="reps" placeholder="Reps">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Sets:</label>
                                    <input type="number" name="sets" class="form-control" id="sets" placeholder="Sets">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="category" class="filterable">Rest Duration:</label>
                                    <input type="number" name="rest_duration" class="form-control" id="rest_duration" placeholder="Rest Duration">
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
  });

  $("#variation_post").validate({
    submitHandler: function(form) { 
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#variation_post')[0];
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
      url: "{{ route('admin-edit-workout-exercise') }}",
      data: { _token: _token, evId: evId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $('#variation_post').trigger('reset');
        $("#id").val(detail.id);
        $("#variation_name").val(detail.variation_name);
        $("#exid").val(detail.exercise_id).trigger('change');
        $('#exid').attr('readonly', true);
        $("#ex_duration").val(detail.ex_duration).trigger('change');
        $("#level").val(detail.level).trigger('change');
        $("#sets").val(detail.sets);
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
