@extends('layouts.main')

@section('title')
	Account
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">


				<div class="row">
					@if(Session::has('flash_message'))
						<div class="col-md-12">
							<div class="alert alert-success">
								{{ Session::get('flash_message') }}
							</div>
						</div>
					@endif
					<div class="col-md-6">
						<div class="main">

							<div class="add-category">
								<h3>Update Account</h3>

								<form method="post" action="{{ route('account.submit') }}">
									<div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
										<label>Name <span class="required">*</span> </label> <input class="form-control" type="text" name="name" value="{{ $user->name }}" required/>
										@if ($errors->has('name'))
											<p class="help-block">
												<strong>{{ $errors->first('name') }}</strong>
											</p>
										@endif

									</div>

									<div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
										<label>Email <span class="required">*</span> </label> <input class="form-control" type="email" name="email" value="{{ $user->email }}" required/>
										@if ($errors->has('email'))
											<p class="help-block">
												<strong>{{ $errors->first('email') }}</strong>
											</p>
										@endif

									</div>

									<div class="form-group {{ $errors->has('password') ? ' has-error' : '' }}">
										<label>Password <span class="required">*</span> </label> <input class="form-control" type="password" name="password" value=""/>
										@if ($errors->has('password'))
											<p class="help-block">
												<strong>{{ $errors->first('password') }}</strong>
											</p>
										@endif
										<p class="error">Leave blank to keep exisitng password</p>
									</div>
									<div class="form-group {{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
										<label>Password Confirmation <span class="required">*</span> </label> <input class="form-control" type="password" name="password_confirmation" value=""/>
										@if ($errors->has('password_confirmation'))
											<p class="help-block">
												<strong>{{ $errors->first('password_confirmation') }}</strong>
											</p>
										@endif

									</div>


									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Update Account" name=""/> <input type="hidden" name="id" value="{{ $user->id }}"/>
										{{ csrf_field() }}

									</div>


								</form>


							</div>

							<hr/>


						</div>


					</div>

					<div class="col-md-6">
						<div class="main">

							<div class="add-category">
								<h3>Update Contact Info </h3>

								<form method="post" action="{{ route('update-user.submit') }}">

									<div class="form-group">
										<label>Name : </label> <input class="form-control" name="name" type="text" value="{{ $address->name }}" required>
									</div>
									<div class="form-group">
										<label>Address Line 1 : </label> <input class="form-control" name="address_1" type="text" value="{{ $address->address_1 }}" required>
									</div>
									<div class="form-group">
										<label>Address Line 2 : </label> <input class="form-control" name="address_2" type="text" value="{{ $address->address_2 }}">
									</div>
									<div class="form-group">
										<label>City : </label> <input class="form-control" name="city" type="text" value="{{ $address->city }}" required>
									</div>
									<div class="form-group">
										<label>Zip Code : </label> <input class="form-control" name="zipcode" type="text" value="{{ $address->zipcode }}" required>
									</div>
									<div class="form-group">
										<label>Contact Number : </label> <input class="form-control" name="phone" type="text" value="{{ $address->phone }}" required>
									</div>

									<div class="form-group">
										<input type="submit" class="btn btn-primary" value="Update Contact Info" name=""/> <input type="hidden" name="id" value="{{ $user->id }}"/>
										{{ csrf_field() }}
									</div>
								</form>

							</div>


						</div>


					</div>
				</div>
			</div>
		</div>
	</div>



@endsection

@section('js')

	<script>
		jQuery(document).ready(function () {
			console.log("ready!");


			jQuery(".show-details").click(function () {
				jQuery(this).closest(".products").find(".product-details").toggle(1000);
			});

			jQuery(".add-competitor").click(function (e) {
				e.preventDefault();
				jQuery(".competitor").append('<div class="competitor-url form-group"><label>Competitor URL</label> <input class="form-control" type="url" name="competitor_url[]" placeholder="URL"/></div>');
			});

			jQuery(".add-competitor-category").click(function (e) {
				e.preventDefault();
				jQuery(".competitor-category").append('<div class="competitor-url form-group"><label>Competitor URL</label> <input class="form-control" type="url" name="competitor_url[]" placeholder="URL"/></div>');
			});


		});
	</script>
@endsection