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
					<h2><i class="fa fa-envelope"></i> Users </h2>
				</div>
				<div class="col-md-12">
							<table class="table table-striped">
								<tr>
									<th>Name</th>
									<th>Email</th>

									<th>Status</th>
									<th>Verified</th>
									<th>Provider</th>

									<th>Date</th>
									<th>Action</th>
								</tr>
								@foreach($users as $usr)
									<tr>
										<td><a class="" href="{{ route('admin.user', $usr->id) }}">{{ $usr->name }}</a></td>
										<td>{{ $usr->email }}</td>

										<td>@if($usr->status == 1) Active @else Inactive @endif</td>
										<td>@if($usr->verified == 1) Verified @else Pending @endif</td>
										<td>{{ $usr->provider }}</td>
										<td>{{ $usr->created_at }}</td>
										<td>Change Status</td>
									</tr>
								@endforeach
								<tr>
									<td colspan="4">{{ $users->links() }}</td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>


	</section>

@endsection
