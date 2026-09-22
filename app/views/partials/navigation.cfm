<cfoutput>
<!--- d-print-none hides the navbar when using Print Employee Report --->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top d-print-none">
	<div class="container-fluid">

		<!--- Brand --->
		<a class="navbar-brand" href="#event.buildLink( "employees" )#">
			<i class="bi bi-people-fill"></i>
			<strong>Employee Directory</strong>
		</a>

		<!--- Mobile Toggler --->
		<button
			class="navbar-toggler"
			type="button"
			data-bs-toggle="collapse"
			data-bs-target="##navbarSupportedContent"
			aria-controls="navbarSupportedContent"
			aria-expanded="false"
			aria-label="Toggle navigation"
		>
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<!--- Highlight this link when the Employees handler is running --->
					<a
						class="nav-link #event.getCurrentHandler() == "Employees" ? "active" : ""#"
						href="#event.buildLink( "employees" )#"
					>
						Employees
					</a>
				</li>
			</ul>
		</div>

	</div>
</nav>
</cfoutput>