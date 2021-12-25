<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>@yield('title') | YouThinkWeWrap</title>
	<meta name="description" content="You Think We Wrap is a Gift Portal Service offering a variety of Unique Gifts at Doorstep to Surprise your loved ones anywhere in Lahore. We offer deliveries from 12 pm to midnight. Our Products have a wide range of variety starting from Customized Gift Baskets, Chocolate bouquets, Cakes, Flowers, Hand Made Cards, Customized Frames, Customized Cushions and Much more. ">
	<meta name="author" content="">

	<link rel="icon" type="image/png" href="{{ URL::to('src/images/favicon.ico') }}">

	<meta property="og:url"                content="http://www.youthinkwewrap.com" />
	<meta property="og:type"               content="page" />
	<meta property="og:title"              content="@yield('title')" />
	<meta property="og:description"        content="You Think We Wrap is a Gift Portal Service offering a variety of Unique Gifts at Doorstep to Surprise your loved ones anywhere in Lahore. We offer deliveries from 12 pm to midnight. Our Products have a wide range of variety starting from Customized Gift Baskets, Chocolate bouquets, Cakes, Flowers, Hand Made Cards, Customized Frames, Customized Cushions and Much more. " />
	<meta property="og:image"              content="" />

	<!-- Bootstrap core CSS -->
	<link href="{{ URL::to('src/assets/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
	<link href="{{ URL::to('src/assets/fontawesome/css/font-awesome.css') }}" rel="stylesheet">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	{{--<link rel="stylesheet" href="/resources/demos/style.css">--}}

	<link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

	<!-- Main CSS -->
	<link href="{{ URL::to('src/css/style.css') }}" rel="stylesheet">
	<link href="{{ URL::to('src/css/main.css') }}" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>    <![endif]-->
</head>

<body>
<!-- header -->
<header>
	<div class="row-1">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo">
						<a href="{{ route('home') }}"><img src="{{ URL::to('src/images/logo.png') }}" alt=""></a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="phone inline">
						Connect: 0335 452 4728
					</div>
					<div class="search pull-right">
						<form method="get" action="{{ route('search') }}">
						<input type="text" name="search" placeholder="Enter a keyword"> <img src="{{ URL::to('src/images/search.png') }}" alt="">
						</form>
					</div>
					<div class="cart pull-right">
						<a href="{{ route('cart') }}">
						<div class="img-wrapper">
							<img src="{{ URL::to('src/images/cart.png') }}" alt=""> PKR <?php
							$amt = 0;
							if ((Session()->has('cart'))) {
								$cart = Session('cart');
								foreach ($cart as $c) {
									$amt += $c['amount'];
								}
							}
							?>
							{{ $amt }}
						</div>
						</a>
					</div>
					<ul class="login-nav pull-right">
						@if (Auth::guest())
							{{--<li><a href="{{ route('register') }}"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>--}}
							<li><a href="{{ route('login') }}"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
						@else
							<li><a href="{{ route('update-user') }}"><span class="glyphicon glyphicon-user"></span> Account</a></li>
							<li><a href="{{ route('user.logout') }}"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						@endif

					</ul>
				</div>

			</div>
		</div>
	</div>

	<div class="row-2">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-md-push-3 col-sm-9 col-sm-push-3">

					<nav class="navbar navbar-default pull-right">
						<div class="container-fluid-x">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="#"></a>
							</div>
							<div class="collapse navbar-collapse" id="myNavbar">
								<ul class="nav navbar-nav">
									<li><a href="{{ route('category', 3)  }}">Gift Baskets</a></li>

									<li><a href="{{ route('category', 2)  }}">Flowers</a></li>
									<li><a href="{{ route('category', 1)  }}">Cakes</a></li>
									<li><a href="{{ route('category', 9)  }}">Combo Deals</a></li>
									<li><a href="{{ route('category', 10)  }}">Chocolate Bouquets</a></li>
									<li class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">More Gifts<span class="caret"></span></a>
										<ul class="dropdown-menu">

											<li><a href="{{ route('category', 4)  }}">Hand-made Cards</a></li>
											<li><a href="{{ route('category', 5)  }}">Customized Mugs</a></li>
											<li><a href="{{ route('category', 6)  }}">Cushions</a></li>
											<li><a href="{{ route('category', 7)  }}">Frames</a></li>
											<li><a href="{{ route('category', 8)  }}">Stuffed Toys</a></li>
										</ul>
									</li>


								</ul>

							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>


</header>


<section class="content">
	@yield('content')
