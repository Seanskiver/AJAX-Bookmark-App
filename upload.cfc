<cfcomponent>
	<!--- Get the user's bookmarked links --->
	<cffunction name="getUserLinks" access="remote" returntype="Query" returnformat="JSON">
		<cfargument name="username" default="#GetHttpRequestData().headers.username#"/>

		<cfquery datasource="MyAuCards" name="links">
			SELECT * FROM links where username = <cfqueryparam value="#GetAuthUser()#">
		</cfquery>
		<!--- <cfoutput>#myvar#</cfoutput> --->
		<cfreturn "#links#">
	</cffunction>


	<!--- Insert new links --->
	<cffunction name="addLink" access="remote">
		<cfargument name="title" default="#GetHttpRequestData().headers.title#">
		<cfargument name="link" default="#GetHttpRequestData().headers.link#" type="string">
		<cfargument name="image" default="#GetHttpRequestData().headers.image#">

		<cfinvoke component="upload" method="treatURL" url="#arguments.link#" returnvariable="myUrl">
		

		<cfquery datasource="myaucards" name="links">
			INSERT INTO links (title, link, icon, username)
			VALUES (
				<cfqueryparam cfsqltype="varchar" value="#arguments.title#">,
				<cfqueryparam cfsqltype="varchar" value="#myUrl#">,
				<cfqueryparam cfsqltype="varchar" value="#arguments.image#">,
				--GetAuthUser()
				<cfqueryparam value="#GetAuthUser()#">
			)
		</cfquery>
	</cffunction>

	<!--- Delete link --->
	<cffunction name="delete" access="remote">
		<cfargument name="id" default="#getHTTPRequestData().headers.id#">

		<cfquery datasource="myaucards" name="del">
			DELETE from links
			WHERE 
			id = <cfqueryparam cfsqltype="int" value="#arguments.id#"> 
		</cfquery>
	</cffunction>

	<!--- Edit Link --->
	<cffunction name="editLink" access="remote">
		<cfargument name="link" default="#getHTTPRequestData().headers.link#">
		<cfargument name="image" default="#getHTTPRequestData().headers.image#">
		<cfargument name="title" default="#GetHttpRequestData().headers.title#">
		<cfargument name="id" default="#GetHttpRequestData().headers.id#">

		<cfinvoke component="upload" method="treatURL" url="#arguments.link#" returnvariable="myUrl">


		<cfquery name="edit" datasource="myaucards">
			UPDATE links 
			SET 
			link = <cfqueryparam cfsqltype="varchar" value="#myUrl#">,
			icon = <cfqueryparam cfsqltype="varchar" value="#arguments.image#">,
			title = <cfqueryparam cfsqltype="varchar" value="#arguments.title#">

			WHERE id = <cfqueryparam cfsqltype="int" value="#arguments.id#">
		</cfquery>
	</cffunction>

	<cffunction name="treatURL" returntype="string" access="remote">
		<cfargument name="url" type="string">

		<cfset split = ListToArray(arguments.url, ".", false, false)>

		<cfif !FindNoCase("http://", split[1])>
			<cfset newUrl = "http://"&arguments.url>
		<cfelse>
			<cfset newUrl = arguments.url>
		</cfif>  

		<cfreturn newUrl>
	</cffunction>


	<cffunction name="loadOne" access="remote" returnformat="JSON">
		<cfargument name="id" default="#GetHttpRequestData().headers.id#">

		<cfquery name="oneLink" datasource="myaucards">
			SELECT * FROM links where id = <cfqueryparam value="#arguments.id#">
		</cfquery>


		<!--- Set link as new structure --->
		<cfset var link = structNew() />
		<!--- Assign link properties --->
		<cfset link.id = oneLink.id />
		<cfset link.title = oneLink.title />
		<cfset link.link = oneLink.link />
		<cfset link.icon = oneLink.icon />
		<cfset link.username = oneLink.username />

		<cfreturn link />
	</cffunction>
</cfcomponent>