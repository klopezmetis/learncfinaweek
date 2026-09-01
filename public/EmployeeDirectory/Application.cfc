component{

	this.name="EmployeeDirectory";
	this.datasource="cfsqltraining";
	this.applicationTimeout= CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement = true;
	this.clientManagement = true;
	this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
	this.invokeImplicitAccessor = true;		

	function onRequestStart(string targetPage){
		
		if(structKeyExists(url, "reload")){
			
			onApplicationStart();
			
		}
		
	}	


}