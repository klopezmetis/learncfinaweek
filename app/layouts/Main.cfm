<cfoutput>
<!doctype html>
<html lang="en" class="h-100">
<head>
	<!--- Metatags ---> 
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Employee Directory Application">

	<!--- Base URL: every relative link below (like includes/css/...) starts from here ---> 
	<base href="#event.getHTMLBaseURL()#" />

	<!--- CSS
		- Bootstrap 5
		- Bootstrap Icons
		- Employee Directory styles ---> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="includes/css/EmployeeDirectory.css">

	<!--- Title ---> 
	<title>Employee Directory Application</title>
</head>
<body style="padding-top: 60px" class="d-flex flex-column h-100">

	<!--- Top NavBar ---> 
	#view("partials/navigation")#

	<!--- Container And Views: the handler's view is rendered here ---> 
	<main class="flex-shrink-0">
		#view()#
	</main>

	<!--- Footer ---> 
	#view("partials/footer")#

	<!--- JavaScript
		- Bootstrap 5 bundle (includes Popper, needed for modals and dropdowns)
		- Employee Directory scripts ---> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="includes/js/EmployeeDirectory.js"></script>
</body>
</html>
</cfoutput>
