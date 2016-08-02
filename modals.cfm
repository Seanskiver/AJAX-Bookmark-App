<!--- MANAGE LINKS MODAL --->
<div id="manage-bookmarks" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="edit-modal-close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">Edit Bookmark</h4>
				<button type="button" class="btn btn-info" id="btn-add-bookmark">
					<span class="glyphicon glyphicon-plus"></span> Add Bookmark
				</button>
			</div>
			<!--- LINK EDIT FORM --->
			<div class="slideForm" id="edit-form-container">
				<form id="edit-link-frm">
					<input type="hidden" id="link-id">
					<div class="form-group">
						<label for="recipient-name" class="form-control-label">Title:</label>
						<input type="text" class="form-control" id="edit-title" />
						<div class="invalid"></div>
					</div>

					<div class="form-group">
						<label for="message-text" class="form-control-label">Link:</label>
						<input class="form-control" id="edit-link" />
						<div class="invalid"></div>
					</div>

					<div class="form-group">
						<label for="message-text" class="form-control-label">Image:</label>
						<input class="form-control" id="edit-image" />
						<div class="invalid"></div>
					</div>
					
					<button class="btn btn-white" id="edit-close">Close</button>
					<button class="btn btn-purple" id="Edit-form-sub">Edit bookmark</button>
				</form>
			</div>
			
			<!--- LINK ADD FORM --->
			<div class="slideForm" id="add-form-container">
				<form id="add-form">
					<div class="form-group">
						<label for="recipient-name" class="form-control-label">Title:</label>
						<input type="text" class="form-control" id="add-title" placeholder="(ex Facebook)">
						<div class="err" id="add-title-err"></div>
					</div>
						
					<div class="form-group">
						<label for="message-text" class="form-control-label">Link:</label>
						<input type="text" class="form-control" id="add-link" placeholder="(ex. www.facebook.com)"></input>
						<div class="err" id="add-link-err"></div>
					</div>

					<div class="form-group">
						<label for="message-text" class="form-control-label">Image:</label>
						<!--- <i id="info" class="glyphicon glyphicon-info-sign"></i> --->
						<input type="text" class="form-control" id="add-image" placeholder="(ex. www.google.com/image.jpg)"></input>
						<div class="err" id="add-image-err"></div>
					</div>

					<button class="btn btn-white" id="add-close">Close</button>
					<button id="add-submit" type="button" class="btn btn-purple">Add bookmark</button>
				</form>		
			</div>
	
			<!--- LINKS TABLE INCLUDE  --->
			<div class="modal-body" id="edit-body">	
				<cfinclude template="./linksTable.cfm">
			</div>
		</div>
	</div>
</div> <!--- /EDIT LINK MODAL --->

