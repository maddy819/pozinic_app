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
                  <form class="form-inline" action="{{ route('admin-import-splits') }}" method="POST" enctype="multipart/form-data">@csrf
                    <div class="form-group">
                      <label>Import:&nbsp; </label>
                      <input type="file" name="file" id="file">
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-sm btn-success">Import Splits</button>
                    </div>
                  </form>
                </div>
                <div class="col-6">
                  <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-split">Post Split</a>
                  <a class="btn btn-sm btn-danger float-right mr-2" id="delete-all" href="#">Delete Splits</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <table id="example1" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Code</th>
                    <th>Title</th>
                    <th>Duration (Mins/Day)</th>
                    <th>Image</th>
                    <th>Good For</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>Total Days</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($splits as $sp)
                  <tr>
                    <td>{{ $sp->code }}</td>
                    <td>{{ $sp->title }}</td>
                    <td>{{ $sp->duration }}</td>
                    <td>
                      @if($sp->image)
                        @if(file_exists('uploads/splits/images/'.$sp->image))
                          <img width="40" src="{{ asset('uploads/splits/images/'.$sp->image) }}" alt="{{ $sp->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $sp->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $sp->title }}"/>
                      @endif
                    </td>
                    <td>{{ $sp->good_for }}</td>
                    <td>{{ $sp->focus_area }}</td>
                    <td>{{ $sp->level }}</td>
                    <td>{{ $sp->no_of_days }}</td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a title="Edit Split" class="dropdown-item" href="#" onclick="edit_split({{ $sp->id }})">Edit Split</a>
                          <a title="Delete Split" class="dropdown-item" href="{{ route('admin-delete-split', [$sp->id]) }}" onclick="return confirm('Are you sure?')">Delete Split</a>
                          <a title="View Program" class="dropdown-item" href="#" onclick="getSplitDurations({{ json_encode($sp->duration) }}, {{ $sp->id }})">View Split</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Code</th>
                    <th>Title</th>
                    <th>Duration (Mins/Day)</th> 
                    <th>Image</th>
                    <th>Good For</th>
                    <th>Focus Area</th>
                    <th>Level</th>
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
    <div class="modal modal-primary fade" id="modal-split" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Split</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="split_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Title:*</label>
                                    <input type="hidden" name="id" id="id">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title" required>
                                </div>
                            </div>

                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Video Link:*</label>
                                    <input type="url" name="video_link" class="form-control" id="video_link" placeholder="Video Link" required>
                                </div>
                            </div> -->

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control"  id="image">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Duration:*</label>
                                    <select class="form-control" name="duration[]" id="duration" multiple required>
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
                                    <label for="title">Tags: (Comma Seperated)</label>
                                    <input type="text" name="tags" class="form-control" id="tags" placeholder="Tags">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="title">Number Of Days:*</label>
                                    <input type="number" name="no_of_days" class="form-control" id="no_of_days" placeholder="Number Of Days" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Category:</label>
                                    <select class="form-control" name="category" id="category">
                                      @foreach(App\Category::where('featured_for', 4)->get() as $cat)
                                        <option value="{{ $cat->id }}" selected>{{ $cat->name }}</option>
                                      @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Visibility:*</label>
                                    <select class="form-control" name="visible" id="visible" required>
                                      <option value="1">Visible</option>
                                      <option value="0">Invisible</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Tips:*</label>
                                    <textarea name="instruction" class="form-control" id="instruction" placeholder="Tips" required></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="breath">Implementation:*</label>
                                    <textarea name="breath" class="form-control" id="breath" placeholder="Implementation" required></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <button type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Split">Post Split</button>
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

    <div class="modal modal-primary fade" id="modal-split-duration" data-backdrop="static" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm">
          <div class="modal-content">
              <div class="modal-header bg-primary">
                  <h5 class="modal-title">Select Program Duration</h5>
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

      var url = '{{ route("admin-delete-split", ":id") }}';
      url = url.replace(':id', ids);
      window.location.href = url;
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

    $('#modal-split').on('hidden.bs.modal', function (e) {
      $('#split_post').trigger('reset');
      $('#duration').val([]).change();
      $("#equipments").val([]).change();
      $('#focus_area').val([]).change();
      $('#good_for').val([]).change();
      $('#level').val([]).change();
      $('#breath').summernote('reset');
      $('#instruction').summernote('reset');
    })
  });

  $("#split_post").validate({
    ignore: ".ql-container *",
    submitHandler: function(form) {
      $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

      var form = $('#split_post')[0];
      var data = new FormData(form);

      $.ajax({
        url: "{{ route('admin-store-split') }}",
        enctype: 'multipart/form-data',
        type: "POST",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function( response ) {
          //console.log(response);
          if(response.success) {
            $('#split_post').trigger('reset');
            $('#breath').summernote('reset');
            $('#instruction').summernote('reset');
            $('#modal-split').modal('hide');
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

  function edit_split(sid) {
    var _token = $("input[name=_token]").val();
    $.ajax({
      type: "POST", 
      url: "{{ route('admin-edit-split') }}",
      data: { _token: _token, sid: sid },
      cache: false, 
      dataType: "json",
      success: function(detail){
        //console.log(detail);
        $('#split_post').trigger('reset');
        $("#id").val(detail.id);
        $("#title").val(detail.title);
        $("#old_image").val(detail.image);
        $("#no_of_days").val(detail.no_of_days);
        //$("#video_link").val(detail.video_link);

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

        $("#instruction").summernote('code', detail.instructions);
        $("#breath").summernote('code', detail.breath);
        $("#tags").val(detail.tags);
        $("#visible").val(detail.visible).trigger('change');
        $("#category").val(detail.category_id).trigger('change');
        
        $.each(detail.equipments, function(key, value) {
          $("#equipments [value=" + value.id + "]").prop('selected', true);
          $("#equipments").trigger('change');
        });

        $('#send_form').attr({value: "Update Split"});
        $("#modal-split").modal('show');
      },
      error: function(error) {
        console.log(error);
        Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
      }
    });
  }

  function getSplitDurations(durations, spid) {
    var du = durations.split(',');
    $("#show_durations").html("");
    $("#spid").val(spid);
    jQuery.each(du, function(index, item) {
      var spldu = spid + "," + item;
      if(index == 0) {
        $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='goToSplitWorkouts(" + JSON.stringify(spldu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
      } else {
        $("#show_durations").append("<div class='radio'><label><input type='radio' onclick='goToSplitWorkouts(" + JSON.stringify(spldu) + ")' value='" + item + "' name='duration'> " + item + " Mins</label></div>");
      }
    });
    
    $("#modal-split-duration").modal('show');
  }

  function goToSplitWorkouts(spldu) {
    var res = spldu.split(",");
    var url = "{{ route('admin-split-workouts-variation', [':spid', ':duration']) }}";
    url = url.replace(':spid', res[0]);
    url = url.replace(':duration', res[1]);
    window.location.href = url;
  }
</script>
@endsection

