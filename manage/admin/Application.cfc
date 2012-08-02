<cfcomponent output="false">

	<!--- Application.cfc configuration --->
	<cfscript>
		this.name = "ManageTheLocalNetwork-Administration";
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

		this.sessionmanagement = "false";
		//this.sessiontimeout = createTimeSpan(0,0,15,0);

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
			application.paths.rel.root = '/manage/admin';
			
			application.host.machineName = CreateObject("java", "java.net.InetAddress").getLocalHost().getHostName();
			application.host.addr = CreateObject("java", "java.net.InetAddress").getLocalHost().getHostAddress();
			
			application.isDev = (application.host.machineName EQ "DEV" OR application.host.machineName EQ "Jason-PC");
			application.isProd = (NOT application.isDev);
			
			initCacheSettings();
			initComponents();
	
			return true;
		}
		
		
		
		public void function onRequestStart(required string thePage){
			if(structKeyExists(url, "reset")){
				resetHandler();
			}
			
			request.remoteAddr = application.util.net.getRemoteAddr();
			if(application.isDev){
				initCacheSettings();
				initComponents();
			}
		}
		
		
		
		public void function onRequestEnd(required string thePage){}
		
		
		
		//public void function onSessionStart(){}
		
		
	</cfscript>
	 




	<!--- Application.cfc utility functions --->
	<cfscript>
		
		
		
		private void function initComponents(){
			application.util.net = new lib.cfc.net();
			application.util.cfscript = new lib.cfc.cfscript();
		}
		
		
		
		private void function initCacheSettings(){}
		
		
		
	
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

		<cfdump var="#arguments#">

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