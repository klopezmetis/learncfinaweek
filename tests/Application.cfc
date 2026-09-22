/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	/**
	 * --------------------------------------------------------------------------
	 * Application Properties: Modify as you see fit!
	 * --------------------------------------------------------------------------
	 */
	this.name = "ColdBoxTestingSuite"
	this.sessionManagement = true
	this.setClientCookies = true
	this.sessionTimeout = createTimespan( 0, 0, 15, 0 )
	this.applicationTimeout = createTimespan( 0, 0, 15, 0 )

	/**
	 * --------------------------------------------------------------------------
	 * Location Mappings
	 * --------------------------------------------------------------------------
	 * The majority of mappings are pre-configured for you so they can be reused.
	 */
	_testsRoot = getDirectoryFromPath( getCurrentTemplatePath() )
	_appRoot = REReplaceNoCase( _testsRoot, "tests(\\|/)", "" )
	// Create testing mapping
	this.mappings[ "/tests" ]   = _testsRoot
	// Register the mappings ColdBox and its dependencies need to resolve, since
	// this virtual test application has its own mapping scope.
	this.mappings[ "/app" ]                       = _appRoot & "app"
	this.mappings[ "/public" ]                    = _appRoot & "public"
	this.mappings[ "/coldbox" ]                   = _appRoot & "lib/coldbox"
	this.mappings[ "/coldbox/system/exceptions" ] = _appRoot & "lib/coldbox/system/exceptions"
	this.mappings[ "/modules" ]                   = _appRoot & "lib/modules"
	this.mappings[ "/testbox" ]                   = _appRoot & "lib/testbox"

	/**
	 * Fires on every test request. It builds a Virtual ColdBox application for you
	 *
	 * @targetPage The requested page
	 */
	public boolean function onRequestStart( targetPage ) output="true"{
		// Set a high timeout for long running tests
		cfsetting( requestTimeout="9999" );
		// Clear the page pool on each request for test freshness
		pagePoolClear()
		// New ColdBox Virtual Application Starter
		request.coldBoxVirtualApp= new coldbox.system.testing.VirtualApp(
			appMapping : "/app",
			webMapping : "/public"
		)

		// If hitting the runner or specs, prep our virtual app
		if ( getBaseTemplatePath().replace( expandPath( "/tests" ), "" ).reFindNoCase( "(runner|specs)" ) ) {
			request.coldBoxVirtualApp.startup( true );
		}

		// Reload for fresh results
		if ( structKeyExists( url, "fwreinit" ) ) {
			// ormReload();
			request.coldBoxVirtualApp.restart();
		}

		return true;
	}

	/**
	 * Fires when the testing requests end and the ColdBox application is shutdown
	 */
	public void function onRequestEnd( required targetPage ){
		request.coldBoxVirtualApp.shutdown();
	}
}
