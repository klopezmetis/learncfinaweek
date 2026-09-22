<!---
	Employee Directory view
	Rendered by Employees.index() and placed inside layouts/Main.cfm where #view()# is.
	Data available:
		prc.employees  - query of all employees (set by the handler)
		flash          - success / error messages from the last create, update or delete
--->
<cfoutput>
<div class="container my-4">

	<h1>Employee Directory Application</h1>

	<!---Success / error messages saved by the handler with flash.put() before relocating back here--->
	<cfif len( flash.get( "message", "" ) )>
		<div class="alert alert-success">#encodeForHTML( flash.get( "message" ) )#</div>
	</cfif>
	<cfif len( flash.get( "errorMessage", "" ) )>
		<div class="alert alert-danger">#encodeForHTML( flash.get( "errorMessage" ) )#</div>
	</cfif>

	<!---Action buttons--->
	<div class="mb-3">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="##addEmployeeModal">
			Add Employee
		</button>
		<button type="button" class="btn btn-success" onclick="window.print()">
			Print Employee Report
		</button>
	</div>

	<!---Employee table--->
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
			<!---One row per employee--->
			<cfloop query="prc.employees">
				<tr>
					<td>#encodeForHTML( prc.employees.firstname & " " & prc.employees.lastname )#</td>
					<td>#encodeForHTML( prc.employees.address )#</td>
					<td>#encodeForHTML( prc.employees.email )#</td>
					<td>#encodeForHTML( prc.employees.phone )#</td>
					<td>
						<button
							type="button"
							class="btn btn-outline-secondary btn-sm"
							data-bs-toggle="modal"
							data-bs-target="##editEmployeeModal#prc.employees.id#">
							Edit
						</button>
						<button
							type="button"
							class="btn btn-danger btn-sm"
							data-bs-toggle="modal"
							data-bs-target="##deleteConfirmModal#prc.employees.id#">
							Delete
						</button>
					</td>
				</tr>
			</cfloop>
		</tbody>
	</table>

</div><!--- end container --->


<!---
	==========================================================================
	Modals
	Placed after the table because a <div> is not allowed inside <tbody>.
	==========================================================================
--->

<!---Add Employee Modal--->
<div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!---Posts to Employees.create()--->
			<form method="post" action="#event.buildLink( 'employees.create' )#">
				<div class="modal-header">
					<h5 class="modal-title" id="addEmployeeLabel">Add Employee</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="firstname" class="form-label">First name</label>
						<input type="text" class="form-control" id="firstname" name="firstname" required>
					</div>
					<div class="mb-3">
						<label for="lastname" class="form-label">Last name</label>
						<input type="text" class="form-control" id="lastname" name="lastname" required>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<input type="email" class="form-control" id="email" name="email" required>
					</div>
					<div class="mb-3">
						<label for="address" class="form-label">Address</label>
						<input type="text" class="form-control" id="address" name="address" required>
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">Phone</label>
						<input type="tel" class="form-control" id="phone" name="phone" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary">Save Employee</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!---One Edit modal and one Delete modal per employee, each with a unique id--->
<cfloop query="prc.employees">

	<!---Edit Employee Modal--->
	<div class="modal fade" id="editEmployeeModal#prc.employees.id#" tabindex="-1" aria-labelledby="editEmployeeLabel#prc.employees.id#" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!---Posts to Employees.update()--->
				<form method="post" action="#event.buildLink( 'employees.update' )#">
					<input type="hidden" name="id" value="#prc.employees.id#">

					<div class="modal-header">
						<h5 class="modal-title" id="editEmployeeLabel#prc.employees.id#">Edit Employee</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label for="firstname#prc.employees.id#" class="form-label">First name</label>
							<input type="text" class="form-control" id="firstname#prc.employees.id#" name="firstname"
								value="#encodeForHTMLAttribute( prc.employees.firstname )#" required>
						</div>
						<div class="mb-3">
							<label for="lastname#prc.employees.id#" class="form-label">Last name</label>
							<input type="text" class="form-control" id="lastname#prc.employees.id#" name="lastname"
								value="#encodeForHTMLAttribute( prc.employees.lastname )#" required>
						</div>
						<div class="mb-3">
							<label for="email#prc.employees.id#" class="form-label">Email</label>
							<input type="email" class="form-control" id="email#prc.employees.id#" name="email"
								value="#encodeForHTMLAttribute( prc.employees.email )#" required>
						</div>
						<div class="mb-3">
							<label for="address#prc.employees.id#" class="form-label">Address</label>
							<input type="text" class="form-control" id="address#prc.employees.id#" name="address"
								value="#encodeForHTMLAttribute( prc.employees.address )#" required>
						</div>
						<div class="mb-3">
							<label for="phone#prc.employees.id#" class="form-label">Phone</label>
							<input type="tel" class="form-control" id="phone#prc.employees.id#" name="phone"
								value="#encodeForHTMLAttribute( prc.employees.phone )#" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Update Employee</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!---Delete Confirmation Modal--->
	<div class="modal fade" id="deleteConfirmModal#prc.employees.id#" tabindex="-1" aria-labelledby="deleteConfirmLabel#prc.employees.id#" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteConfirmLabel#prc.employees.id#">Confirm Delete</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to delete <strong>#encodeForHTML( prc.employees.firstname & " " & prc.employees.lastname )#</strong>?</p>
					<p>This action cannot be undone.</p>
				</div>
				<!---Posts to Employees.delete()--->
				<form method="post" action="#event.buildLink( 'employees.delete' )#">
					<input type="hidden" name="id" value="#prc.employees.id#">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-danger">Delete</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</cfloop>
</cfoutput>