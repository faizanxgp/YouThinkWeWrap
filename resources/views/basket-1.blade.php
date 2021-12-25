@extends('layouts.main')

@section('content')


    <div class="container">
        <div class="row form-group">
            <div class="col-xs-12">
                <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                    <li class="active"><a href="#step-1">
                        <h4 class="list-group-item-heading">Step 1</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-2">
                        <h4 class="list-group-item-heading">Step 2</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-3">
                        <h4 class="list-group-item-heading">Step 3</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-4">
                        <h4 class="list-group-item-heading">Step 4</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-5">
                        <h4 class="list-group-item-heading">Step 5</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-6">
                        <h4 class="list-group-item-heading">Step 6</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-7">
                        <h4 class="list-group-item-heading">Step 7</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>
                    <li class="disabled"><a href="#step-8">
                        <h4 class="list-group-item-heading">Step 8</h4>
                        <p class="list-group-item-text"></p>
                    </a></li>   
                </ul>
            </div>
        </div>
    </div>  

<form >
<div class="container">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1> STEP 1</h1>

                <h2>Step 1: Select Event </h2>
<input type="radio" name="event" id="a1" class="input-hidden" /> 
<label for="a1">Birthday<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event" id="a2" class="input-hidden" /> 
<label for="a2">Annivarsary<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event" id="a3" class="input-hidden" /> 
<label for="a3">Valentine Day<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event" id="a4" class="input-hidden" /> 
<label for="a4">Mother's Day<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event" id="a5" class="input-hidden" /> 
<label for="a5">Special Event<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<div class="text-center">
                <button id="activate-step-2" class="btn btn-primary btn-md">Activate Step 2</button>
</div>
            </div>
        </div>
    </div>
</div>

<div class="container">


    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 2</h1>

                <h2>Step 2: Select Basket Design </h2>
<input type="radio" name="event2" id="b1" class="input-hidden" /> 
<label for="b1">Design 1<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event2" id="b2" class="input-hidden" /> 
<label for="b2">Design 2<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event2" id="b3" class="input-hidden" /> 
<label for="b3">Design 3<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event2" id="b4" class="input-hidden" /> 
<label for="b4">Design 4<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<div class="text-center">
                <button id="activate-step-3" class="btn btn-primary btn-md">Activate Step 3</button>
</div>
                

            
                
                
            </div>
        </div>
    </div>

</div>
<div class="container">


    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 3</h1>
                <h2>Step 3: Select Package </h2>

                <input type="radio" name="event3" id="c1" class="input-hidden" /> 
                <label for="c1">Basic Package : 4 chocolates like kitkat snickers mars twix with regular wrapping<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

                <input type="radio" name="event3" id="c2" class="input-hidden" /> 
                <label for="c2">Premium Package: 5 chocolates like kitkat snickers mars twix bounty with premium wrapping<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>
                
            <div class="text-center">
                
                <button id="activate-step-4" class="btn btn-primary btn-md">Activate Step 4</button>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="container">

    
    <div class="row setup-content" id="step-4">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1 class="text-center"> STEP 4</h1>
                
<!--<form></form> -->                
                <button id="activate-step-5" class="btn btn-primary btn-md">Activate Step 5</button>
            </div>
        </div>
    </div>
</div>

<div class="container">

    
    <div class="row setup-content" id="step-5">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 5</h1>



                <h2>Step 5: Select Tags </h2>

                <div class="row">
                    <div class="col-xs-6">
                        <input type="radio" name="event5" value="1"> Hand Written <br />
                        <textarea rows="3"></textarea><br />

                    </div>
                    <div class="col-xs-6">

                        <input type="radio" name="event5" value="2"> Picture <br />
                        <input type="file" />
                    </div>
                </div>
                
<!--<form></form> -->        
<div class="text-center">        
                <button id="activate-step-6" class="btn btn-primary btn-md">Activate Step 6</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">

    
    <div class="row setup-content" id="step-6">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 6</h1>

                <h2>Step 6: Select Color Theme </h2>
            <input type="color" name="event61" value="#ff00ff"> Color 1 
            <input type="color" name="event62" value="#00ff00"> Color 2 (optional) <br />
                
<!--<form></form> -->                
                <button id="activate-step-7" class="btn btn-primary btn-md">Activate Step 7</button>
            </div>
        </div>
    </div>
</div>

