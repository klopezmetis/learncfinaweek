<cfcomponent singleton="true">

	<!--- Returns a query of all employees in the employees table ---> 
	<cffunction
		name="getEmployees"
		output="false"
		returntype="query"
		access="public"
		hint="Returns the List of Employees"
	>
		<!--- Name the query local.employees so it only exists inside this function ---> 
		<cfquery name="local.employees">
			SELECT id, firstname, lastname, email, address, phone
			FROM employees
			ORDER BY id
		</cfquery>

		<cfreturn local.employees>

	</cffunction>

	<!--- Takes 5 arguments and inserts them into the employees table as query params ---> 
	<cffunction
		name="addEmployee"
		output="false"
		returntype="void"
		access="public"
		hint="Adds an employee to the directory"
	>
		<cfquery>
			INSERT INTO employees (firstname, lastname, email, address, phone)
			VALUES (
				<cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
			)
		</cfquery>
	</cffunction>

	<!--- Modifies an existing employee record ---> 
	<cffunction
		name="updateEmployee"
		output="false"
		returntype="void"
		access="public"
		hint="Updates an employee in the directory"
	>
		<cfquery>
			UPDATE employees
			SET
				firstname = <cfqueryparam
			value="#arguments.firstname#"
			cfsqltype="cf_sql_varchar"
		>,
				lastname = <cfqueryparam
			value="#arguments.lastname#"
			cfsqltype="cf_sql_varchar"
		>,
				email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
				address = <cfqueryparam
			value="#arguments.address#"
			cfsqltype="cf_sql_varchar"
		>,
				phone = <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
			WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cffunction>

	<!--- Deletes an employee by id ---> 
	<cffunction
		name="deleteEmployee"
		output="false"
		returntype="void"
		access="public"
		hint="Deletes an employee from the directory"
	>
		<cfquery>
			DELETE FROM employees
			WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cffunction>

</cfcomponent>
