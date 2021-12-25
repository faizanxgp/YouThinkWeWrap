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
					<h2><i class="fa fa-envelope"></i> Orders </h2>
				</div>
				<div class="col-md-12">
					<table class="table">
						<tr>
							<th>ID</th>
							<th>Sender</th>
							<th>Location</th>
							<th>Order Date</th>
							<th>Delivery Date/Time</th>
							<th>Status</th>
							<th>Amount</th>
							
							<th>Order On</th>
							<th>Action</th>
						</tr>
						@foreach($orders as $order)
							<tr>
								<td>{{$order->id}}</td>
								<td><a href="{{ route('admin.user', $order->user_id) }}">{{ $order->user->name }}</a></td>
								<td><?php $rec = $order->receiver; echo $rec['address_2'] . ', '. $rec['city']; ?></td>
								<td>{{ $order->order_date }}</td>
								<td>{{ $order->delivery_date }} / {{ $order->preferred_time }}</td>
								<td>{{ $order->order_status }}</td>
								<td>{{ $order->order_amount }}</td>
								
								<td>{{ $order->created_at }}</td>

								<td><a class="btn btn-primary" href="{{ route('admin.order', $order->id) }}">Update</a>
									{{--<a class="btn btn-danger" href="">Delete</a>--}}
								</td>
							</tr>
						@endforeach
					</table>
				</div>

			</div>
		</div>


	</section>

@endsection