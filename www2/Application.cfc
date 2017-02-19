<cfcomponent output="false">

	<!--- Application.cfc configuration --->
	<cfscript>
		this.name = "TheLocalNetwork";
		this.ApplicationTimeout = createTimeSpan(1,0,0,0);
		//this.loginstorage = "cookie" ;

		this.setClientCookies = "no";
		this.setDomainCookies = "no";
		this.ScriptProtect = "no";

		this.sessionmanagement = "no";
		//this.sessiontimeout = createTimeSpan(0,0,0,1);

		this.clientmanagement= "no";
		//this.clientStorage = "CF_ClientVariables";


		/* define custom coldfusion mappings. Keys are mapping names, values are full paths */
		this.mappings = {
			'/layout' = expandPath('../layout')
		};

		/* define a list of custom tag paths. */
		//this.customtagpaths = "";
	</cfscript>





	<!--- Application.cfc framework --->
	<cfscript>
		public boolean function onApplicationStart(){
			request.isDev = false;
			application.canon.domain = "the-local-network.com";

			initComponents();
			generateCachedQueries();

			return true;
		}



		public void function onRequestStart(required string thePage){
			if(structKeyExists(url, "reset")){
				resetHandler();
			}

			request.remoteAddr = application.cfc.net.getRemoteAddr();

			redirectsHandler();
			devModeHandler();
		}



		public void function onRequestEnd(required string thePage){
			if(structKeyExists(url, "isDev")){
				application.isDev = false;
			}
		}
	</cfscript>





	<!--- Application.cfc utility functions --->
	<cfscript>

		private void function initComponents(){
			application.cfc.net = new lib.cfc.net();
		}



		private void function generateCachedQueries(){
		}


		private void function resetHandler(){
			if (url.reset EQ "app"){
				resetApp();
			}
			else if (url.reset EQ "client"){
				resetClient();
			}
			else if (url.reset EQ "cache"){
				resetCache();
			}

			location(url="/", addtoken="no");
		}


		private void function resetApp(){
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
		private void function redirectsHandler(){
			if (
				CGI.SERVER_NAME NEQ application.canon.domain
				AND NOT CGI.SERVER_NAME CONTAINS "dev"
				AND NOT CGI.SERVER_NAME CONTAINS "hostek"
			){
				local.scriptPath = application.cfc.net.getScriptNameWithQuery();
				if(local.scriptPath EQ "/default.cfm"){
					local.scriptPath = "/";
				}
				local.redirectTo = "http://#lcase(application.canon.domain)#" & local.scriptPath;
			}



			if(structKeyExists(local, "redirectTo")){
				location(
					url = local.redirectTo,
					addtoken = false,
					statuscode = 301
				);
			}

		}


		private void function devModeHandler(){
			if(request.remoteAddr EQ "127.0.0.1"){
				initComponents();
				request.isDev = true;
			}

			if(structKeyExists(url, "noDev")){
				request.isDev = false;
			}
			else if(structKeyExists(url, "isDev")){
				request.isDev = true;
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

</cfcomponent>
