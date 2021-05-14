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
            <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-workouts">Post Workouts</a>
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
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>equipments</th>
                    <th>created At</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($workouts as $wk)
                  <tr>
                    <td>{{ $wk->title }}</td>
                    <td>{{ $wk->duration }}</td>
                    <td>
                      @if($wk->image)
                        <img width="40" src="{{ url($wk->image) }}" alt="{{ $wk->title }}"/>
                      @else
                      @endif
                    </td>
                    <td>{{ $wk->focus_area }}</td>
                    <td>{{ $wk->level }}</td>
                    <td>{{ $wk->equipments }}</td>
                    <td>{{ $wk->created_at->diffForHumans() }}</td>
                    <td>
                      <form action="javascript:void(0)">@csrf
                          <a class="btn btn-xs btn-primary" href="#" onclick="edit_workout({{ $wk->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                      </form>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>equipments</th>
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
    <div class="modal modal-primary fade" id="modal-workouts" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Workout</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="workout_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
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
                                    <label for="title">Code:</label>
                                    <input type="text" name="code" class="form-control" id="code" placeholder="Code" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <input type="text" name="duration" class="form-control" id="duration" placeholder="Duration" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Type:</label>
                                    <input type="text" name="type" class="form-control" id="type" placeholder="Type" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control"  id="image">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Warm Ups:</label>
                                    <select class="form-control" name="warm_ups[]" id="warm_ups" required multiple>
                                        @foreach($warmUps as $wu)
                                          <option value="{{ $wu->id }}">{{ $wu->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Post Streches:</label>
                                    <select class="form-control" name="post_streches[]" id="post_streches" required multiple>
                                        @foreach($postStreches as $ps)
                                          <option value="{{ $ps->id }}">{{ $ps->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Focus Area:</label>
                                    <input type="text" name="focus_area" class="form-control" id="focus_area" placeholder="Focus Area" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Level:</label>
                                    <input type="text" name="level" class="form-control" id="level" placeholder="Level" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Equipments:</label>
                                    <select class="form-control" name="equipments[]" id="equipments" required multiple>
                                      @foreach(App\Equipments::all() as $eq)
                                        <option value="{{ $eq->id }}">{{ $eq->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Good For:</label>
                                    <input type="text" name="good_for" class="form-control" id="good_for" placeholder="Good For" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Calories Burned:</label>
                                    <input type="text" name="calories_burned" class="form-control" id="calories_burned" placeholder="Calories Burned" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Video Link:</label>
                                    <input type="text" name="video_link" class="form-control" id="video_link" placeholder="Video Link" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Tags: (Comma Seperated)</label>
                                    <input type="text" name="tags" class="form-control" id="tags" placeholder="Tags" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Visibility:</label>
                                    <select class="form-control" name="visible" id="visible">
                                      <option value="1">Visible</option>
                                      <option value="0">Invisible</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Instruction:</label>
                                    <textarea name="instruction" class="form-control" id="instruction" placeholder="Instruction" required></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description" required></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Workout">
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

    $('#equipments').select2({
      placeholder: 'Select an equipment',
      multiple: true,
      width: '100%'
    });

    $('#warm_ups').select2({
      //theme: "bootstrap",
      placeholder: "Choose Warm Ups...",
      multiple: true,
      width: '100%'
    });

    $('#post_streches').select2({
      //theme: "bootstrap",
      placeholder: "Choose Post Streches...",
      multiple: true,
      width: '100%'
    });

    $('#expired_at').datepicker({
      format: 'yyyy-mm-dd',
      autoclose:true
    });
  });

  $("#workout_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });
      $('#send_form').val('Sending..');

      var form = $('#workout_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-workouts') }}",
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
            $('#workout_post').trigger('reset');
            $('#description').summernote('reset');
            $('#instruction').summernote('reset');
            $('#modal-workouts').modal('hide');
            window.setTimeout(function(){location.reload()},1500)
            Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 1500 });
          } else {
            Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 1500 });
          }
        },
        error: function(error) {
          //console.log(error);
          Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
        }
      });
    }
  });

  function edit_workout(wkId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-workout') }}",
      data: { _token: _token, wkId: wkId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#old_image").val(detail.image);
        $("#duration").val(detail.duration);
        $("#instruction").summernote('code', detail.instructions);
        $("#description").summernote('code', detail.description);
        $("#focus_area").val(detail.focus_area);
        $("#level").val(detail.level);
        $("#equipments").val(detail.equipments);
        $('#exercises').val([]);

        $.each(detail.exercises, function(key, value) {
          var option = new Option(value.title, value.id, true, true);
          $("#exercises").append(option).trigger('change');
        });


        $('#send_form').attr({value: "Update Workout"});
        $("#modal-workouts").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection

