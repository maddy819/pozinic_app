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
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-blog">Post Blog</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Visible</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Visible</th>
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
    
    <div class="modal modal-primary fade" id="modal-blog" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Blog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="blog_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
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
                                    <label for="category">Type:</label>
                                    <select class="form-control featured" name="type" id="type" required>
                                        <option selected disabled>Select Option</option>
                                        <option value="Nutrition">Nutrition</option>
                                        <option value="Workout">Workout</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Blog Url:</label>
                                    <input type="text" name="url" class="form-control" id="url" placeholder="Blog Url" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="position">Image:</label>
                                    <input type="hidden" id="old_image" name="old_image">
                                    <input type="file" name="image" class="form-control"  id="image" required>
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
                                    <label for="title">Visibility:</label>
                                    <select class="form-control" name="visible" id="visible">
                                      <option value="1">Visible</option>
                                      <option value="0">Invisible</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description" required></textarea>
                                </div>

                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Blog">
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
        var table = $('#example1').DataTable({
            "processing": true,
            "responsive": true,
            "serverSide": true,
            "ajax":"{{ route('all-blogs') }}",
            "columns": [
                { "data": "id", "name": "id" },
                { "data": "title", "name": "title" },
                { "data": "type", "name": "type" },
                { "data": "image", "name": "image" },
                { "data": "description", "name": "description" },
                { "data": "visible", "name": "visible" },
                { "data": "action", "name": "action", "orderable": false, "searchable": false }
            ],
            "dom": 'Blfrtip',
            "buttons": [
                "selectAll",
                "selectNone",
                "copy", 
                "csv", 
                "excel", 
                "pdf", 
                "print", 
                "colvis"
            ]
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

        $('#modal-blog').on('hidden.bs.modal', function (e) {
            $('#blog_post').trigger('reset');
            $('#description').summernote('reset');
        })
    });

    $("#blog_post").validate({
        ignore: ".ql-container *",
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });
        
            var form = $('#blog_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-blog') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                //console.log(response);
                    if(response.success) {
                        $('#blog_post').trigger('reset');
                        $('#description').summernote('reset');
                        $('#modal-blog').modal('hide');
                        //window.setTimeout(function(){location.reload()},1500)
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

    function edit_blog(bId) {
        $.LoadingOverlay("show");
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-blog') }}",
            data: { _token: _token, bId: bId},
            cache: false,
            dataType: "json",
            success: function(detail){
                //console.log(detail);
                $('#blog_post').trigger('reset');
                $("#id").val(detail.id);
                $("#title").val(detail.title);
                $("#type").val(detail.type).trigger('change');
                $("#url").val(detail.url);
                $("#old_image").val(detail.image);
                $("#tags").val(detail.tags);
                $('#send_form').attr({value: "Update Blog"});
                $("#visible").val(detail.visible).trigger('change');
                $("#description").summernote('code', detail.description);
                $("#modal-blog").modal('show');
                $.LoadingOverlay("hide");
            }
        })
    }

    function delete_blog(bId) {
        if (confirm('Are you sure to delete')) {
            var url = '{{ route("admin-delete-blog", ":id") }}';
            url = url.replace(':id', bId);
            window.location.href = url;
        }
    }
</script>
@endsection