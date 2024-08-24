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
                  <form class="form-inline" action="{{ route('admin-import-workouts') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Workouts</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-workouts">Post Workouts</a>
                  <a class="btn btn-sm btn-danger float-right mr-2" id="delete-all" href="#">Delete Workouts</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <table id="example1" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>S No.</th>
                    <th>Code</th>
                    <th>Title</th>
                    <th>Duration (Mins/Day)</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($workouts as $wk)
                  <tr>
                    <td>{{ $wk->id }}</td>
                    <td>{{ $wk->code }}</td>
                    <td>{{ $wk->title }}</td>
                    <td>{{ $wk->duration }}</td>
                    <td>
                      @if($wk->image)
                        @if(file_exists('uploads/workouts/images/'.$wk->image))
                          <img width="40" src="{{ asset('uploads/workouts/images/'.$wk->image) }}" alt="{{ $wk->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $wk->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $wk->title }}"/>
                      @endif
                    </td>
                    <td>{{ $wk->focus_area }}</td>
                    <td>{{ $wk->level }}</td>
                    <td>
                      <form action="javascript:void(0)">@csrf
                          
                      </form>
                      <div class="dropdown">
                        <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a title="Edit Workout" class="dropdown-item" href="#" onclick="edit_workout({{ $wk->id }})">Edit Workout</a>
                          <a title="Delete Workout" class="dropdown-item" href="{{ route('admin-delete-workout', [$wk->id]) }}" onclick="return confirm('Are you sure?')">Delete Workout</a>
                          <a title="Add Exercises" class="dropdown-item" href="#" onclick="getWorkoutDurations({{ json_encode($wk->duration) }}, {{ $wk->id }})">View Workout</a>
                          <!-- <a title="Make Featured" class="dropdown-item" href="#" onclick="getFeaturedDuration({{ json_encode($wk->duration) }}, {{ $wk->id }})">Make Featured</a> -->
                        </div>
                      </div>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>S No.</th>
                    <th>Code</th>
                    <th>Title</th>
                    <th>Duration (Mins/Day)</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Title:*</label>
                                    <input type="hidden" name="id" id="id">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Duration (Mins):*</label>
                                    <select class="form-control" name="duration[]" id="duration" multiple required>
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Type:*</label>
                                    <input type="text" name="type" class="form-control" id="type" placeholder="Type" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control" id="image">
                                </div>
                            </div>

                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Warm Ups:</label>
                                    <select class="form-control" name="warm_ups[]" id="warm_ups" multiple>
                                        @foreach($warmUps as $wu)
                                          <option value="{{ $wu->id }}">{{ $wu->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Post Streches:</label>
                                    <select class="form-control" name="post_streches[]" id="post_streches" multiple>
                                        @foreach($postStreches as $ps)
                                          <option value="{{ $ps->id }}">{{ $ps->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div> -->

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Focus Area:*</label>
                                    <select class="form-control" name="focus_area[]" id="focus_area" required multiple>
                                      @foreach($focusAreas as $fa)
                                        <option value="{{ $fa->slug }}">{{ $fa->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Level:*</label>
                                    <select name="level[]" class="form-control" id="level" required multiple>
                                      <option value="Beginner">Beginner</option>
                                      <option value="Intermediate">Intermediate</option>
                                      <option value="Advanced">Advanced</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Equipments:*</label>
                                    <select class="form-control" name="equipments[]" id="equipments" required multiple>
                                      @foreach(App\Equipments::all() as $eq)
                                        <option value="{{ $eq->id }}">{{ $eq->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Good For:*</label>
                                    <select class="form-control" name="good_for[]" id="good_for" required multiple>
                                      @foreach($goodFors as $gf)
                                        <option value="{{ $gf->slug }}">{{ $gf->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Calories Burned (KCal):*</label>
                                    <input type="number" name="calories_burned" class="form-control" id="calories_burned" placeholder="Calories Burned" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Category:</label>
                                    <select class="form-control" name="category" id="category">
                                      <option selected disabled>Select Category</option>
                                      @foreach(App\Category::where('featured_for', 2)->get() as $cat)
                                        <option value="{{ $cat->id }}">{{ $cat->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Video Link:*</label>
                                    <input type="text" name="video_link" class="form-control" id="video_link" placeholder="Video Link" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Tags: (Comma Seperated)</label>
                                    <input type="text" name="tags" class="form-control" id="tags" placeholder="Tags">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Visibility:</label>
                                    <select class="form-control" name="visible" id="visible">
                                      <option value="1">Visible</option>
                                      <option value="0">Invisible</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="title">Instruction:*</label>
                                    <textarea name="instruction" class="form-control" id="instruction" placeholder="Instruction" required></textarea>
                                </div>
                            </div>

                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description"></textarea>
                                </div>
                            </div> -->

                            <div class="col-md-6">
                                <div class="form-group">
                                    <button type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Workout">Post Workout</button>
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
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group" id="show_durations">
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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

      var url = '{{ route("admin-delete-workout", ":id") }}';
      url = url.replace(':id', ids);
      window.location.href = url;
    });

    $('#equipments').select2({
      placeholder: 'Select an equipment',
      multiple: true,
      width: '100%'
    });

    $('#warm_ups').select2({
      placeholder: "Choose Warm Ups...",
      multiple: true,
      width: '100%'
    });

    $('#post_streches').select2({
      placeholder: "Choose Post Streches...",
      multiple: true,
      width: '100%'
    });

    $('#focus_area').select2({
      placeholder: 'Select a Focus area',
      multiple: true,
      width: '100%'
    });

    $('#good_for').select2({
      placeholder: 'Select Good for',
      multiple: true,
      width: '100%'
    });

    $('#level').select2({
      placeholder: 'Select Level',
      multiple: true,
      width: '100%'
    });

    $('#duration').select2({
      placeholder: 'Select Duration',
      multiple: true,
      width: '100%'
    });

    $('#expired_at').datepicker({
      format: 'yyyy-mm-dd',
      autoclose:true
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

    $('#modal-workouts').on('hidden.bs.modal', function (e) {
      $('#workout_post').trigger('reset');
      $('#duration').val([]).change();
      $("#equipments").val([]).change();
      $('#focus_area').val([]).change();
      $('#post_streches').val([]).change();
      $('#good_for').val([]).change();
      $('#level').val([]).change();
      $('#warm_ups').val([]).change();
      $('#description').summernote('reset');
      $('#instruction').summernote('reset');
    })
  });

  $("#workout_post").validate({
    ignore: ".ql-container *",
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

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
          console.log(response);
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
        $('#workout_post').trigger('reset');
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#type").val(detail.type);
        $("#calories_burned").val(detail.calories_burned);
        $("#video_link").val(detail.video_link);
        $("#tags").val(detail.tags);
        $("#visible").val(detail.visible).trigger('change');
        $("#category").val(detail.category_id).trigger('change');
        $("#old_image").val(detail.image);
        $("#instruction").summernote('code', detail.instructions);
        $("#description").summernote('code', detail.description);
        $('#exercises').val([]);
        $('#post_streches').val([]);
        $('#warm_ups').val([]);

        $.each(detail.equipments, function(key, value) {
          var option = new Option(value.name, value.id, true, true);
          $("#equipments").append(option).trigger('change');
        });

        // $.each(detail.poststreches, function(key, value) {
        //   var option = new Option(value.title, value.id, true, true);
        //   $("#post_streches").append(option).trigger('change');
        // });

        // $.each(detail.warmups, function(key, value) {
        //   var option = new Option(value.title, value.id, true, true);
        //   $("#warm_ups").append(option).trigger('change');
        // });

        var res0 = detail.level.split(",");

        for (x in res0) {
          $("#level [value=" + res0[x] + "]").prop('selected', true);
          $("#level").trigger('change');
        }

        var res1 = detail.good_for.split(",");

        for (x in res1) {
          $("#good_for [value=" + res1[x] + "]").prop('selected', true);
          $("#good_for").trigger('change');
        }

        var res2 = detail.duration.split(",");

        for (x in res2) {
          $("#duration [value=" + res2[x] + "]").prop('selected', true);
          $("#duration").trigger('change');
        }

        var res4 = detail.focus_area.split(",");

        for (x in res4) {
          $("#focus_area [value=" + res4[x] + "]").prop('selected', true);
          $("#focus_area").trigger('change');
        }

        $('#send_form').attr({value: "Update Workout"});
        $("#modal-workouts").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }

  function getWorkoutDurations(durations, wkid) {
    var du = durations.split(',');
    $("#show_durations").html("");
    $("#wkid").val(wkid);
    jQuery.each(du, function(index, item) {
      var workdu = wkid + "," + item;
      if(index == 0) {
        $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='goToWorkoutExercises(" + JSON.stringify(workdu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
      } else {
        $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='goToWorkoutExercises(" + JSON.stringify(workdu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
      }
    });
    
    $("#modal-workout-duration").modal('show');
  }

  function goToWorkoutExercises(workdu) {
    var res = workdu.split(",");
    var url = "{{ route('admin-workout-exercises-variation', [':wkid', ':duration']) }}";
    url = url.replace(':wkid', res[0]);
    url = url.replace(':duration', res[1]);
    window.location.href = url;
  }

  // function getFeaturedDuration(durations, wkid) {
  //   var du = durations.split(',');
  //   $("#show_durations").html("");
  //   $("#wkid").val(wkid);
  //   jQuery.each(du, function(index, item) {
  //     var workdu = wkid + "," + item;
  //     if(index == 0) {
  //       $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='makeFeatured(" + JSON.stringify(workdu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
  //     } else {
  //       $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='makeFeatured(" + JSON.stringify(workdu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
  //     }
  //   });
    
  //   $("#modal-workout-duration").modal('show');
  // }

  // function makeFeatured(workdu) {
  //   var res = workdu.split(",");
  //   var url = "{{ route('admin-workout-make-featured', [':wkid', ':duration']) }}";
  //   url = url.replace(':wkid', res[0]);
  //   url = url.replace(':duration', res[1]);
  //   window.location.href = url;
  // }
</script>
@endsection

