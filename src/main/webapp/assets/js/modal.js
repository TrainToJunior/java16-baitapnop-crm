$(document).on('shown.bs.modal','#modal-user-update', function (event) {
var button = $(event.relatedTarget)
  	var userID = button.data('userid')
	var fullName = button.data('fullname')
	var email = button.data('email') 
	var userPassword = button.data('userpassword')
	var userRoleName = button.data('userrolename')    
var modal = $(this)
	modal.find('#userID').text('UserID: ' + userID)
	modal.find('#updateID').val(userID)
 	modal.find('#fullName').val(fullName)
	modal.find('#email').val(email)
	modal.find('#userPassword').val(userPassword)
	modal.find('#selectRole').text('Quyền(' + userRoleName + ")")
});

$(document).on('shown.bs.modal','#modal-task-update', function (event) {
var button = $(event.relatedTarget)
  	var taskID = button.data('taskid')
	var taskName = button.data('taskname')
	var userName = button.data('selectuser')
	var userID = button.data('userid')
	var now = new Date();
    var month = (now.getMonth() + 1);               
    var day = now.getDate();
	var endMonth = month + 1;
    if (month < 10) {
        month = "0" + month;
		if (endMonth < 10){
			endMonth = "0" + endMonth;
		}
	}
    if (day < 10) 
        day = "0" + day;
    var today = now.getFullYear() + '-' + month + '-' + day;
	var endDate = now.getFullYear() + '-' + endMonth + '-' + day;
var modal = $(this)
	modal.find('#taskID').text('TaskID: ' + taskID )
	modal.find('#updateID').val(taskID)
 	modal.find('#taskName').val(taskName)
	modal.find('#startDate').val(today)
	modal.find('#endDate').val(endDate)
	modal.find('#optionSelectUser').val(userID)
	modal.find('#optionSelectUser').text(userName)
	
});

$(document).on('shown.bs.modal','#modal-task-insert', function () {
	var now = new Date();
    var month = (now.getMonth() + 1);               
    var day = now.getDate();
	var endMonth = month + 1;
    if (month < 10) {
        month = "0" + month;
		if (endMonth < 10){
			endMonth = "0" + endMonth;
		}
	}
    if (day < 10) 
        day = "0" + day;
    var today = now.getFullYear() + '-' + month + '-' + day;
	var endDate = now.getFullYear() + '-' + endMonth + '-' + day;
var modal = $(this)
	modal.find('#startDate').val(today)
	modal.find('#endDate').val(endDate)
});