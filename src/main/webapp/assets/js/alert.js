$(document).ready(function() {	
	if ($('#message').length > 0 && "" !== $('#message').val()){	
		toastr.success($('#message').val())
	}
});