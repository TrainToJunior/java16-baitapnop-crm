<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@page import="cybersoft.javabackend.crm.dao.RoleDAO"%>
<%@page import="cybersoft.javabackend.crm.util.JspConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasks List</title>
</head>
<body>
	<div class="container page__container">
		<h4>Danh sách công việc</h4>
		<div class="d-flex justify-content-end">
			<div class="row">
				<div class="col-md-12 bg-light ">
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#modal-task-insert">

						<i class="fa fa-plus"></i> Thêm công việc
					</button>
				</div>
			</div>
		</div>
		<div class="card">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">ID</th>

						<th scope="col">Tên dự án</th>

						<th scope="col">Tên công việc</th>
						<th scope="col">Người thực hiện</th>
						<th scope="col">Ngày bắt đầu</th>
						<th scope="col">Ngày kết thúc</th>
						<th scope="col">Trạng thái</th>

						<th scope="col">Thao tác</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="task" items="${listTask}" varStatus="loop">
						<tr>
							<th scope="row">${task.taskID}</th>

							<c:forEach var="job" items="${listJob}" varStatus="loop">
								<c:if test="${job.jobID == task.jobID}">
									<td>${job.jobName}</td>
									<c:set var="selectJobID" value="${job.jobID}" />
								</c:if>
							</c:forEach>

							<td>${task.taskName }</td>
							<c:forEach var="user" items="${listUser}" varStatus="loop">
								<c:if test="${user.userID == task.userID}">
									<td>${user.fullName}</td>
									<c:set var="selectUserName" value="${user.fullName}" />
									<c:set var="selectUserID" value="${user.userID}" />
								</c:if>
							</c:forEach>
							<td>${task.startDate }</td>
							<td>${task.endDate }</td>

							<c:forEach var="status" items="${listStatus}" varStatus="loop">
								<c:if test="${status.statusID == task.statusID}">
									<td>${status.statusName}</td>
									<c:set var="selectStatusID" value="${status.statusID}" />
								</c:if>
							</c:forEach>
							<td>
								<button style="float: left" type="button"
									class="btn btn-secondary" data-toggle="modal"
									data-target="#modal-task-update" 
									data-taskid="${task.taskID}"
									data-taskname="${task.taskName }"
									data-startdate="${task.startDate }"
									data-enddate="${task.endDate }"
									data-userid="<c:out value = "${selectUserID}"/>"
									data-jobid="<c:out value = "${selectJobID}"/>"
									data-statusid="<c:out value = "${selectStatusID}"/>"
									data-selectuser="<c:out value = "${selectUserName}"/>">
									<i class="fa fa-pen"></i>
								</button>
								<form
									action="<%=request.getContextPath() + UrlConst.TASK_DELETE%>"
									method="post" style="float: left">
									<input type="hidden" id="deleteID" name="deleteID"
										value="${task.taskID}">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-trash"></i>
									</button>
								</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<input type="hidden" id="message" name="message" value="${message}">
</body>
</html>