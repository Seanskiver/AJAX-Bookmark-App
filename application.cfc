<!--- All this file does is turn off a feature that puts 2 forward slashes (//)
In front of JSON objects that are returned from a CFC. This makes it possible to read
JSON objects returned from the functions in upload.cfc --->
<cfcomponent>
	<cfscript>
		this.secureJSON = false;	
	</cfscript>
</cfcomponent>