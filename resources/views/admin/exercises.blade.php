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
            <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-exercise">Post Exercises</a>
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
                    <th>Reps</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>created At</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($exercises as $ex)
                  <tr>
                    <td>{{ $ex->title }}</td>
                    <td>{{ $ex->duration }}</td>
                    <td>
                      @if($ex->image)
                        <img width="40" src="{{ url($ex->image) }}" alt="{{ $ex->title }}"/>
                      @else
                      @endif
                    </td>
                    <td>{{ $ex->reps }}</td>
                    <td>{{ $ex->focus_area }}</td>
                    <td>{{ $ex->level }}</td>
                    <td>{{ $ex->created_at->diffForHumans() }}</td>
                    <td>
                      <form action="javascript:void(0)">@csrf
                          <a title="Edit Exercise" class="btn btn-xs btn-primary" href="#" onclick="edit_exercise({{ $ex->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                          <a title="Add Variations" class="btn btn-xs btn-success" href="{{ route('admin-exercises-variation', [$ex->code]) }}"><i class="fa fa-plus" aria-hidden="true"></i></a>
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
                    <th>Reps</th>
                    <th>Focus Area</th>
                    <th>Level</th>
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
    <div class="modal modal-primary fade" id="modal-exercise" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Exercise</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="exercise_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
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
                                    <label for="title">Tip Video:</label>
                                    <input type="hidden" id="old_tip_video" name="old_tip_video">
                                    <input type="file" name="tip_video" class="form-control" id="tip_video" placeholder="Tip Video">
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
                                    <label for="title">Duration:</label>
                                    <input type="text" name="duration" class="form-control" id="duration" placeholder="Duration" required>
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
                                    <label for="title">Specific Muscles: (Comma Seperated)</label>
                                    <input type="text" name="specific_muscles" class="form-control" id="specific_muscles" placeholder="Specific Muscles" required>
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
                                    <label for="title">Weight:</label>
                                    <input type="text" name="weight" class="form-control" id="weight" placeholder="Weight" required>
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
                                    <label for="title">Reps:</label>
                                    <input type="text" name="reps" class="form-control" id="reps" placeholder="Reps" required>
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
                                    <label for="title">Video Link:</label>
                                    <input type="text" name="video_link" class="form-control" id="video_link" placeholder="Video Link" required>
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
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Exercise">
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

    $('#description').summernote({
      height: 100,
      placeholder: 'Description',
    });

    $('#instruction').summernote({
      height: 100,
      placeholder: 'Instruction',
    });

  });

  $("#exercise_post").validate({
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });
      $('#send_form').val('Sending..');

      var form = $('#exercise_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-exercises') }}",
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
            $('#exercise_post').trigger('reset');
            $('#description').summernote('reset');
            $('#instruction').summernote('reset');
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

  function edit_exercise(exId) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-exercise') }}",
      data: { _token: _token, exId: exId },
      cache: false, 
      dataType: "json",
      success: function(detail){
        console.log(detail);
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#code").val(detail.code);
        $("#specific_muscles").val(detail.specific_muscles);
        $("#good_for").val(detail.good_for);
        $("#tags").val(detail.tags);
        $("#video_link").val(detail.video_link);
        $("#weight").val(detail.weight);
        $("#old_image").val(detail.image);
        $("#old_tip_video").val(detail.tip_video);
        $("#duration").val(detail.duration);
        $("#instruction").summernote('code', detail.instructions);
        $("#reps").val(detail.reps);
        $("#description").summernote('code', detail.description);
        $("#focus_area").val(detail.focus_area);
        $("#level").val(detail.level);
        $("#equipments").val([]);

        $.each(detail.equipments, function(key, value) {
          var option = new Option(value.name, value.id, true, true);
          $("#equipments").append(option).trigger('change');
        });

        $('#send_form').attr({value: "Update Exercise"});
        $("#modal-exercise").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }
</script>
@endsection

