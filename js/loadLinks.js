// Filename: 	loadLink.js
// Author: 		Sean Skiver
// Written: 	6/30/2016
/* 
Description:
	loads links into the #links div on document load as well as after
	the user submits a new link. Uses AJAX to add the bookmark and
	reload the user's bookmarks
*/
//-------------------------------------------------

// Load links.cfm into the #link-container div
function loadLinks() {
	$("#link-container").load('../../apps/fav-links/links.cfm');
}

/* 
	Calls the addLink function in Upload.cfc 
 	Then calls the loadLinks function to refresh the links
 	in the #link-container div  */
function addLink(title, link, image) {
	$.get('../../apps/fav-links/upload.cfc', 
		{ 
			method: 	"addLink", 
			title: 		$('#add-title').val(),
			link: 		$('#add-link').val(),
			image: 	$('#add-image').val()
		}, 

	// Anon callback  to reload the links into the #links div
	function(data) {
		loadLinks();
	});
}

/* 
	Sends a get request to upload.cfc and calls the editLink function
	Passes the data to the loadLinks() function to refresh links */
function editLink(id, title, link, image) {
	$.get('../../apps/fav-links/upload.cfc', 
		{
			method: 	'editLink',
			title: 		$('#edit-title').val(),
			link: 		$('#edit-link').val(),
			image: 	$('#edit-image').val(),
			id: 		$('#link-id').val()
		},
	// reloads links into the link list
	function(data) {
		loadLinks();
	});
}

// Deletes a link
function deleteLink(linkId) {
	$.post('../../apps/fav-links/upload.cfc', {
		method: 'delete',
		id: linkId
	});
}

/*	Uses AJAX to load one link from the database, 
	Then passes the data to the FillForm() function
	Located: ./formHandling.js */
function loadOne(linkId) {
	$.get('../../apps/fav-links/upload.cfc', {
		method: 'loadOne',
		id: linkId,
		dataType: 'json',
	}, function(data) {
		// Call the function fillForm() Below
		console.log(JSON.parse(data));
		fillForm(JSON.parse(data));

	});
}