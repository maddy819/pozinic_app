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
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-muscle">Post Muscle</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Slug</th>
                        <th>Post Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($muscles as $m)
                    <tr>
                        <td>{{ $m->name }}</td>
                        <td>{{ $m->slug }}</td>
                        <td>{{ date('F d, Y', strtotime($m->created_at)) }}</td>
                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_muscle({{ $m->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                <a class="btn btn-xs btn-danger" href="{{ route('admin-delete-muscles', [$m->id]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Slug</th>
                        <th>Post Date</th>
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
    <div class="modal modal-primary fade" id="modal-muscle" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Muscle</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="muscle_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Name:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Name">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Muscle">
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
      toastr.error('{{Session::get("success")}}');
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

        $('#modal-muscle').on('hidden.bs.modal', function (e) {
            $('#muscle_post').trigger('reset');
        })
    });

    $("#muscle_post").validate({
        ignore: "",
        rules: {
            name: {
                required: true,
            }
        },
        messages: {
            name: "Please Enter Muscle",
        },
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

            var form = $('#muscle_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-muscles') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                    //console.log(response);
                    if(response.success) {
                        $('#muscle_post').trigger('reset');
                        $('#modal-muscle').modal('hide');
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

    function edit_muscle(mId) {
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-muscles') }}",
            data: { _token: _token, mId: mId },
            cache: false, 
            dataType: "json",
            success: function(detail){
                console.log(detail);
                $('#muscle_post').trigger('reset');
                $("#id").val(detail.id);
                $("#name").val(detail.name);
                $('#send_form').attr({value: "Update Muscle"});
                $("#modal-muscle").modal('show');
            },
            error: function(error) {
                console.log(error);
                Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
            }
        });
    }
</script>
@endsection