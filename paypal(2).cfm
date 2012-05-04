<cfimport taglib="/muraWRM/WRA/cfUniform/tags/forms/cfUniForm" prefix="uform" />
<cfparam name="form.OTHER" type="string" default="" />
<cfparam name="form.DONATIONTYPE" type="string" default="" />
<cfparam name="form.SELECTBOX" type="string" default="" />
<cfparam name="form.first_name" type="string" default="" />
<cfparam name="form.last_name" type="string" default="" />
<cfparam name="form.CONTACTNUMBER" type="string" default="" />
<cfparam name="form.email" type="string" default="" />
<cfparam name="form.EMAILADDRESS2" type="string" default="" />
<cfparam name="form.ADDRESS1" type="string" default="" />
<cfparam name="form.NEWSLETTER" type="string" default="" />
<cfparam name="form.SUBMITBUTTON" type="string" default="" />
<cfparam name="form.FORMID" type="string" default="" />
<style type="text/css">
body {
	font-family:Arial, Helvetica, sans-serif;
}
#primary form {
    max-width: 957px;
}

#myradio label {
	display:inline;
	position:relative;
	top:.025em;
	float:none;
	margin-right:-0.25em;
}
#myradio input {
	display:inline;
	width:auto;
	float:none;
	margin-right:10px;
	margin-left:5px;
}
#cfUniForm-form-container, form.uniForm  {
	width: 970px;
	margin: auto;
}
.mypound label {
	display:inline;
	position:relative;
	top:.025em;
	float:none;
	text-align:right;
}
.mypound input {
	display:inline;
	width:auto;
	float:none;
	margin-right:10px;
}
.formHint {
	color:red !important;
	font-style:italic;
}
em {
	color:red;
}
.inlineLabel  {
	line-height:5em;
}
#donateusd .uniForm .inlineLabels ul li label {
    display: block;
    float: none;
	width: 50%;
	text-align:left;
}
#donateusd .uniForm .inlineLabels .textInput, #donateusd .uniForm .inlineLabels .fileUpload, #donateusd .uniForm .inlineLabels .selectInput, #donateusd .uniForm .inlineLabels select, #donateusd .uniForm .inlineLabels textarea {
float: left;
width:50%;
}
#donateusd label, #donateusd  p.fieldLabel, #donateusd form li.mura-form-radio p, #donateusd form li.mura-form-checkbox p {
text-align: left;
margin-top:-5px;
}
#setlabelright label {
	text-align: right;
}
#setlabelright2 label {
	text-align: right;
}
.required {
color: #000000;
}
#btnone,#btntwo {
	text-align:right;
}
</style>
<cfscript>
	// let's create an error struct for the sake of demonstration
	errs = structNew();
