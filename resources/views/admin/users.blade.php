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
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Description</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Level</th>
                        <th>Height</th>
                        <th>Weight</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Description</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Level</th>
                        <th>Height</th>
                        <th>Weight</th>
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

    <div class="modal modal-primary fade" id="plan_model" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Active Plan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table id="example2" class="table table-sm table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                            </tr>
                        </tfoot>
                    </table>
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
        $('#example1').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax":"{{ route('all-users') }}",
            "columns": [
                { "data": "id", "name": "id" },
                { "data": "name", "name": "name" },
                { "data": "email", "name": "email" },
                { "data": "mobile", "name": "mobile" },
                { "data": "gender", "name": "gender" },
                { "data": "age", "name": "age" },
                { "data": "level", "name": "level" },
                { "data": "height", "name": "height" },
                { "data": "weight", "name": "weight" },
                { "data": "action", "name": "action", "orderable": false, "searchable": false }
            ]
        });
    });

    function view_playlists(userId) {
      var url = '{{ route("users-view-playlists", ":id") }}';
      url = url.replace(':id', userId);
      window.location.href = url;
    }

    function favourite_resources(userId) {
      var url = '{{ route("users-favourite-resources", ":id") }}';
      url = url.replace(':id', userId);
      window.location.href = url;
    }

    function recent_resources(userId) {
      var url = '{{ route("users-recent-resources", ":id") }}';
      url = url.replace(':id', userId);
      window.location.href = url;
    }

    function user_program_subscriptions(userId) {
      var url = '{{ route("users-program-subscriptions", ":id") }}';
      url = url.replace(':id', userId);
      window.location.href = url;
    }

    function active_plan(userId) {
      $.LoadingOverlay("show");
      $('#plan_model').modal('show');
      var url = '{{ route("users-active-plan", ":id") }}';
      url = url.replace(':id', userId);
      $.LoadingOverlay("hide");
      $('#example2').DataTable({
          "processing": true,
          "serverSide": true,
          "responsive": true,
          "lengthChange": true,
          "autoWidth": false,
          "destroy": true,
          "ajax":url,
          "columns": [
              { "data": "name", "name": "name" },
              { "data": "plan_type", "name": "plan_type" },
              { "data": "plan_start", "name": "plan_start" },
              { "data": "plan_end", "name": "plan_end" },
          ]
      });
    }
</script>
@endsection