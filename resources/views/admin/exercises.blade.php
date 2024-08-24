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
                  <form class="form-inline" action="{{ route('admin-import-exercises') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Exercises</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-exercise">Post Exercises</a>
                  <a class="btn btn-sm btn-danger float-right mr-2" id="delete-all" href="#">Delete Exercises</a>
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
                    <th>Type</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Reps</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($exercises as $ex)
                  <tr>
                    <td>{{ $ex->id }}</td>
                    <td>{{ $ex->code }}</td>
                    <td>{{ $ex->title }}</td>
                    <td>{{ $ex->type }}</td>
                    <td>{{ $ex->duration }}</td>
                    <td>
                      @if($ex->image)
                        @if(file_exists('uploads/exercises/images/'.$ex->image))
                          <img width="40" src="{{ asset('uploads/exercises/images/'.$ex->image) }}" alt="{{ $ex->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $ex->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $ex->title }}"/>
                      @endif
                    </td>
                    <td>{{ $ex->reps }}</td>
                    <td>{{ $ex->focus_area }}</td>
                    <td>
                      @php
                        $levels = explode(',', $ex->level);

                        if(in_array('Beginner', $levels) && in_array('Intermediate', $levels) && in_array('Advanced', $levels)) :
                          echo "All";
                        else :
                          echo $ex->level;
                        endif
                      @endphp
                    </td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a title="Edit Exercise" class="dropdown-item" href="#" onclick="edit_exercise({{ $ex->id }})">Edit Exercise</a>
                          <a title="Delete Exercise" class="dropdown-item" href="{{ route('admin-delete-exercise', [$ex->id]) }}" onclick="return confirm('Are you sure?')">Delete Exercise</a>
                          <!-- <a title="Add Variations" class="dropdown-item" href="{{ route('admin-exercises-variation', [$ex->code]) }}">Add Variations</a> -->
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
                    <th>Type</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Reps</th>
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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Title:*</label>
                                    <input type="hidden" name="id" id="id">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Based On:</label>
                                    <select name="based_on" class="form-control" id="based_on" onchange="basedOn()">
                                      <option value="Reps">Reps</option>
                                      <option value="Duration">Duration</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Video Link:*</label>
                                    <input type="url" name="video_link" class="form-control" id="video_link" placeholder="Video Link" required>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control"  id="image">
                                </div>
                            </div>

                            <div class="col-md-4" id="duration_element">
                                <div class="form-group">
                                    <label for="title">Duration:</label>
                                    <select class="form-control" name="duration" id="duration">
                                      @foreach(App\Duration::all() as $du)
                                        <option value="{{ $du->duration }}">{{ $du->duration }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

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
                                    <label for="title">Specific Muscles:</label>
                                    <select class="form-control" name="specific_muscles[]" id="specific_muscles" multiple>
                                      @foreach($muscles as $m)
                                        <option value="{{ $m->slug }}">{{ $m->name }}</option>
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
                                    <label for="title">Level:*</label>
                                    <select name="level[]" class="form-control" id="level" required multiple>
                                      <option value="ALL">ALL</option>
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

                            <div class="col-md-4" id="reps_element">
                                <div class="form-group">
                                    <label for="title">Reps:</label>
                                    <input type="text" name="reps" class="form-control" id="reps" placeholder="Reps">
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
                                    <label for="title">Type:*</label>
                                    <select class="form-control" name="type[]" id="type" multiple required>
                                      <option selected value="exercise">Exercise</option>
                                      <option value="warmup">Warm Ups</option>
                                      <option value="poststrech">Post Streches</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Category:</label>
                                    <select class="form-control" name="category" id="category">
                                      @foreach(App\Category::where('featured_for', 1)->get() as $cat)
                                        <option value="{{ $cat->id }}" selected>{{ $cat->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Tip Video:*</label>
                                    <input type="url" name="tip_video" class="form-control" id="tip_video" placeholder="Tip Video" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Instruction:</label>
                                    <textarea name="instruction" class="form-control" id="instruction" placeholder="Instruction"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="breath">Breath:</label>
                                    <textarea name="breath" class="form-control" id="breath" placeholder="Breath"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <button type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Exercise">Post Exercise</button>
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
      "lengthChange": true, 
      "info": true,
      "dom": 'Blfrtip',
      "buttons": ["selectAll","selectNone","copy","csv","excel","pdf","print","colvis"]
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

      var url = '{{ route("admin-delete-exercise", ":id") }}';
      url = url.replace(':id', ids);
      window.location.href = url;
    });

    $('#equipments').select2({
      placeholder: 'Select an equipment',
      multiple: true,
      width: '100%'
    });

    $('#focus_area').select2({
      placeholder: 'Select a Focus area',
      multiple: true,
      width: '100%'
    });

    $('#specific_muscles').select2({
      placeholder: 'Select a Muscle',
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

    $('#type').select2({
      placeholder: 'Select a Type',
      multiple: true,
      width: '100%'
    });

    $('#breath').summernote({
      height: 100,
      placeholder: 'Breath',
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
    
    $('#modal-exercise').on('hidden.bs.modal', function (e) {
      $('#exercise_post').trigger('reset');
      $("#equipments").val([]).change();
      $('#focus_area').val([]).change();
      $('#specific_muscles').val([]).change();
      $('#good_for').val([]).change();
      $('#level').val([]).change();
      $('#type').val([]).change();
      $('#breath').summernote('reset');
      $('#instruction').summernote('reset');
    });

    basedOn();
  });

  function basedOn() {
    var basedOn = $("#based_on").val();
    if(basedOn == "Reps") {
      $("#reps_element").show();
      $("#duration_element").hide();
    } else {
      $("#reps_element").hide();
      $("#duration_element").show();
    }
  }

  $("#exercise_post").validate({
    //ignore: ".ql-container *",
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

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
          console.log(response);
          if(response.success) {
            $('#exercise_post').trigger('reset');
            $('#breath').summernote('reset');
            $('#instruction').summernote('reset');
            $('#modal-exercise').modal('hide');
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
        $('#exercise_post').trigger('reset');
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#based_on").val(detail.based_on).trigger('change');
        $("#tags").val(detail.tags);
        $("#video_link").val(detail.video_link);
        $("#weight").val(detail.weight);
        $("#old_image").val(detail.image);
        $("#tip_video").val(detail.tip_video);
        $("#duration").val(detail.duration).trigger('change');
        $("#instruction").summernote('code', detail.instructions);
        $("#reps").val(detail.reps);
        $("#breath").summernote('code', detail.breath);
        $("#category").val(detail.category_id).trigger('change');

        $.each(detail.equipments, function(key, value) {
          $("#equipments [value=" + value.id + "]").prop('selected', true);
          $("#equipments").trigger('change');
        });

        var res0 = detail.level.split(",");

        if(res0.includes("Beginner") && res0.includes("Intermediate") && res0.includes("Advanced")) {
          $("#level").val("ALL").trigger('change');
        } else {
          for (x in res0) {
            $("#level [value=" + res0[x] + "]").prop('selected', true);
            $("#level").trigger('change');
          }
        }

        var res1 = detail.good_for.split(",");

        for (x in res1) {
          $("#good_for [value=" + res1[x] + "]").prop('selected', true);
          $("#good_for").trigger('change');
        }

        var res2 = detail.type.split(",");
        $("#type").val("");
        $("#type").trigger("change");

        for (x in res2) {
          $("#type [value=" + res2[x] + "]").prop('selected', true);
          $("#type").trigger('change');
        }

        if(detail.specific_muscles) {
          var res3 = detail.specific_muscles.split(",");

          for (x in res3) {
            $("#specific_muscles [value=" + res3[x] + "]").prop('selected', true);
            $("#specific_muscles").trigger('change');
          }
        }

        var res4 = detail.focus_area.split(",");

        for (x in res4) {
          $("#focus_area [value=" + res4[x] + "]").prop('selected', true);
          $("#focus_area").trigger('change');
        }

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