</cfscript>
<script type="text/javascript">
 $(document).ready(function() {
 	$(".cfUniForm-form-container em").css("margin-left","50px");
	var US = $("fieldset.#american").html();
	var UK = $("fieldset.#british").html();
	$('.mypound').hide();
	$('input.other').hide(); // hide all first
	$('#american').hide();
	$('#british').hide();
	$("#dollarBtn,#poundBtn").mouseover(function() {
    $(this).css('cursor', 'pointer');
 	});
	$('#dollarBtn').click( function() {
		$('#british').hide();
		$('#american').show();
		$("fieldset.#american").html(US);
		$("fieldset.#british").html("");
		$('input.other').hide();
		$('.mypound').hide();
		$('#american').find('*').attr('disabled', false);
	 });
	$('#poundBtn').click( function() {
		$('#american').hide();
		$('#british').show();
		$("fieldset.#american").html("");
		$("fieldset.#british").html(UK);
		$('input.other').hide();
		$('.mypound').hide();
		$('#british').find('*').attr('disabled', false);
	 });
    $('input[type="radio"]').click( function() {
        //$('input.hide_input').hide(); // hide all on click
        if( $(this).hasClass('show_input') ) { // only if the radio button has a dob-field
$('.mypound').show();
         $('input.other').show();// show only the following first
        }
		if( $(this).hasClass('hide_input') ) { // only if the radio button has a dob-field
$('.mypound').hide();
         $('input.other').hide();// show only the following first
		 $('input.other').attr('value', '');
        }
    });

	$('.other').bind('keyup keypress blur', function() 
	{  
    $('#other').val($(this).val()); 
});

})
</script>
<cfif StructKeyExists(form, "cmd")>
<cfinclude template="/WRA/includes/display_objects/custom/paypal_redirect.cfm" />
<cfabort>
<cfelse>
<div class="cfUniForm-form-container" id="cfUniForm-form-container">
  <uform:form action="https://www.paypal.com/cgi-bin/webscr"
					name="donateform"
					id="frm84D5AC611CC070ABCBCCB99810E1147A"
					cancelAction="index.cfm"
					errors="#errs#"
					errorMessagePlacement="both"
					okMsg=""
					showSubmit="false"
					submitValue="Submit Donation"
					loadjQuery="false"
					loadValidation="true"
			>
    <uform:fieldset legend="">
      <p>By supporting the White Ribbon Alliance you are helping to make pregnancy and childbirth the joyful time it should be for all families.   Your donation will make a real difference to the lives of so many people. </p>
      <div id="dollar_container" style="text-align:center;"> <img title="Click to pay in US dollars" id="dollarBtn" src="/WRA/assets/image/dollar-buttons.jpg" width="175" height="140" alt="Pay in US Dollars" /> <img title="Click to pay in pounds" id="poundBtn" src="/WRA/assets/image/british-pounds.jpg" width="175" height="140" alt="Pay in British Pounds" /> </div>
    </uform:fieldset>
    <uform:fieldset legend="Please choose the amount by selecting one of the boxes below:" id="american">
    <input name="usdollarsindicator" type="hidden" value="true" />
      <uform:field type="custom">
        <p align="center" id="myradio">
          <label>$25.00 </label>
          <input checked="checked" class="hide_input" name="amount" type="radio" value="25.00" onclick="changeState(this,'us')"/>
          <label>$50.00</label>
          <input class="hide_input" name="amount" type="radio" value="50.00" onclick="changeState(this,'us')"/>
          <label>$100.00</label>
          <input class="hide_input" name="amount" type="radio" value="100.00" onclick="changeState(this,'us')"/>
          <label>$250.00</label>
          <input class="hide_input" name="amount" type="radio" value="250.00" onclick="changeState(this,'us')"/>
          <label>$500.00</label>
          <input class="hide_input" name="amount" type="radio" value="500.00" onclick="changeState(this,'us')"/>
          <label>$1000.00</label>
          <input class="hide_input" name="amount" type="radio" value="1000.00" onclick="changeState(this,'us')"/>
          <label>other amount</label>
          <input class="show_input" id="other" name="amount" type="radio" value="" onclick="changeState(this,'us')"/>
        </p>
        <div style="width:320px; margin:0 auto;">
          <p id="setlabelright" class="mypound">
            <label>$</label>
            <input class="other" name="other" type="text" value="" />
          </p>
        </div>
        <p class="formHint">All online donations are securely processed by PayPal.</p>
      </uform:field>
      <uform:field label="How you want to make your donation" name="donationtype" type="radio" isRequired="true" hint="Fields marked with a * are mandatory">
        <uform:radio label="Visa" 
								value="1" 
								isChecked="false" />
        <uform:radio label="Mastercard" 
								value="2" 
								isChecked="false" />
       <uform:radio label="American Express" 
								value="3" 
								isChecked="false" />
        <uform:radio label="Discover" 
								value="4" 
								isChecked="false" />
      </uform:field>
      <uform:field label="Title:" name="selectbox" type="select" isRequired="true">
        <uform:option display="Choose One" value="" />
        <uform:option display="Dr." value="1" />
        <uform:option display="Mr." value="2" />
        <uform:option display="Ms." value="3" />
        <uform:option display="Mrs." value="4" />
        <uform:option display="Miss" value="4" />
      </uform:field>
      <uform:field label="First Name:" 
							name="first_name" 
							isRequired="true" 
							type="text"
                            maxFieldLength="34" 
							value="" />
      <uform:field label="Last Name:" 
							name="last_name" 
							isRequired="true" 
							type="text"
                            maxFieldLength="64" 
							value="" />
      <uform:field label="Contact Number:" 
							name="contactnumber" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Email Address:" 
							name="email" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Re-type Email Address:" 
							name="emailAddress2" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Billing Address:"
            				name="address1"
                            isRequired="true"
                            type="text"
                            value="" />
      <uform:field label="Zip/Post Code:"
            				name="zip"
                            isRequired="true"
                            type="text"
                            value="" />
      <uform:field label="Please keep me informed by email <br />about what the White Ribbon Alliance is doing: " type="radio" isRequired="true" name="newsletter">
        <uform:radio label="yes" 
								value="1" 
								isChecked="false" />
        <uform:radio label="No" 
								value="2" 
								isChecked="false" />
      </uform:field>
