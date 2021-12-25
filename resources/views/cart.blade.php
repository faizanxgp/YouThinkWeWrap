@extends('layouts.main')

@section('title')
	Cart
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Cart</h1>
				@if(Session::has('flash_message'))
					<div class="alert alert-success">
						{{ Session::get('flash_message') }}
					</div>
				@endif
				<form method="post" action="{{ route('update-cart') }}">
					<table class="table">
						<tr>
							<th></th>
							<th>Title</th>
							<th>Qty</th>
							<th>Price</th>
							<th>Amount</th>
							<th>Action</th>
						</tr>
						<?php $total = 0; ?>

						@foreach($cart as $k=>$v)
							<tr>
								<td><img src="@if($v['image'] != "") {{ URL::to('uploads/products/' . $v['image']) }} @else {{ URL::to('src/images/image.png') }} @endif" alt="" class="thumb"></td>
								<td>{{ $v['title'] }}</td>
								<td><input type="number" name="qty[{{$k}}]" class="qty" min="0" value="{{ $v['qty'] }}"/></td>
								<td>{{ $v['price'] }}</td>
								<td class="align-right">{{ $v['amount'] }}</td>
								<?php $total += $v['amount']; ?>
								<td>
									<a class="btn btn-danger" href="{{ route('remove-cart', $k) }}"> Remove </a> <input type="hidden" name="id[{{$k}}]" value="{{ $k }}"/>
								</td>
							</tr>
						@endforeach
						<tr>
							<td colspan="4" class="text-right">
								Deliver in:
								{{--<select name="location" id="location" >--}}
								{{--<option value="Lahore">Lahore</option>--}}
								{{--<option value="In Pakistan">Anywhere in Pakistan</option>--}}
								{{--</select>--}}

								{{ Form::select('location',
									$delivery,
									$location,
									['class' => 'input-control', 'id' => 'location'
								   ]) }}


							</td>
							<?php if ($location == 'Lahore') $dcharges = 200; else $dcharges = 400; ?>
							<td class="align-right"><strong><span id="deliveryChargesTxt">{{ $dcharges }}</span></strong> <input type="hidden" name="delivery_charges" id="deliveryCharges" value="{{ $dcharges }}"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="4" class="text-right">
								Discount:
							</td>
							<?php $perc = $coupon['percent']; $discount = $total * ($perc / 100); ?>
							<td class="align-right">
								<strong><span id="dicountChargesTxt">{{ $discount }}</span></strong>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2" class="text-right">
								{{ csrf_field() }}
								<input type="submit" class="btn btn-primary" value="Update Cart"/>
							</td>
							<td></td>
							<td class="align-right">Total Amount:</td>
							<td class="align-right"><span id="totalAmount"><strong>{{ $total + $dcharges - $discount }}</strong></span></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-push-6">
				<form method="post" action="{{ route('apply-coupon') }}">
					<table class="table">
						<tr>
							<td colspan="2"><h3>Coupon Code:</h3></td>
						</tr>
						<tr>
							<td><input type="text" name="coupon" class="form-control" value="{{ $coupon['title'] }}" /></td>
							<td>
								<input type="submit" class="btn btn-danger" value="Apply"/>
								{{ csrf_field() }}
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="row">
			<form method="post" action="{{ route('checkout') }}">
				<div class="col-md-8 col-md-push-2">
					<hr/>
					<div class="row">
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

					<div class="row">
						<div class="col-md-6">
							<div class="checkout text-right">
								<input type="submit" name="btnBasket" class="btn btn-primary" style="background-color: #4cae4c" value="Create Basket & Checkout"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="checkout text-right">
								<input type="hidden" name="discount" id="discount" value="{{ $discount }}"/>
								<input type="submit" name="btnCheckout" class="btn btn-primary" value="Checkout"/>
								{{ csrf_field() }}
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
@endsection

@section('js')
	<script>
		jQuery(document).ready(function () {
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd"
			});

			$("#location").on("change", function () {
				val = $(this).val();

				if (val == 'Lahore') {
					$("#deliveryCharges").val(200);
					$("#deliveryChargesTxt").html(200);
				} else {
					$("#deliveryCharges").val(400);
					$("#deliveryChargesTxt").html(400);
				}
			});

		});
	</script>
@endsection