</section>
<footer>
	<div class="container-fluid" id="social-icons-row">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12" id="social-text">
				<h3 class="find">Find Us Where You Are!</h3>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div id="social-icons">
					<div class="social-icon">
						<a href="https://www.facebook.com/youthinkwewrap/"><i class="fa fa-facebook"></i></a>

					</div>
					<div class="social-icon">
						<a href="https://twitter.com/youthinkwewrap"><i class="fa fa-twitter"></i></a>

					</div>
					<div class="social-icon">
						<a href="#"><i class="fa fa-pinterest"></i></a>

					</div>
					<div class="social-icon">
						<a href="#"><i class="fa fa-youtube"></i></a>

					</div>
					<div class="social-icon">
						<a href="#"><i class="fa fa-instagram"></i></a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="f-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="row">
						<div class="col-md-4 col-sm-4 col-xs-6">
							<div class="f-row1">
								<h4 class="footer-head">COMPANY</h4>
								<ul class="f-lists">
									<li><a href="{{ route('page', 'about-us') }}">About Us</a></li>
									<li><a href="{{ route('page', 'terms-conditions') }}">Terms and Conditions</a></li>
									<li><a href="{{ route('page', 'faqs') }}">FAQs</a></li>
								</ul>
							</div>

						</div>
						<div class="col-md-4  col-sm-4 col-xs-6">
							<div class="f-row1">
								<h4 class="footer-head">CUSTOMER</h4>
								<ul class="f-lists">
									<li><a href="#">My Account</a></li>
									<li><a href="#">Track Your Order</a></li>

								</ul>
							</div>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-6">
							<div class="f-row1">
								<h4 class="footer-head">OCCASIONS</h4>
								<ul class="f-lists">
									<li><a href="{{ route('tag', 'birthday') }}">Birthday</a></li>
									<li><a href="{{ route('tag', 'engagement-wedding') }}">Engagement & Wedding</a></li>
									<li><a href="{{ route('tag', 'congratulations') }}">Congratulations</a></li>
									<li><a href="{{ route('tag', 'thank-you-sorry') }}">Thank you & Sorry</a></li>
									<li><a href="{{ route('tag', 'seasonal') }}">Seasonal Gifts</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<h4 class="footer-head">PROUDLY ACCEPT PAYMENTS FROM</h4>
					<img class="payments" src="{{ URL::to('src/images/payments.png') }}" alt=""><br>
					<div class="row" id="connect">
						<div class="col-md-6 col-xs-6">
							<h4 id="footer-head1">OUR LOCATION</h4><br><br>
							<p>You Think We Wrap, <br>34 - Lower Ground, Century Tower, <br />Kalma Chowk, Lahore</p>

						</div>
						<div class="col-md-6 col-xs-6">
							<h4 id="footer-head2">CONTACT INFO</h4>
							<p>Phone / Whatsapp: 0335 452 4728<br>Email: youthinkwewrap@gmail.com</p>
						</div>
					</div>
				</div>
			</div>
			<div class="f-last">
				<div class="row">
					<div class="col-md-6 col-xs-6">
						<img src="{{ URL::to('src/images/f-logo.png') }}" alt=""> <img src="{{ URL::to('src/images/sep.png') }}" alt="">
					</div>
					<div class="col-md-6 col-xs-6">
						<div class="track-order">
							<form method="get" action="{{ route('track-order') }}">
							<div class="row">
								<div class="col-md-8 col-xs-12">
									<input type="text" name="order" class="text-track" placeholder="Enter Your Order ID">
								</div>
								<div class="col-md-4 col-xs-12">
									<button class="btn btn-primary">Track My Order</button>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid copyright">
			<div class="r-border">
				<img src="{{ URL::to('src/images/border.png') }}" alt="">

				<div class="f-copyright">
					<div class="container">
						<div class="row" id="design">
							<div class="col-md-6 col-xs-6" id="copy">
								<p>&copy; All Rights Reserved 2017-2018</p>
							</div>
							<div class="col-md-6 col-xs-6" id="team">
								<p>Designed & Developed By <a href="http://team-online.biz">Team Online</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Bootstrap core JavaScript
	================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="{{ URL::to('src/assets/jquery.js') }}"></script>
<script src="{{ URL::to('src/assets/bootstrap/js/bootstrap.min.js') }}"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="{{ URL::to('src/js/scripts.js') }}"></script>
<script src="{{ URL::to('src/js/myjs.js') }}"></script>
@yield('js')

<!--Start of Tawk.to Script-->
<script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/5a3014175d3202175d9b7d4b/default';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
	})();
</script>
<!--End of Tawk.to Script-->

</body>
</html>