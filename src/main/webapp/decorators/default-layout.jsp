<%@page import="cybersoft.javabackend.crm.util.JspConst"%>
<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title><dec:title /></title>
<jsp:include page="<%=JspConst.HEADER%>"></jsp:include>
<dec:head />
</head>
<body class="layout-fixed">
	<div class="preloader"></div>
	<!-- Header Layout -->
	<div class="mdk-header-layout js-mdk-header-layout">
		<!-- Header -->
		<jsp:include page="<%=JspConst.TOP_NAVIGATION%>"></jsp:include>
		<!-- End Header -->
		<!--HEADER CONTENT -->
		<jsp:include page="<%=JspConst.LEFT_NAVIGATION%>"></jsp:include>
		<!-- // END HEADER CONTEN -->
		<!--PAGE CONTENT -->
		<dec:body />
		<!-- // END PAGE CONTEN -->
	</div>

	<jsp:include page="<%=JspConst.BOOTER%>"></jsp:include>

	<!-- Update Modal -->
	<div id="modal-update" class="modal fade" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="px-3">
						<div class="d-flex justify-content-center mt-2 mb-4 navbar-light">
							<a href="dashboard.html" class="navbar-brand"
								style="min-width: 0"> <img class="navbar-brand-icon"
								src="assets/images/logo.png" width="250" alt="Cybersoft">
							</a>
						</div>
						<form
							action="<%=request.getContextPath() + UrlConst.UPDATE_USER%>"
							method="POST">
							<div class="form-group">
								<h5 id="userID">UserID :</h5>
								<input type="hidden" id="updateID" name="updateID">
							</div>
							<div class="form-group">
								<label for="fullName">Họ và tên:</label> <input
									class="form-control" type="text" id="fullName" name="fullName"
									placeholder="John Doe" />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input class="form-control"
									type="email" name="email" id="email" placeholder="john@doe.com" />
							</div>
							<div class="form-group">
								<label for="userPassword">Mật khẩu:</label> <input
									class="form-control" name="userPassword" id="userPassword"
									placeholder="Enter your password" />
							</div>
							<div class="form-group">
								<label for="selectRole">Quyền:</label> <select id="selectRole"
									name="selectRole">
									<c:forEach var="role" items="${listRole}" varStatus="loop">
										<option value="${role.roleID}">${role.roleName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Cập
									nhật</button>
							</div>
						</form>

					</div>
				</div>
				<!-- // END .modal-body -->
			</div>
			<!-- // END .modal-content -->
		</div>
		<!-- // END .modal-dialog -->
	</div>
	<!-- // END .modal -->

	<!-- INSERT Modal -->
	<div id="modal-insert" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="px-3">
						<div class="d-flex justify-content-center mt-2 mb-4 navbar-light">
							<a href="dashboard.html" class="navbar-brand"
								style="min-width: 0"> <img class="navbar-brand-icon"
								src="assets/images/logo.png" width="250" alt="Cybersoft">
							</a>
						</div>

						<form
							action="<%=request.getContextPath() + UrlConst.INSERT_USER%>"
							method="POST">
							<div class="form-group">
								<label for="fullName">Họ và tên:</label> <input
									class="form-control" type="text" id="fullName" name="fullName"
									placeholder="John Doe" />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input class="form-control"
									type="email" name="email" id="email" placeholder="john@doe.com" />
							</div>
							<div class="form-group">
								<label for="userPassword">Mật khẩu:</label> <input
									class="form-control" name="userPassword" id="userPassword"
									placeholder="Enter your password" />
							</div>
							<div class="form-group">
								<label for="selectRole">Quyền:</label> <select id="selectRole"
									name="selectRole">
									<c:forEach var="role" items="${listRole}" varStatus="loop">
										<option value="${role.roleID}">${role.roleName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Thêm
									thành viên</button>
							</div>
						</form>
					</div>
				</div>
				<!-- // END .modal-body -->
			</div>
			<!-- // END .modal-content -->
		</div>
		<!-- // END .modal-dialog -->
	</div>
	<!-- // END .modal -->
	
	
	
</body>
</html>