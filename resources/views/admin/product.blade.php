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
					<h2><i class="fa fa-gift"></i> Post Request </h2>
					<form method="post" action="{{ route('admin.update-product') }}" enctype="multipart/form-data">

						<div class="form-group {{ $errors->has('title') ? ' has-error' : '' }}">
							<div class="">
								<label>Product Name <span class="required">*</span></label> <input name="title" class="form-control" type="text" placeholder="Enter product name in full" value="{{ $product->title or old('title') }}"/>
								@if ($errors->has('title'))
									<span class="help-block">
                            			<strong>{{ $errors->first('title') }}</strong>
                          			</span>
								@endif
							</div>
						</div>
						<div class="form-group {{ $errors->has('sku') ? ' has-error' : '' }}">
							<div class="">
								<label>Product SKU <span class="required">*</span></label> <input name="sku" class="form-control" type="text" placeholder="Enter product SKU" value="{{ $product->sku or old('sku') }}"/>
								@if ($errors->has('sku'))
									<span class="help-block">
                            			<strong>{{ $errors->first('sku') }}</strong>
                          			</span>
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('slug') ? ' has-error' : '' }}">
							<div class="">
								<label>Product Slug <span class="required">*</span></label> <input name="slug" class="form-control" type="text" placeholder="Enter product Slug" value="{{ $product->slug or old('slug') }}"/>
								@if ($errors->has('slug'))
									<span class="help-block">
                            			<strong>{{ $errors->first('slug') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>
						<div class="form-group">
							<label>Category <span class="required">*</span></label>
							{{ Form::select('category_id',
							$categories,
							$product->category_id,
							['class' => 'form-control'
						   ]) }}
							@if ($errors->has('category_id'))
								<span class="help-block">
                        			<strong>{{ $errors->first('category_id') }}</strong>
                      			</span>
							@endif
						</div>
						<div class="form-group">
							<label>Tags <span class="required">*</span></label>
							{{ Form::select('tag_id[]',
							$tags,
							$tags2,
							['class' => 'form-control',
							'multiple' => 'multiple'
						   ]) }}
							@if ($errors->has('tag_id'))
								<span class="help-block">
                        			<strong>{{ $errors->first('tag_id') }}</strong>
                      			</span>
							@endif
						</div>



						<div class="form-group {{ $errors->has('description') ? ' has-error' : '' }}">
							<div class="">
								<label>Description <span class="required">*</span></label> <textarea name="description" class="form-control" placeholder="Enter product description">{{ $product->description or old('description') }}</textarea>
								@if ($errors->has('description'))
									<span class="help-block">
                            			<strong>{{ $errors->first('description') }}</strong>
                          			</span>							
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('regular_price') ? ' has-error' : '' }}">
							<div class="">
								<label>Regular Price (without any discount, should be higher the sell price or zero) <span class="required">*</span></label>
								<input name="regular_price" class="form-control" type="text" placeholder="Enter product price" value="{{ $product->regular_price or old ('regular_price') }}"/>
								@if ($errors->has('regular_price'))
									<span class="help-block">
                            			<strong>{{ $errors->first('regular_price') }}</strong>
                          			</span>							
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('price') ? ' has-error' : '' }}">
							<div class="">
								<label>Sell Price (Price we are selling) <span class="required">*</span></label>
								<input name="price" class="form-control" type="text" placeholder="" value="{{ $product->price or old('price') }}"/>
								@if ($errors->has('price'))
									<span class="help-block">
                            			<strong>{{ $errors->first('price') }}</strong>
                          			</span>
                          		@endif
							</div>
						</div>

						<div class="form-group">
							<label>Delivery <span class="required">*</span></label>
							{{ Form::select('delivery',
							$delivery,
							$product->delivery,
							['class' => 'form-control'
						   ]) }}
							@if ($errors->has('delivery'))
								<span class="help-block">
                        			<strong>{{ $errors->first('delivery') }}</strong>
                      			</span>
							@endif
						</div>

						<div class="form-group">
							<label>Packaging <span class="required">*</span></label>
							{{ Form::radio('packaging', '1', ($product->packaging == 1 ? true : false)) }} With Basket
							{{ Form::radio('packaging', '2', ($product->packaging == 2 ? true : false)) }} Without Basket
							{{ Form::radio('packaging', '3', ($product->packaging == 3 ? true : false)) }} With & Without Basket
						</div>

						<div class="form-group {{ $errors->has('available') ? ' has-error' : '' }}">
							<div class="">
								<label>Available <span class="required">*</span></label> <input name="available" class="form-control-chk" type="checkbox" value="1" @if($product->available == 1) checked="" @endif />
								@if ($errors->has('available'))
									<span class="help-block">
                            			<strong>{{ $errors->first('available') }}</strong>
                          			</span>							
                          		@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image1') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Picture 1 (600x600) <span class="required">*</span></label> <input name="image1" class="form-control" type="file" placeholder=""/>

								@if ($errors->has('image1'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image1') }}</strong>
                          			</span>
								@endif
								@if($product->image1 != "")
									<img src="{{ URL::to('uploads/products/' . $product->image1) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image2') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Picture 2 (600x600)</label> <input name="image2" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('image2'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image2') }}</strong>
                          			</span>
								@endif
								@if($product->image2 != "")
									<img src="{{ URL::to('uploads/products/' . $product->image2) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image3') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Picture 3 (600x600)</label> <input name="image3" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('image3'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image3') }}</strong>
                          			</span>
								@endif
								@if($product->image3 != "")
									<img src="{{ URL::to('uploads/products/' . $product->image3) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image4') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Picture 4 (600x600)</label> <input name="image4" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('image4'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image4') }}</strong>
                          			</span>
								@endif
								@if($product->image4 != "")
									<img src="{{ URL::to('uploads/products/' . $product->image4) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('image5') ? ' has-error' : '' }}">
							<div class="">
								<label>Upload Picture 5 (600x600)</label> <input name="image5" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('image5'))
									<span class="help-block">
                            			<strong>{{ $errors->first('image5') }}</strong>
                          			</span>
								@endif
								@if($product->image5 != "")
									<img src="{{ URL::to('uploads/products/' . $product->image5) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $product->id }}"/>
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