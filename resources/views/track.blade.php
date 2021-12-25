@extends('layouts.main')

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Order Status</h1>
				@if(Session::has('flash_message'))
					<div class="alert alert-success">
						{{ Session::get('flash_message') }}
					</div>
				@endif
				<h2>{{ $msg }}</h2>
			</div>
		</div>


	</div>
@endsection

@section('js')

@endsection