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
            <div class="card-body">
                <form action="{{ route('admin-settings-update') }}" method="post" enctype="multipart/form-data">@csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="hidden" name="id" id="id" value="{{ $setting->id }}">
                                <input type="hidden" name="old_logo" value="{{ $setting->logo }}" />
                                <input type="hidden" name="old_favicon" value="{{ $setting->favicon }}" />
                                <label for="title">Title:</label>
                                <input type="text" name="title" class="form-control {{ $errors->has('title') ? ' is-invalid' : '' }}" id="title" placeholder="Title" value="{{ $setting->title }}">
                                @if ($errors->has('title'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="logo">Logo:</label>
                                <br><br>
                                <img src="{{ asset('uploads') }}/{{ $setting->logo }}" class="img img-thumbnail" style="width: 100px;">
                                <br><br>
                                <input type="file" name="logo" class="form-control {{ $errors->has('logo') ? ' is-invalid' : '' }}" id="logo">
                                @if ($errors->has('logo'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('logo') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="contact">Contact Number:</label>
                                <input type="number" name="contact" class="form-control {{ $errors->has('contact') ? ' is-invalid' : '' }}" id="contact" placeholder="Contact" value="{{ $setting->contact }}">
                                @if ($errors->has('contact'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('contact') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="description">Description:</label>
                                <textarea name="description" class="form-control {{ $errors->has('description') ? ' is-invalid' : '' }}" id="description1" placeholder="Description">{{ $setting->description }}</textarea>
                                @if ($errors->has('description'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" name="email" class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}" id="email" placeholder="Email" value="{{ $setting->email }}">
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                            
                            <div class="form-group">
                                <label for="favicon">Favicon:</label>
                                <br><br>
                                <img src="{{ asset('uploads') }}/{{ $setting->favicon }}" class="img img-thumbnail" style="width: 100px;">
                                <br><br>
                                <input type="file" name="favicon" class="form-control {{ $errors->has('favicon') ? ' is-invalid' : '' }}" id="favicon">
                                @if ($errors->has('favicon'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('favicon') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="website">Website:</label>
                                <input type="text" name="website" class="form-control {{ $errors->has('website') ? ' is-invalid' : '' }}" id="website" placeholder="Website" value="{{ $setting->website }}">
                                @if ($errors->has('website'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('website') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="tags">Tags:</label>
                                <textarea name="tags" class="form-control {{ $errors->has('tags') ? ' is-invalid' : '' }}" id="tags" placeholder="Tags">{{ $setting->tags }}</textarea>
                                @if ($errors->has('tags'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('tags') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <textarea name="address" class="form-control {{ $errors->has('address') ? ' is-invalid' : '' }}" id="address" placeholder="Address">{{ $setting->address }}</textarea>
                                @if ($errors->has('address'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('address') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Update Settings">
                            </div>
                        </div>
                    </div>
                </form>
                @if(Session::has('message'))
                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        {{Session::get('message')}}
                    </div>
                @endif
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
@endsection
