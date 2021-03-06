<cfquery datasource="MyAuCards" name="links">
	-- GetAuthUser();
	SELECT * FROM links WHERE username = <cfqueryparam value="#GetAuthUser()#">
</cfquery>


<table class="table">
	<thead>
		<tr>
			<th>title</th>
			<th>edit</th>
			<th>delete</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="links">
			<cfoutput>
				<tr>
					<td class="id" style="display:none;">#id#</td>
					<td class="title">
 						<cfif Len(title) GT 15>
							#Left(title, 10)#...	
						<cfelse>
							#title#
						</cfif> 
					</td>
					<td><button class="btn edit">Edit</button></td>
					<td><button class="btn btn-danger delete">Delete</button></td>
				</tr>
			</cfoutput>
		</cfloop>
	</tbody>
</table>
