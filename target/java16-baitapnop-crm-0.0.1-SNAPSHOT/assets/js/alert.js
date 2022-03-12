$(document).ready(function() {
	
	if ($('#message').val() != ''){	
		toastr.warning($('#message').val());
	}else {
		toastr.success($('#message').val());
	}
});