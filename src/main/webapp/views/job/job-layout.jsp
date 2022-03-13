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
<title>Projects List</title>
</head>
<body>
	<div class="container page__container">
		<h4>Danh sách dự án</h4>
		<div class="d-flex justify-content-end">
			<div class="row">
				<div class="col-md-12 bg-light ">
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#modal-job-insert">

						<i class="fa fa-plus"></i> Thêm dự án
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
						<th scope="col">Người tham gia</th>
						<th scope="col">Ngày bắt đầu</th>
						<th scope="col">Ngày kết thúc</th>
						<th scope="col">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="job" items="${listJob}" varStatus="loop">
						<tr>
							<th scope="row">${job.jobID}</th>
							<td>${job.jobName }</td>
							<td>
								<c:forEach var="task" items="${listTask}"
									varStatus="loop">
									<c:if test="${job.jobID == task.jobID}">
										<c:forEach var="user" items="${listUser}" varStatus="loop">
											<c:if test="${task.userID == user.userID}">
											${user.fullName}<br/>
											</c:if>
										</c:forEach>
									</c:if>
								</c:forEach>
							</td>
							<td>${job.startDate }</td>
							<td>${job.endDate }</td>
							<td>
								<button style="float: left" type="button"
									class="btn btn-secondary" data-toggle="modal"
									data-target="#modal-job-update" data-jobid="${job.jobID}"
									data-jobname="${job.jobName}" data-jobstartdate="${job.startDate}"
									data-jobenddate="${job.endDate }">
									<i class="fa fa-pen"></i>
								</button>
								<form
									action="<%=request.getContextPath() + UrlConst.JOB_DELETE%>"
									method="post" style="float: left">
									<input type="hidden" id="deleteID" name="deleteID"
										value="${job.jobID}">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-trash"></i>
									</button>
								</form>
								<div style="clear: both;"></div>
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