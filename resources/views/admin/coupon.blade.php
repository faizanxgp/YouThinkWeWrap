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
				<div class="col-md-6 col-md-push-3">
					@if(Session::has('flash_message'))
						<div class="alert alert-success">
							{{ Session::get('flash_message') }}
						</div>
					@endif
					<h2><i class="fa fa-gift"></i> Coupon </h2>
					<form method="post" action="{{ route('admin.update-coupon') }}" enctype="multipart/form-data">
						
						<div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
							<div class="">
								<label>Coupon Name <span class="required">*</span></label> <input name="title" class="form-control" type="text" placeholder="Enter coupon name in full" value="{{ $coupon->title or old('title') }}"/>
								@if ($errors->has('title'))
									<span class="help-block">
                            			<strong>{{ $errors->first('title') }}</strong>
                          			</span>
								@endif
							</div>
						</div>
						

						<div class="form-group {{ $errors->has('percent') ? ' has-error' : '' }}">
							<div class="">
								<label>Discount percent <span class="required">*</span></label> <input name="percent" class="form-control" type="text" placeholder="Enter coupon %" value="{{ $coupon->percent or old('percent') }}"/>
								@if ($errors->has('percent'))
									<span class="help-block">
                            			<strong>{{ $errors->first('percent') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('valid_till') ? ' has-error' : '' }}">
							<div class="">
								<label>Valid till <span class="required">*</span></label> <input name="valid_till" class="form-control" type="text" placeholder="Enter date in yyyy-mm-dd" value="{{ $coupon->valid_till or old('valid_till') }}"/>
								@if ($errors->has('valid_till'))
									<span class="help-block">
                            			<strong>{{ $errors->first('valid_till') }}</strong>
										</span>
								@endif
							</div>
						</div>

						

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $coupon->id }}"/>
								<input class="btn btn-primary" type="submit" value="Submit"/>
								{{ csrf_field() }}
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

@endsection