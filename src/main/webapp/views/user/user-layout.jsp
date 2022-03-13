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
<title>Home</title>
</head>
<body>
	<div class="container-fluid page__container">
		<div style="padding-left: 200px; padding-right: 200px">
			<h4>Danh sách thành viên</h4>
			<div class="d-flex justify-content-end">
				<div class="row">
					<div class="col-md-12 bg-light ">
						<button type="button" class="btn btn-secondary"
							data-toggle="modal" data-target="#modal-user-insert">
							<i class="fa fa-plus"></i> Thêm thành viên
						</button>

					</div>
				</div>
			</div>
			<div class="card">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">UserID</th>
							<th scope="col">Email</th>
							<th scope="col">Họ và tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Quyền</th>
							<th scope="col">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${listUser}" varStatus="loop">
							<tr>
								<th scope="row">${user.userID}</th>
								<td>${user.email}</td>
								<td>${user.fullName}</td>
								<td>${user.phoneNumber}</td>
								<td>${user.address}</td>
								<c:forEach var="role" items="${listRole}" varStatus="loop">
									<c:if test="${user.roleID == role.roleID}">
										<td>${role.roleName}</td>
										<c:set var="roleID" value="${user.roleID}" />
									</c:if>
								</c:forEach>
								<td>
									<button style="float: left" type="button"
										class="btn btn-secondary btn-sm" data-toggle="modal"
										data-target="#modal-user-update" data-userid="${user.userID}"
										data-fullname="${user.fullName}" data-email="${user.email}"
										data-phonenumber="${user.phoneNumber}"
										data-address="${user.address}"
										data-userpassword="${user.userPassword}"
										data-roleid="<c:out value = "${roleID}"/>">
										<i class="fa fa-pen"></i>
									</button>
									<form
										action="<%=request.getContextPath() + UrlConst.USER_DELETE%>"
										method="post" style="float: left">
										<input type="hidden" id="deleteID" name="deleteID"
											value="${user.userID}">
										<button type="submit" class="btn btn-primary btn-sm">
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
	</div>
	<input type="hidden" id="message" name="message" value="${message}">

</body>
</html>