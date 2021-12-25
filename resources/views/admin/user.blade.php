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
					<h2><i class="fa fa-gift"></i> User </h2>
					<form method="post" action="{{ route('admin.update-user') }}" enctype="multipart/form-data">

						<div class="form-group {{ $errors->has('person') ? ' has-error' : '' }}">
							<div class="">
								<label>Name <span class="required">*</span></label> <input name="name" class="form-control" type="text" placeholder="Enter user name in full" value="{{ $usr->name or old('name') }}"/>
								@if ($errors->has('name'))
									<span class="help-block">
                            			<strong>{{ $errors->first('name') }}</strong>
                          			</span>
								@endif
							</div>
						</div>


						<div class="form-group {{ $errors->has('email') ? ' has-error' : '' }}">
							<div class="">
								<label>User Email <span class="required">*</span></label>
								<input type="email" name="email" class="form-control" placeholder="Enter user name in full" value="{{ $usr->email or old('email') }}" />
								@if ($errors->has('email'))
									<span class="help-block">
                            			<strong>{{ $errors->first('email') }}</strong>
                          			</span>
								@endif
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label">Status</label>

							<div class="col-sm-12x">
								{{ Form::checkbox('status', '1', $usr->status) }}
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Verified</label>

							<div class="col-sm-12x">
								{{ Form::checkbox('verified', '1', $usr->verified) }}
							</div>
						</div>





						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $usr->id }}"/>
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