<uform:field type="custom">
<div id="btnone">
<input name="currency_code" type="hidden" value="USD" />
<input name="cmd" type="hidden" value="_s-xclick" /> <input name="hosted_button_id" type="hidden" value="B6LCEK4HET8XE" /> <input alt="PayPal - The safer, easier way to pay online!" border="0" class="pbutton" height="47" cmd="_donations" name="submit" src="https://www.paypalobjects.com/WEBSCR-640-20110401-1/en_US/i/btn/btn_donateCC_LG.gif" type="image" width="147" /> <img alt="" border="0" height="1" src="https://www.paypalobjects.com/WEBSCR-640-20110401-1/en_US/i/scr/pixel.gif" width="1" />
</div>
</uform:field>
    </uform:fieldset>
    <uform:fieldset legend="Please choose the amount by selecting one of the boxes below:" id="british">
    <input name="britishpoundssindicator" type="hidden" value="true" />
      <uform:field type="custom">
        <p align="center" id="myradio">
          <label>&pound;25.00 </label>
          <input checked="checked" class="hide_input" name="amount" type="radio" value="25.00" onclick="changeState(this.'uk')" />
          <label>&pound;50.00</label>
          <input class="hide_input" name="amount" type="radio" value="50.00" onclick="changeState(this.'uk')"/>
          <label>&pound;100.00</label>
          <input class="hide_input" name="amount" type="radio" value="100.00" onclick="changeState(this.'uk')"/>
          <label>&pound;250.00</label>
          <input class="hide_input" name="amount" type="radio" value="250.00" onclick="changeState(this.'uk')"/>
          <label>&pound;500.00</label>
          <input class="hide_input" name="amount" type="radio" value="500.00" onclick="changeState(this.'uk')"/>
          <label>&pound;1000.00</label>
          <input class="hide_input" name="amount" type="radio" value="1000.00" onclick="changeState(this.'uk')"/>
          <label>other amount</label>
          <input class="show_input" id="other" name="amount" type="radio" value="" onclick="changeState(this.'uk')"/>
        </p>
        <div style="width:320px; margin:0 auto;">
          <p id="setlabelright2" class="mypound">
            <label>&pound;</label>
            <input class="other" name="other" type="text" value="" />
          </p>
        </div>
        <p class="formHint">All online donations are securely processed by PayPal.</p>
      </uform:field>

      <uform:field label="How you want to make your donation" name="donationtype" type="radio" isRequired="true" hint="Fields marked with a * are mandatory">
        <uform:radio label="Visa" 
								value="1" 
								isChecked="false" />
        <uform:radio label="Mastercard" 
								value="2" 
								isChecked="false" />
       <uform:radio label="American Express" 
								value="3" 
								isChecked="false" />
        <uform:radio label="Discover" 
								value="4" 
								isChecked="false" />
      </uform:field>
      <uform:field label="Title:" name="selectbox" type="select" isRequired="true">
        <uform:option display="Choose One" value="" />
        <uform:option display="Dr." value="1" />
        <uform:option display="Mr." value="2" />
        <uform:option display="Ms." value="3" />
        <uform:option display="Mrs." value="4" />
        <uform:option display="Miss" value="4" />
      </uform:field>
      <uform:field label="First Name:" 
							name="first_name" 
							isRequired="true" 
							type="text"
                            maxFieldLength="34" 
							value="" />
      <uform:field label="Last Name:" 
							name="last_name" 
							isRequired="true" 
							type="text"
                            maxFieldLength="64" 
							value="" />
      <uform:field label="Contact Number:" 
							name="contactnumber" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Email Address:" 
							name="email" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Re-type Email Address:" 
							name="emailAddress2" 
							isRequired="true" 
							type="text" 
							value="" />
      <uform:field label="Billing Address:"
            				name="address1"
                            isRequired="true"
                            type="text"
                            value="" />
     <uform:field label="Zip/Post Code:"
            				name="zip"
                            isRequired="true"
                            type="text"
                            value="" />
     <uform:field label="Gift Aid" 
							name="giftaid" 
							type="checkboxgroup">
        <uform:checkbox label="Increase the value of your donation by 25%:<br />If you are a UK taxpayer, the value of your donation can be increased by a quarter through the Gift Aid scheme - at no extra cost to you.<br /><span style='color:red; font-style:italic;'>This means, for example, a &pound;10 donation would be worth &pound;12.50 to us.</span><br />Please tick the box on the left to join the scheme and increase the value of your gift to The White Ribbon Alliance." value="1" hint="" isChecked="false" class="fixLabel" />
      </uform:field>
      <uform:field label="Please keep me informed by email <br />about what the White Ribbon Alliance is doing: " type="radio" isRequired="true" name="newsletter">
        <uform:radio label="yes" 
								value="1" 
								isChecked="false" />
        <uform:radio label="No" 
								value="2" 
								isChecked="false" />
      </uform:field>
