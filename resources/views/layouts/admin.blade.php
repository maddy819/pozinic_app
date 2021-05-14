<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ $pageTitle }} - {{ $setting->title }}</title>
  <meta name="description" content="{{ $setting->description }}">
  <meta name="keywords" content="{{ $setting->tags }}" />
  <meta name="author" content="{{ $setting->title }}">
  <meta name='copyright' content="{{ $setting->title }}">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- Favicon -->
  <link rel="shortcut icon" href="{{ asset('uploads/'.$setting->favicon) }}">
  @include('../partials.head')
  <style>
  .main-sidebar, .main-sidebar::before {
    transition: margin-left .3s ease-in-out,width .3s ease-in-out;
  }

  .dataTables_length {
    display:inline-block;
  }

  .note-btn-group .btn {
    color: black;
  }

  @media (min-width: 768px) {
    body:not(.sidebar-mini-md) .content-wrapper, body:not(.sidebar-mini-md) .main-footer, body:not(.sidebar-mini-md) .main-header {
        transition: margin-left .3s ease-in-out;
    }
  }

  .card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 0.5rem;
  }
  </style>

@yield('style')
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  @include('../partials.admin-navbar')
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  @include('../partials.admin-sidebar')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>
  <!-- /.content-wrapper -->
  
  @include('../partials.footer')
  
</div>
<!-- ./wrapper -->

  @include('../partials.scripts')

  @yield('script')
</body>
</html>
