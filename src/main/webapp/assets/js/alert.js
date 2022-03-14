$(document).ready(function() {
	if ($('#message').length > 0 && "" !== $('#message').val()) {
		if($('#error').length > 0 && "" !== $('#error').val()){
			toastr.warning($('#message').val())
		}else{
			toastr.success($('#message').val())			
		}
	}
});
$(document).ready(function() {
	var currentUserRoleID = $('#currentUserRoleID').val();
	var roleLeader =$('#roleLeader').val();
	var roleMember = $('#roleMember').val();
	var roleAdmin = $('#roleAdmin').val();

	
	if (currentUserRoleID === roleLeader) {
		$('.user-container button').attr('disabled', true)
		$('#navJob').removeClass('disabled').addClass('active')
		$('#navUser').removeClass('disabled').addClass('active')
		$('.task-container #addTask').removeAttr('disabled')

	}
	if (currentUserRoleID === roleMember) {
		$('#navJob').removeClass('active').addClass('disabled')
		$('#navUser').removeClass('active').addClass('disabled')
		$('.task-container #addTask').attr('disabled', true)

	}
	if (currentUserRoleID === roleAdmin){
		$('.user-container button').attr('disabled', false);
		$('#navJob').removeClass('disabled').addClass('active')
		$('#navUser').removeClass('disabled').addClass('active')
		$('.task-container #addTask').attr('disabled', false);
	}
});