<uform:field type="custom">
<div id="btntwo">
<input name="hosted_button_id" type="hidden" value="KZYW9X3YXJHBN" /> <input name="currency_code" type="hidden" value="GBP" /> <input alt="PayPal - The safer, easier way to pay online!" border="0" class="pbutton" height="47" name="submit" src="https://www.paypalobjects.com/WEBSCR-640-20110401-1/en_US/i/btn/btn_donateCC_LG.gif" type="image" width="147" />
			<input name="cmd" type="hidden" value="_s-xclick" />
</div>
</uform:field>
    </uform:fieldset>
  </uform:form>
</div>
</cfif>
<script type="application/javascript">
 	var error = false;
	document.getElementById('frm84D5AC611CC070ABCBCCB99810E1147A').onsubmit = function(ex){
		ex.preventDefault();
		validateEmail();
	}
	
	validateEmail = function(){
		try
		{
			var exprn =  /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			if(exprn.test(document.getElementById('emailAddress2').value)){
				if(document.getElementById('emailAddress2').value == document.getElementById('email').value){
					error = false;
				}else{
					error = true;
					alert("Email Fields dont match");
				}
			}else{
				alert("Invalid Email Address");
			}
		}
		catch(er){
			alert(er.message);
		}
		return false;
	}
	//This function toggles the state of the text box when radio button is ckicked
	function changeState(me,country){
		if(me.className == 'show_input' && country == 'us'){
			$("p.#setlabelright").show();
			$('input.other').show();
		}else{
			$("p.#setlabelright").hide();
			//$('input.other').show();
		}
		if(me.className == 'show_input' && country == 'uk'){
			$("p.#setlabelright2").show();
			$('input.other').show();
		}else{
			$("p.#setlabelright2").hide();
			//$('input.other').show();
		}
	}
	$("input.#other").bind('onchange',function(){
		alert("Changed");
	})
 </script>