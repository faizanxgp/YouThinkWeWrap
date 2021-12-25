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
					<h2><i class="fa fa-gift"></i> Category Discount </h2>
					<form method="post" action="{{ route('admin.update-discount') }}" enctype="multipart/form-data">
						<div class="form-group">
							<label>Category <span class="required">*</span></label>
							{{ Form::select('category_id',
							$categories,
							null,
							['class' => 'form-control'
						   ]) }}
							@if ($errors->has('category_id'))
								<span class="help-block">
                        			<strong>{{ $errors->first('category_id') }}</strong>
                      			</span>
							@endif
						</div>

						<div class="form-group">
							<label>Discount % (Based on Regular Price) <span class="required">*</span></label>
							<input type="text" class="form-control" name="discount" value="0" />
							@if ($errors->has('discount'))
								<span class="help-block">
                        			<strong>{{ $errors->first('discount') }}</strong>
                      			</span>
							@endif
						</div>

						

						<div class="form-group">
							<div class="">

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