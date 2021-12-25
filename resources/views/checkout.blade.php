@extends('layouts.main')

@section('title')
	Checkout
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form method="post" action="{{ route('cart-finished') }}">
					<div class="row">
						<div class="col-md-12">
							<h2>Select Delivery Method </h2>
							<input type="radio" name="delivery_method" value="Self"> Self (Available in Lahore Only) <br/>
							<input type="radio" name="delivery_method" value="YTWW" checked> By YTWW <br/>
						</div>
					</div>

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
								<label>Zip Code : </label><input class="form-control" name="s_zipcode" type="text" value="{{ $customer_address['zipcode'] }}">
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

					<div class="col-md-12">
						<h2>Payment Method </h2>
						<input type="radio" name="payment_method" id="h1" class="input-hidden" value="Cash on Delivery" /> <label for="h1">Cash On Delivery<br/><img src="{{ URL::to('src/images/baskets/payment_cod.jpg') }}" alt=""/></label>

						<input type="radio" name="payment_method" id="h2" class="input-hidden" value="Bank Transfer" checked /> <label for="h2">Bank Transfer<br/><img src="{{ URL::to('src/images/baskets/payment_bank_transfer.jpg') }}" alt=""/></label>

						<input type="radio" name="payment_method" id="h3" class="input-hidden" value="Easy Paisa"/> <label for="h3">Easy Paisa<br/><img src="{{ URL::to('src/images/baskets/payment_easypaisa.jpg') }}" alt=""/></label>

					</div>
					<div class="row">
						<div class="col-md-4 col-md-push-8 text-right">
							<input type="submit" class="btn btn-primary" name="submit" value="Proceed"/>
							{{ csrf_field() }}
						</div>
					</div>
				</form>
			</div>


		</div>

	</div>
@endsection
