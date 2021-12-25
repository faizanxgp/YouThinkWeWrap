<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Newsletter;

class MailChimpController extends Controller
{

    public function subscribe(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
        ]);

        try {
            Newsletter::subscribe($request['email']);
            Session::flash('flash_message', 'Email Subscribed successfully');
            return redirect()->back();
        } catch (\Mailchimp_List_AlreadySubscribed $e) {
            Session::flash('flash_message', 'Email is Already Subscribed');
            return redirect()->back();
        } catch (\Mailchimp_Error $e) {
            Session::flash('flash_message', 'Error from MailChimp');
            return redirect()->back();
        }
    }
}