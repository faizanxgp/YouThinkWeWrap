<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;

use App\Category;
use App\Product;
use App\Tag;
use App\ProductTag;
use App\Order;
use App\OrderDetails;
use App\CustomerAddress;
use App\ReceiverAddress;
use App\Setting;
use App\Testimonial;
use App\Page;
use App\Coupon;
use App\User;

use Auth;
use Validator;
use Session;
use Redirect;

use Image; // for resize

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin');
    }


    public function getOrders()
    {
        $user = Auth::user();
        $user_id = $user->id;

        $orders = Order::orderBy('id', 'desc')->get();

        return view('admin.orders', ['orders' => $orders]);
    }

    public function getOrder($id = 0)
    {

        $status= config('variables.orderStatus');

        $order = Order::findOrFail($id);
        $order_details = OrderDetails::where('order_id', $id)->get();

        $customer = CustomerAddress::where('user_id', $order->user_id)->first();
        $receiver = ReceiverAddress::where('order_id', $id)->first();

        if ($customer == null or $receiver == null) return redirect()->route('admin.dashboard');

        return view('admin.order', ['order' => $order, 'order_details' => $order_details, 'cust' => $customer, 'recv' => $receiver, 'status' => $status]);
    }

    public function postOrder(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('order_status' => 'required', 'order_notes' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.order', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            $order = Order::findOrFail($id);

            $order->order_status = $request["order_status"];
            $order->received = $request["received"];
            $order->order_notes = $request["order_notes"];
            $order->save();

            Session::flash('flash_message', 'Product successfully updated!');

        }

        return redirect()->route('admin.orders');
    }

    public function getProducts(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $search = (isset($request['search']) ? $request['search'] : '');

        //$countries = config('variables.countries');
        $categories = Category::all()->pluck('category', 'id');

        if ($search == "")
            $products = Product::orderBy('category_id')->paginate(10);
        else
            $products = Product::where('title', 'like', '%' . $search . '%')->orderBy('category_id')->paginate(10);

        return view('admin.products', ['products' => $products, 'categories' => $categories, 'search' => $search]);
    }

    public function getProduct($id = 0)
    {

        $delivery = config('variables.delivery');
        $packaging = config('variables.packaging');

        $categories = Category::pluck('title', 'id')->all();
        $tags = Tag::pluck('title', 'id')->all();

        if ($id == 0) {
            $product = new Product();

        } else {
            $product = Product::findOrFail($id);
        }

        $tags2 = ProductTag::where('product_id', $product->id)->pluck('tag_id');

        return view('admin.product', ['product' => $product, 'categories' => $categories, 'tags' => $tags, 'tags2' => $tags2, 'delivery' => $delivery, 'packaging' => $packaging]);
    }

    public function postProduct(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('title' => 'required', 'slug' => 'required', 'description' => 'required', 'regular_price' => 'required|numeric', 'price' => 'required|numeric',);

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.product', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {

                $product = new Product();

            } else {
                $product = Product::findOrFail($id);
            }
            $product->category_id = $request['category_id'];
            $product->title = $request["title"];
            $product->sku = $request["sku"];
            $product->slug = $request["slug"];
            $product->description = $request["description"];
            $product->regular_price = $request["regular_price"];
            $product->price = $request["price"];
            $product->available = (isset($request["available"]) ? 1 : 0);
            $product->delivery = $request["delivery"];
            $product->packaging = $request["packaging"];
            $product->save();

            $product_id = $product->id;
            // delete existing data
            ProductTag::where('product_id', $product_id)->delete();
            // add new data
            $tags = (isset($request['tag_id']) ? $request['tag_id'] : array() );
            foreach($tags as $key=>$val) {
                $producttags = new ProductTag();
                $producttags->tag_id = $val;
                $producttags->product_id = $product_id;
                $producttags->save();
            }

            // getting all of the post images
            $file = $request['image1'];
            $destinationPath = 'uploads/products';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png") and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $product->image1 = $fname;
                    $product->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(600, 600, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            } else {
                // for duplicate
                if ($id == 0 and isset($request['photo_old'])) {
                    $product->image1 = $request['photo_old'];
                    $product->save();
                }
            }

            $file = $request['image2'];
            $destinationPath = 'uploads/products';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $product->image2 = $fname;
                    $product->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(600, 600, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            } else {
                // for duplicate
                if ($id == 0 and isset($request['photo_old'])) {
                    $product->image2 = $request['photo_old'];
                    $product->save();
                }
            }

            $file = $request['image3'];
            $destinationPath = 'uploads/products';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $product->image3 = $fname;
                    $product->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(600, 600, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            } else {
                // for duplicate
                if ($id == 0 and isset($request['photo_old'])) {
                    $product->image3 = $request['photo_old'];
                    $product->save();
                }
            }

            $file = $request['image4'];
            $destinationPath = 'uploads/products';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $product->image4 = $fname;
                    $product->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(600, 600, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            } else {
                // for duplicate
                if ($id == 0 and isset($request['photo_old'])) {
                    $product->image4 = $request['photo_old'];
                    $product->save();
                }
            }

            $file = $request['image5'];
            $destinationPath = 'uploads/products';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png") and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $product->image5 = $fname;
                    $product->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(600, 600, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            } else {
                // for duplicate
                if ($id == 0 and isset($request['photo_old'])) {
                    $product->image5 = $request['photo_old'];
                    $product->save();
                }
            }

            // // getting all of the post images
            // $file = $request['photo'];
            // $destinationPath = 'uploads/products';
            // if ($file) {
            //     // only jpg files of less than 2MB
            //     $filename = $file->getClientOriginalName();
            //     // 5mb
            //     if ($file->getClientMimeType() == "image/jpeg" and $file->getClientSize() < 5242880) {

            //         $fname = $user_id . "-" . $filename;
            //         // save image name
            //         $product->image = $fname;
            //         $product->save();

            //         //resize
            //         $img = Image::make($file->getRealPath());
            //         $img->resize(700, 1000, function ($constraint) {
            //             $constraint->aspectRatio();
            //             $constraint->upsize();
            //         })->save($destinationPath . '/' . $fname);
            //         // end of resize
            //     }
            // }

            Session::flash('flash_message', 'Product successfully updated!');

        }

        return redirect()->route('admin.products');

    }


    public function getCategories()
    {
        $user = Auth::user();
        $user_id = $user->id;

        //$countries = config('variables.countries');
        $categories = Category::orderBy('id', 'desc')->get();

        return view('admin.categories', ['categories' => $categories]);
    }

    public function getCategory($id = 0)
    {

        //$countries = config('variables.countries');


        if ($id == 0) {
            $category = new Category();

        } else {
            $category = Category::findOrFail($id);
        }

        return view('admin.category', ['category' => $category]);
    }

    public function postCategory(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('title' => 'required', 'slug' => 'required', 'description' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.category', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {

                $category = new Category();

            } else {
                $category = Category::findOrFail($id);
            }

            $category->title = $request["title"];
            $category->slug = $request["slug"];
            $category->available = (isset($request["available"]) ? 1 : 0);
            $category->cart = (isset($request["cart"]) ? 1 : 0);
            $category->description = $request["description"];
            $category->save();


//            // getting all of the post images
//            $file = $request['image'];
//            $destinationPath = 'uploads/categories';
//            if ($file) {
//                // only jpg files of less than 2MB
//                $filename = $file->getClientOriginalName();
//                // 5mb
//                if ($file->getClientMimeType() == "image/jpeg" and $file->getClientSize() < 5242880) {
//
//                    $fname = $user_id . "-" . $filename;
//                    // save image name
//                    $category->image = $fname;
//                    $category->save();
//
//                    //resize
//                    $img = Image::make($file->getRealPath());
//                    $img->resize(870, 220, function ($constraint) {
//                        $constraint->aspectRatio();
//                        $constraint->upsize();
//                    })->save($destinationPath . '/' . $fname);
//                    // end of resize
//                }
//            } else {
//                // for duplicate
//                if ($id == 0 and isset($request['photo_old'])) {
//                    $category->image = $request['photo_old'];
//                    $category->save();
//                }
//            }


             // getting all of the post images
             $file = $request['image'];
             $destinationPath = 'uploads/categories';
             if ($file) {
                 // only jpg files of less than 2MB
                 $filename = $file->getClientOriginalName();
                 // 5mb
                 if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png") and $file->getClientSize() < 5242880) {

                     $filename = $user_id . "-" . $filename;
                     // save image name
                     $category->image = $filename;
                     $category->save();

                     //resize
                     $img = Image::make($file->getRealPath());
                     $img->resize(870, 220, function ($constraint) {
                         $constraint->aspectRatio();
                         $constraint->upsize();
                     })->save($destinationPath . '/' . $filename);
                     // end of resize
                 }
             }

            Session::flash('flash_message', 'Category successfully updated!');

        }

        return redirect()->route('admin.categories');

    }



    public function getTags()
    {
        $user = Auth::user();
        $user_id = $user->id;

        //$countries = config('variables.countries');
        $tags = Tag::orderBy('id', 'desc')->get();

        return view('admin.tags', ['tags' => $tags]);
    }

    public function getTag($id = 0)
    {

        //$countries = config('variables.countries');


        if ($id == 0) {
            $tag = new Tag();

        } else {
            $tag = Tag::findOrFail($id);
        }

        return view('admin.tag', ['tag' => $tag]);
    }

    public function postTag(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('title' => 'required', 'slug' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.tag', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {

                $tag = new Tag();

            } else {
                $tag = Tag::findOrFail($id);
            }

            $tag->title = $request["title"];
            $tag->slug = $request["slug"];
            $tag->save();



            Session::flash('flash_message', 'Tag successfully updated!');

        }

        return redirect()->route('admin.tags');

    }


    public function getCoupons()
    {
        $user = Auth::user();
        $user_id = $user->id;

        //$countries = config('variables.countries');
        $coupons = Coupon::orderBy('id', 'desc')->get();

        return view('admin.coupons', ['coupons' => $coupons]);
    }

    public function getCoupon($id = 0)
    {

        //$countries = config('variables.countries');


        if ($id == 0) {
            $coupon = new Coupon();

        } else {
            $coupon = Coupon::findOrFail($id);
        }

        return view('admin.coupon', ['coupon' => $coupon]);
    }

    public function postCoupon(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('title' => 'required', 'percent' => 'required', 'valid_till' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.coupon', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {

                $coupon = new Coupon();

            } else {
                $coupon = Coupon::findOrFail($id);
            }

            $coupon->title = $request["title"];
            $coupon->percent = $request["percent"];
            $coupon->valid_till = $request["valid_till"];
            $coupon->save();



            Session::flash('flash_message', 'Coupon successfully updated!');

        }

        return redirect()->route('admin.coupons');

    }

    public function getTestimonials()
    {
        $user = Auth::user();

        //$countries = config('variables.countries');
        $testimonials = Testimonial::orderBy('id', 'desc')->get();

        return view('admin.testimonials', ['testimonials' => $testimonials]);
    }

    public function getTestimonial($id = 0)
    {

        //$countries = config('variables.countries');

        if ($id == 0) {
            $testimonial = new Testimonial();
        } else {
            $testimonial = Testimonial::findOrFail($id);
        }

        return view('admin.testimonial', ['testimonial' => $testimonial]);
    }

    public function postTestimonial(Request $request)
    {
        $user = Auth::user();

        $rules = array('person' => 'required', 'details' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.testimonial', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {

                $testimonial = new Testimonial();

            } else {
                $testimonial = Testimonial::findOrFail($id);
            }

            $testimonial->person = $request["person"];
            $testimonial->details = $request["details"];
            $testimonial->save();



            Session::flash('flash_message', 'Testimonial successfully updated!');

        }

        return redirect()->route('admin.testimonials');

    }


    public function getUsers()
    {
        $user = Auth::user();

        //$countries = config('variables.countries');
        $users = User::orderBy('id', 'desc')->paginate(20);

        return view('admin.users', ['users' => $users]);
    }

    public function getUser($id)
    {

        $usr= User::findOrFail($id);

        return view('admin.user', ['usr' => $usr]);
    }

    public function postUser(Request $request)
    {
        $user = Auth::user();

        $rules = array('name' => 'required', 'email' => 'required|email');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.user', $request->id)->withErrors($validator)->withInput();

        } else {

            $id = $request['id'];

            if ($id == 0) {
                //$user = new User();
            } else {
                $usr = User::findOrFail($id);
            }

            $usr->name = $request["name"];
            $usr->email = $request["email"];
            $usr->status = (isset($request["status"]) ? 1 : 0);
            $usr->verified = (isset($request["verified"]) ? 1 : 0);
            $usr->save();

            Session::flash('flash_message', 'User successfully updated!');

        }

        return redirect()->route('admin.users');

    }

    public function getSetting()
    {

        //$countries = config('variables.countries');

        $setting = Setting::findOrFail(1);


        return view('admin.setting', ['setting' => $setting]);

    }

    public function postSetting(Request $request)
    {
        $user = Auth::user();
        $user_id = $user->id;

        $rules = array('main_link' => 'required');

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.setting')->withErrors($validator)->withInput();

        } else {

            $id = 1;

            $setting = Setting::findOrFail($id);

            $setting->main_link = $request['main_link'];
            $setting->small_link_1 = $request['small_link_1'];
            $setting->small_link_2 = $request['small_link_2'];
            $setting->category_link = $request['category_link'];
            $setting->save();

            // getting all of the post images
            $file = $request['main_offer'];
            $destinationPath = 'uploads/settings';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png") and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $setting->main_offer = $fname;
                    $setting->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(550, 400, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            }

            // getting all of the post images
            $file = $request['small_offer_1'];
            $destinationPath = 'uploads/settings';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $setting->small_offer_1 = $fname;
                    $setting->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(550, 400, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            }

            // getting all of the post images
            $file = $request['small_offer_2'];
            $destinationPath = 'uploads/settings';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $setting->small_offer_2 = $fname;
                    $setting->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(550, 400, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            }

            // getting all of the post images
            $file = $request['category_offer'];
            $destinationPath = 'uploads/settings';
            if ($file) {
                // only jpg files of less than 2MB
                $filename = $file->getClientOriginalName();
                // 5mb
                if ( ($file->getClientMimeType() == "image/jpeg" or $file->getClientMimeType() == "image/png")  and $file->getClientSize() < 5242880) {

                    $fname = $user_id . "-" . $filename;
                    // save image name
                    $setting->category_offer = $fname;
                    $setting->save();

                    //resize
                    $img = Image::make($file->getRealPath());
                    $img->resize(550, 400, function ($constraint) {
                        $constraint->aspectRatio();
                        $constraint->upsize();
                    })->save($destinationPath . '/' . $fname);
                    // end of resize
                }
            }

            Session::flash('flash_message', 'Settings successfully updated!');

        }

        return redirect()->route('admin.dashboard');

    }


    public function getAccount()
    {

        $user = Auth::user();
        $user_id = $user->id;

        //$account = User::findOrFail($user_id);

        return view('admin.account', ['user' => $user]);

    }

    public function postAccount(Request $request)
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
            return Redirect::route('admin.dashboard')->withErrors($validator)->withInput();

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
        return redirect()->route('admin.dashboard');
    }

    public function getPages()
    {
        $adminuser = Auth::guard('admin')->user();
        $user_id = $adminuser->id;

        $pages = Page::orderBy('id')->paginate(10);

        return view('admin.pages', ['user' => $adminuser, 'pages' => $pages]);
    }

    public function getPage($id)
    {
        $adminuser = Auth::guard('admin')->user();
        $user_id = $adminuser->id;

        if ($id == 0) {
            $page = new Page();
        } else {
            $page = Page::find($id);
        }

        return view('admin.page', ['user' => $adminuser, 'page' => $page]);
    }

    public function postPage(Request $request)
    {
        $adminuser = Auth::guard('admin')->user();
        $user_id = $adminuser->id;

        //$user = Auth::user();
        $id = $request["id"];

        $rules = array('slug' => 'required', 'title' => 'required', 'description' => 'required',);

        // do the validation ----------------------------------
        // validate against the inputs from our form
        $validator = Validator::make($request->all(), $rules);

        // check if the validator failed -----------------------
        if ($validator->fails()) {

            // get the error messages from the validator
            //$messages = $validator->messages();

            // redirect our user back to the form with the errors from the validator
            return Redirect::route('admin.page', $id)->withErrors($validator)->withInput();

        } else {

            if ($id == 0) {
                $page = new Page();
                $page->title = $request['title'];
                $page->slug = $request['slug'];
                $page->meta_description = $request['meta_description'];
                $page->description = $request['description'];
                $page->active = (isset($request['active']) ? 1 : 0);

                $page->save();
            } else {

                $page = Page::find($id);

                $page->title = $request['title'];
                $page->slug = $request['slug'];
                $page->meta_description = $request['meta_description'];
                $page->description = $request['description'];
                $page->active = (isset($request['active']) ? 1 : 0);

                $page->save();
            }

            Session::flash('flash_message', 'Email successfully updated!');

            //return redirect()->route('shippingaddress')->with('status', 'Address successfully updated!');
            return redirect()->route('admin.page', $id);
        }
    }

    public function getDiscount() {
        $adminuser = Auth::guard('admin')->user();
        $user_id = $adminuser->id;

        $categories = Category::all()->pluck('title', 'id');


        return view('admin.discount', ['categories' => $categories]);

    }

    public function postDiscount(Request $request) {
        $adminuser = Auth::guard('admin')->user();
        $user_id = $adminuser->id;

        $category_id = $request['category_id'];
        $discount = $request['discount'] / 100;

        $products = Product::where('category_id', $category_id)->get();

        foreach($products as $product) {
            if ($product->regular_price > 0) {
                $product->price = $product->regular_price - ($product->regular_price * $discount);
                $product->save();
            }

        }

        Session::flash('flash_message', 'Prices successfully updated!');
        return redirect()->route('admin.discount');
    }
}