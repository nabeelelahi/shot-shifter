<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>
        {{ !empty(CustomHelper::appSetting('application_setting','application_name')) ?
            CustomHelper::appSetting('application_setting','application_name') : env('APP_NAME')
         }} | Admin Panel
    </title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{ URL::to(CustomHelper::appSetting('application_setting','favicon'))  }}">
    <link href="{{ asset('admin/assets/lib/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('admin/assets/lib/toast/jquery.toast.min.css') }}" rel="stylesheet">
    <link href="{{ asset('admin/assets/scss/style.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    @stack('stylesheets')
    <script>
        var base_url    = '{{ URL::to("/") }}';
        var current_url = '{{ url()->current() }}';
    </script>
</head>
<body>
<div id="overlay"></div>
<div class="top-bar primary-top-bar">
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <a class="admin-logo" href="{{ route('admin.dashboard') }}">
                    <h1>
                        <img style="width: 165px;" alt="logo" src="{{ CustomHelper::appSetting('application_setting','logo') }}" class="toggle-none hidden-xs">
                    </h1>
                </a>
                <div class="left-nav-toggle" >
                    <a  href="#" class="nav-collapse"><i class="fa fa-bars"></i></a>
                </div>
                <div class="left-nav-collapsed" >
                    <a  href="#" class="nav-collapsed"><i class="fa fa-bars"></i></a>
                </div>
                <ul class="list-inline top-right-nav">
                    <li class="dropdown avtar-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <img alt="" class="rounded-circle" src="{{ !empty( CustomHelper::currentUser()->image_url) ? URL::to( CustomHelper::currentUser()->image_url) : asset('admin/assets/img/avtar-2.png') }}" width="30">
                            {{ CustomHelper::currentUser()->name }}
                        </a>
                        <ul class="dropdown-menu top-dropdown">
                            <li>
                                <a class="dropdown-item" href="{{ route('admin.profile') }}"><i class="icon-user"></i> Profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('admin.change-password') }}"><i class="icon-lock"></i> Change Password</a>
                            </li>
                            <li class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item" href="{{ route('admin.logout') }}"><i class="icon-logout"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="main-sidebar-nav default-navigation">
    <div class="nano">
        <div class="nano-content sidebar-nav">
            <div class="card-body border-bottom text-center nav-profile">
                <div class="notify setpos"> <span class="heartbit"></span> <span class="point"></span> </div>
                <img alt="profile" class="margin-b-10" src="{{ !empty( CustomHelper::currentUser()->image_url) ? URL::to( CustomHelper::currentUser()->image_url) : asset('admin/assets/img/avtar-2.png') }}" width="80">
                <p class="lead margin-b-0 toggle-none">{{ CustomHelper::currentUser()->name }}</p>
                <p class="text-muted mv-0 toggle-none">Welcome</p>
            </div>
            <ul class="metisMenu nav flex-column" id="menu">
                <li class="nav-heading"><span>MODULE</span></li>
                <li data-type="parent" class="nav-item">
                    <a class="nav-link" href="{{ route('admin.dashboard') }}">
                        <i class="fa fa-home"></i> <span class="toggle-none">Dashboard</span>
                    </a>
                </li>
                @if( count($cmsModules) )
                    @foreach( $cmsModules as $modules )
                        @if( count($modules->child) )
                            <li data-type="child" class="nav-item">
                                <a class="nav-link"  href="javascript: void(0);" aria-expanded="false">
                                    <i class="{{ $modules->icon }}"></i> <span class="toggle-none">{{ $modules->name }} <span class="fa arrow"></span></span>
                                </a>
                                <ul class="nav-second-level nav flex-column " aria-expanded="false">
                                    @foreach($modules->child as $childModules)
                                        <li class="nav-item"><a class="nav-link" href="{{ route($childModules->route_name) }}">{{ $childModules->name }}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                        @else
                            <li data-type="parent" class="nav-item">
                                <a class="nav-link" href="{{ route($modules->route_name) }}">
                                    <i class="{{ $modules->icon }}"></i> <span class="toggle-none">{{ $modules->name }}</span>
                                </a>
                            </li>
                        @endif
                    @endforeach
                @endif
            </ul>
        </div>
    </div>
</div>
<div class="row page-header">
    <div class="col-lg-6 align-self-center ">
        <h2>{{ !empty($page_title) ? $page_title : '' }}</h2>
    </div>
</div>
@yield('content')
<script src="{{ asset('admin/assets/lib/jquery/dist/jquery.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/bootstrap/js/popper.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/bootstrap/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/pace/pace.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/jasny-bootstrap/js/jasny-bootstrap.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/slimscroll/jquery.slimscroll.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/nano-scroll/jquery.nanoscroller.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/metisMenu/metisMenu.min.js') }}"></script>
<script src="{{ asset('admin/assets/lib/toast/jquery.toast.min.js') }}"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script src="{{ asset('admin/assets/js/custom.js') }}"></script>
<script src="{{ asset('admin/assets/js/admin.js') }}"></script>
@stack('scripts')
</body>
</html>
