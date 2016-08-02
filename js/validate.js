// Filename: 	validate.js
// Author: 		Sean Skiver
// Written: 	7/30/2016
/* 
Description:
	Validates form fields for the Edit Link form and Add Link form 
	which includes image validation, and empty field validation
*/
//-------------------------------------------------


// When the user submits the Add Link form
$('#add-submit').click(function() {
	// get link, image, and title field values
	link = $('#add-link').val();
	title = $('#add-title').val();
	image = validateImage($('#add-image').val());
	
	var fields = $('#add-form').find('.form-control');
	valid = validateForm(fields);

	if (valid == true) {
		// Add new link 
		addLink(link, title, image);
		// Close the modal
		$('#menu-add').modal('hide');
		// Clear input fields	
		clearInputFields($(this));		

		// Close the form
		closeForm($('#add-form-container'));

		//Reload Links
		$('#link-container').load('../../apps/fav-links/linksTable.cfm'); 
		$('#edit-body').load('../../apps/fav-links/linksTable.cfm'); 

	}
});	

// When the user submits the edit form
$('#Edit-form-sub').click(function(e) {
	// Stop Form Submission
	e.preventDefault();
	// Get all Form fields
	var fields = $('#edit-link-frm').find('.form-control');
	// Validate Form fields
	var valid = validateForm(fields);

	// If form validation passes, call the edit link function
	if ( valid == true ) { 
		editLink($('#edit-link').val(), $('#edit-title').val(), $('#edit-image').val());
		// Close the modal
		$('#menu-edit').modal('hide');
		// Clear input fields
		clearInputFields($(this));	
	} 

	// Close the form
	closeForm($('#edit-form-container'));

	//Reload Links
	$('#edit-body').load('../../apps/fav-links/linksTable.cfm'); 
});


// Validate Forms with all input fields as an array
function validateForm(fields) {
	// Error Boolean
	var err = 0;

	// Loop through all form fields
	for (var i = 0; i < fields.length; i++) {
		// If field is blank, insert error message
		if ( fields[i].value == '' ) {
			$(fields[i]).parent().siblings('.invalid').text('This field is required');
			err = 1; 
		// If invalid image: insert image error
		} else if ( fields[i].id.includes('image') ) {
			if ( validateImage(fields[i].value) == false ) {
				$(fields[i]).parent().siblings('.invalid').text('This is an invalid image. The file extension must be .jpeg, .jpg or .png');
				err = 1;
			} else {
				$(fields[i]).parent().siblings('.invalid').text('');
			}
		} else {
			$(fields[i]).parent().siblings('.invalid').text('');
		}
	}

	if (err == 0) return true;
	else return false
}


// Validates for jpg, png, and jpeg file extensions
function validateImage(src) {
	strArr = src.split('.');

	if (strArr[strArr.length-1] == 'png' || strArr[strArr.length-1] == 'jpg' || strArr[strArr.length-1] == 'jpeg') {
		return src;
	} else {
		return false;
	}
}


// Clear add form on submit
function clearInputFields(el) {
	el.parent().siblings('.modal-body').find('input').val('');
}


















