/**
 * Employee Directory scripts
 * Loaded at the bottom of layouts/Main.cfm, after the Bootstrap bundle.
 */

// When any modal finishes opening, put the cursor in its first visible input
document.addEventListener( "shown.bs.modal", function ( event ) {
	const firstInput = event.target.querySelector( "input:not([type=hidden])" );
	if ( firstInput ) {
		firstInput.focus();
	}
} );