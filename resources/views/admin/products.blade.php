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
					<h2><i class="fa fa-envelope"></i> Products </h2>
					<form method="get" action="{{ route('admin.products') }}">Search: <input type="text" name="search" value="{{ $search }}" placeholder="Serch Products" /></form>
				</div>
				<div class="col-md-12">
					{{--<h3 class="inline"><i class="fa fa-list-ul"></i> Activities </h3>--}}
					{{--<div class="filterby">Filter by <select></select></div>--}}

					<table class="table">
						<tr>
							<th>Product</th>
							<th>Sku</th>
							<th>Slug</th>
							<th>Category</th>
							<th>Regular Price</th>
							<th>Price</th>
							<th>Available</th>
							<th>Date/Time</th>
							<th>Action</th>
						</tr>
						@foreach($products as $product)
							<tr>
								<td><a href="{{ route('admin.product', $product->id) }}">{{ $product->title }}</a></td>
								<td>{{ $product->sku }}</td>
								<td>{{ $product->slug }}</td>
								<td>{{ $product->category->title }}</td>
								<td>{{ $product->regular_price }}</td>
								<td>{{ $product->price }}</td>
								<td>{{ $product->available }}</td>
								<td>{{ $product->created_at }}</td>
								<td><a class="btn btn-primary" href="{{ route('admin.product', $product->id) }}">Edit</a> </td>

							</tr>
						@endforeach
						<tr><td colspan="7">{{ $products->links() }}</td></tr>
					</table>
					<p><a class="btn btn-primary" href="{{ route('admin.product') }}">Add Product</a></p>
				</div>

			</div>
		</div>


	</section>

@endsection