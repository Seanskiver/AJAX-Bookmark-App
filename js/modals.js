// Filename: 	Modals.js
// Author: 		Sean Skiver
// Written: 	6/30/2016
/* 
Description:
	Loads data into the add and edit modals when the user opens them.
	Uses event capturing to handle dynamically rendered data.
*/
//-------------------------------------------------
// Load links into the div on page load

// Edit links modal
$('body').on('click', '#editLink', function() {
	// Modal appears
	$('#manage-bookmarks').modal('toggle');

	if (window.innerWidth > 730) {
		// Loads the linksTable file.
		$('#edit-body').load('../../apps/fav-links/linksTable.cfm'); 
	} else {
		$('#edit-body').load('../../apps/fav-links/linksTableMobile.cfm'); 
	}
});

$('body').on('click', '#addLink', function() {
	$('#menu-add').modal('toggle');
});

