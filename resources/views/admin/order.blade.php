@extends('layouts.app')

@section('title')
	Admin Dashboard
@endsection

@section('pageHeading')
	User Dashboard
@endsection

@section('content')
	<section id="page" class="header-margin">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					@if(Session::has('flash_message'))
						<div class="alert alert-success">
							{{ Session::get('flash_message') }}
						</div>
					@endif
					<h2><i class="fa fa-gift"></i> Order </h2>

					<div class="row">
						<div class="col-md-6">
							<h2>Order Details</h2>
							<table class="table">
								<tr>
									<td>Order Date</td>
									<td>{{ $order->order_date }}</td>
								</tr>
								<tr>
									<td>Delivery Date</td>
									<td>{{ $order->delivery_date }}</td>
								</tr>
								<tr>
									<td>Delivery Time</td>
									<td>{{ $order->preferred_time }}</td>
								</tr>
								<tr>
									<td>Instructions</td>
									<td>{{ $order->instruction }}</td>
								</tr>
								<tr>
									<td>Coupon</td>
									<td>{{ $order->coupon }}</td>
								</tr>
								<tr>
									<td>Location (for Charges)</td>
									<td><strong>{{ $order->location }}</strong></td>
								</tr>
								<tr>
									<td>Delivery Charges</td>
									<td><strong>{{ $order->delivery_charges }}</strong></td>
								</tr>


								<tr>
									<td>Discount Amount</td>
									<td><strong>{{ $order->discount }}</strong></td>
								</tr>
								<tr>
									<td>Order Amount</td>
									<td><h4><strong>{{ $order->order_amount }}</strong></h4></td>
								</tr>
								<tr>
									<td>Delivery Method</td>
									<td>{{ $order->delivery_method }}</td>
								</tr>
								<tr>
									<td>Payment Method</td>
									<td>{{ $order->payment_method }}</td>
								</tr>
							</table>
						</div>
						<div class="col-md-6">
							<h2>Basket </h2>
							<table class="table">
								<tr>
									<td>Event</td>
									<td>{{ $order->event }}</td>
								</tr>
								<tr>
									<td>Basket Design</td>
									<td>{{ $order->basket_design }}</td>
								</tr>
								<tr>
									<td>Package</td>
									<td>{{ $order->package }}</td>
								</tr>
								<tr>
									<td>Tags</td>
									<td>{{ $order->tags_handwritten }} {{ $order->tags_image }}</td>
								</tr>
								<tr>
									<td>Colors</td>
									<td>
										{{ $order->color1 }} <div style="width: 50px; height: 50px; border: 2px dashed #000; background-color: {{ $order->color1 }}"></div>
										{{ $order->color2 }} <div style="width: 50px; height: 50px; border: 2px dashed #000; background-color: {{ $order->color2 }}"></div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h2>Products</h2>
							<table class="table">
								<tr>
									<th>Product</th>
									<th>Qty</th>
									<th>Rate</th>
									<th>Amount</th>
									<th>Basket</th>
								</tr>
								@foreach($order_details as $detail)
									<tr>
										<td>{{ $detail->product->title }}</td>
										<td>{{ $detail->qty }}</td>
										<td>{{ $detail->rate }}</td>
										<td>{{ $detail->amount }}</td>
										<td>{{ $detail->in_basket }}</td>
									</tr>

								@endforeach
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h2>Customer Details</h2>
							<table class="table">
								<tr>
									<td>Name</td>
									<td>{{ $cust->name }}</td>
								</tr>
								<tr>
									<td>Address</td>
									<td>{{ $cust->address_1 }}</td>
								</tr>
								{{--<tr>--}}
									{{--<td></td>--}}
									{{--<td>{{ $cust->address_2 }}</td>--}}
								{{--</tr>--}}
								<tr>
									<td>City</td>
									<td>{{ $cust->city }}</td>
								</tr>
								<tr>
									<td>Zip</td>
									<td><strong>{{ $cust->zipcode }}</strong></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>{{ $cust->phone }}</td>
								</tr>

							</table>
						</div>
						<div class="col-md-6">
							<h2>Receiver Details</h2>
							<table class="table">
								<tr>
									<td>Name</td>
									<td>{{ $recv->name }}</td>
								</tr>
								<tr>
									<td>Address</td>
									<td>{{ $recv->address_1 }}</td>
								</tr>
								{{--<tr>--}}
									{{--<td></td>--}}
									{{--<td>{{ $recv->address_2 }}</td>--}}
								{{--</tr>--}}
								<tr>
									<td>City</td>
									<td>{{ $recv->city }}</td>
								</tr>
								<tr>
									<td>Zip</td>
									<td><strong>{{ $recv->zipcode }}</strong></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td>{{ $recv->phone }}</td>
								</tr>
							</table>

						</div>
					</div>

					<div class="col-md-6">
						<form method="post" action="{{ route('admin.update-order') }}" enctype="multipart/form-data">
							<div class="form-group {{ $errors->has('order_status') ? ' has-error' : '' }}">
								<h2>Update Order</h2>
								<div class="">
									<label>Order Status <span class="required">*</span></label>
									{{--<input name="order_status" class="form-control" type="text" placeholder="Enter product name in full" value="{{ $order->order_status or old('order_status') }}"/>--}}

									{{ Form::select('order_status',
									$status,
									$order->order_status,
									['class' => 'form-control'
								   ]) }}

									@if ($errors->has('order_status'))
										<span class="help-block">
											<strong>{{ $errors->first('order_status') }}</strong>
										</span>
									@endif
								</div>
							</div>

							<div class="form-group {{ $errors->has('order_notes') ? ' has-error' : '' }}">
								<div class="">
									<label>Received Amount <span class="required">*</span></label>
									<input name="received" class="form-control" placeholder="" value="{{ $order->received }}" >
								</div>
							</div>

							<div class="form-group {{ $errors->has('order_notes') ? ' has-error' : '' }}">
								<div class="">
									<label>Order Notes (for Staff) <span class="required">*</span></label> <textarea name="order_notes" class="form-control" placeholder="Enter product name in full">{{ $order->order_notes or old('order_notes') }}</textarea>
									@if ($errors->has('order_notes'))
										<span class="help-block">
								<strong>{{ $errors->first('order_notes') }}</strong>                            </spa>
									@endif
								</div>
							</div>


							<div class="form-group">
								<div class="">
									<input type="hidden" name="id" value="{{ $order->id }}"/> <input class="btn btn-primary" type="submit" value="submit"/>
									{{ csrf_field() }}
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

@endsection