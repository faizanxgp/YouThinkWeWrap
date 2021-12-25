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
					<h2><i class="fa fa-gift"></i> Tag </h2>
					<form method="post" action="{{ route('admin.update-tag') }}" enctype="multipart/form-data">
						
						<div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
							<div class="">
								<label>Tag Name <span class="required">*</span></label> <input name="title" class="form-control" type="text" placeholder="Enter tag name in full" value="{{ $tag->title or old('title') }}"/>
								@if ($errors->has('title'))
									<span class="help-block">
                            			<strong>{{ $errors->first('title') }}</strong>
                          			</span>
								@endif
							</div>
						</div>
						

						<div class="form-group {{ $errors->has('slug') ? ' has-error' : '' }}">
							<div class="">
								<label>Tag Slug <span class="required">*</span></label> <input name="slug" class="form-control" type="text" placeholder="Enter tag name in full" value="{{ $tag->slug or old('slug') }}"/>
								@if ($errors->has('slug'))
									<span class="help-block">
                            			<strong>{{ $errors->first('slug') }}</strong>
                          			</spa>							
                          		@endif
							</div>
						</div>

						

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $tag->id }}"/>
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