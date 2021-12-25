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
					<h2><i class="fa fa-gift"></i> Site Settings </h2>
					<form method="post" action="{{ route('admin.update-setting') }}" enctype="multipart/form-data">

						<div class="form-group {{ $errors->has('main_offer') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Offer (550x400) <span class="required">*</span></label>
								<input name="main_offer" class="form-control" type="file" placeholder=""/>

								@if ($errors->has('main_offer'))
									<span class="help-block">
                            			<strong>{{ $errors->first('main_offer') }}</strong>
                          			</span>
								@endif
								@if($setting->main_offer != "")
									<img src="{{ URL::to('uploads/settings/' . $setting->main_offer) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('main_link') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Offer URL</label> <input name="main_link" class="form-control" type="text" placeholder="" value="{{ $setting->main_link }}" />
								@if ($errors->has('main_link'))
									<span class="help-block">
                            			<strong>{{ $errors->first('main_link') }}</strong>
                          			</span>
								@endif


							</div>
						</div>

						<div class="form-group {{ $errors->has('small_offer_1') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Small Offer 1 (265x200)</label> <input name="small_offer_1" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('small_offer_1'))
									<span class="help-block">
                            			<strong>{{ $errors->first('small_offer_1') }}</strong>
                          			</span>
								@endif
								@if($setting->small_offer_1 != "")
									<img src="{{ URL::to('uploads/settings/' . $setting->small_offer_1) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('small_link_1') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Small Offer 1 URL</label> <input name="small_link_1" class="form-control" type="text" placeholder="" value="{{ $setting->small_link_1 }}" />
								@if ($errors->has('small_link_1'))
									<span class="help-block">
                            			<strong>{{ $errors->first('small_link_1') }}</strong>
                          			</span>
								@endif

							</div>
						</div>



						<div class="form-group {{ $errors->has('small_offer_2') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Small Offer 2 (265x200)</label> <input name="small_offer_2" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('small_offer_2'))
									<span class="help-block">
                            			<strong>{{ $errors->first('small_offer_2') }}</strong>
                          			</span>
								@endif
								@if($setting->small_offer_2 != "")
									<img src="{{ URL::to('uploads/settings/' . $setting->small_offer_2) }}" alt="" />
								@endif
							</div>
						</div>



						<div class="form-group {{ $errors->has('small_link_2') ? ' has-error' : '' }}">
							<div class="">
								<label>Main Page Small Offer 2 URL</label> <input name="small_link_2" class="form-control" type="text" placeholder="" value="{{ $setting->small_link_2 }}" />
								@if ($errors->has('small_link_2'))
									<span class="help-block">
                            			<strong>{{ $errors->first('small_link_2') }}</strong>
                          			</span>
								@endif

							</div>
						</div>


						<div class="form-group {{ $errors->has('category_offer') ? ' has-error' : '' }}">
							<div class="">
								<label>Category Page Offer (280x400)</label> <input name="category_offer" class="form-control" type="file" placeholder=""/>
								@if ($errors->has('category_offer'))
									<span class="help-block">
                            			<strong>{{ $errors->first('category_offer') }}</strong>
                          			</span>
								@endif
								@if($setting->category_offer != "")
									<img src="{{ URL::to('uploads/settings/' . $setting->category_offer) }}" alt="" />
								@endif
							</div>
						</div>

						<div class="form-group {{ $errors->has('category_link') ? ' has-error' : '' }}">
							<div class="">
								<label>Category Page Offer URL</label> <input name="category_link" class="form-control" type="text" placeholder="" value="{{ $setting->category_link }}" />
								@if ($errors->has('category_link'))
									<span class="help-block">
                            			<strong>{{ $errors->first('category_link') }}</strong>
                          			</span>
								@endif

							</div>
						</div>

						<div class="form-group">
							<div class="">
								<input type="hidden" name="id" value="{{ $setting->id }}"/>
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