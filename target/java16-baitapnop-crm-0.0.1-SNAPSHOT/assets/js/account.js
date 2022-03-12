$(document).on('shown.bs.modal','#modal-update', function (event) {
var button = $(event.relatedTarget) // Button that triggered the modal
  	var userID = button.data('userid')
	var fullName = button.data('fullname')
	var email = button.data('email') 
	var userPassword = button.data('userpassword')  
var modal = $(this)
	modal.find('#userID').text('UserID: ' + userID)
	modal.find('#updateID').val(userID)
 	modal.find('#fullName').val(fullName)
	modal.find('#email').val(email)
	modal.find('#userPassword').val(userPassword)
});