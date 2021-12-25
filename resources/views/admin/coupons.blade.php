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
				<div class="col-md-12">
					<h2><i class="fa fa-envelope"></i> Coupons </h2>
				</div>
				<div class="col-md-12">
					{{--<h3 class="inline"><i class="fa fa-list-ul"></i> Activities </h3>--}}
					{{--<div class="filterby">Filter by <select></select></div>--}}

					<table class="table">
						<tr>
							<th>Coupon</th>
							
							<th>Percent</th>
							<th>Valid Till</th>


							<th>Date/Time</th>
							<th>Action</th>
						</tr>
						@foreach($coupons as $coupon)


							<tr>
								<td><a href="{{ route('admin.coupon', $coupon->id) }}">{{ $coupon->title }}</a></td>
					
								<td>{{ $coupon->percent }}</td>
								<td>{{ $coupon->valid_till }}</td>

						
								<td>{{ $coupon->created_at }}</td>

								<td><a class="btn btn-primary" href="{{ route('admin.coupon', $coupon->id) }}">Edit</a> </td>

							</tr>
						@endforeach
					</table>
					<p><a class="btn btn-primary" href="{{ route('admin.coupon') }}">Add Coupon</a></p>
				</div>

			</div>
		</div>


	</section>

@endsection