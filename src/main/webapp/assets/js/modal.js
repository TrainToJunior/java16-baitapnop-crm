$(document).on('shown.bs.modal','#modal-user-update', function (event) {
//Get and set value
var button = $(event.relatedTarget)
  	var userID = button.data('userid')
	var fullName = button.data('fullname')
	var email = button.data('email') 
	var userPassword = button.data('userpassword')
	var roleID = button.data('roleid')  
// Replace
var modal = $(this)
	modal.find('#userID').text('UserID: ' + userID)
	modal.find('#updateID').val(userID)
 	modal.find('#fullName').val(fullName)
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
  	var taskID = button.data('taskid')
	var taskName = button.data('taskname')
	var startDate = button.data('startdate')
	var endDate = button.data('enddate')
	var userID = button.data('userid')
	var jobID = button.data('jobid')
	var statusID = button.data('statusid')
	var userName = button.data('selectuser')
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
	modal.find('#startDate').val(selectStartDate)
	modal.find('#endDate').val(selectEndDate)
	modal.find('#optionSelectUser').val(userID)
	modal.find('#optionSelectUser').text(userName)	
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

$(document).on('shown.bs.modal','#modal-job-update', function (event) {
//Get and set value
var button = $(event.relatedTarget)
  	var jobID = button.data('jobid')
	var jobName = button.data('jobname')
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
	modal.find('#updateID').val(jobID)
	modal.find('#startDate').val(selectJobStartDate)
	modal.find('#endDate').val(selectJobEndDate)

});