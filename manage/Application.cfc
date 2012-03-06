<cfcomponent output="false">

	<!--- Application.cfc configuration --->
	<cfscript>
		this.name = "ManageTheLocalNetwork";
		this.ApplicationTimeout = createTimeSpan(1,0,0,0);
		//this.loginstorage = "cookie" ;

		this.setClientCookies = "true";
		this.setDomainCookies = "true";
		this.ScriptProtect = "no";
		this.datasource = "TheLocalNetwork";
			
		this.smtpserversettings = {
			server = "email-smtp.us-east-1.amazonaws.com",
			username = "AKIAJL44YTZUFPZI7O6Q",
			password = "AhTLX4Eux2pvd6MbAac61HQcIXLvOKi8CIgOGjpAnBk7",
			port = "465",
			usessl = "true",
			usetls = "false"
		};

		this.sessionmanagement = "true";
		this.sessiontimeout = createTimeSpan(0,0,15,0);

		this.clientmanagement= "false";
		//this.clientStorage = "CF_ClientVariables";


		/* define custom coldfusion mappings. Keys are mapping names, values are full paths */
		this.mappings = {
			'/layout' = expandPath('./layout'),
			'/cfc' = expandPath('./cfc')
		};

		/* define a list of custom tag paths. */
		//this.customtagpaths = "";
	</cfscript>
	 



	
	<!--- Application.cfc framework --->
	<cfscript>		
		public boolean function onApplicationStart(){
			application.paths.rel.root = '/manage';
			
			initComponents();
	
			return true;
		}
		
		
		
		public void function onRequestStart(required string thePage){
			if(structKeyExists(url, "reset")){
				resetHandler();
			}
			
			request.remoteAddr = application.cfc.net.getRemoteAddr();
			if(request.remoteAddr EQ "127.0.0.1"){
				initComponents();
			}
			
			checkAuth();
		}
		
		
		
		public void function onRequestEnd(required string thePage){}
		
		
		
		public void function onSessionStart(){
			session.dateInitialized = now();
			session.user = application.cfc.auth.getDefaultUser();
		}
		
		
	</cfscript>
	 




	<!--- Application.cfc utility functions --->
	<cfscript>
		
		
		
		private void function checkAuth(){
			if(isUserAttemptingAuth()){
				session.user = application.cfc.auth.getUserByAuth(form.username, form.password);
				if(session.user.getId()){
					location(url="#application.paths.rel.root#/", addtoken="no");
				}
			}
			if(NOT session.user.getId()){
				include "login.cfm";
				abort;
			}
		}
		
		
		
		private boolean function isUserAttemptingAuth(){
			return (
				structKeyExists(url, "login")
				
				AND structKeyExists(form, "username")
				AND len(trim(form.username))
				
				AND structKeyExists(form, "password")
				AND len(trim(form.password))
			);
		}
		
		
		
		private void function initComponents(){
			application.cfc.net = new lib.cfc.net();
			application.cfc.cfscript = new lib.cfc.cfscript();
			application.cfc.auth = new cfc.auth();
			application.cfc.userContent = new lib.cfc.TheLocalNetwork.userContent();
		}
		
	
		private void function resetHandler(){
			if (url.reset EQ "app"){
				resetApp();
			}
			else if (url.reset EQ "client"){
				resetClient();
			}
			else if (url.reset EQ "user"){
				structClear(session);
				setCookie(name="jsessionid", expires="now");
				getPageContext().getSession().invalidate();
				/*
				setCookie(name="cftoken", expires="now");
				setCookie(name="cfid", expires="now");
				*/
			}
			else if (url.reset EQ "cache"){
				resetCache();
			}
			
			location(url="#application.paths.rel.root#/", addtoken="no");
		}
		
		
		private void function resetApp(){
			resetCache();
			applicationStop();
		}
		
		
		private void function resetClient(){
			local.clientVars = structKeyArray(client);
			for(local.ixCVar IN local.clientVars){
				deleteClientVariable(local.ixCVar);
			}
		}
		
		
		private void function resetCache(){
			local.cacheIdArray = cacheGetAllIds();
			for(local.ixCacheId IN local.cacheIdArray){
				cacheRemove(local.ixCacheId);
			}
		}
	</cfscript>
	 
	 
	 


	<!--- Runs before request as well, after onRequestStart --->
	<!---
	WARNING!!!!! THE USE OF THIS METHOD WILL BREAK FLASH REMOTING, WEB SERVICES, AND AJAX CALLS.
	DO NOT USE THIS METHOD UNLESS YOU KNOW THIS AND KNOW HOW TO WORK AROUND IT!
	EXAMPLE: http://www.coldfusionjedi.com/index.cfm?mode=entry&entry=ED9D4058-E661-02E9-E70A41706CD89724
	--->
	<!--- <cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">



		<cfinclude template="#arguments.thePage#">
	</cffunction> --->



	<!---
	<!--- Runs when your session starts --->
	<cffunction name="onSessionStart" returnType="void" output="false">
	</cffunction>

	<!--- Runs when session ends --->
	<cffunction name="onSessionEnd" returnType="void" output="false">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" type="struct" required="false">
	</cffunction>
	 --->

	<!--- Run when application stops --->
	<!---<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>--->





	<!--- Runs on error --->
	<!---<cffunction
		name="onError"
		access="public"
		returntype="void"
		output="true"
		hint="I handle any uncaught errors within the application.">


		<!--- Return out. --->
		<cfreturn />
	</cffunction>--->
	
	
	

	<!--- Fired when user requests a CFM that doesn't exist. --->
	<!---<cffunction name="onMissingTemplate" returnType="boolean" output="false">
		<cfargument name="targetpage" required="true" type="string">
		<cfinclude template="~404.cfm">
		<cfreturn true>
	</cffunction>--->
	
	<cffunction name="setCookie" access="private" returnType="void" output="false">
		<cfargument name="name" type="string" required="true">
		<cfargument name="value" type="string" required="false">
		<cfargument name="expires" type="any" required="false">
		<cfargument name="domain" type="string" required="false">
		<cfargument name="httpOnly" type="boolean" required="false">
		<cfargument name="path" type="string" required="false">
		<cfargument name="secure" type="boolean" required="false">
		<cfset var args = {}>
		<cfset var arg = "">
		<cfloop item="arg" collection="#arguments#">
		    <cfif not isNull(arguments[arg])>
		        <cfset args[arg] = arguments[arg]>
		    </cfif>
		</cfloop>
		
		<cfcookie attributecollection="#args#">
	</cffunction>
</cfcomponent>