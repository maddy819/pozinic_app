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
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-plan">Post Plans</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Duration</th>
                        <th>Plan Type</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($plans as $plan)
                    <tr>
                        <td>{{ $plan->id }}</td>
                        <td>{{ $plan->name }}</td>
                        <td>{{ $plan->price }}</td>
                        <td>{{ $plan->duration }} {{ $plan->duration_type }}</td>
                        <td>{{ $plan->plan_type }}</td>
                        <td>{{ $plan->description }}</td>
                        <td>
                            <form action="javascript:void(0)">@csrf
                                <a class="btn btn-xs btn-primary" href="#" onclick="edit_plan({{ $plan->id }})"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                <a class="btn btn-xs btn-danger" href="{{ route('admin-delete-plan', [$plan->id]) }}" onclick="return confirm('Are you sure?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Duration</th>
                        <th>Plan Type</th>
                        <th>Description</th>
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
    
    <div class="modal modal-primary fade" id="modal-plan" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Plan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="plan_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Name:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Name" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input type="number" name="price" class="form-control" id="price" placeholder="Price" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="price">Plan Type:</label>
                                    <select name="plan_type" id="plan_type" class="form-control" required>
                                        <option value="trial">Trial</option>
                                        <option value="paid">Paid</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="price">Duration:</label>
                                    <input type="number" name="duration" class="form-control" id="duration" placeholder="Duration" required>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="price">Duration Type:</label>
                                    <select name="duration_type" id="duration_type" class="form-control" required>
                                        <option value="days">Days</option>
                                        <option value="months">Months</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea name="description" class="form-control" id="description" placeholder="Description"></textarea>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Plan">
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
        var table = $('#example1').DataTable();

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

        $('#modal-plan').on('hidden.bs.modal', function (e) {
            $('#plan_post').trigger('reset');
            $('#description').summernote('reset');
        })
    });

    $("#plan_post").validate({
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

            var form = $('#plan_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-plan') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                    //console.log(response);
                    if(response.success) {
                        $('#plan_post').trigger('reset');
                        $('#description').summernote('reset');
                        $('#modal-plan').modal('hide');
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

    function edit_plan(pId) {
        $.LoadingOverlay("show");
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-plan') }}",
            data: { _token: _token, pId: pId},
            cache: false,
            dataType: "json",
            success: function(detail){
                //console.log(detail);
                $('#plan_post').trigger('reset');
                $("#id").val(detail.id);
                $("#name").val(detail.name);
                $("#price").val(detail.price);
                $("#duration").val(detail.duration);
                $("#duration_type").val(detail.duration_type).trigger("change");
                $("#description").summernote('code', detail.description);
                $('#send_form').attr({value: "Update Plan"});
                $("#modal-plan").modal('show');
                $.LoadingOverlay("hide");
            }
        })
    }
</script>
@endsection