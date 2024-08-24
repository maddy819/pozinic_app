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
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Type</th>
                      <th>Subject</th>
                      <th>Description</th>
                      <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Type</th>
                      <th>Subject</th>
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
        "serverSide": true,
        "ajax":"{{ route('all-contact') }}",
        "columns": [
            { "data": "id", "name": "id" },
            { "data": "name", "name": "name" },
            { "data": "email", "name": "email" },
            { "data": "type", "name": "type" },
            { "data": "subject", "name": "subject" },
            { "data": "description", "name": "description" },
            { "data": "action", "name": "action", "orderable": false, "searchable": false }
        ]
      });
    });

    function delete_contact(cId) {
        if (confirm('Are you sure to delete')) {
            var url = '{{ route("admin-delete-contact", ":id") }}';
            url = url.replace(':id', cId);
            window.location.href = url;
        }
    }
</script>
@endsection