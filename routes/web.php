<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('home');
});

Auth::routes();

//Route::get('/user/logout', 'Auth\LoginController@userlogout')->name('user.logout');
Route::get('/user/logout', 'HomeController@logout')->name('user.logout');

#Email
Route::get('register/verify/{token}', 'Auth\RegisterController@verify');

Route::group(['middleware' => ['web']], function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/product/{id}', 'HomeController@getProduct')->name('product');
    Route::get('/category/{id}', 'HomeController@getCategory')->name('category');
    Route::get('/category-modal/{id}', 'HomeController@getCategoryModal')->name('category-modal');

    Route::post('/cart/add', 'HomeController@postAddCart')->name('add-cart');
    Route::get('/cart/delete/{id}', 'HomeController@getRemoveCart')->name('remove-cart');
    Route::post('/cart/update', 'HomeController@postUpdateCart')->name('update-cart');
    Route::get('/cart', 'HomeController@getCart')->name('cart');

    Route::get('/checkout', 'HomeController@getCheckout')->name('checkout');
    Route::post('/checkout', 'HomeController@postCheckout')->name('checkout');

    Route::post('/cart-finished', 'HomeController@postCartFinished')->name('cart-finished');
    Route::post('/cart-finished-basket', 'HomeController@postCartFinishedBasket')->name('cart-finished-basket');

    Route::get('/basket', 'HomeController@getBasket')->name('basket');

    Route::post('/apply-coupon', 'HomeController@postApplyCoupon')->name('apply-coupon');

    Route::get('/user/update', 'HomeController@getUpdateUser')->name('update-user');
    Route::post('/user/submit-account', 'HomeController@postUpdateAccount')->name('account.submit');
    Route::post('/user/submit-update', 'HomeController@postUpdateUser')->name('update-user.submit');

    Route::get('/page/{slug}', 'HomeController@getPage')->name('page');


    Route::get('/addcart', 'HomeController@ajaxAddCart')->name('addcart');

    Route::get('/track-order', 'HomeController@getTrackOrder')->name('track-order');
    Route::get('/search', 'HomeController@getSearch')->name('search');
    Route::get('/tag/{id}', 'HomeController@getTag')->name('tag');

});

Route::prefix('admin')->group(function () {

    Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login');
    Route::post('/login', 'Auth\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/', 'AdminController@index')->name('admin.dashboard');
    Route::post('/logout', 'Auth\AdminLoginController@logout')->name('admin.logout');

    Route::get('/account', 'AdminController@getAccount')->name('admin.account');
    Route::post('/account/update', 'AdminController@postAccount')->name('admin.account.submit');

    // Password reset routes
    Route::post('/password/email', 'Auth\AdminForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('/password/reset', 'Auth\AdminForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('/password/reset', 'Auth\AdminResetPasswordController@reset');
    Route::get('/password/reset/{token}', 'Auth\AdminResetPasswordController@showResetForm')->name('admin.password.reset');

    Route::get('/products', 'AdminController@getProducts')->name('admin.products');
    Route::get('/product/{id?}', 'AdminController@getProduct')->name('admin.product');
    Route::post('/update-product', 'AdminController@postProduct')->name('admin.update-product');

    Route::get('/setting', 'AdminController@getSetting')->name('admin.setting');
    Route::post('/update-setting', 'AdminController@postSetting')->name('admin.update-setting');

    Route::get('/discount', 'AdminController@getDiscount')->name('admin.discount');
    Route::post('/update-discount', 'AdminController@postDiscount')->name('admin.update-discount');

    Route::get('/categories', 'AdminController@getCategories')->name('admin.categories');
    Route::get('/category/{id?}', 'AdminController@getCategory')->name('admin.category');
    Route::post('/update-category', 'AdminController@postCategory')->name('admin.update-category');

    Route::get('/tags', 'AdminController@getTags')->name('admin.tags');
    Route::get('/tag/{id?}', 'AdminController@getTag')->name('admin.tag');
    Route::post('/update-tag', 'AdminController@postTag')->name('admin.update-tag');

    Route::get('/coupons', 'AdminController@getCoupons')->name('admin.coupons');
    Route::get('/coupon/{id?}', 'AdminController@getCoupon')->name('admin.coupon');
    Route::post('/update-coupon', 'AdminController@postCoupon')->name('admin.update-coupon');

    Route::get('/testimonials', 'AdminController@getTestimonials')->name('admin.testimonials');
    Route::get('/testimonial/{id?}', 'AdminController@getTestimonial')->name('admin.testimonial');
    Route::post('/update-testimonial', 'AdminController@postTestimonial')->name('admin.update-testimonial');


    Route::get('/users', 'AdminController@getUsers')->name('admin.users');
    Route::get('/user/{id?}', 'AdminController@getUser')->name('admin.user');
    Route::post('/update-user', 'AdminController@postUser')->name('admin.update-user');

    

    Route::get('/orders', 'AdminController@getOrders')->name('admin.orders');
    Route::get('/order/{id?}', 'AdminController@getOrder')->name('admin.order');
    Route::post('/update-order', 'AdminController@postOrder')->name('admin.update-order');

    Route::get('/user/{id}', 'AdminController@getUser')->name('admin.user');

    Route::get('/pages', 'AdminController@getPages')->name('admin.pages');

    Route::get('/page/{id}', 'AdminController@getPage')->name('admin.page');

    Route::post('/page', 'AdminController@postPage')->name('admin.updatepage');

});



Route::get('auth/{provider}', 'Auth\RegisterController@redirectToProvider');
Route::get('auth/{provider}/callback', 'Auth\RegisterController@handleProviderCallback');


Route::post('/subscribe', 'MailChimpController@subscribe')->name('subscribe');