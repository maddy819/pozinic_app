<aside class="main-sidebar sidebar-dark-primary elevation-4">
   

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset('dist/img/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{{ Auth::user()->name }}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item has-treeview">
            <a href="{{ route('admin-dashboard') }}" class="nav-link {{ (request()->segment(2) == 'dashboard') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Dashboard</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-equipments') }}" class="nav-link {{ (request()->segment(2) == 'equipments') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Equipments</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-exercises') }}" class="nav-link {{ (request()->segment(2) == 'exercises') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Exercises</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-workouts') }}" class="nav-link {{ (request()->segment(2) == 'workouts') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Workouts</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="{{ route('admin-settings') }}" class="nav-link {{ (request()->segment(2) == 'settings') ? 'active' : '' }}">
              <i class="nav-icon fas fa-cogs"></i>
              <p>{{ __('Settings') }}</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="{{ route('admin-change-password') }}" class="nav-link {{ (request()->segment(2) == 'change-password') ? 'active' : '' }}">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>{{ __('Change Password') }}</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="nav-link">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>{{ __('Logout') }}</p>
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
              @csrf
            </form>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
