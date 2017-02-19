<cfscript>
	head.title = 'Contact The Local Network';
	head.description = 'Contact The Local Network';
	include "/layout/template-open.cfm";
</cfscript>

<cfoutput><h1 class="page-header">#head.title#</h1></cfoutput>

<cfscript>
	param name="form.name" default="";
	param name="form.email" default="";
	param name="form.phone" default="";

	param name="form.street" default="";
	param name="form.city" default="";
	param name="form.state" default="";
	param name="form.zip" default="";

	param name="form.subject" default="";
	param name="form.message" default="";

	param name="form.referer" default="#cgi.http_referer#";
</cfscript>
<cfif structKeyExists(url, "submit")>

    <cfmail to="feedback@the-ln.com" from="feedback@the-ln.com" subject="TLN Feedback: #htmlEditFormat(form.subject)#" type="html">
        <cfoutput>
    		<dl>
    			<dt style="margin-top: 1em; font-weight: bold;">Subject</dt><dd>#htmlEditFormat(form.subject)#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">Message</dt><dd>#htmlEditFormat(form.message)#</dd>

    			<dt style="margin-top: 4em; font-weight: bold;">Name</dt><dd>#htmlEditFormat(form.name)#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">Email</dt><dd>#htmlEditFormat(form.email)#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">Phone</dt><dd>#htmlEditFormat(form.phone)#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">Address</dt><dd>
    				#htmlEditFormat(form.street)#<br>
    				#htmlEditFormat('#form.city#, #form.state# #form.zip#' )#</dd>

    			<dt style="margin-top: 4em; font-weight: bold;">Date</dt><dd>#DateFormat(Now(),'yyyy-mm-dd')# #TimeFormat(Now(),'hh:mm:ss tt')#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">IP Address</dt><dd>#REQUEST.remoteAddr#</dd>
    			<dt style="margin-top: 1em; font-weight: bold;">Referer</dt><dd>#paragraphFormat( form.referer )#</dd>

    		</dl>
        </cfoutput>
    </cfmail>


	<!--- <cfif isValid('email', htmlEditFormat(form.email))>
		<cfset thanksSettings = {
			to="#htmlEditFormat(form.email)#",
			from="feedback@the-ln.com" ,
			subject="The Local Network got your message",
			type="html"
		} />

		<cfmail attributecollection="#thanksSettings#">
			<h1>Thank you for your message!</h1>
			<h3>We will be reviewing your feedback, and if appropriate you'll hear back from us soon.</h3>
			<hr>
			<blockquote><cfoutput>#emailContent#</cfoutput></blockquote>
		</cfmail>
	</cfif> --->

</cfif>


<cfif structKeyExists(url, "submit")>
	<div class='alert alert-success'>
		<h1 class="alert-heading">Thank you for your message!</h1>
		<h3 class="alert-heading">We will be reviewing your feedback, and if appropriate you'll hear back from us soon.</h3>
	</div>
</cfif>

<div class="row">
	<div class="span6 offset1">


		<cfoutput>
		<form class="form-horizontal" action="#cgi.script_name#?submit=true" method="POST">
			<input type="hidden" name="referer" value="#form.referer#" />
			<fieldset>

				<div class="control-group">
					<label class="control-label" for="name">Your Full Name</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="name" name="name" value="#htmlEditFormat(form.name)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="email">E-Mail Address</label>
					<div class="controls">
						<input type="email" class="input-xlarge" id="email" name="email" value="#htmlEditFormat(form.email)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="phone">Phone Number</label>
					<div class="controls">
						<input type="tel" class="input-xlarge" id="phone" name="phone" value="#htmlEditFormat(form.phone)#">
					</div>
				</div>


				<div class="control-group">
					<label class="control-label" for="street">Street Address</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="street" name="street" value="#htmlEditFormat(form.street)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="city">City</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="city" name="city" value="#htmlEditFormat(form.city)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="state">State</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="state" name="state" value="#htmlEditFormat(form.state)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="zip">Zip Code</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="zip" name="zip" value="#htmlEditFormat(form.zip)#">
					</div>
				</div>


				<div class="control-group">
					<label class="control-label" for="subject">Message Subject</label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="subject" name="subject" value="#htmlEditFormat(form.subject)#">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="message">Message</label>
						<div class="controls">
						<textarea class="input-xlarge" rows="8" id="message" name="message">#htmlEditFormat(form.message)#</textarea>
					</div>
				</div>

				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Send Message</button>
					<button type="reset" class="btn">Cancel</button>
				</div>
			</fieldset>
		</form>
		</cfoutput>
	</div>
	<div class="span3 offset1">
		<address id="contactAdress">
			<strong>The Local Network LLC</strong>
			Attn: Jason W. Rushton
			2847 East 1290 South
			St. George, UT 84790
		</address>
		<ul class="nav nav-tabs nav-stacked">
			<li><a href="/legal/TermsAndConditions.cfm">Terms and Conditions of Use</a></li>
			<li><a href="/legal/PrivacyPolicy.cfm">Privacy Policy</a></li>
			<li><a href="/legal/ContentGuidelines.cfm">Content Policies and Guidelines</a></li>
		</ul>
	</div>
</div>




<cfscript>
	include "/layout/template-close.cfm";
</cfscript>
