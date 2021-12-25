@extends('layouts.main')

@section('title')
	Basket
@endsection

@section('content')


	<div class="container">
		<div class="basket-wrapper">
			<div class="row form-group">
				<div class="col-md-12">
					<ul class="nav nav-pills nav-justified thumbnail setup-panel">
						<li class="active"><a href="#step-1">
								<h4 class="list-group-item-heading">Step 1</h4>
								<p class="list-group-item-text">Basket</p>
							</a></li>
						<li class="disabled"><a href="#step-2">
								<h4 class="list-group-item-heading">Step 2</h4>
								<p class="list-group-item-text">Package</p>
							</a></li>
						<li class="disabled"><a href="#step-3">
								<h4 class="list-group-item-heading">Step 3</h4>
								<p class="list-group-item-text">Products</p>
							</a></li>
						<li class="disabled"><a href="#step-4">
								<h4 class="list-group-item-heading">Step 4</h4>
								<p class="list-group-item-text">Delivery</p>
							</a></li>
						{{--<li class="disabled"><a href="#step-5">--}}
						{{--<h4 class="list-group-item-heading">Step 5</h4>--}}
						{{--<p class="list-group-item-text">Tags</p>--}}
						{{--</a></li>--}}
						{{--<li class="disabled"><a href="#step-6">--}}
						{{--<h4 class="list-group-item-heading">Step 6</h4>--}}
						{{--<p class="list-group-item-text">Color Theme</p>--}}
						{{--</a></li>--}}
						{{--<li class="disabled"><a href="#step-7">--}}
						{{--<h4 class="list-group-item-heading">Step 7</h4>--}}
						{{--<p class="list-group-item-text">Delivery</p>--}}
						{{--</a></li>--}}
						{{--<li class="disabled"><a href="#step-8">--}}
						{{--<h4 class="list-group-item-heading">Step 8</h4>--}}
						{{--<p class="list-group-item-text">Payment Method</p>--}}
						{{--</a></li>--}}
					</ul>
				</div>
			</div>
		</div>
	</div>

	<form method="post" action="{{ route('cart-finished-basket') }}">
		<div class="container">
			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12 well text-centerx">
						<h1> STEP 1</h1>

						<h2>Select Event </h2>
						<input type="radio" name="event" id="a1" class="input-hidden" value="Birthday"/> <label for="a1">Birthday<br/><img src="{{ URL::to('src/images/baskets/events_birthday.jpg') }}" alt=""/></label>

						<input type="radio" name="event" id="a2" class="input-hidden" value="Annivarsary"/> <label for="a2">Annivarsary<br/><img src="{{ URL::to('src/images/baskets/events_anniversary.jpg') }}" alt=""/></label>

						<input type="radio" name="event" id="a3" class="input-hidden" value="Sorry"/> <label for="a3">Sorry<br/><img src="{{ URL::to('src/images/baskets/events_sorry.jpg') }}" alt=""/></label>

						<input type="radio" name="event" id="a4" class="input-hidden" value="Thank you"/> <label for="a4">Thank you<br/><img src="{{ URL::to('src/images/baskets/events_thankyou.jpg') }}" alt=""/></label>

						<input type="radio" name="event" id="a5" class="input-hidden" value="Special Event" checked/> <label for="a5">Special Event<br/><img src="{{ URL::to('src/images/baskets/events_others.jpg') }}" alt=""/></label>

						<h2>Select Basket Design </h2>
						<input type="radio" name="design" id="b1" class="input-hidden" value="Basket White" checked/> <label for="b1">Basket White<br/><img src="{{ URL::to('src/images/baskets/basket_white.jpg') }}" alt=""/></label>

						<input type="radio" name="design" id="b2" class="input-hidden" value="Basket Golden"/> <label for="b2">Basket Golden<br/><img src="{{ URL::to('src/images/baskets/basket_golden.jpg') }}" alt=""/></label>

						<input type="radio" name="design" id="b3" class="input-hidden" value="Basket Oval"/> <label for="b3">Basket Oval<br/><img src="{{ URL::to('src/images/baskets/basket_oval.jpg') }}" alt=""/></label>

						<h2>Select Tags </h2>
						<div class="row">
							<div class="col-xs-6">
								<input type="radio" name="tag_type" value="text" checked=""> Hand Written <br/> <textarea class="form-control" rows="3" name="tag_handwritten"></textarea><br/>

							</div>
							<div class="col-xs-6">

								<input type="radio" name="tag_type" value="image" name="tag_image"> Picture <br/> <input type="file"/>
							</div>
						</div>

						<h2>Select Color Theme </h2>
						<input type="color" name="color1" value="#ffffff"> Color 1 <input type="color" name="color2" value=""> Color 2 (optional) <br/>

						<div class="text-center action-button">
							<button id="activate-step-2" class="btn btn-primary btn-md">Next: Step 2</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">


			<div class="row setup-content" id="step-2">
				<div class="col-xs-12">
					<div class="col-md-12 well text-centerx">
						<h1> STEP 2 </h1>

						<h2>Select Package </h2>

						@foreach($packages as $package)
							<div class="package-wrapper row">
								<div class="col-md-12">
									<h4>{{ $package->title }}</h4>
								</div>
								<div class="col-md-3">

									<input type="radio" name="package" id="c{{$package->id}}" class="input-hidden" value="{{ $package->id }}"/>
									<label for="c{{$package->id}}"> <br/>
										@if($package->image1 != "")
											<img src="{{ URL::to('/uploads/products/' . $package->image1) }}" alt="">
										@else
											<img src="{{ URL::to('src/images/placeholder.jpg') }}" alt=""/>
										@endif
									</label>
								</div>
								<div class="col-md-9">
									<div class="inline"><br /><br /><strong>(Add Rs. {{ $package->price }})</strong><br /><br />{!! $package->description !!}</div>
								</div>
							</div>
						@endforeach

						{{--<input type="radio" name="package" id="c1" class="input-hidden" value="Regular Package"/> <label for="c1">Regular Package (Add 2000 rupees)<br/> <img src="{{ URL::to('src/images/baskets/package_basic.jpg') }}" alt=""/></label>--}}
						{{--<div class="inline">A beautiful basket wrapped with net, Hand written tags, and Decor using Ribbons etc<br/> <strong>Basket Stuffing:</strong><br/> Kitkat, snickers, mars, twix, bounty, kinder, bueno, pringles, little hearts, swiss--}}
							{{--rolls, tiffany wafers--}}
						{{--</div>--}}

						{{--<input type="radio" name="package" id="c2" class="input-hidden" value="Premium Package"/> <label for="c2">Premium Package ( Add 3000 Rupees)<br/> <img src="{{ URL::to('src/images/baskets/package_premium.jpg') }}" alt=""/></label>--}}
						{{--<div class="inline">Beautiful Basket wrapped using beads work, ribbons, hand written tags and velvet finishes.<br/> <strong>Basket Stuffing:</strong><br/> Hersheys, Toblerone, Rafaello, M&Ms, Dewberry biscuits, Kitkat,--}}
							{{--snickers,<br/> mars, twix, bounty, kinder, bueno, pringles, little hearts, swiss rolls, tiffany wafers--}}
						{{--</div>--}}


						<div class="text-center action-button">
							<button id="activate-step-3" class="btn btn-primary btn-md">Next: Step 3</button>
						</div>


					</div>
				</div>
			</div>

		</div>
		<div class="container">


			<div class="row setup-content" id="step-3">
				<div class="col-xs-12">
					<div class="col-md-12 well modal-category">
						<h1>STEP 3</h1>

						Please select:
						@foreach($categories as $key=>$val)
							<a href="{{ route('category-modal', $key) }}" class="ls-modal category"> {{ $val }} </a>
						@endforeach

						<div class="category-body">

						</div>


						<div class="text-center action-button">
							<button id="activate-step-4" class="btn btn-primary btn-md">Next: Step 4</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="container">


			<div class="row setup-content" id="step-4">
				<div class="col-xs-12">
					<div class="col-md-12 well">
						<h1> STEP 4</h1>

						<h2>Select Delivery Method </h2>
						<input type="radio" name="delivery_method" value="Self"> Self (Available in Lahore Only) <br/>
						<input type="radio" name="delivery_method" value="YTWW" checked=""> By YTWW <br/>

						<div class="row">
							<div class="col-md-6">

								<h3>Sender's Info</h3>
								<div class="form-group">
									<label>Name : <span class="required">*</span></label><input class="form-control" name="s_name" type="text" value="{{ $customer_address['name'] }}" required>
								</div>
								<div class="form-group">
									<label>Address Line 1 : <span class="required">*</span></label><input class="form-control" name="s_address1" type="text" value="{{ $customer_address['address_1'] }}" required>
								</div>

								<div class="form-group">
									<label>City : <span class="required">*</span></label><input class="form-control" name="s_city" type="text" value="{{ $customer_address['city'] }}" required>
								</div>
								<div class="form-group">
									<label>Zip Code : </label><input class="form-control" name="s_zipcode" type="text" value="{{ $customer_address['zipcode'] }}" >
								</div>
								<div class="form-group">
									<label>Contact Number : <span class="required">*</span></label><input class="form-control" name="s_contact" type="text" value="{{ $customer_address['phone'] }}" required>
								</div>

							</div>
							<div class="col-md-6">

								<h3>Receiver's Info</h3>
								<div class="form-group">
									<label>Name : <span class="required">*</span></label><input class="form-control" name="r_name" type="text" required>
								</div>
								<div class="form-group">
									<label>Address Line 1 : <span class="required">*</span></label><input class="form-control" name="r_address1" type="text" required>
								</div>

								<div class="form-group">
									<label>City : <span class="required">*</span></label><input class="form-control" name="r_city" type="text" required>
								</div>
								<div class="form-group">
									<label>Zip Code : </label><input class="form-control" name="r_zipcode" type="text">
								</div>
								<div class="form-group">
									<label>Contact Number (upto 3 numbers) : <span class="required">*</span></label><input class="form-control" name="r_contact" type="text" required>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h2>Payment Method </h2>
								<input type="radio" name="payment_method" id="h1" class="input-hidden" value="Cash on Delivery"/> <label for="h1">Cash On Delivery<br/><img src="{{ URL::to('src/images/baskets/payment_cod.jpg') }}" alt=""/></label>

								<input type="radio" name="payment_method" id="h2" class="input-hidden" value="Bank Transfer" checked/> <label for="h2">Bank Transfer<br/><img src="{{ URL::to('src/images/baskets/payment_bank_transfer.jpg') }}"
											alt=""/></label>

								<input type="radio" name="payment_method" id="h3" class="input-hidden" value="Easy Paisa"/> <label for="h3">Easy Paisa<br/><img src="{{ URL::to('src/images/baskets/payment_easypaisa.jpg') }}" alt=""/></label>

							</div>
						</div>


						@if($delivery_date == "")
						<div class="row">
							<div class="col-md-12">
								<h2>Delivery Date & Instructions</h2>
							</div>
							<div class="col-md-6">
								<label>Delivery Date <span class="required">*</span> </label> <input type="text" id="datepicker" name="delivery_date" maxlength="10" placeholder="2018-12-25" required />
							</div>
							<div class="col-md-6">
								<label>Preferred Time </label> <input type="text" name="preferred_time" maxlength="10" placeholder="10 PM"/>
							</div>
							<div class="col-md-12">
								<hr/>
								<label>Special Instructions:</label> <textarea name="instructions" class="form-control mb10" placeholder="Instructions about packing, handling or delivery (if any)"></textarea>
							</div>
						</div>
						@endif

						{{--<div class="text-center action-button">--}}
						{{--<button id="activate-step-5" class="btn btn-primary btn-md">Next: Step 5</button>--}}
						{{--</div>--}}
						<div class="text-center">
							<input type="submit" value="Complete Order" class="btn btn-primary btn-large">
							{{--<button id="activate-step-9" class="btn btn-primary btn-md">Proceed to Confirmation</button>--}}
							{{ csrf_field() }}
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">BringFare</h4>
				</div>
				<div class="modal-body">
					<p>Loading...</p>
				</div>
				<div class="modal-footer">

				</div>
			</div>
		</div>
	</div>

