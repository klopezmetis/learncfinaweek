<cfcomponent>
	<!---Create function getEmployees(), returns a query of all employees in the Employees table--->
	<cffunction name="getEmployees" output="false" returntype="Query" access="public" hint="Returns the List of Employees">
		
		<cfquery name="employees">
	
			SELECT id, firstname, lastname, email, address, phone 
			FROM employees
			ORDER BY id  
	
		</cfquery>
		
		<cfreturn employees>
		
	</cffunction>	
	<!---Create function addEmployee(), takes 5 arguments, passes arguments as query params to insert into Employees table--->
	<cffunction name="addEmployee" output="false" returntype="void" access="public" hint="Adds an employee to the directory">
		<cfargument name="firstname" type="string" required="true">
		<cfargument name="lastname" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="phone" type="string" required="true">

		<cfquery>
			INSERT INTO Employees (firstname, lastname, email, address, phone)
			VALUES (
				<cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
			)
		</cfquery>
	</cffunction>	

	
	<!---Update function to modify existing employee records--->
	<cffunction name="updateEmployee" output="false" returntype="void" access="public" hint="Updates an employee in the directory">
		<cfargument name="id" type="numeric" required="true">
		<cfargument name="firstname" type="string" required="true">
		<cfargument name="lastname" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="address" type="string" required="true">
		<cfargument name="phone" type="string" required="true">

		<cfquery>
			UPDATE Employees
			SET 
				firstname = <cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
				lastname = <cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
				email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
				address = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
				phone = <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
			WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cffunction>

	<cffunction name="deleteEmployee" output="false" returntype="void" access="public" hint="deletes an employee from the directory">
		<cfargument name="id" type="numeric" required="true">

		<cfquery>
			DELETE FROM Employees
			WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cffunction>

</cfcomponent>