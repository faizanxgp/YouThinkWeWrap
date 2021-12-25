@extends('layouts.main')

@section('content')
<div class="container">
    <div class="row">    
        <div class="col-md-8 col-md-push-2">
            <h1>Cart</h1> 
            <table class="table">
            @foreach($cart as $k=>$v)
            <form method="post" action="{{ route('add-cart') }}">
                <tr>
                <td>{{ $v['title'] }}</td>
                <td><input type="text" name="qty" value="{{ $v['qty'] }}" /></td>
                <td>{{ $v['price'] }}</td>
                <td>{{ $v['amount'] }}</td>
                <td><input type="hidden" name="id" value="{{ $k }}" /><input type="submit" class="btn btn-primary" value="Update" />{{ csrf_field() }} <a class="btn btn-danger" href="#">Remove</a></td>
                </tr>
            </form>
            @endforeach
            </table>

            <div class="checkout">
            <a href="#" class="btn btn-primary">Checkout</a>
            </div>
        </div>
    </div>
</div>
@endsection
