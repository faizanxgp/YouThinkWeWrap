<?php

namespace App\Http\Controllers;

use App\User;
use App\Product;
use App\Category;
use App\CategoryProduct;
use App\CustomerAddress;
use App\ReceiverAddress;
use App\Testimonial;
use App\Setting;
use App\Page;
use App\Tag;
use App\Coupon;

use App\Order;
use App\OrderDetails;

use Illuminate\Http\Request;
use Session;
use Auth;
use Validator;
use Redirect;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:web')->except(['index', 'getCategory', 'getProduct', 'getCart', 'postAddCart', 'postUpdateCart', 'getRemoveCart', 'getPage', 'getTrackOrder', 'getSearch', 'getTag']);
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/home');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $randproducts = Product::inRandomOrder()->where('available', 1)->limit(3)->get();
        $recentproducts = Product::where('available', 1)->orderBy('id', 'DESC')->limit(6)->get();
        $testimonials = Testimonial::orderBy('id', 'DESC')->limit(3)->get();
        $settings = Setting::first();

        return view('home', ['random' => $randproducts, 'recent' => $recentproducts, 'testimonials' => $testimonials, 'settings' => $settings]);
    }

    public function getCategory($id)
    {

        $category = Category::findOrFail($id);

        //$products = $category->products;
        $products = Product::where('category_id', $id)->where('available', 1)->orderBy('id', 'DESC')->paginate(12);

        $categories = Category::where('available',1)->orderBy('title')->get();

        $settings = Setting::first();

        return view('category', ['category' => $category, 'categories' => $categories, 'products' => $products, 'settings' => $settings]);

    }

    public function getCategoryModal($id)
    {

        $category = Category::findOrFail($id);

        $products = Product::where('category_id', $id)->where('available', 1)->orderBy('id', 'DESC')->get();

        return view('category-modal', ['category' => $category, 'products' => $products]);

    }

    public function getProduct($id)
    {

        $product = Product::findOrFail($id);

        $category = $product->category_id;

        $randproducts = Product::where('category_id', $category)->where('available', 1)->inRandomOrder()->limit(3)->get();

        return view('product', ['product' => $product, 'random' => $randproducts]);
    }

    public function getCart()
    {


        $delivery = config('variables.delivery2');

        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }
        if (Session()->has('location')) {
            $location = Session('location');
        } else {
            $location = 'Lahore';
        }

        if (Session()->has('coupon')) {
            $coupon = Session('coupon');
        } else {
            $coupon['title'] = '';
            $coupon['percent'] = 0;
        }

        return view('cart', ['cart' => $cart, 'delivery' => $delivery, 'location' => $location, 'coupon' => $coupon]);
    }

    public function postAddCart(Request $request)
    {
        // $id = product id
        $id = $request['id'];
        $qty = $request['qty'];
        //$location = 'Lahore';

        $product = Product::findOrFail($id);

        $name = $product->title;
        $price = $product->price;
        $amount = $qty * $price;
        $image = $product->image1;
        $packaging = $product->packaging;
        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }

        $cart[$id] = ['id' => $id, 'image' => $image, 'packaging' => $packaging, 'title' => $name, 'qty' => $qty, 'price' => $price, 'amount' => $amount];

        Session()->put('cart', $cart);

        Session::flash('flash_message', 'Product added to <a href="' . route("cart") . '">Cart</a> successfully');

        return redirect()->route('product', $id);
    }

    public function getRemoveCart($id)
    {
        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }

        unset($cart[$id]);

        Session()->put('cart', $cart);

        Session::flash('flash_message', 'Product removed from Cart');

        return redirect()->route('cart');
    }

    public function postUpdateCart(Request $request)
    {
        $ids = $request['id'];
        $qtys = $request['qty'];
        $location = $request['location']; // only one box in cart
        $discount = $request['discount'];

        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }

