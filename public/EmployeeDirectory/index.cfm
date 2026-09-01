<html>
	<head>
		<!--- JQuery --->
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<!--- Bootstrap Latest compiled and minified CSS --->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!--- Bootstrap Optional theme --->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<!--- Bootstrap Latest compiled and minified JavaScript --->
		
		<!--- Stylesheet --->
		<link rel="stylesheet" type="text/css" href="css/EmployeeDirectory.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		


		<!--- Creates a new object, tells CF that it is a "component" type, and tells CF where to find file  --->
		<cfset employeeService = createObject("component", "services.EmployeeDirectory")>
		<cfset message = "">
		<cfset errorMessage = "">

		<!---Check to see if addEmployee form was submitted, then assigns values to variables from input form--->
		<!---Also trims out any white space--->
		<cfif structKeyExists(form, "addEmployee")>
			<cfif len(trim(form.firstname)) AND len(trim(form.lastname)) AND len(trim(form.email)) AND len(trim(form.address)) AND len(trim(form.phone))>
				<cfset employeeService.addEmployee(
					firstname = trim(form.firstname),
					lastname = trim(form.lastname),
					email = trim(form.email),
					address = trim(form.address),
					phone = trim(form.phone)
				)>
				<cfset message = "Employee added successfully.">
			<cfelse>
				<cfset errorMessage = "Please complete every field.">
			</cfif>
		</cfif>

		<!---Check to see if updateEmployee form was submitted, then assigns values to variables from input form--->
		<!---Also trims out any white space--->
		<cfif structKeyExists(form, "editEmployee")>
			<cfif
				structKeyExists(form, "id")
				AND isNumeric(form.id)
				AND len(trim(form.firstname))
				AND len(trim(form.lastname))
				AND len(trim(form.email))
				AND len(trim(form.address))
				AND len(trim(form.phone))
			>
				<cfset employeeService.updateEmployee(
					id = int(form.id),
					firstname = trim(form.firstname),
					lastname = trim(form.lastname),
					email = trim(form.email),
					address = trim(form.address),
					phone = trim(form.phone)
				)>
				<cfset message = "Employee updated successfully.">
			<cfelse>
				<cfset errorMessage = "Please complete every field.">
			</cfif>
		</cfif>

		<cfif structKeyExists(form, "deleteEmployee")>
			<cfif structKeyExists(form, "id") AND isNumeric(form.id)>
				<cfset employeeService.deleteEmployee(id = int(form.id))>
				<cfset message = "Employee deleted successfully.">
			<cfelse>
				<cfset errorMessage = "Invalid employee ID.">
			</cfif>
		</cfif>

		<cfset employees = employeeService.getEmployees()>
		

		<title>Employee Directory Application</title>
		
	</head>

  	<body>

      	<div class="container">

	        <h1>Employee Directory Application</h1>
			<!---Evaluates message, checks to see if message contains text, if it does then it will display the associated messages--->
			<cfoutput>
				<cfif len(message)><div class="alert alert-success">#encodeForHTML(message)#</div></cfif>
				<cfif len(errorMessage)><div class="alert alert-danger">#encodeForHTML(errorMessage)#</div></cfif>
			</cfoutput>
			
			<!---Adds button --->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addEmployeeModal">
				Add Employee
			</button>
			<button type="button" class="btn btn-success" onclick="window.print()">
				Print Employee Report
			</button>
			<br><br>
			<!---creates a hidden modal--->
			<div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="addEmployeeLabel">Add Employee</h4>
						</div>
						<!---Sends data back to index.cfm, each field has name attrs that match CFML vairables expected by the form handler--->
						<!---when form is submitted,form triggers cfif structKeyExists(form, "addEmployee")--->
						<form method="post" action="index.cfm">
							<div class="modal-body">
								<div class="form-group">
									<label for="firstname">First name</label>
									<input type="text" class="form-control" id="firstname" name="firstname" required>
								</div>
								<div class="form-group">
									<label for="lastname">Last name</label>
									<input type="text" class="form-control" id="lastname" name="lastname" required>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<input type="email" class="form-control" id="email" name="email" required>
								</div>
								<div class="form-group">
									<label for="address">Address</label>
									<input type="text" class="form-control" id="address" name="address" required>
								</div>
								<div class="form-group">
									<label for="phone">Phone</label>
									<input type="tel" class="form-control" id="phone" name="phone" required>
								</div>
							</div>
							<!---adds a cancel button to the modal, if user wants to cancel entry--->
							<!---adds save button to save entry to employees table--->
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								<button type="submit" name="addEmployee" value="true" class="btn btn-primary">Save Employee</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Name</th>
						<th>Address</th>
						<th>Email</th>
						<th>Phone Number</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<!---Loops through the query and outputs each employee--->
					<cfoutput query="employees">
						<tr>
							<td>#encodeForHTML(firstname & " " & lastname)#</td>
							<td>#encodeForHTML(address)#</td>
							<td>#encodeForHTML(email)#</td>
							<td>#encodeForHTML(phone)#</td>
							<td>
								<button
									type="button"
									class="btn btn-default btn-sm"
									data-toggle="modal"
									data-target="##editEmployeeModal#id#">
									Edit
								</button>
								<button
									type="button"
									class="btn btn-danger btn-sm"
									data-toggle="modal"
									data-target="##deleteConfirmModal#id#">
									Delete
								</button>
							</td>
						</tr>

						<!--- Edit Modal for each employee --->
						<div
							class="modal fade"
							id="editEmployeeModal#id#"
							tabindex="-1"
							role="dialog"
							aria-labelledby="editEmployeeLabel#id#">

							<div class="modal-dialog" role="document">
								<div class="modal-content">

									<div class="modal-header">
										<button
											type="button"
											class="close"
											data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>

										<h4 class="modal-title" id="editEmployeeLabel#id#">
											Edit Employee
										</h4>
									</div>

									

									<form method="post" action="index.cfm">
										<div class="modal-body">

											<input type="hidden" name="id" value="#id#">

											<div class="form-group">
												<label for="firstname#id#">First name</label>
												<input
													type="text"
													class="form-control"
													id="firstname#id#"
													name="firstname"
													value="#encodeForHTMLAttribute(firstname)#"
													required>
											</div>

											<div class="form-group">
												<label for="lastname#id#">Last name</label>
												<input
													type="text"
													class="form-control"
													id="lastname#id#"
													name="lastname"
													value="#encodeForHTMLAttribute(lastname)#"
													required>
											</div>

											<div class="form-group">
												<label for="email#id#">Email</label>
												<input
													type="email"
													class="form-control"
													id="email#id#"
													name="email"
													value="#encodeForHTMLAttribute(email)#"
													required>
											</div>

											<div class="form-group">
												<label for="address#id#">Address</label>
												<input
													type="text"
													class="form-control"
													id="address#id#"
													name="address"
													value="#encodeForHTMLAttribute(address)#"
													required>
											</div>

											<div class="form-group">
												<label for="phone#id#">Phone</label>
												<input
													type="tel"
													class="form-control"
													id="phone#id#"
													name="phone"
													value="#encodeForHTMLAttribute(phone)#"
													required>
											</div>

										</div>

										<div class="modal-footer">
											<button
												type="button"
												class="btn btn-default"
												data-dismiss="modal">
												Cancel
											</button>

											<button
												type="submit"
												name="editEmployee"
												value="true"
												class="btn btn-primary">
												Update Employee
											</button>
										</div>
									</form>

								</div>
							</div>
						</div>

						<!--- Delete Confirmation Modal --->
						<div
							class="modal fade"
							id="deleteConfirmModal#id#"
							tabindex="-1"
							role="dialog"
							aria-labelledby="deleteConfirmLabel#id#">

							<div class="modal-dialog" role="document">
								<div class="modal-content">

									<div class="modal-header">
										<button
											type="button"
											class="close"
											data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>

										<h4 class="modal-title" id="deleteConfirmLabel#id#">
											Confirm Delete
										</h4>
									</div>

									<div class="modal-body">
										<p>Are you sure you want to delete <strong>#encodeForHTML(firstname & " " & lastname)#</strong>?</p>
										<p>This action cannot be undone.</p>
									</div>

									<form method="post" action="index.cfm">
										<div class="modal-footer">
											<input type="hidden" name="id" value="#id#">

											<button
												type="button"
												class="btn btn-default"
												data-dismiss="modal">
												Cancel
											</button>

											<button
												type="submit"
												name="deleteEmployee"
												value="true"
												class="btn btn-danger">
												Delete
											</button>
										</div>
									</form>

								</div>
							</div>
						</div>
					</cfoutput>
			  	</tbody>
		  	</table>
	  
    	</div><!--- end container --->	

	</body>
</html>