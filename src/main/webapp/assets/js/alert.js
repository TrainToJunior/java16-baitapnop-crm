$(document).ready(function() {

	if ($('#message').val() == ''){	
	}else {
		 toastr.success($('#message').val());
	}
});