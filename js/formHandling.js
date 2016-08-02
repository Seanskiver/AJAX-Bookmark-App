// Filename: 	formHandling.js
// Author: 		Sean Skiver
// Written: 	6/30/2016
/* 
Description:
	Functions for opening, closing, and filling in form fields.
	Also uses event capturing to handle dynamically rendered data
*/
//-------------------------------------------------

// A structure used to populate form fields
$('#edit-close').click(function(e) {
	e.preventDefault();
	closeForm($('#edit-form-container'));
});

// Close form when the close button is hit
$('#add-close').click(function(e) {
	e.preventDefault();
	closeForm($('#add-form-container'));
});

// When the user hits hte edit button
$('#edit-body').on('click', '.edit', function() {
	// The id is located in a hidden <td> tag on the table
	var id = $(this).parent().siblings('.id')[0].innerHTML;
	// Load one record from the database (located in loadLinks.js)
	var link = loadOne(id);
	// open the form
	openForm($('#edit-form-container'));
});

// When the user hits the Add Bookmark button
$('#btn-add-bookmark').click(function() {
	openForm($('#add-form-container'));
})

// When the user clicks the delete button
$('body').on('click', '.delete', function() {
	// Make the table row fade out
	$(this).parent().parent().fadeOut();
	// Get id from sibling td
	var id = $(this).parent().siblings('.id').text();
	
	if (confirm('Are you sure you want to delete this bookmark?')) {
		deleteLink(id);
		// Refresh links in the #link-container div
		loadLinks();
	}
});

// when the modal closes, the edit/add form closes too
$('#edit-modal-close').click(function() {
	closeForm($('#edit-form-container'));
	closeForm($('#add-form-container'));
});

/* Fill Form fields with data from JSON object info
   This function is only called in the loadOne Function */
function fillForm(info) {
	$('#link-id').val(info.ID)
	$('#edit-title').val(info.TITLE);
	$('#edit-link').val(info.LINK);
	$('#edit-image').val(info.ICON);
}

// Closes the edit form
function closeForm(el) {
	// // transition
	el.animate({
		'width':'100%',
		'height':'0',
		'overflow':'auto',
	}, 450, function() {
		el.css('opacity', 0);
	});	
}

// Opens the edit form
function openForm(el) {
	el.css('opacity', 1);
	// // transition
	el.animate({
		'height':'90%',
		'padding': '30px',
		'padding-bottom': '0',
		'overflow':'auto',

	}, 450);
}
