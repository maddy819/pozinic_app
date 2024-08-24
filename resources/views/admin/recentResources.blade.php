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
                <h3>Recent Exercises</h3>
            </div>
            <div class="card-body">
              <table id="example1" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Reps</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($recentExercises as $ex)
                  <tr>
                    <td>{{ $ex->title }}</td>
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
                    <td>{{ $ex->level }}</td>
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

    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- /.card-header -->
            <div class="card-header">
                <h3>Recent Workouts</h3>
            </div>
            <div class="card-body">
              <table id="example2" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>equipments</th>
                    <th>no. of days</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($recentWorkouts as $wk)
                  <tr>
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
                      @foreach($wk->equipments as $weq)
                        @if($loop->last)
                          {{ $weq->name }}
                        @else
                          {{ $weq->name.', ' }}
                        @endif
                      @endforeach
                      </td>
                      <td>{{ $wk->no_of_days }}</td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                    <th>equipments</th>
                    <th>no. of days</th>
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

    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- /.card-header -->
            <div class="card-header">
                <h3>Recent Programs</h3>
            </div>
            <div class="card-body">
              <table id="example3" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Frequency</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($recentPrograms as $pr)
                  <tr>
                    <td>{{ $pr->title }}</td>
                    <td>{{ $pr->duration }}</td>
                    <td>
                      @if($pr->image)
                        @if(file_exists('uploads/programs/images/'.$pr->image))
                          <img width="40" src="{{ asset('uploads/programs/images/'.$pr->image) }}" alt="{{ $pr->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pr->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pr->title }}"/>
                      @endif
                    </td>
                    <td>{{ $pr->frequency }}</td>
                    <td>{{ $pr->focus_area }}</td>
                    <td>{{ $pr->level }}</td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Frequency</th>
                    <th>Focus Area</th>
                    <th>Level</th>
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

    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- /.card-header -->
            <div class="card-header">
                <h3>Recent Splits</h3>
            </div>
            <div class="card-body">
              <table id="example4" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Good For</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($recentSplits as $pr)
                  <tr>
                    <td>{{ $pr->title }}</td>
                    <td>{{ $pr->duration }}</td>
                    <td>{{ $pr->good_for }}</td>
                    <td>{{ $pr->focus_area }}</td>
                    <td>{{ $pr->level }}</td>
                  </tr>
                  @endforeach
                </tbody>
                <tfoot>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Good For</th>
                    <th>Focus Area</th>
                    <th>Level</th>
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

    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- /.card-header -->
            <div class="card-header">
                <h3>Recent Streches</h3>
            </div>
            <div class="card-body">
              <table id="example5" class="table table-sm table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Duration</th>
                    <th>Image</th>
                    <th>Reps</th>
                    <th>Focus Area</th>
                    <th>Level</th>
                  </tr>
                </thead>
                <tbody>
                  
                  @foreach($recentStreches as $pr)
                  <tr>
                    <td>{{ $pr->title }}</td>
                    <td>{{ $pr->duration }}</td>
                    <td>
                      @if($pr->image)
                        @if(file_exists('uploads/programs/images/'.$pr->image))
                          <img width="40" src="{{ asset('uploads/programs/images/'.$pr->image) }}" alt="{{ $pr->title }}"/>
                        @else
                          <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pr->title }}"/>
                        @endif
                      @else
                        <img width="40" src="{{ asset('uploads/default-placeholder.png') }}" alt="{{ $pr->title }}"/>
                      @endif
                    </td>
                    <td>{{ $pr->frequency }}</td>
                    <td>{{ $pr->focus_area }}</td>
                    <td>{{ $pr->level }}</td>
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
    $("#example1").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
    });

    $("#example2").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
    });

    $("#example3").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
    });

    $("#example4").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
    });

    $("#example5").DataTable({
      "responsive": true, 
      "lengthChange": false, 
      "autoWidth": false, 
      "info": true,
      "lengthChange": true,
    });
  });

  
</script>
@endsection

