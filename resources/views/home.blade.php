@extends('layouts.main')


@section('title')
	We Deliver Sentiments
@endsection

@section('content')

	<div class="container-fluid">
		<div class="w-bakground">
			<img src="{{ URL::to('src/images/background.jpg') }}" alt="">
		</div>
		<div class="container">
			@if(Session::has('flash_message'))
				<div class="alert alert-success">
					{!! Session::get('flash_message') !!}
				</div>
			@endif
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					{{--<li data-target="#carousel-example-generic" data-slide-to="2"></li>--}}
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="{{ URL::to('src/images/temp-slide-1.jpg') }}" alt="slide 1">
						<div class="carousel-caption">

						</div>
					</div>
					<div class="item">
						<img src="{{ URL::to('src/images/temp-slide-2.jpg') }}" alt="slide 1">
						<div class="carousel-caption">

						</div>
					</div>

				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a
						class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
			</div>


		</div>
	</div>


	<section>
		<div class="container">
			<div class="trend-barx makeabasket">
				<div class="row">
					<div class="col-md-12">
						<a href="{{ route('basket') }}">
						<img src="{{ URL::to('src/images/make-a-basket.jpg') }}" alt="">
						</a>
					</div>
					{{--<div class="col-md-3 col-xs-3">--}}
						{{--<div class="gift-img">--}}
							{{--<div class="row">--}}
								{{--<div class="col-md-6 col-xs-6">--}}
									{{--<img src="{{ URL::to('src/images/gift.png') }}" alt="">--}}
								{{--</div>--}}
								{{--<div class="col-md-6 col-xs-6">--}}
									{{--<h5>TRENDING</h5>--}}
								{{--</div>--}}
							{{--</div>--}}
						{{--</div>--}}
					{{--</div>--}}
					{{--<div class="col-md-9 col-xs-9">--}}
						{{--<ul class="events-list">--}}
							{{--<li>--}}
								{{--<a href="#"> 01. Chocolates </a></li>--}}
							{{--<li>--}}
								{{--<a href="#" class="active-mother1">02. Mother's Day</a>--}}
							{{--</li>--}}
							{{--<li>--}}
								{{--<a href="#">03. Baby Products</a>--}}
							{{--</li>--}}
							{{--<li>--}}
								{{--<a href="#">04. Father's Day</a>--}}
							{{--</li>--}}
							{{--<li>--}}
								{{--<a href="#">05. Anniversary</a>--}}
							{{--</li>--}}
						{{--</ul>--}}
					{{--</div>--}}
				</div>
			</div>
		</div>
		<div class="container">
			<div class="trend-bar-mob">
				<div class="row">
					<div class="col-md-3 col-xs-3">
						<div class="gift-img">
							<div class="row">
								<div class="col-md-6 col-xs-6">
									<img src="{{ URL::to('src/images/gift.png') }}" alt="">
								</div>
								<div class="col-md-6 col-xs-6">
									<h5>TRENDING</h5>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-9 col-xs-9">
						<div class="trends">
							<ul class="nav1" id="topnav1">
								<li><a href="javascript:void(0);" class="icon1" onclick="myFunction1()">&#9776;</a></li>
								<li>01. Chocolates</li>
								<li>02. Mother's Day</li>
								<li>03. Baby Products</li>
								<li>04. Father's Day</li>
								<li>05. Anniversary</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="arrivals">
			<h2>New Arrivals</h2>
			<div class="container">
				<div class="row">

					@foreach ($recent as $product)
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="thumbnail item-card">
								<img src="@if($product->image1 != "") {{ URL::to('uploads/products/' . $product->image1) }} @else {{ URL::to('src/images/image.png') }} @endif" alt="">
								<div class="caption item-caption">
									<p class="blue-text">{{ $product->title }}</p>
									<p class="fade-tagline">Delivery: {{ $product->delivery }}</p>
									<div class="card-price-row row">
										<div style="clear: both;"></div>
										<div class="col-md-6 col-xs-12 price">PKR <span>@if($product->available == 1){{ $product->price }}@endif</span></div>
										@if ($product->regular_price != 0)
											<div class="col-md-6 col-xs-12 sale">ON Sale<span>PKR {{ $product->regular_price }}</span></div>
										@endif
									</div>
									<div class="card-button container-fluid">
										<a href="{{ route('product', $product->id) }}" class="details-btn" role="button">View Details</a> <a href="#" class="like-btn" role="button"><img src="{{ URL::to('src/images/heart.jpg') }}" alt=""></a>
									</div>
								</div>
							</div>
						</div>
					@endforeach


				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="black-background">
			<div class="container" id="gift-wrap">
				<div class="row">
					<div class="col-md-6 col-xs-12">
						<a href="@if($settings->main_link != "") {{ $settings->main_link }} @else # @endif">
						@if ($settings->main_offer)
							<img class="happy-bd" src="{{ URL::to('uploads/settings/' . $settings->main_offer) }}" alt="">
						@else
							<img class="happy-bd" src="{{ URL::to('src/images/ad1.png') }}" alt="">
						@endif
						</a>
					</div>
					<div class="col-md-6 col-xs-12" id="right-imgs">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<div class="back">
									<a href="@if($settings->small_link_1 != "") {{ $settings->small_link_1 }} @else # @endif">
									@if ($settings->small_offer_1)
										<img src="{{ URL::to('uploads/settings/' . $settings->small_offer_1) }}" alt="">
									@else
										<img src="{{ URL::to('src/images/sameday.png') }}" alt="">
									@endif
									</a>
									<h5>Same Day Gifts</h5>
								</div>
							</div>
							<div class="col-md-6 col-xs-6">
								<div class="back">
									<a href="@if($settings->small_link_2 != "") {{ $settings->small_link_2 }} @else # @endif">
									@if ($settings->small_offer_2)
										<img src="{{ URL::to('uploads/settings/' . $settings->small_offer_2) }}" alt="">
									@else
										<img src="{{ URL::to('src/images/fatherday.png') }}" alt="">
									@endif
									</a>
									<h5>Offer of Day</h5>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-xs-12" id="bg">
								<div class="bac-img">
									<h4>Get Exclusive Discounts In Your Inbox</h4>
									<h5>Never miss a single update or discount offer</h5>
									{!! Form::open(array('route' => 'subscribe')) !!}
									<input class="place form-control" type="email" name="email" placeholder="Enter Your Best Email Address">
									<div class="row" id="below-input">
										<div class="col-md-6 col-xs-6">
											<p class="spam">We hate SPAM like you do!</p>
										</div>
										<div class="col-md-6 col-xs-6" id="butn">
											<button class="btn btn-success" type="submit">Count Me In:)</button>
										</div>
									</div>
									{!! Form::close() !!}
								</div>
								<div class="text-img">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="arrivals">
				<h2>Most Popular</h2>
				<div class="row">
					@foreach ($random as $product)
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="thumbnail item-card">
								<img src="@if($product->image1 != "") {{ URL::to('uploads/products/' . $product->image1) }} @else {{ URL::to('src/images/image.png') }} @endif" alt="">
								<div class="caption item-caption">
									<p class="blue-text">{{ $product->title }}</p>
									<p class="fade-tagline">Delivery: All Country</p>
									<div class="card-price-row row">
										<div style="clear: both;"></div>
										<div class="col-md-6 col-xs-12 price">PKR <span>{{ $product->price }}</span></div>

										@if ($product->regular_price != 0)
											<div class="col-md-6 col-xs-12 sale">ON Sale<span>PKR {{ $product->regular_price }}</span></div>
										@endif

									</div>
									<div class="card-button container-fluid">
										<a href="{{ route('product', $product->id) }}" class="details-btn" role="button">View Details</a> <a href="#" class="like-btn" role="button"><img src="{{ URL::to('src/images/heart.jpg') }}" alt=""></a>
									</div>
								</div>
							</div>
						</div>
					@endforeach

				</div>
			</div>
		</div>

	</section>

	<section>
		<div class="container-fluid" id="testimonials">
			<div class="container">
				<h2 id="testimonial-h">Some Love From Our Customers</h2><br>
				<div class="row ladies-test">
					@foreach($testimonials as $testimonial)
					<div class="col-md-4">
						<div class="testimonial">
							<div class="testimonial-img">
								<img src="{{ URL::to('src/images/lady1.png') }}" alt="">
							</div>
							<div class="name">
								<h4>{{ $testimonial->person }}</h4>
								<img class="rating" src="{{ URL::to('src/images/ratings.png') }}" alt=""> <img class="blue-stars" src="{{ URL::to('src/images/blue-stars.png') }}" alt="">
							</div>
							<div class="test-txt">
								<p>{{ $testimonial->details }}</p>
							</div>
						</div>
					</div>
					@endforeach

				</div>

			</div>
		</div>
	</section>
	<section>
		<div class="container-fluid" id="wrap-up">
			<div class="container">
				<div class="row h-t-order">
					<div class="col-md-2 col-sm-12 col-xs-12" id="lft1">
						<div class="order-txt1">
							<h2>HOW TO ORDER?</h2>
							<p>Follow these steps to Place Order and Surprise your Loved Ones.</p>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4 lft1">
						<div class="order-txt">
							<div class="first-img">
								<img class="lft2" src="{{ URL::to('src/images/1.png') }}" alt="">
							</div>
							<div class="numbers">
								<h4>1</h4>
							</div>
							<div class="icon-img">
								<img src="{{ URL::to('src/images/1icon.png') }}" alt="">
							</div>
							<div class="first-txt">
								<p>Select Products<br>You Love</p>
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4 lft1">
						<div class="order-txt">
							<div class="first-img">
								<img class="lft2" src="{{ URL::to('src/images/1.png') }}" alt="">
							</div>
							<div class="numbers">
								<h4>2</h4>
							</div>
							<div class="icon-img">
								<img src="{{ URL::to('src/images/2.png') }}" alt="">
							</div>
							<div class="first-txt">
								<p>Proceed To<br>Check Out</p>
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4 lft1">
						<div class="order-txt">
							<div class="first-img">
								<img class="lft2" src="{{ URL::to('src/images/1.png') }}" alt="">
							</div>
							<div class="numbers">
								<h4>3</h4>
							</div>
							<div class="icon-img">
								<img src="{{ URL::to('src/images/icon3.png') }}" alt="">
							</div>
							<div class="first-txt">
								<p>Get A<br>Confirmation Call</p>
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4 lft1">
						<div class="order-txt">
							<div class="first-img">
								<img class="lft2" src="{{ URL::to('src/images/1.png') }}" alt="">
							</div>
							<div class="numbers">
								<h4>4</h4>
							</div>
							<div class="icon-img">
								<img src="{{ URL::to('src/images/icon4.png') }}" alt="">
							</div>
							<div class="first-txt">
								<p>Complete<br>Payment</p>
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4 lft1">
						<div class="order-txt">
							<div class="first-img">
								<img class="lft2" src="{{ URL::to('src/images/1.png') }}" alt="">
							</div>
							<div class="numbers">
								<h4>5</h4>
							</div>
							<div class="icon-img">
								<img src="{{ URL::to('src/images/icon5.png') }}" alt="">
							</div>
							<div class="first-txt">
								<p>Get Your<br>Order Delivered</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

@endsection
