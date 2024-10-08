<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      
      
      <li class="nav-item dropdown user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
          @if($setting->logo)
            @if(file_exists('uploads/'.$setting->logo))
                <img class="user-image img-circle elevation-2" src="{{asset('uploads/'.$setting->logo)}}" alt="User profile picture">
            @else
                <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
            @endif
          @else
              <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
          @endif
          <span class="d-none d-md-inline">{{ Auth::user()->name }}</span>
        </a>
        <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <!-- User image -->
          <li class="user-header bg-primary">
            @if($setting->logo)
              @if(file_exists('uploads/'.$setting->logo))
                  <img class="user-image img-circle elevation-2" src="{{asset('uploads/'.$setting->logo)}}" alt="User profile picture">
              @else
                  <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
              @endif
            @else
                <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
            @endif
            <p>
              {{ Auth::user()->name }}
              <small>Joined {{ Auth::user()->created_at->diffForHumans() }}</small>
            </p>
          </li>
          <!-- Menu Footer-->
          <li class="user-footer">
            <a href="{{ route('admin-change-password') }}" class="btn btn-default btn-flat">{{ __('Change Password') }}</a>
            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout').submit();" class="btn btn-default btn-flat float-right">{{ __('Logout') }}</a>
            <form id="logout" action="{{ route('logout') }}" method="POST" style="display: none;">
              @csrf
            </form>
          </li>
        </ul>
      </li>
    </ul>
  </nav>