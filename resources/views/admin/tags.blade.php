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
					<h2><i class="fa fa-envelope"></i> Tags </h2>
				</div>
				<div class="col-md-12">
					{{--<h3 class="inline"><i class="fa fa-list-ul"></i> Activities </h3>--}}
					{{--<div class="filterby">Filter by <select></select></div>--}}

					<table class="table">
						<tr>
							<th>Tag</th>
							
							<th>Slug</th>

							<th>Date/Time</th>
							<th>Action</th>
						</tr>
						@foreach($tags as $tag)

							<tr>
								<td><a href="{{ route('admin.tag', $tag->id) }}">{{ $tag->title }}</a></td>
					
								<td>{{ $tag->slug }}</td>

								<td>{{ $tag->created_at }}</td>

								<td><a class="btn btn-primary" href="{{ route('admin.tag', $tag->id) }}">Edit</a> </td>

							</tr>
						@endforeach
					</table>
					<p><a class="btn btn-primary" href="{{ route('admin.tag') }}">Add Tag</a></p>
				</div>

			</div>
		</div>


	</section>

@endsection