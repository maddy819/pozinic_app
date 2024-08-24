<aside class="main-sidebar sidebar-dark-primary elevation-4">
   

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          @if($setting->logo)
            @if(file_exists('uploads/'.$setting->logo))
                <img class="user-image img-circle elevation-2" src="{{asset('uploads/'.$setting->logo)}}" alt="User profile picture">
            @else
                <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
            @endif
          @else
              <img class="user-image img-circle elevation-2" src="{{asset('uploads/default-placeholder.png')}}" alt="User profile picture">
          @endif
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

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-programs') }}" class="nav-link {{ (request()->segment(2) == 'programs') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tasks"></i>
              <p>Programs</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-splits') }}" class="nav-link {{ (request()->segment(2) == 'splits') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Splits</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-streches') }}" class="nav-link {{ (request()->segment(2) == 'streches') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Streches</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-nutrition') }}" class="nav-link {{ (request()->segment(2) == 'nutrition') ? 'active' : '' }}">
              <i class="nav-icon fa fa-cutlery"></i>
              <p>Nutrition</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-blogs') }}" class="nav-link {{ (request()->segment(2) == 'blogs') ? 'active' : '' }}">
              <i class="nav-icon fas fa-rss-square"></i>
              <p>Blogs</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-videos') }}" class="nav-link {{ (request()->segment(2) == 'videos') ? 'active' : '' }}">
              <i class="nav-icon fas fa-video-camera"></i>
              <p>Videos</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-questions') }}" class="nav-link {{ (request()->segment(3) == 'questions') ? 'active' : '' }}">
              <i class="nav-icon fas fa-question-circle"></i>
              <p>Signup Questions</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-filter"></i>
              <p>
                Filters
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('admin-equipments') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Equipments</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('admin-categories') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Categories</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('admin-good-for') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Good Fors</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('admin-focus-area') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Focus Area</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('admin-muscles') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Muscles</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{ route('admin-durations') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Durations</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item has-treeview">
            <a href="{{ route('admin-users') }}" class="nav-link {{ (request()->segment(2) == 'users') ? 'active' : '' }}">
              <i class="nav-icon fas fa-users"></i>
              <p>Users</p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fa fa-wpexplorer"></i>
              <p>
                General
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{ route('admin-plan') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Plans</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="{{ route('admin-faq') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>FAQ</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="{{ route('admin-contact') }}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="{{ route('admin-settings') }}" class="nav-link {{ (request()->segment(2) == 'settings') ? 'active' : '' }}">
              <i class="nav-icon fas fa-cogs"></i>
              <p>{{ __('Settings') }}</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="{{ route('admin-change-password') }}" class="nav-link {{ (request()->segment(2) == 'change-password') ? 'active' : '' }}">
              <i class="nav-icon fas fa-key"></i>
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
