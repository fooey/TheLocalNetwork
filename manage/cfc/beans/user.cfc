component
accessors="true" 
output="false"
{
	property name="id" type="numeric";
	property name="username" type="any";
	property name="name" type="any";
	
	public function init(id,username,name){
		variables.id = arguments.id;
		variables.username = arguments.username;
		variables.name = arguments.name;
	}

}