<!--- GET links by username --->
<cfquery datasource="MyAuCards" name="links">
	SELECT * FROM links where username = <cfqueryparam value="#GetAuthUser()#">
</cfquery>


<cfoutput>
	<ul id="links">
		<!--- Add new link button --->
<!--- 		<li class="AddBookmark bookmark" id="addLink">
			<img class="thumbnail" src="http://image.flaticon.com/icons/svg/59/59426.svg" alt="">
			<p><b id="">Add new</b></p>
		</li> --->
		<!--- Edit link button --->
		<li class="EditBookmark bookmark" id="editLink">
			<span class="glyphicon glyphicon-cog" style="font-size:2.5em"></span>
			<!--- <img class="thumbnail" src="http://www.freeiconspng.com/uploads/edit-new-icon-22.png" alt=""> --->
			<p><b>Manage</b></p>
		</li>

		<!--- Loop for loading user links --->
		<cfloop query="links">
				<li class="bookmark" data-id="#links.id#">
					<a href="#link#" class="link" target="_new">
						<img class="thumbnail" src="#icon#" alt="">
						<!--- <div style='background:url(#icon#)' class="thumbnail"></div> --->
						<p><b>#title#</b></p>
					</a>
				</li>
		</cfloop>
	</ul>
</cfoutput>
