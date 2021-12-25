@extends('layouts.main')

@section('title')
	{{ $category->title }}
@endsection

@section('content')
	<section class="container-fluid inn-wrap">
		<div class="container">
			<div class="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Gifts</a></li>
					<li class="breadcrumb-item active">Products</li>
				</ol>
			</div>
			<div class="columns">
				<div class="row">
					<div class="col-md-3">
						<div class="aniversary-gift">
							<a href="@if($settings->category_link != "") {{ $settings->category_link }} @else # @endif">
								@if ($settings->category_offer)
									<img class="happy-bd" src="{{ URL::to('uploads/settings/' . $settings->category_offer) }}" alt="">
								@else
									<img src="{{ URL::to('src/images/banner-sidebar.jpg') }}" alt="">
								@endif
							</a>
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
						<div class="img-content">
							<div class="image">
								@if ($category->image)
									<img class="img-responsive" src="{{ URL::to('uploads/categories/' . $category->image) }}" alt="{{ $category->title }}">
								@else
									<img class="img-responsive" src="{{ URL::to('src/images/summer-dresses.jpg') }}" alt="{{ $category->title }}">
								@endif
							</div>
							<div class="cat_desc">
								<div class="rte">{{ $category->description }}</div>
							</div>
						</div>
						<h1 class="page-heading product-listing">
							<span class="cat-name"> {{ $category->title }}&nbsp;</span>
							<small class="heading-counter">There are {{ $products->total() }} products.</small>
						</h1>
						<div class="content-bar1">
							<div class="row">
								<div class="col-md-4">
									<span style="padding: 10px;">Showing maximum 12 items per page</span>
									{{--<div class="select">--}}
										{{--<div class="row mid-one">--}}
											{{--<div class="col-md-4">--}}
												{{--<label for="selectProductSort">Sort by</label>--}}
											{{--</div>--}}
											{{--<div class="col-md-8">--}}
												{{--<select id="selectProductSort" class="selectProductSort form-control">--}}
													{{--<option value="position:asc" selected="selected">--</option>--}}
													{{--<option value="price:asc">Price: Lowest first</option>--}}
													{{--<option value="price:desc">Price: Highest first</option>--}}
													{{--<option value="name:asc">Product Name: A to Z</option>--}}
													{{--<option value="name:desc">Product Name: Z to A</option>--}}
													{{--<option value="quantity:desc">In stock</option>--}}
													{{--<option value="reference:asc">Reference: Lowest first</option>--}}
													{{--<option value="reference:desc">Reference: Highest first</option>--}}
												{{--</select>--}}
											{{--</div>--}}
										{{--</div>--}}
									{{--</div>--}}
								</div>
								{{--<div class="col-md-offset-2 col-md-4">--}}
									{{--<div class="clearfix selector1">--}}
										{{--<div class="row mid-one">--}}
											{{--<div class="col-md-2 col-md-offset-4 no-pad">--}}
												{{--<label for="nb_item"> Showing maximum 12 items per page </label>--}}
											{{--</div>--}}
											{{--<div class="col-md-3 no-pad">--}}
												{{--<input type="hidden" name="id_category" value="11"> <select name="n" id="nb_item" class="form-control">--}}
													{{--<option value="12" selected="selected">12</option>--}}
													{{--<option value="24">24</option>--}}
												{{--</select>--}}
											{{--</div>--}}
											{{--<div class="col-md-3 p-page no-pad">--}}
												{{--<span>per page</span>--}}
											{{--</div>--}}
										{{--</div>--}}
									{{--</div>--}}
								{{--</div>--}}
								{{--<div class="col-md-2">--}}
									{{--<button type="submit" class="sub_btn">--}}
										{{--<span>Compare</span>--}}
									{{--</button>--}}
								{{--</div>--}}
							</div>
						</div>
						<!-- Bar finishes -->
						<div class="arrivals">
							<div class="row">
								<?php $ctr = 0; ?>
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

							</div>
							<div class="content-bar">
								<div class="row">
									<div class="col-md-6">
										<div class="page-no">

											{{ $products->links() }}
											{{--<ul class="pagination pull-left">--}}
											{{--<li id="pagination_previous_bottom" class="disabled pagination_previous"><span> <i class="fa fa-chevron-left"></i></span></li>--}}
											{{--<li class="active current">--}}
											{{--<span>--}}
											{{--<span>1</span>--}}
											{{--</span>--}}
											{{--</li>--}}
											{{--<li>--}}
											{{--<a rel="nofollow" href="#"> <span>2</span> </a></li>--}}
											{{--<li id="pagination_next_bottom" class="pagination_next">--}}
											{{--<a rel="nofollow" href="#"> <i class="fa fa-chevron-right"></i> </a></li>--}}
											{{--</ul>--}}
										</div>
									</div>
									<div class="col-md-6">
										<div class="product-count pull-right"> Showing {{ $products->firstItem() }} - {{ $products->lastItem() }} of {{ $products->total() }} items</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

@endsection