<div class="container">

    
    <div class="row setup-content" id="step-7">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 7</h1>


                <h2>Step 7: Select Delivery Method </h2>
            <input type="radio" name="event7" value="1"> Self (Available in Lahore Only) <br />
            <input type="radio" name="event7" value="2"> By YTWW <br />

            <div class="row">
              <div class="col-md-6">
                <h3>Receiver's Info</h3>
                <div class="form-group">
                  <label>Name : </label><input class="form-control" type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Address Line 1 : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Address Line 2 : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>City : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Contact Number : </label><input class="form-control"  type="text" name="name">
                </div>
              </div>



              <div class="col-md-6">

                <h3>Sender's Info</h3>
                <div class="form-group">
                  <label>Name : </label><input class="form-control" type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Address Line 1 : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Address Line 2 : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>City : </label><input class="form-control"  type="text" name="name">
                </div>
                <div class="form-group">
                  <label>Contact Number : </label><input class="form-control"  type="text" name="name">
                </div>
              </div>
              </div>
                
<!--<form></form> -->                

<div class="text-center">
                <button id="activate-step-8" class="btn btn-primary btn-md">Activate Step 8</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">

    
    <div class="row setup-content" id="step-8">
        <div class="col-xs-12">
            <div class="col-md-12 well text-centerx">
                <h1 class="text-center"> STEP 8</h1>

<h2>Step 8: Payment Method </h2>
<input type="radio" name="event8" id="h1" class="input-hidden" /> 
<label for="h1">Cash On Delivery<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event8" id="h2" class="input-hidden" /> 
<label for="h2">Bank Transfer<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

<input type="radio" name="event8" id="h3" class="input-hidden" /> 
<label for="h3">Easy Paisa<br /><img src="{{ URL::to('src/images/radio-placeholder.png') }}" alt="" /></label>

                
<!--<form></form> -->       
<div class="text-center">         
                <button id="activate-step-9" class="btn btn-primary btn-md">Proceed to Confirmation</button>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

    

@endsection

@section('js')
<script>

// Activate Next Step

$(document).ready(function() {
    
    var navListItems = $('ul.setup-panel li a'),
        allWells = $('.setup-content');

    allWells.hide();

    navListItems.click(function(e)
    {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this).closest('li');
        
        if (!$item.hasClass('disabled')) {
            navListItems.closest('li').removeClass('active');
            $item.addClass('active');
            allWells.hide();
            $target.show();
        }
    });
    
    $('ul.setup-panel li.active a').trigger('click');
    
    // DEMO ONLY //
    $('#activate-step-2').on('click', function(e) {
        $('ul.setup-panel li:eq(1)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        $(this).remove();
    })
    
    $('#activate-step-3').on('click', function(e) {
        $('ul.setup-panel li:eq(2)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $(this).remove();
    })
    
    $('#activate-step-4').on('click', function(e) {
        $('ul.setup-panel li:eq(3)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-4"]').trigger('click');
        $(this).remove();
    })
    
    $('#activate-step-5').on('click', function(e) {
        $('ul.setup-panel li:eq(4)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-5"]').trigger('click');
        $(this).remove();
    })

    $('#activate-step-6').on('click', function(e) {
        $('ul.setup-panel li:eq(5)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-6"]').trigger('click');
        $(this).remove();
    })

    $('#activate-step-7').on('click', function(e) {
        $('ul.setup-panel li:eq(6)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-7"]').trigger('click');
        $(this).remove();
    })

    $('#activate-step-8').on('click', function(e) {
        $('ul.setup-panel li:eq(7)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-8"]').trigger('click');
        $(this).remove();
    })
});


// Add , Dlelete row dynamically

     $(document).ready(function(){
      var i=1;
     $("#add_row").click(function(){
      $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='name"+i+"' type='text' placeholder='Name' class='form-control input-md'  /> </td><td><input  name='sur"+i+"' type='text' placeholder='Surname'  class='form-control input-md'></td><td><input  name='email"+i+"' type='text' placeholder='Email'  class='form-control input-md'></td><td><select type='text' name='gender"+i+"' class='form-control'><option name='male"+i+"' value='male'>Male</option><option name='Female"+i+"' value='Female'>Female</option><option name='3rdgen"+i+"' value='none'>None</option></select></td>");

      $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
      i++; 
  });
     $("#delete_row").click(function(){
         if(i>1){
         $("#addr"+(i-1)).html('');
         i--;
         }
     });

});

</script>
@endsection