//        if (Session()->has('location')) {
//            $location = Session('location');
//        }
        Session()->put('location', $location);

        if (count($ids) > 0) {
            foreach ($ids as $id) {
                $product = Product::findOrFail($id);

                $name = $product->title;
                $price = $product->price;
                $amount = $qtys[$id] * $price;
                $image = $product->image1;
                $packaging = $product->packaging;

                $cart[$id] = ['id' => $id, 'image' => $image, 'packaging' => $packaging, 'title' => $name, 'qty' => $qtys[$id], 'price' => $price, 'amount' => $amount];
            }
        }

        Session()->put('cart', $cart);
        Session::flash('flash_message', 'Cart updated');
        return redirect()->route('cart');
    }

    public function getCheckout()
    {
        $user = Auth::user();
        $user_id = $user->id;

        if (Session()->has('cart')) {
            $cart = Session('cart');
        }
        if (Session()->has('location')) {
            $location = Session('location');
        } else {
            $location = 'Lahore';
        }
        if (Session()->has('coupon')) {
            $discount = Session('coupon');
        } else {
            $discount['title'] = '';
            $discount['percent'] = 0;
        }

        $customer_address = CustomerAddress::where('user_id', $user_id)->first();

        if ($customer_address == null)
            $customer_address = new CustomerAddress();

        $isBasket = 0;
//        foreach ($cart as $ci) {
//            if ($ci['basket'] == 1) $isBasket = 1;
//        }
        if ($isBasket == 1)
            return redirect()->route('basket');
        else
            return view('checkout', ['cart' => $cart, 'location' => $location, 'discount' => $discount, 'instructions' => '', 'customer_address' => $customer_address]);

    }

    public function postCheckout(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;
        // must be login for this step
        $instructions = $request['instructions'];
        $delivery_date = $request['delivery_date'];
        $preferred_time = $request['preferred_time'];

        if (isset($request['btnBasket'])) {
            $isBasket = 1;
        } else {
            $isBasket = 0;
        }

        Session()->put('instructions', $instructions);
        Session()->put('delivery_date', $delivery_date);
        Session()->put('preferred_time', $preferred_time);

        if (Session()->has('cart')) {
            $cart = Session('cart');
        }

        $customer_address = CustomerAddress::where('user_id', $user_id)->first();

        if ($customer_address == null)
            $customer_address = new CustomerAddress();

//        $isBasket = 0;
//        foreach ($cart as $ci) {
//            if ($ci['basket'] == 1) $isBasket = 1;
//        }
        if ($isBasket == 1)
            return redirect()->route('basket');
        else
            return view('checkout', ['cart' => $cart, 'instructions' => $instructions, 'delivery_date' => $delivery_date, 'preferred_time' => $preferred_time, 'customer_address' => $customer_address]);
    }

    public function postCartFinished(Request $request)
    {

        $user = Auth::user();
        $user_id = $user->id;

        $delivery_method = $request['delivery_method'];
        $payment_method = $request['payment_method'];

        $r_name = $request['r_name'];
        $r_address1 = $request['r_address1'];
        //$r_address2 = $request['r_address2'];
        $r_city = $request['r_city'];
        $r_zipcode = $request['r_zipcode'];
        $r_contact = $request['r_contact'];

        $s_name = $request['s_name'];
        $s_address1 = $request['s_address1'];
        //$s_address2 = $request['s_address2'];
        $s_city = $request['s_city'];
        $s_zipcode = $request['s_zipcode'];
        $s_contact = $request['s_contact'];
        //$s_email = $user->email;

        $instructions = Session('instructions');
        if ($instructions == null) $instructions = 'None';

        $delivery_date = Session('delivery_date');
        if ($delivery_date == null) $delivery_date = date('Y-m-d');

        $preferred_time = Session('preferred_time');
        if ($preferred_time == null) $preferred_time = '';

//        $coupon = '';
//        $discount_perc = 0;
//        if (Session()->has('coupon')) {
//            $coupon_arr = Session('coupon');
//            $coupon = (isset($coupon_arr['title']) ? $coupon_arr['title'] : '');
//            $discount_perc = (isset($coupon_arr['percent']) ? $coupon_arr['percent'] : 0);
//        }

        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }
        $location = 'Lahore';
        if (Session()->has('location')) {
            $location = Session('location');
        }

        if (Session()->has('coupon')) {
            $discount = Session('coupon');
        } else {
            $discount['title'] = '';
            $discount['percent'] = 0;
        }
        $coupon = $discount['title'];
        $discount_perc = $discount['percent'];

        $delivery_charges = ($location == 'Lahore' ? 200 : 400);

        $order_amount = 0;
        foreach ($cart as $key => $val) {
            $order_amount += $val['qty'] * $val['price'];
        }
        $discount_amt = $order_amount * ($discount_perc / 100);
        $order_amount = $order_amount + $delivery_charges - $discount_amt;

        $order = new Order();
        $order->user_id = $user_id;
        $order->order_date = date('Y-m-d');
        $order->delivery_date = $delivery_date;
        $order->location = $location;
        $order->delivery_charges = $delivery_charges;
        $order->order_amount = $order_amount;
        $order->discount = $discount_amt;
        $order->coupon = $coupon;
        $order->preferred_time = $preferred_time;
        $order->instruction = $instructions;
        $order->event = '0';
        $order->basket_design = '0';
        $order->package = '0';
        $order->tags_handwritten = '';
        $order->tags_image = '';
        $order->color1 = '';
        $order->color2 = '';
        $order->delivery_method = $delivery_method;
        $order->payment_method = $payment_method;
        $order->order_status = 'Un-Assigned';
        $order->order_notes = '';

        $order->discount = $discount_amt;
        $order->received = 0; // received no money yet
        $order->save();

        foreach ($cart as $key => $val) {
            $order_details = new OrderDetails();
            $order_details->order_id = $order->id;
            $order_details->product_id = $key;
            $order_details->qty = $val['qty'];
            $order_details->rate = $val['price'];
            $order_details->amount = $val['amount'];
            $order_details->discount = '0';
            $order_details->in_basket = 0;
            $order_details->save();
        }

        $customer_address = CustomerAddress::where('user_id', $user_id)->first();
        if ($customer_address == null) {
            $customer_address = new CustomerAddress();
        }
        $customer_address->user_id = $user_id;
        $customer_address->name = $s_name;
        $customer_address->address_1 = $s_address1;
        //$customer_address->address_2 = $s_address2;
        $customer_address->city = $s_city;
        $customer_address->zipcode = $s_zipcode;
        $customer_address->phone = $s_contact;
        $customer_address->state = '';
        $customer_address->country = '';
        $customer_address->email = $user->email;
        $customer_address->save();

        $receiver_address = new ReceiverAddress();
        $receiver_address->name = $r_name;
        $receiver_address->address_1 = $r_address1;
        //$receiver_address->address_2 = $s_address2;
        $receiver_address->city = $r_city;
        $receiver_address->zipcode = $r_zipcode;
        $receiver_address->phone = $r_contact;
        $receiver_address->state = '';
        $receiver_address->country = '';
        $receiver_address->email = '';
        $receiver_address->order_id = $order->id;
        $receiver_address->save();

        if (Session()->has('cart')) {
            Session()->forget('cart');
        }
        Session::flash('flash_message', 'Your Order has been Placed. You Will Receive Confirmation Call Soon.');

        return redirect()->route('home');

    }

    public function postCartFinishedBasket(Request $request)
    {

        $user = Auth::user();
        $user_id = $user->id;

        $delivery_method = $request['delivery_method'];
        $payment_method = $request['payment_method'];

        $r_name = $request['r_name'];
        $r_address1 = $request['r_address1'];
        //$r_address2 = $request['r_address2'];
        $r_city = $request['r_city'];
        $r_zipcode = $request['r_zipcode'];
        $r_contact = $request['r_contact'];

        $s_name = $request['s_name'];
        $s_address1 = $request['s_address1'];
        //$s_address2 = $request['s_address2'];
        $s_city = $request['s_city'];
        $s_zipcode = $request['s_zipcode'];
        $s_contact = $request['s_contact'];
        $s_email = $request['s_email'];


        // in case of direct basket, data would be in $request

        if (isset($request['instructions'])) {
            $instructions = $request['instructions'];
        } else {
            $instructions = Session('instructions');
            if ($instructions == null) $instructions = 'None';
        }

        if (isset($request['delivery_date'])) {
            $delivery_date = $request['delivery_date'];
        } else {
            $delivery_date = Session('delivery_date');
            if ($delivery_date == null) $delivery_date = date('Y-m-d');
        }

        $preferred_time = '';
        if (isset($request['preferred_time'])) {
            $preferred_time = $request['preferred_time'];
        } else {
            if (Session()->has('preferred_time')) {
                $preferred_time = Session('preferred_time');
            }
        }

//        $coupon = '';
//        if (Session()->has('coupon')) {
//            $coupon_arr = Session('coupon');
//            $coupon = (isset($coupon_arr['title']) ? $coupon_arr['title'] : '');
//        }

        $cart = array();
        if (Session()->has('cart')) {
            $cart = Session('cart');
        }
        $location = 'Lahore';
        if (Session()->has('location')) {
            $location = Session('location');
        }

        if (Session()->has('coupon')) {
            $discount = Session('coupon');
        } else {
            $discount['title'] = '';
            $discount['percent'] = 0;
        }
        $coupon = $discount['title'];
        $discount_perc = $discount['percent'];

        $delivery_charges = ($location == 'Lahore' ? 200 : 400);
        $order_amount = 0;
        foreach ($cart as $key => $val) {
            $order_amount += $val['qty'] * $val['price'];
        }
        $discount_amt = $order_amount * ($discount_perc / 100);
        $order_amount = $order_amount + $delivery_charges - $discount_amt;

//        $order = new Order();
//        $order->user_id = $user_id;
//        $order->order_date = date('Y-m-d');
//        $order->delivery_date = date('Y-m-d');
//        $order->order_amount = $order_amount;
//        $order->coupon = '';
//        $order->instruction = $instructions;
//        $order->event = $request['event'];
//        $order->basket_design = $request['design'];
//        $order->package = $request['package'];
//        if ($request['tag_type'] == 'text') {
//            $order->tags_handwritten = $request['tag_handwritten'];
//            $order->tags_image = '';
//        } else {
//            $order->tags_handwritten = '';
//            $order->tags_image = '';
//        }
//        $order->color1 = $request['color1'];
//        $order->color2 = $request['color2'];
//        $order->delivery_method = $delivery_method;
//        $order->payment_method = $payment_method;
//        $order->order_status = 'Received';
//        $order->order_notes = '';
//        $order->save();

        $order = new Order();
        $order->user_id = $user_id;
        $order->order_date = date('Y-m-d');
        $order->delivery_date = $delivery_date;
        $order->location = $location;
        $order->delivery_charges = $delivery_charges;
        $order->order_amount = $order_amount;
        $order->discount = $discount_amt;
        $order->coupon = $coupon;
        $order->preferred_time = $preferred_time;
        $order->instruction = $instructions;
        $order->event = $request['event'];
        $order->basket_design = $request['design'];
        $order->package = $request['package'];
        if ($request['tag_type'] == 'text') {
            $order->tags_handwritten = $request['tag_handwritten'];
            $order->tags_image = '';
        } else {
            $order->tags_handwritten = '';
            $order->tags_image = '';
        }
        $order->color1 = $request['color1'];
        $order->color2 = $request['color2'];
        $order->delivery_method = $delivery_method;
        $order->payment_method = $payment_method;
        $order->order_status = 'Un-Assigned';
        $order->order_notes = '';

        $order->discount = $discount_amt;
        $order->received = 0; // received no money yet
        $order->save();

        foreach ($cart as $key => $val) {
            $order_details = new OrderDetails();
            $order_details->order_id = $order->id;
            $order_details->product_id = $key;
            $order_details->qty = $val['qty'];
            $order_details->rate = $val['price'];
            $order_details->amount = $val['amount'];
            $order_details->discount = '0';
            $order_details->in_basket = 0;
            $order_details->save();
        }

        // package

        if (isset($request['package'])) {
            $package_id = $request['package'];
            $pproduct = Product::findOrFail($package_id);

            $order_details = new OrderDetails();
            $order_details->order_id = $order->id;
            $order_details->product_id = $package_id;
            $order_details->qty = 1;
            $order_details->rate = $pproduct->price;
            $order_details->amount = $pproduct->price;
            $order_details->discount = '0';
            $order_details->in_basket = 0;
            $order_details->save();


            // update order total
            $order->order_amount = $order_amount + $pproduct->price;
            $order->save();

        }

        $customer_address = CustomerAddress::where('user_id', $user_id)->first();
        if ($customer_address == null) {
            $customer_address = new CustomerAddress();
        }
        $customer_address->user_id = $user_id;
        $customer_address->name = $s_name;
        $customer_address->address_1 = $s_address1;
        //$customer_address->address_2 = $s_address2;
        $customer_address->city = $s_city;
        $customer_address->zipcode = $s_zipcode;
        $customer_address->phone = $s_contact;
        $customer_address->state = '';
        $customer_address->country = '';
        $customer_address->email = $user->email;
        $customer_address->save();

        $receiver_address = new ReceiverAddress();
        $receiver_address->name = $r_name;
        $receiver_address->address_1 = $r_address1;
        //$receiver_address->address_2 = $s_address2;
        $receiver_address->city = $r_city;
        $receiver_address->zipcode = $r_zipcode;
        $receiver_address->phone = $r_contact;
        $receiver_address->state = '';
        $receiver_address->country = '';
        $receiver_address->email = '';
        $receiver_address->order_id = $order->id;
        $receiver_address->save();

        if (Session()->has('cart')) {
            Session()->forget('cart');
        }

        if (Session()->has('instructions')) {
            Session()->forget('instructions');
        }
        if (Session()->has('delivery_date')) {
            Session()->forget('delivery_date');
        }
        if (Session()->has('preferred_time')) {
            Session()->forget('preferred_time');
        }

        Session::flash('flash_message', 'Your Order has been Placed. You Will Receive Confirmation Call Soon.');

        return redirect()->route('home');

    }

    public function getBasket()
    {
        $user = Auth::user();
        $user_id = $user->id;

        $customer_address = CustomerAddress::where('user_id', $user_id)->first();

        if ($customer_address == null)
            $customer_address = new CustomerAddress();

        $categories = Category::where('cart', 1)->orderBy('title')->pluck('title', 'id');

        $packages = Product::where('category_id', 20)->get();

        // check for require date

        $instructions = '';
        if (Session()->has('instructions')) {
            $instructions = Session('instructions');
        }
        $delivery_date = '';
        if (Session()->has('delivery_date')) {
            $delivery_date = Session('delivery_date');
        }
        $preferred_time = '';
        if (Session()->has('preferred_time')) {
            $preferred_time = Session('preferred_time');
        }

        return view('basket', ['categories' => $categories, 'packages' => $packages, 'customer_address' => $customer_address, 'instructions' => $instructions, 'delivery_date' => $delivery_date, 'preferred_time' => $preferred_time]);
    }

    public function postApplyCoupon(Request $request)
    {

        $coupon_code = $request['coupon'];

        $coupon = Coupon::where('title', $coupon_code)->whereDate('valid_till', '>=', date('Y-m-d'))->first();

        $discount = 0;
        if ($coupon != null) {
            $discount = $coupon->percent;
        }

        $coupon_sess = ['title' => $coupon_code, 'percent' => $discount];

        Session()->put('coupon', $coupon_sess);

        return redirect()->route('cart');

    }

    public function getUpdateUser()
    {
        $user = Auth::user();
        $user_id = $user->id;

        $customerAddress = CustomerAddress::where('user_id', $user_id)->first();

        if ($customerAddress == null) {
            $customerAddress = new CustomerAddress();
            $customerAddress->id = $user_id;
        }

        return view('account', ['user' => $user, 'address' => $customerAddress]);
    }

    public function postUpdateAccount(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('name' => 'required', 'email' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('update-user')->withErrors($validator)->withInput();

        } else {

            $user->name = $request['name'];
            $user->email = $request['email'];
            if ($request->password != null and $request->password_confirmation != null
                and strlen($request->password) >= 6 and $request->password == $request->password_confirmation
            ) {
                $user->password = bcrypt($request->password);
            }
            $user->save();
            Session::flash('flash_message', 'Account successfully updated!');
        }
        return redirect()->route('update-user');
    }

    public function postUpdateUser(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('name' => 'required', 'address_1' => 'required', 'city' => 'required', 'phone' => 'required',);

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('update-user')->withErrors($validator)->withInput();

        } else {

            $caddress = CustomerAddress::where('user_id', $user_id)->first();
            if ($caddress == null) {
                $caddress = new CustomerAddress();
                $caddress->user_id = $user_id;
            }

            $caddress->name = $request['name'];
            $caddress->address_1 = $request['address_1'];
            $caddress->address_2 = $request['address_2'];
            $caddress->city = $request['city'];
            $caddress->zipcode = $request['zipcode'];
            $caddress->phone = $request['phone'];
            $caddress->save();

            Session::flash('flash_message', 'Account successfully updated!');
        }
        return redirect()->route('update-user');
    }

    public function getPage($slug)
    {
        //$user = Auth::user();

        $page = Page::where('slug', $slug)->first();

        return view('page', ["page" => $page]);

    }

    public function ajaxAddCart(Request $request)
    {
        $user = Auth::user();
        $id = $request->input('id');
        if ($user != null) {
            $product = Product::findOrFail($id);

            if ($product != null) {
                $qty = 1;
                $name = $product->title;
                $price = $product->price;
                $amount = $qty * $price;
                $image = $product->image1;
                $packaging = $product->packaging;
                $cart = array();
                if (Session()->has('cart')) {
                    $cart = Session('cart');
                }

                $cart[$id] = ['id' => $id, 'image' => $image, 'packaging' => $packaging, 'title' => $name, 'qty' => $qty, 'price' => $price, 'amount' => $amount];

                Session()->put('cart', $cart);

            }

            $response = array(
                'id' => $id,
                'status' => 'success',
                'msg' => 'Added to cart',
            );
            return \Response::json($response);
        }
        return 0;
    }

    public function getTrackOrder(Request $request)
    {


        $order_id = $request['order'];

        if ($order_id != "" or $order_id != null) {

            $order = Order::where('id', $order_id)->first();

            $msg = "";
            if ($order != null and $order->count() > 0) {
                $order_status = $order->order_status;
                $order_date = $order->order_date;

                $msg = "Your order #" . $order_id . " dated " . $order_date . " is " . $order_status;
            } else {
                $msg = "Not Found";
            }

            return view('track', ['msg' => $msg]);

        } else {
            return redirect()->route('home');
        }

    }

    public function getSearch(Request $request)
    {


        $search = $request['search'];

        if ($search != "" or $search != null) {

            $categories = Category::where('available',1)->orderBy('title')->get();
            $products = Product::where('title', 'like', '%' . $search . '%')->get();

            if ($products != null and $products->count() > 0) {


            } else {

            }

            return view('search', ['products' => $products, 'categories' => $categories]);

        } else {
            return redirect()->route('home');
        }

    }


    public function getTag($tag_slug)
    {

        $tag = Tag::where('slug', $tag_slug)->first();

        if ($tag != "" or $tag != null) {

            $categories = Category::where('available',1)->orderBy('title')->get();
            $products = $tag->products()->get();

            return view('search', ['products' => $products, 'categories' => $categories]);

        } else {
            return redirect()->route('home');
        }

    }
}