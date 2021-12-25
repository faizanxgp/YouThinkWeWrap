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
					<h2><i class="fa fa-gift"></i> Category </h2>
					<form method="post" action="{{ route('admin.update-category') }}" enctype="multipart/form-data">
						
						<div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
							<div class="">
								<label>Category Name <span class="required">*</span></label> <input name="title" class="form-control" type="text" placeholder="Enter category name in full" value="{{ $category->title or old('title') }}"/>
								@if ($errors->has('title'))
									<span class="help-block">
                            			<strong>{{ $errors->first('title') }}</strong>
                          			</span>
								@endif
							</div>
						</div>
						

						<div class="form-group {{ $errors->has('slug') ? ' has-error' : '' }}">
							<div class="">
								<label>Category Slug <span class="required">*</span></label> <input name="slug" class="form-control" type="text" placeholder="Enter category name in full" value="{{ $category->slug or old('slug') }}"/>
								@if ($errors->has('slug'))
									<span class="help-block">
                            			<strong>{{ $errors->first('slug') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('description') ? ' has-error' : '' }}">
							<div class="">
								<label>Category Description <span class="required">*</span></label> <textarea name="description" class="form-control" placeholder="Enter category name in full">{{ $category->description or old('description') }}</textarea>
								@if ($errors->has('description'))
									<span class="help-block">
                            			<strong>{{ $errors->first('description') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('available') ? ' has-error' : '' }}">
							<div class="">
								<label>Available <span class="required">*</span></label> <input name="available" class="form-control-chk" type="checkbox" value="1" @if($category->available == 1) checked="" @endif />
								@if ($errors->has('available'))
									<span class="help-block">
                            			<strong>{{ $errors->first('available') }}</strong>
                          			</span>
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('cart') ? ' has-error' : '' }}">
							<div class="">
								<label>Available In CART <span class="required">*</span></label> <input name="cart" class="form-control-chk" type="checkbox" value="1" @if($category->cart == 1) checked="" @endif />
								@if ($errors->has('cart'))
									<span class="help-block">
                            			<strong>{{ $errors->first('cart') }}</strong>
                          			</span>
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Category Image (870x220)<span class="required">*</span></label> <input name="image" class="form-control" type="file" placeholder=""/>

								@if ($errors->has('image'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image') }}</strong>
                          			</span>
								@endif
								@if($category->image != "")
									<img src="{{ URL::to('uploads/categories/' . $category->image) }}" alt="" />
								@endif
							</div>
						</div>

						

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $category->id }}"/>
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