/**
 * Employees handler
 * Handles every request for the Employee Directory.
 * Each public function is an "action" reachable at /employees/{action}
 */
component
	extends="coldbox.system.EventHandler"
{

	/**
	 * Dependency Injection
	 * WireBox finds app/models/EmployeeService.cfc and places it in variables.employeeService
	 */
	property
		name="employeeService"
		inject="EmployeeService";

	/**
	 * Only allow these actions to be called with a form POST.
	 * Stops someone from deleting an employee just by visiting /employees/delete?id=1
	 */
	this.allowedMethods = {
		create : "POST",
		update : "POST",
		delete : "POST"
	};

	/**
	 * List all employees
	 * URL: /employees
	 */
	function index(event, rc, prc){
		prc.employees = employeeService.getEmployees();
		event.setView("employees/index");
	}

	/**
	 * Add an employee (Add Employee modal posts here)
	 * URL: /employees/create
	 */
	function create(event, rc, prc){
		if (hasAllFields(rc)) {
			employeeService
				.addEmployee(
					firstname = trim(rc.firstname),
					lastname = trim(rc.lastname),
					email = trim(rc.email),
					address = trim(rc.address),
					phone = trim(rc.phone)
				);
			flash.put("message", "Employee added successfully.");
		} else {
			flash.put("errorMessage", "Please complete every field.");
		}
		relocate("employees");
	}

	/**
	 * Update an employee (Edit modal posts here)
	 * URL: /employees/update
	 */
	function update(event, rc, prc){
		if (isNumeric(rc.id ?: "") && hasAllFields(rc)) {
			employeeService
				.updateEmployee(
					id = int(rc.id),
					firstname = trim(rc.firstname),
					lastname = trim(rc.lastname),
					email = trim(rc.email),
					address = trim(rc.address),
					phone = trim(rc.phone)
				);
			flash.put("message", "Employee updated successfully.");
		} else {
			flash.put("errorMessage", "Please complete every field.");
		}
		relocate("employees");
	}

	/**
	 * Delete an employee (Delete Confirm modal posts here)
	 * URL: /employees/delete
	 */
	function delete(event, rc, prc){
		if (isNumeric(rc.id ?: "")) {
			employeeService.deleteEmployee(id = int(rc.id));
			flash.put("message", "Employee deleted successfully.");
		} else {
			flash.put("errorMessage", "Invalid employee ID.");
		}
		relocate("employees");
	}

	/**
	 * Returns true only if every form field was submitted and isn't blank.
	 * Private, so it can't be reached from a URL.
	 */
	private boolean function hasAllFields(required struct rc){
		for (var field in [
			"firstname",
			"lastname",
			"email",
			"address",
			"phone"
		]) {
			if (!len(trim(rc[ field ] ?: ""))) {
				return false;
			}
		}
		return true;
	}

}
