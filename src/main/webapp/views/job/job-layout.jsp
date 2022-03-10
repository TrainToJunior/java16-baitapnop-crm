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
		<h4>Danh sách dự án </h4>
		<div class="d-flex justify-content-end">
			<div class="row">
				<div class="col-md-12 bg-light ">
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#modal-job">
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
						<th scope="col">Người bắt đầu</th>
						<th scope="col">Ngày kết thúc</th>
						<th scope="col">Thao tác</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="job" items="${listJob}" varStatus="loop">
						<tr>
							<th scope="row">${job.jobID}</th>
							<td>${job.jobName }</td>
							<td>${job.startDate }</td>
							<td>${job.endDate }</td>
							<td></td>
														
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>