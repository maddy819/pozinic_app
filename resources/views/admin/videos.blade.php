@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{ $pageTitle }}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('admin-dashboard') }}">Home</a></li>
              <li class="breadcrumb-item active">{{ $pageTitle }}</li>
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
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-video">Post Video</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Video</th>
                        <th>Order</th>
                        <th>Tags</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Video</th>
                        <th>Order</th>
                        <th>Tags</th>
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
    
    <div class="modal modal-primary fade" id="modal-video" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Video</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="video_post" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="Title" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="position">Video url:</label>
                                    <input type="url" name="url" class="form-control" id="url" placeholder="Video Url" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Tags: (Comma Seperated)</label>
                                    <input type="text" name="tags" class="form-control" id="tags" placeholder="Tags">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="position">Video Type:</label>
                                    <select name="type" id="type" class="form-control" required>
                                        <option value="youtube">Youtube</option>
                                        <option value="vimeo">Vimeo</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Order:</label>
                                    <input type="number" name="order" class="form-control" id="order" placeholder="Order" required>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description"></textarea>
                                </div>

                                <div class="form-group">
                                    <button type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Video">Post Video</button>
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

        var table = $('#example1').DataTable({
            "processing": true,
            "serverSide": true,
            "order": [ 3, 'asc' ],
            "ajax":"{{ route('all-videos') }}",
            "columns": [
                { "data": "id", "name": "id" },
                { "data": "title", "name": "title" },
                { "data": "thumbnail", "name": "thumbnail" },
                { "data": "order", "name": "order" },
                { "data": "tags", "name": "tags" },
                { "data": "action", "name": "action", "orderable": false, "searchable": false }
            ]
        });

        $('#modal-video').on('hidden.bs.modal', function (e) {
            $('#video_post').trigger('reset');
            $('#send_form').attr('value', 'Post Video');
            $('#description').summernote('reset');
        })
    });

    $("#video_post").validate({
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

            var form = $('#video_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-video') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                //console.log(response);
                    if(response.success) {
                        $('#video_post').trigger('reset');
                        $('#description').summernote('reset');
                        $('#modal-video').modal('hide');
                        $('#example1').DataTable().ajax.reload();
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

    function edit_video(vId) {
        $.LoadingOverlay("show");
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-video') }}",
            data: { _token: _token, vId: vId},
            cache: false,
            dataType: "json",
            success: function(detail){
                console.log(detail);
                $('#video_post').trigger('reset');
                $("#id").val(detail.id);
                $("#title").val(detail.title);
                $("#url").val(detail.url);
                $("#tags").val(detail.tags);
                $("#type").val(detail.type).trigger('change');
                $("#order").val(detail.order);
                $("#description").summernote('code', detail.description);
                $('#send_form').attr({value: "Update Video"});
                $("#modal-video").modal('show');
                $.LoadingOverlay("hide");
            }
        })
    }

    function delete_video(vId) {
        if (confirm('Are you sure to delete')) {
            var url = '{{ route("admin-delete-video", ":id") }}';
            url = url.replace(':id', vId);
            window.location.href = url;
        }
    }
</script>
@endsection