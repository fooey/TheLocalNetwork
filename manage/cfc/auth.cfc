component 
output="false" {
	
	variables.salt = 'C0606BFF-F1B1-ACAC-7CA450132798688B';
	variables.extraHashIterations = 1024;
	variables.adminHash = '22F3305039C63D2AFEB7EB64D7AD1E24324F9452AD060C88B548705915F9846FE668EB30002AA416DAA46D8C4D415D69BD25F4C7E1AC031009E3E0FCCA7AECB9';
	
	
	public function getUserByAuth(username, password) {
		arguments.username = trim(arguments.username);
		arguments.password = trim(arguments.password);
		local.passwordHash = getPasswordHash(arguments.password);
		
		if(arguments.username EQ "sysadmin" AND local.passwordHash EQ variables.adminHash){
			return new cfc.beans.user(1, 'sysadmin', 'Administrator');
		}
		return getDefaultUser();
	}
	
	public cfc.beans.user function getDefaultUser() {
		return new cfc.beans.user(0, 'Not Logged In', 'Not Logged In');
	}
	
	
	
	public function getPasswordHash(password) {
		local.hashed = doHash(arguments.password);
		
		for(local.i = 1; local.i LTE variables.extraHashIterations; local.i++){
			local.hashed = doHash(local.hashed);
		}
		
		return local.hashed;
	}
	
	
	
	public function doHash(inString) {
		return hash(arguments.inString & variables.salt, 'SHA-512');
	}
}