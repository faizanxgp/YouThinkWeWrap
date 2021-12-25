@extends('layouts.app')

@section('person')
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
					<h2><i class="fa fa-gift"></i> Testimonial </h2>
					<form method="post" action="{{ route('admin.update-testimonial') }}" enctype="multipart/form-data">
						
						<div class="form-group {{ $errors->has('person') ? ' has-error' : '' }}">
							<div class="">
								<label>Person <span class="required">*</span></label> <input name="person" class="form-control" type="text" placeholder="Enter testimonial name in full" value="{{ $testimonial->person or old('person') }}"/>
								@if ($errors->has('person'))
									<span class="help-block">
                            			<strong>{{ $errors->first('person') }}</strong>
                          			</span>
								@endif
							</div>
						</div>
						

						<div class="form-group {{ $errors->has('details') ? ' has-error' : '' }}">
							<div class="">
								<label>Testimonial Details <span class="required">*</span></label>
								<textarea name="details" class="form-control" placeholder="Enter testimonial name in full">{{ $testimonial->details or old('details') }}</textarea>
								@if ($errors->has('details'))
									<span class="help-block">
                            			<strong>{{ $errors->first('details') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>

						

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $testimonial->id }}"/>
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