@endsection


@section('js')
	<script>

		// Activate Next Step

		$(document).ready(function () {

			var navListItems = $('ul.setup-panel li a'),
					allWells = $('.setup-content');

			allWells.hide();

			navListItems.click(function (e) {
				e.preventDefault();
				var $target = $($(this).attr('href')),
						$item = $(this).closest('li');

				if (!$item.hasClass('disabled')) {
					navListItems.closest('li').removeClass('active');
					$item.addClass('active');
					allWells.hide();
					$target.show();
				}
			});

			$('ul.setup-panel li.active a').trigger('click');

			// DEMO ONLY //
			$('#activate-step-2').on('click', function (e) {
				$('ul.setup-panel li:eq(1)').removeClass('disabled');
				$('ul.setup-panel li a[href="#step-2"]').trigger('click');
				$(this).remove();
			});

			$('#activate-step-3').on('click', function (e) {
				$('ul.setup-panel li:eq(2)').removeClass('disabled');
				$('ul.setup-panel li a[href="#step-3"]').trigger('click');
				$(this).remove();
			});

			$('#activate-step-4').on('click', function (e) {
				$('ul.setup-panel li:eq(3)').removeClass('disabled');
				$('ul.setup-panel li a[href="#step-4"]').trigger('click');
				$(this).remove();
			});

//			$('#activate-step-5').on('click', function (e) {
//				$('ul.setup-panel li:eq(4)').removeClass('disabled');
//				$('ul.setup-panel li a[href="#step-5"]').trigger('click');
//				$(this).remove();
//			})
//
//			$('#activate-step-6').on('click', function (e) {
//				$('ul.setup-panel li:eq(5)').removeClass('disabled');
//				$('ul.setup-panel li a[href="#step-6"]').trigger('click');
//				$(this).remove();
//			})
//
//			$('#activate-step-7').on('click', function (e) {
//				$('ul.setup-panel li:eq(6)').removeClass('disabled');
//				$('ul.setup-panel li a[href="#step-7"]').trigger('click');
//				$(this).remove();
//			})
//
//			$('#activate-step-8').on('click', function (e) {
//				$('ul.setup-panel li:eq(7)').removeClass('disabled');
//				$('ul.setup-panel li a[href="#step-8"]').trigger('click');
//				$(this).remove();
//			})

			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd"
			});

		});


		// Add , Dlelete row dynamically

		$(document).ready(function () {
//			jQuery('.ls-modal').on('click', function (e) {
//				e.preventDefault();
//				jQuery('#myModal').modal('show').find('.modal-body').load(jQuery(this).attr('href'));
//			});

			jQuery('.ls-modal').on('click', function (e) {
				e.preventDefault();
				jQuery('.category-body').load(jQuery(this).attr('href'));
			});
		});

	</script>
@endsection
