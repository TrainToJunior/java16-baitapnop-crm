$(document).on('shown.bs.modal','#modal-user-update', function (event) {
//Get and set value
var button = $(event.relatedTarget)
  	var userID = button.data('userid')
	var fullName = button.data('fullname')
	var phoneNumber = button.data('phonenumber')
	var address = button.data('address')
	var email = button.data('email') 
	var userPassword = button.data('userpassword')
	var roleID = button.data('roleid')  
// Replace
var modal = $(this)
	modal.find('#userID').text('UserID: ' + userID)
	modal.find('#updateID').val(userID)
 	modal.find('#fullName').val(fullName)
	modal.find('#phoneNumber').val(phoneNumber)
	modal.find('#address').val(address)
	modal.find('#email').val(email)
	modal.find('#userPassword').val(userPassword)
// Options select
	$('.role-options option')
     .removeAttr('selected')
     .filter('[value="'+ roleID +'"]')
         .attr('selected', true)
});

$(document).on('shown.bs.modal','#modal-task-update', function (event) {
//Get and set value
var button = $(event.relatedTarget)
	var currentUserRoleID = $('#currentUserRoleID').val();
	var roleMember = $('#roleMember').val();
	var roleLeader = $('#roleLeader').val();
	var taskID = button.data('taskid')
	var taskName = button.data('taskname')
	var taskDescription = button.data('taskdescription')
	var startDate = button.data('startdate')
	var endDate = button.data('enddate')
	var userID = button.data('userid')
	var jobID = button.data('jobid')
	var statusID = button.data('statusid')
	var stringStartDate = startDate.toString().split(' ')[0]
	var stringEndDate = endDate.toString().split(' ')[0]
	var selectStartDate = new Date();
	selectStartDate = stringStartDate;
	var selectEndDate = new Date();
	selectEndDate = stringEndDate;
// Replace
var modal = $(this)
	modal.find('#taskID').text('TaskID: ' + taskID )
	modal.find('#updateID').val(taskID)
 	modal.find('#taskName').val(taskName)
	modal.find('#taskDescription').val(taskDescription)
	modal.find('#startDate').val(selectStartDate)
	modal.find('#endDate').val(selectEndDate)
// Options select
	$('.user-options option')
     .removeAttr('selected')
     .filter('[value="'+ userID +'"]')
         .attr('selected', true)
	$('.job-options option')
     .removeAttr('selected')
     .filter('[value="'+ jobID +'"]')
         .attr('selected', true)
	$('.status-options option')
     .removeAttr('selected')
     .filter('[value="'+ statusID +'"]')
         .attr('selected', true)

	if (currentUserRoleID == roleMember) {
		$('.form-group input').attr('readonly', true)
		$('.user-options option:not(:selected)').attr('disabled', true)
		$('.job-options option:not(:selected)').attr('disabled', true)
	}else{
		$('.form-group input').attr('readonly', false);
		$('.user-options option').attr('disabled', false);
		$('.job-options option').attr('disabled', false);
	}
	if(currentUserRoleID == roleLeader){
		$('.user-options option:not(.3)').attr('disabled', true)			
	}	
});

$(document).on('shown.bs.modal','#modal-task-insert', function () {
	var currentUserRoleID = $('#currentUserRoleID').val();
	var roleMember = $('#roleMember').val();
	var roleLeader = $('#roleLeader').val();
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
	
	$('.user-options option')
     .removeAttr('selected')
     .filter('[value="'+ userID +'"]')
         .attr('selected', true)
	$('.job-options option')
     .removeAttr('selected')
     .filter('[value="'+ jobID +'"]')
         .attr('selected', true)
	
	
	if (currentUserRoleID == roleMember) {
		$('.form-group input').attr('readonly', true)
		$('.user-options option:not(:selected)').attr('disabled', true)
		$('.job-options option:not(:selected)').attr('disabled', true)
	}else{
		$('.form-group input').attr('readonly', false);
		$('.user-options option').attr('disabled', false);
		$('.job-options option').attr('disabled', false);
	}
	if(currentUserRoleID == roleLeader){
		$('.user-options option:not(.3)').attr('disabled', true)
		$('.user-options option:not(:disabled)').attr('selected', true)
		console.log('chay role')	
	}	
});

$(document).on('shown.bs.modal','#modal-job-update', function (event) {
//Get and set value
var button = $(event.relatedTarget)
  	var jobID = button.data('jobid')
	var jobName = button.data('jobname')
	var jobDescription = button.data('jobdescription')
	var userCreatedID = button.data('usercreatedid')
	var userCreatedFullName = button.data('usercreatedfullname')
	var jobStartDate = button.data('jobstartdate') 
	var jobEndDate = button.data('jobenddate')
	var stringJobStartDate = jobStartDate.toString().split(' ')[0]
	var stringJobEndDate = jobEndDate.toString().split(' ')[0]
	var selectJobStartDate = new Date();
	selectJobStartDate = stringJobStartDate;
	var selectJobEndDate = new Date();
	selectJobEndDate = stringJobEndDate; 
// Replace
var modal = $(this)
	modal.find('#jobID').text('JobID: ' + jobID)
	modal.find('#jobName').val(jobName)
	modal.find('#jobDescription').val(jobDescription)
	modal.find('#userCreated').text('Người tạo: ' + userCreatedFullName + ' ID: ' + userCreatedID)
	modal.find('#updateID').val(jobID)
	modal.find('#startDate').val(selectJobStartDate)
	modal.find('#endDate').val(selectJobEndDate)

});

$(document).on('shown.bs.modal','#modal-job-insert', function () {
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