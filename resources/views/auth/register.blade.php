@extends('layouts.main')

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">

				<h1 class="text-center">Create An Account</h1>
				<p class="text-center">Existing User? <a href="{{ route('login') }}">Login Here</a></p>
				@if(Session::has('flash_message'))
					<div class="alert alert-success">
						{!! Session::get('flash_message') !!}
					</div>
				@endif
				<div class="row">
					<div class="col-md-6">
						<div class="grey-register-bg">
							<p>
								<a class="loginBtn loginBtn--facebook" href="{{ url('/auth/facebook') }}"> Login with Facebook </a></p>
							<p>
								<a class="loginBtn loginBtn--google" href="{{ url('/auth/google') }}"> Login with Google </a>
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="auth-wrapper">
							<form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
								{{ csrf_field() }}

								<div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
									{{--<label for="name" class="col-md-4 control-label">Name</label>--}}

									<div class="">
										<input id="name" type="text" class="form-control" name="name" placeholder="Full Name" value="{{ old('name') }}" required autofocus>

										@if ($errors->has('name'))
											<span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
										@endif
									</div>
								</div>

								<div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
									{{--<label for="email" class="col-md-4 control-label">E-Mail Address</label>--}}

									<div class="">
										<input id="email" type="email" class="form-control" name="email" placeholder="Email"  value="{{ old('email') }}" required>

										@if ($errors->has('email'))
											<span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
										@endif
									</div>
								</div>

								<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
									{{--<label for="password" class="col-md-4 control-label">Password</label>--}}

									<div class="">
										<input id="password" type="password" class="form-control" name="password" placeholder="Password" required>

										@if ($errors->has('password'))
											<span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
										@endif
									</div>
								</div>

								<div class="form-group">
									{{--<label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>--}}

									<div class="">
										<input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password" required>
									</div>
								</div>

								<div class="form-group">
									<div class="">
										<button type="submit" class="btn btn-primary">
											Register
										</button>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>


				{{--<div class="panel panel-default">--}}
					{{--<div class="panel-heading">Register</div>--}}
					{{--<div class="panel-body">--}}
						{{--<form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">--}}
							{{--{{ csrf_field() }}--}}

							{{--<div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">--}}
								{{--<label for="name" class="col-md-4 control-label">Name</label>--}}

								{{--<div class="col-md-6">--}}
									{{--<input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>--}}

									{{--@if ($errors->has('name'))--}}
										{{--<span class="help-block">--}}
                                        {{--<strong>{{ $errors->first('name') }}</strong>--}}
                                    {{--</span>--}}
									{{--@endif--}}
								{{--</div>--}}
							{{--</div>--}}

							{{--<div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">--}}
								{{--<label for="email" class="col-md-4 control-label">E-Mail Address</label>--}}

								{{--<div class="col-md-6">--}}
									{{--<input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>--}}

									{{--@if ($errors->has('email'))--}}
										{{--<span class="help-block">--}}
                                        {{--<strong>{{ $errors->first('email') }}</strong>--}}
                                    {{--</span>--}}
									{{--@endif--}}
								{{--</div>--}}
							{{--</div>--}}

							{{--<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">--}}
								{{--<label for="password" class="col-md-4 control-label">Password</label>--}}

								{{--<div class="col-md-6">--}}
									{{--<input id="password" type="password" class="form-control" name="password" required>--}}

									{{--@if ($errors->has('password'))--}}
										{{--<span class="help-block">--}}
                                        {{--<strong>{{ $errors->first('password') }}</strong>--}}
                                    {{--</span>--}}
									{{--@endif--}}
								{{--</div>--}}
							{{--</div>--}}

							{{--<div class="form-group">--}}
								{{--<label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>--}}

								{{--<div class="col-md-6">--}}
									{{--<input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>--}}
								{{--</div>--}}
							{{--</div>--}}

							{{--<div class="form-group">--}}
								{{--<div class="col-md-6 col-md-offset-4">--}}
									{{--<button type="submit" class="btn btn-primary">--}}
										{{--Register--}}
									{{--</button>--}}
								{{--</div>--}}
							{{--</div>--}}
						{{--</form>--}}
					{{--</div>--}}
				{{--</div>--}}
			</div>
		</div>
	</div>
@endsection
