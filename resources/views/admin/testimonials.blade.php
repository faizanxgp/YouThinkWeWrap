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
					<h2><i class="fa fa-envelope"></i> Testimonials </h2>
				</div>
				<div class="col-md-12">
					{{--<h3 class="inline"><i class="fa fa-list-ul"></i> Activities </h3>--}}
					{{--<div class="filterby">Filter by <select></select></div>--}}

					<table class="table">
						<tr>
							<th>Person</th>
							
							<th>Details</th>
							

							<th>Date/Time</th>
							<th>Action</th>
						</tr>
						@foreach($testimonials as $testimonial)


							<tr>
								<td><a href="{{ route('admin.testimonial', $testimonial->id) }}">{{ $testimonial->person }}</a></td>
					
								<td>{{ $testimonial->details }}</td>

						
								<td>{{ $testimonial->created_at }}</td>

								<td><a class="btn btn-primary" href="{{ route('admin.testimonial', $testimonial->id) }}">Edit</a> </td>

							</tr>
						@endforeach
					</table>
					<p><a class="btn btn-primary" href="{{ route('admin.testimonial') }}">Add Testimonial</a></p>
				</div>

			</div>
		</div>


	</section>

@endsection