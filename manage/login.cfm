<cfscript>
	include "/layout/template-open.cfm";
	
	param name="form.username" default="";  
	param name="form.password" default="";
</cfscript>


<div class="row">
	<div class="span6 offset3">
		<cfoutput>
		<form class="form-horizontal" action="#cgi.script_name#/?login=true" method="POST">
			<fieldset>
				<legend>Login to Management Console</legend>
				<div class="control-group">
					<label class="control-label" for="username">Username</label>
					<div class="controls">
						<input type="text" class="input-xlarge" name="username" id="username" value="#htmlEditFormat(form.username)#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" class="input-xlarge" name="password" id="password">
					</div>
				</div>
			</fieldset>
			
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Process Login</button>
			</div>
		</form>
		</cfoutput>
		
	</div>
</div>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>