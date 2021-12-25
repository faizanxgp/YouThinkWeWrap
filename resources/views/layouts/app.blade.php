<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>{{ config('app.name', 'Laravel') }}</title>

	<!-- Styles -->
	<link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
<div id="app">
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">

				<!-- Collapsed Hamburger -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
					<span class="sr-only">Toggle Navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>

				<!-- Branding Image -->
				<a class="navbar-brand" href="{{ url('/') }}">
					{{ config('app.name', 'YTWW') }}
				</a>
			</div>

			<div class="collapse navbar-collapse" id="app-navbar-collapse">
				<!-- Left Side Of Navbar -->
				<ul class="nav navbar-nav">
					&nbsp;
				</ul>

				<!-- Right Side Of Navbar -->
				<ul class="nav navbar-nav navbar-right">
					<!-- Authentication Links -->
					@if (Auth::guest())
						<li><a href="{{ route('admin.login') }}">Login</a></li>
						<li><a href="{{ route('register') }}">Register</a></li>
					@else
						<li><a href="{{ route('admin.orders') }}">Orders</a></li>
						<li><a href="{{ route('admin.products') }}">Products</a></li>
						<li><a href="{{ route('admin.coupons') }}">Coupons</a></li>

						<li><a href="{{ route('admin.users') }}">Users</a></li>



						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								Other <span class="caret"></span> </a>

							<ul class="dropdown-menu" role="menu">
								<li><a href="{{ route('admin.categories') }}">Categories</a></li>
								<li><a href="{{ route('admin.tags') }}">Tags</a></li>
								<li><a href="{{ route('admin.discount') }}">Category Discount</a></li>
								<li><a href="{{ route('admin.testimonials') }}">Testimonials</a></li>
								<li><a href="{{ route('admin.pages') }}">Pages</a></li>
								<li><a href="{{ route('admin.setting') }}">Site Settings</a></li>
							</ul>
						</li>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								{{ Auth::user()->name }} <span class="caret"></span> </a>

							<ul class="dropdown-menu" role="menu">
								<li><a href="{{ route('admin.account') }}">Account</a></li>
								<li>
									<a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"> Logout </a>

									<form id="logout-form" action="{{ route('admin.logout') }}" method="POST" style="display: none;">
										{{ csrf_field() }}
									</form>
								</li>
							</ul>
						</li>
					@endif
				</ul>
			</div>
		</div>
	</nav>

	@yield('content')
</div>

<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
@yield('js')
</body>
</html>
