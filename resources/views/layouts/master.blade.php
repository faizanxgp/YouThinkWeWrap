<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="../../favicon.ico">

	<title>@yield('title')</title>

	<!-- Bootstrap core CSS -->
	<link href="{{ URL::to('src/css/bootstrap.css') }}" rel="stylesheet">

	<!-- Main CSS -->
	<link href="{{ URL::to('src/css/main.css') }}" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>	<![endif]-->
</head>

<body>
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-4"><img src="{{ URL::to('src/images/logo.png') }}" alt="logo"/></div>
			<div class="col-md-8">Pakistan's Largest Marketplace

				My Account @if (isset($user["name"]))
					{{ $user["name"] }}
				@endif </div>
		</div>
	</div>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">OLX Pakistan</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">Categories</a></li>
					<li><a href="#contact">Search</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					@if (isset($user["name"]))
						<li><a href="#">Update Account</a></li>
						<li><a href="{{ route('logout') }}">Logout</a></li>
					@else
						<li><a href="{{ route('login') }}">Login</a></li>
						<li><a href="{{ route('register') }}">Signup</a></li>
					@endif


				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../navbar/">My Account</a></li>
					<li><a href="../navbar-static-top/">Submit Ad</a></li>
					<li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>
</header>


<div class="container results">
	<div class="content">
		@yield('content')
	</div>
</div>

<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				&copy Copyrights 2016
			</div>
		</div>
	</div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="{{ URL::to('src/js/bootstrap.js') }}"></script>

<script src="{{ URL::to('src/js/scripts.js') }}"></script>

</body>
</html>