<cfquery name="testQuery" datasource="learncfinaweek">
    SELECT * FROM portfolio
</cfquery>

<h1>Database Connection Test</h1>
<p>If you see a table below, your connection is working!</p>

<cfdump var="#testQuery#">