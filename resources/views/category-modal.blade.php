@extends('layouts.modal')

@section('content')
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>{{ $category->title }}</h1>
				<div class="arrivals">
					<div class="row">
						<?php $ctr = 0; ?>
						@foreach($products as $product)
							<?php if ($ctr % 2 == 0) { ?>
							<div class="col-md-12"></div>
							<?php } $ctr++; ?>
							<div class="col-md-6 col-sm-6 col-xs-12">
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
											<button id="row-{{ $product->id }}" class="details-btn add-cart" data-link="{{ $product->id }}">Add to Basket</button>
											<a href="#" class="like-btn" role="button"><img src="{{ URL::to('src/images/heart.jpg') }}" alt=""></a>
										</div>
									</div>
								</div>
							</div>
						@endforeach

					</div>

				</div>

				{{--@foreach($products as $product)--}}

				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="{{ route('product', $product->id) }}">{{ $product->title }}</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}

				{{--<form method="post" action="{{ route('add-cart') }}">--}}
				{{--<input type="hidden" name="qty" value="1" /></td>--}}
				{{--<input type="submit" class="btn btn-primary" value="Add to Cart">--}}
				{{--<input type="hidden" name="id" value="{{ $product->id }}" />--}}
				{{--{{ csrf_field() }}--}}
				{{--</form> --}}
				{{--</div>--}}
				{{--</div>--}}
				{{--@endforeach--}}


				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}

				{{--</div>--}}
				{{--<div class="product-box">--}}
				{{--<div class="image">--}}
				{{--<img src="{{ URL::to('src/images/flower-1.jpg') }}" alt="" />--}}
				{{--</div>--}}
				{{--<div class="title center">--}}
				{{--<h3><a href="#">Product Title</a></h3>--}}
				{{--<p><img src="{{ URL::to('src/images/stars.png') }}" alt="" style="max-height: 30px;" /> 1 review </p>--}}
				{{----}}
				{{--</div>--}}
				{{--</div>--}}
			</div>
		</div>
	</div>

	<script type="text/javascript">
		jQuery().ready(function () {

			var path = '<?php echo getenv('APP_URL'); ?>';

			jQuery('.add-cart').on('click', function (evt) {
				evt.preventDefault();
				var itemid = $(this).attr("data-link");

				$.ajax({
					method: 'get',
					url: path + '/addcart',
					data: {
						id: itemid
					}
				}).done(function (data) {
					$('#row-' + itemid).html('Added');

				});
			});
		});
	</script>
@endsection