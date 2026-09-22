/**
 * Build automation script for ColdBox CFML Template
 *
 * This component handles the build processes including:
 * - Compilation and packaging
 * - Distribution preparation
 * - Checksum generation
 *
 * Usage: box run Build.cfc
 */
component {

	/**
	 * Constructor - Initialize build environment
	 */
	function init(){
		// Setup Pathing
		variables.cwd          = server.cli.executionPath & "/";
		variables.buildDir     = variables.cwd & "build";
		variables.packageDir   = variables.buildDir & "/package";
		variables.distDir      = variables.buildDir & "/distributions";

		// Load box.json for project metadata
		variables.boxJSON = jsonDeserialize( fileRead( variables.cwd & "box.json" ) );
		variables.projectName = variables.boxJSON.slug ?: "coldbox-app";
		variables.projectVersion = variables.boxJSON.version ?: "1.0.0";

		// Source to package
		variables.sources = [
			".cbmigrations.json",
			"box.json",
			"server.json",
			"app",
			"lib",
			"public",
			"runtime"
		];

		// Files and folders to exclude from the build (regex patterns)
		variables.excludes = [
			"logs/",           // Log directories
			"\.DS_Store$",     // macOS system files
			"Thumbs\.db$"      // Windows system files
		];

		return this;
	}

	/**
	 * Main entry point for the build process
	 */
	function main(){
		printHeader( "Starting Build Process for #variables.projectName# v#variables.projectVersion#" );

		// Clean and prepare build directory
		prepareBuildDirectory();

		// Copy source files
		copySources();

		// Create build ID file
		createBuildID();

		// Create distribution zip
		createDistribution();

		// Generate checksums
		generateChecksums();

		printHeader( "✨ Build Complete! Distribution ready at: #variables.distDir#" );
	}

	/**
	 * Prepare the build directory - delete if exists and recreate
	 */
	private function prepareBuildDirectory(){
		printStep( "🧹 Preparing build directory..." );

		// Wipe build directory if it exists
		if ( directoryExists( variables.buildDir ) ) {
			printInfo( "Removing existing build directory..." );
			directoryDelete( variables.buildDir, true );
		}

		// Create directory structure
		directoryCreate( variables.packageDir, true, true );
		directoryCreate( variables.distDir, true, true );

		printSuccess( "Build directory prepared" );
	}

	/**
	 * Copy source files to package directory
	 */
	private function copySources(){
		printStep( "📁 Copying source files..." );

		variables.sources.each( ( source ) => {
			var sourcePath = variables.cwd & source;
			var targetPath = variables.packageDir & "/" & source;

			if ( directoryExists( sourcePath ) ) {
				printInfo( "Copying #source#/ ..." );
				copyDirectoryWithExclusions( sourcePath, targetPath );
			} else if ( fileExists( sourcePath ) ) {
				printInfo( "Copying #source# ..." );
				fileCopy( sourcePath, targetPath );
			} else {
				printWarning( "Source not found: #source#" );
			}
		} );

		printSuccess( "Sources copied successfully" );
	}

	/**
	 * Copy directory recursively with exclusion patterns
	 *
	 * @source The source directory path
	 * @target The target directory path
	 */
	private function copyDirectoryWithExclusions( required string source, required string target ){
		// Create target directory if it doesn't exist
		if ( !directoryExists( arguments.target ) ) {
			directoryCreate( arguments.target, true, true );
		}

		// Get all items in the source directory as an array of paths
		var items = directoryList( arguments.source, false, "array" );

		items.each( ( itemPath ) => {
			var itemName = listLast( itemPath, "/\" );
			var targetPath = target & "/" & itemName;
			var relativePath = itemPath.replace( variables.cwd, "" );

			// Check if item should be excluded
			var isExcluded = isPathExcluded( relativePath );

			if ( isExcluded ) {
				printInfo( "⊘ Excluding: #relativePath#" );
				return;
			}

			// Copy files or directories recursively
			if ( directoryExists( itemPath ) ) {
				copyDirectoryWithExclusions( itemPath, targetPath );
			} else {
				fileCopy( itemPath, targetPath );
			}
		} );
	}

	/**
	 * Check if a path matches any exclusion pattern
	 *
	 * @path The path to check (relative to project root)
	 * @return True if path should be excluded
	 */
	private function isPathExcluded( required string path ){
		var excluded = false;

		variables.excludes.each( ( pattern ) => {
			if ( path.reFindNoCase( pattern ) ) {
				excluded = true;
			}
		} );

		return excluded;
	}

	/**
	 * Create build ID file
	 */
	private function createBuildID(){
		printStep( "🏷️  Creating build ID file..." );
		var buildIDFileName = "#variables.projectName#-#variables.projectVersion#.md";
		var buildIDPath = variables.packageDir & "/" & buildIDFileName;
		var buildContent = "## Build Information

		**Project**: #variables.projectName#
		**Version**: #variables.projectVersion#
		**Built on**: #dateTimeFormat( now(), "full" )#
		";

		fileWrite( buildIDPath, buildContent );
		printSuccess( "Build ID file created: #buildIDFileName#" );
	}

	/**
	 * Create distribution zip file
	 */
	private function createDistribution(){
		printStep( "📦 Creating distribution package..." );

		var zipFileName = "#variables.projectName#-#variables.projectVersion#.zip";
		var zipPath = variables.distDir & "/" & zipFileName;

		printInfo( "Zipping package to: #zipFileName#" );

		cfzip(
			action    = "zip",
			file      = zipPath,
			source    = variables.packageDir,
			overwrite = true,
			recurse   = true
		);

		fileCopy( variables.packageDir & "/box.json", variables.distDir & "/box.json" );

		printSuccess( "Distribution created: #zipFileName#" );
	}

	/**
	 * Generate checksums for the distribution
	 */
	private function generateChecksums(){
		printStep( "🔐 Generating checksums..." );

		var zipFileName = "#variables.projectName#-#variables.projectVersion#.zip";
		var zipPath = variables.distDir & "/" & zipFileName;

		if ( !fileExists( zipPath ) ) {
			printWarning( "Zip file not found for checksum generation" );
			return;
		}

		// Generate MD5
		var md5Hash = hash( fileReadBinary( zipPath ), "MD5" );
		fileWrite( zipPath & ".md5", md5Hash );
		printSuccess( "MD5: #md5Hash#" );

		// Generate SHA-256
		var sha256Hash = hash( fileReadBinary( zipPath ), "SHA-256" );
		fileWrite( zipPath & ".sha256", sha256Hash );
		printSuccess( "SHA-256: #sha256Hash#" );

		// Generate SHA-512
		var sha512Hash = hash( fileReadBinary( zipPath ), "SHA-512" );
		fileWrite( zipPath & ".sha512", sha512Hash );
		printSuccess( "SHA-512: #sha512Hash#" );
	}

	// ============================================================================
	// Print Helpers
	// ============================================================================

	private function printHeader( required string message ){
		var separator = repeatString( "=", 70 );
		systemOutput( "", true );
		systemOutput( separator, true );
		systemOutput( "  🚀 " & arguments.message, true );
		systemOutput( separator, true );
		systemOutput( "", true );
	}

	private function printStep( required string message ){
		systemOutput( "", true );
		systemOutput( "📦 " & arguments.message, true );
	}

	private function printInfo( required string message ){
		systemOutput( "   📄 " & arguments.message, true );
	}

	private function printSuccess( required string message ){
		systemOutput( "   ✅ " & arguments.message, true );
	}

	private function printWarning( required string message ){
		systemOutput( "   ⚠️  " & arguments.message, true );
	}

	private function printError( required string message ){
		systemOutput( "   ❌ " & arguments.message, true );
	}

}