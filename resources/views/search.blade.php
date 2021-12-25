@extends('layouts.main')

@section('title')
	Search
@endsection

@section('content')
	<section class="container-fluid inn-wrap">
		<div class="container">
			<div class="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Search</li>
				</ol>
			</div>
			<div class="columns">
				<div class="row">
					<div class="col-md-3">
						<div class="aniversary-gift">
							<img src="{{ URL::to('src/images/banner-sidebar.jpg') }}" alt="">
						</div>
						<div class="category-one">
							<div class="top-cat">
								<h4>CATEGORIES</h4>
							</div>
							<div class="cat-list">
								<ul>
									@foreach($categories as $cat)
										<li><a href="{{ route('category', $cat->id) }}">{{ $cat->title }}</a></li>
									@endforeach

								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-9">

						{{--<h1 class="page-heading product-listing">--}}
							{{--<span class="cat-name"> Search Results </span>--}}
							{{--<small class="heading-counter">There are {{ $products->total() }} products.</small>--}}
						{{--</h1>--}}

						<!-- Bar finishes -->
						<div class="arrivals">
							<div class="row">
								<?php $ctr = 0; ?>
								@if (count($products) > 0)
								@foreach($products as $product)
									<?php if ($ctr % 3 == 0) { ?>
									<div class="col-md-12"></div>
									<?php } $ctr++; ?>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="thumbnail item-card">
											<a href="{{ route('product', $product->id) }}">
												@if($product->image1 != "")
													<img src="{{ URL::to('/uploads/products/' . $product->image1) }}" alt="">
												@else
													<img src="{{ URL::to('src/images/placeholder.jpg') }}" alt=""/>
												@endif
											</a>
											<div class="caption item-caption">
												<p class="blue-text"><a href="{{ route('product', $product->id) }}">{{ $product->title }}</a></p>
												<p class="fade-tagline">Delivery: {{ $product->delivery }}</p>
												<div class="card-price-row row">
													<div style="clear: both;"></div>
													<div class="col-md-6 price">PKR <span>@if($product->available == 1){{ $product->price }}@endif</span></div>

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

									@else
								<h2>There are no products matching your serach.</h2>

								@endif

							</div>
							{{--<div class="content-bar">
								<div class="row">
									<div class="col-md-6">
										<div class="page-no">

											{{ $products->links() }}
											--}}{{--<ul class="pagination pull-left">--}}{{--
											--}}{{--<li id="pagination_previous_bottom" class="disabled pagination_previous"><span> <i class="fa fa-chevron-left"></i></span></li>--}}{{--
											--}}{{--<li class="active current">--}}{{--
											--}}{{--<span>--}}{{--
											--}}{{--<span>1</span>--}}{{--
											--}}{{--</span>--}}{{--
											--}}{{--</li>--}}{{--
											--}}{{--<li>--}}{{--
											--}}{{--<a rel="nofollow" href="#"> <span>2</span> </a></li>--}}{{--
											--}}{{--<li id="pagination_next_bottom" class="pagination_next">--}}{{--
											--}}{{--<a rel="nofollow" href="#"> <i class="fa fa-chevron-right"></i> </a></li>--}}{{--
											--}}{{--</ul>--}}{{--
										</div>
									</div>
									<div class="col-md-6">
										<div class="product-count pull-right"> Showing {{ $products->firstItem() }} - {{ $products->lastItem() }} of {{ $products->total() }} items</div>
									</div>
								</div>
							</div>--}}
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

@endsection