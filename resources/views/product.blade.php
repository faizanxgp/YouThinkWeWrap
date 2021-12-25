@extends('layouts.main')

@section('title')
	{{ $product->title }}
@endsection

@section('content')
	<section class="container-fluid inn-wrap">
		<div class="container">
			<div class="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Gifts</a></li>
					<li class="breadcrumb-item"><a href="#">Products</a></li>
					<li class="breadcrumb-item active">Cart</li>
				</ol>
			</div>
		</div>
		<div class="container inn-bg">
			<div class="columns">
				@if(Session::has('flash_message'))
					<div class="alert alert-success">
						{!! Session::get('flash_message') !!}
					</div>
				@endif
				<div class="row">
					<div class="col-md-4">
						<div class="gallery-container clearfix">
							<div class="gallery">

								<div class="full">
									<!-- first image is viewable to start -->
									@if($product->image1 != "")
										<img src="{{ URL::to('/uploads/products/' . $product->image1) }}" alt="">
									@else
										<img src="{{ URL::to('src/images/placeholder.jpg') }}" alt=""/>
									@endif
								</div>

								<div class="previews">
									@if($product->image1 != "")
										<a href="#" class="selected" data-full="{{ URL::to('/uploads/products/' . $product->image1) }}"><img class="thumb" src="{{ URL::to('/uploads/products/' . $product->image1) }}" alt=""/></a>
									@endif
									@if($product->image2 != "")
										<a href="#" data-full="{{ URL::to('/uploads/products/' . $product->image2) }}"><img class="thumb" src="{{ URL::to('/uploads/products/' . $product->image2) }}" alt=""/></a>
									@endif
									@if($product->image3 != "")
										<a href="#" data-full="{{ URL::to('/uploads/products/' . $product->image3) }}"><img class="thumb" src="{{ URL::to('/uploads/products/' . $product->image3) }}" alt=""/></a>
									@endif
									@if($product->image4 != "")
										<a href="#" data-full="{{ URL::to('/uploads/products/' . $product->image4) }}"><img class="thumb" src="{{ URL::to('/uploads/products/' . $product->image4) }}" alt=""/></a>
									@endif
									@if($product->image5 != "")
										<a href="#" data-full="{{ URL::to('/uploads/products/' . $product->image5) }}"><img class="thumb" src="{{ URL::to('/uploads/products/' . $product->image5) }}" alt=""/></a>
									@endif
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-8">
						<div class="cart-detail">
							<h1>{{ $product->title }}</h1>
							<p id="product_reference">
								<label>Reference </label> <span class="editable" content="demo_6">{{ $product->slug }}</span>
							</p>

							<p>{{ $product->description }}</p>
							<p id="pQuantityAvailable">
								<span id="quantityAvailable"></span> <span style="display: none;" id="quantityAvailableTxt">Item</span> <span id="quantityAvailableTxtMultiple">Items</span>
							</p>
							<p id="availability_statut">
								<span id="availability_value" class="label label-success">@if($product->available==1) In stock @else Out of stock @endif</span>
							</p>
							<div class="cart-price">
								<p class="our_price_display offers">
									{{--<link class="availability">--}}
									<span id="our_price_display" class="price">PKR @if($product->available == 1){{ $product->price }}@endif</span>

								</p>
							</div>
						</div>
						<div class="border">
							<div class="row">
								<div class="col-md-12">

									<form method="post" action="{{ route('add-cart') }}">
										<table class="data">
											<tr>
												<td>Qty</td>
												<td>
													<input type="number" class="qty" name="qty" value="1" min="1"/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<input type="submit" name="cartbtn" class="btn btn-primary" value="Add to Cart"/>
												</td>
											</tr>
										</table>
										<input type="hidden" name="id" value="{{ $product->id }}"/>
										{{ csrf_field() }}
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="description">
					<p>You Think We Wrap is a Gift Portal Service offering a variety of Unique Gifts at Doorstep to Surprise your loved ones anywhere in Lahore. We offer deliveries from 12 pm to midnight. Our Products have a wide range of variety starting from Customized Gift Baskets, Chocolate bouquets, Cakes, Flowers, Hand Made Cards, Customized Frames, Customized Cushions and Much more. </p>
				</div>
				<div class="related-products">
					<div class="row">
						<div class="col-md-6">
							<div class="rel-product">
								<strong>RELATED PRODUCTS</strong>
							</div>
						</div>
						<div class="col-md-offset-4 col-md-2">
							<div class="rel-icon">
								<!-- Controls -->
								<div class="left-area">
									<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
								</div>
								<div class="right-area">
									<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="slider">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">

							<div class="item active">

								@foreach ($random as $product)
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="thumbnail item-card">
											<img src="@if($product->image1 != "") {{ URL::to('uploads/products/' . $product->image1) }} @else {{ URL::to('src/images/image.png') }} @endif" alt="">
											<div class="caption item-caption">
												<p class="blue-text">{{ $product->title }}</p>
												<p class="fade-tagline">Delivery: {{ $product->delivery }}</p>
												<div class="card-price-row row">
													<div style="clear: both;"></div>
													<div class="col-md-6 col-xs-12 price"><span>PKR @if($product->available == 1){{ $product->price }}@endif</span></div>

													@if ($product->regular_price != 0)
														<div class="col-md-6 col-xs-12 sale">ON Sale <span>PKR {{ $product->regular_price }}</span></div>
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
				</div>
			</div>

		</div>
	</section>

@endsection