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

	<!-- USER-UPDATE Modal -->
	<div id="modal-user-update" class="modal fade" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.USER_UPDATE%>"
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
								<label for="phoneNumber">Số điện thoại:</label> <input
									class="form-control" type="number" id="phoneNumber" name="phoneNumber"
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="address">Địa chỉ:</label> <input
									class="form-control" type="text" id="address" name="address"
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input class="form-control"
									type="email" name="email" id="email" placeholder="john@doe.com" />
							</div>
							<div class="form-group">
								<label for="userPassword">Mật khẩu:</label> <input
									type ="password"
									class="form-control" name="userPassword" id="userPassword"
									placeholder="Enter your password" />
							</div>
							<div class="form-group role-options">
								<h5 id="selectRole">Quyền :</h5> <select id="selectRole"
									name="selectRole" required>
									<c:forEach var="role" items="${listRole}" varStatus="loop">
										<option value="${role.roleID}">${role.roleName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Cập nhật</button>
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

	<!-- USER-INSERT Modal -->
	<div id="modal-user-insert" class="modal fade" tabindex="-1" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.USER_INSERT%>"
							method="POST">
							<div class="form-group">
								<label for="fullName">Họ và tên:</label> <input
									class="form-control" type="text" id="fullName" name="fullName"
									placeholder="John Doe" />
							</div>
							<div class="form-group">
								<label for="phoneNumber">Số điện thoại:</label> <input
									class="form-control" type="number" id="phoneNumber" name="phoneNumber"
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="address">Địa chỉ:</label> <input
									class="form-control" type="text" id="address" name="address"
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input class="form-control"
									type="email" name="email" id="email" placeholder="john@doe.com" />
							</div>
							<div class="form-group">
								<label for="userPassword">Mật khẩu:</label> <input
									type ="password"
									class="form-control" name="userPassword" id="userPassword"
									placeholder="Enter your password" />
							</div>
							<div class="form-group">
								<label for="selectRole">Quyền:</label> <select id="selectRole"
									name="selectRole" required>
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
	
	<!-- TASK-UPDATE Modal -->
	<div id="modal-task-update" class="modal fade" tabindex="-1" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.TASK_UPDATE%>"
							method="POST">
							<div class="form-group">
								<h5 id="taskID">TaskID :</h5>
								<input type="hidden" id="updateID" name="updateID">
							</div>
							<div class="form-group">
								<label for="taskName">Tên công việc :</label> <input class="form-control"
									type="text" id="taskName" name="taskName" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="taskDescription">Mô tả :</label> <input class="form-control"
									type="text" id="taskDescription" name="taskDescription" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="startDate">Ngày bắt đầu:</label> <input
									class="form-control" type="date" name="startDate" id="startDate" required=""
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="endDate">Ngày kết thúc:</label> <input
									class="form-control" type="date" name="endDate" id="endDate" required=""
									placeholder=""  value=""/>
							</div>
							<div class="form-group user-options">
								<label for="selectUserTaskUpdate">Người thực hiện: </label> <select id="selectUserTaskUpdate"
									name="selectUserTaskUpdate" required >									 
									<c:forEach var="user" items="${listUser}" varStatus="loop">
											<option value="${user.userID}" class="${user.roleID}">${user.fullName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group job-options">
								<label for="selectJob">Dự án: </label> <select id="selectJob"
									name="selectJob"  required>									 
									<c:forEach var="job" items="${listJob}" varStatus="loop">	
											<c:if test="${roleLeader  == currentUser.roleID}">	
												<c:if test="${job.userCreatedID == currentUser.userID}">
													<option value="${job.jobID}">${job.jobName}</option>
												</c:if>
											</c:if>
											<c:if test="${roleLeader != currentUser.roleID}">
											<option value="${job.jobID}">${job.jobName}</option>
											</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group status-options">
								<label for="selectStatus">Trạng thái: </label> <select id="selectStatus"
									name="selectStatus" required >									 
									<c:forEach var="status" items="${listStatus}" varStatus="loop">
											
											<option value="${status.statusID}">${status.statusName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Cập nhật</button>
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
	
	<!-- TASK-INSERT Modal -->
	<div id="modal-task-insert" class="modal fade" tabindex="-1" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.TASK_INSERT%>"
							method="POST">
							<div class="form-group">
								<label for="taskName">Tên công việc :</label> <input class="form-control"
									type="text" id="taskName" name="taskName" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="taskDescription">Mô tả :</label> <input class="form-control"
									type="text" id="taskDescription" name="taskDescription" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="startDate">Ngày bắt đầu:</label> <input
									class="form-control" type="date" name="startDate" id="startDate" required=""
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="endDate">Ngày kết thúc:</label> <input
									class="form-control" type="date" name="endDate" id="endDate" required=""
									placeholder="" />
							</div>
							<div class="form-group user-options">
								<label for="selectUser">Người thực hiện: </label> <select id="selectUser"
										name="selectUser" required >																 
									<c:forEach var="user" items="${listUser}" varStatus="loop">
											<option value="${user.userID}" class="${user.roleID}">${user.fullName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group job-options">
								<label for="selectJob">Dự án: </label> <select id="selectJob"
									name="selectJob"  required>									 
									<c:forEach var="job" items="${listJob}" varStatus="loop">	
											<c:if test="${roleLeader  == currentUser.roleID}">	
												<c:if test="${job.userCreatedID == currentUser.userID}">
													<option value="${job.jobID}">${job.jobName}</option>
												</c:if>
											</c:if>
											<c:if test="${roleLeader != currentUser.roleID}">
											<option value="${job.jobID}">${job.jobName}</option>
											</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="selectStatus">Trạng thái: </label> <select id="selectStatus"
									name="selectStatus" required >									 
									<c:forEach var="status" items="${listStatus}" varStatus="loop">								
											<option value="${status.statusID}">${status.statusName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Thêm mới</button>
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
	
	
	<!-- JOB-INSERT Modal -->
	<div id="modal-job-insert" class="modal fade" tabindex="-1" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.JOB_INSERT%>"
							method="POST">
							<input type="hidden" id="userCreatedID" name="userCreatedID">
							<div class="form-group">
								<label for="jobName">Tên dự án :</label> <input class="form-control"
									type="text" id="jobName" name="jobName" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="jobDescription">Mô tả :</label> <input class="form-control"
									type="text" id="jobDescription" name="jobDescription" required="" placeholder="" />
							</div>
							<div class="form-group">	
								<label for="startDate">Ngày bắt đầu:</label> <input
									class="form-control" type="date" name="startDate" id="startDate" required=""
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="enddate">Ngày kết thúc:</label> <input
									class="form-control" type="date" name="endDate" id="endDate" required=""
									placeholder="" />
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Thêm mới</button>
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
	
	<!-- JOB-UPDATE Modal -->
	<div id="modal-job-update" class="modal fade" tabindex="-1" role="dialog"
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
							action="<%=request.getContextPath() + UrlConst.JOB_UPDATE%>"
							method="POST">
							<div class="form-group">
								<h5 id="jobID">JobID :</h5>
								<input type="hidden" id="updateID" name="updateID">
							</div>
							<div class="form-group">
								<label for="jobName">Tên dự án :</label> <input class="form-control"
									type="text" id="jobName" name="jobName" required="" placeholder="" />
							</div>
							<div class="form-group">
								<label for="jobDescription">Mô tả :</label> <input class="form-control"
									type="text" id="jobDescription" name="jobDescription" required="" placeholder="" />
							</div>
							
							<div class="form-group">
								<label for="startDate">Ngày bắt đầu:</label> <input
									class="form-control" type="date" name="startDate" id="startDate" required=""
									placeholder="" />
							</div>
							<div class="form-group">
								<label for="endDate">Ngày kết thúc:</label> <input
									class="form-control" type="date" name="endDate" id="endDate" required=""
									placeholder="" />
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Cập nhật</button>
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