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
					<h2><i class="fa fa-envelope"></i> Categories </h2>
				</div>
				<div class="col-md-12">
					{{--<h3 class="inline"><i class="fa fa-list-ul"></i> Activities </h3>--}}
					{{--<div class="filterby">Filter by <select></select></div>--}}

					<table class="table">
						<tr>
							<th>Category</th>
							
							<th>Slug</th>
							
							<th>Description</th>
							<th>Date/Time</th>
							<th>Action</th>
						</tr>
						@foreach($categories as $category)


							<tr>
								<td><a href="{{ route('admin.category', $category->id) }}">{{ $category->title }}</a></td>
					
								<td>{{ $category->slug }}</td>
								<td>{{ $category->description }}</td>
						
								<td>{{ $category->created_at }}</td>

								<td><a class="btn btn-primary" href="{{ route('admin.category', $category->id) }}">Edit</a> </td>

							</tr>
						@endforeach
					</table>
					<p><a class="btn btn-primary" href="{{ route('admin.category') }}">Add Category</a></p>
				</div>

			</div>
		</div>


	</section>

@endsection