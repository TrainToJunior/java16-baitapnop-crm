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
	<div class="container-fluid page__container">
		<div style="padding-left: 100px; padding-right: 100px">
			<h4>Danh sách dự án</h4>
			<div class="d-flex justify-content-end">
				<div class="row">
					<div class="col-md-12 bg-light ">
						<button type="button" class="btn btn-secondary"
							data-toggle="modal" data-target="#modal-job-insert"
							data-currentuserid="${currentUser.userID}">

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
							<th scope="col">Dự án</th>
							<th scope="col">Mô tả</th>
							<th scope="col">Người tạo</th>
							<th scope="col">Người tham gia</th>
							<th scope="col">Ngày bắt đầu</th>
							<th scope="col">Ngày kết thúc</th>
							<th scope="col">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="job" items="${listJob}" varStatus="loop">
							<c:if test="${currentUser.roleID == roleAdmin}">
								<tr>
									<th scope="row">${job.jobID}</th>
									<td>${job.jobName}</td>
									<td>${job.jobDescription}</td>
									<td>
										<c:set var="foundUser" value="false" /> 
										<c:forEach
											var="user" items="${listUser}" varStatus="loop">
											<c:if test="${user.userID == job.userCreatedID}">
												${user.fullName}
												<c:set var="foundUser" value="true" />
											</c:if>
										</c:forEach> <c:if test="${foundUser eq 'false'}">
											<span style="color: red">Người tạo đã bị xóa</span>
										</c:if></td>

									<td>
										<c:set var="foundTask" value="false" /> 										
										<c:forEach var="user" items="${listUser}" varStatus="loop">
											<c:set var="foundUserDone" value="false" /> 
												<c:forEach var="task" items="${listTask}" varStatus="loop">
													<c:if test="${foundUserDone eq 'false'}">
														<c:if test="${user.userID == task.userID}">
															<c:if test="${job.jobID == task.jobID}">
																${user.fullName}<br />
																<c:set var="foundTask" value="true" /> 
																<c:set var="foundUserDone" value="true" /> 
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											<c:set var="foundUser" value="true" /> 
										</c:forEach>
										<c:set var="foundTaskUserDone" value="false" /> 
										<c:forEach var="task" items="${listTask}" varStatus="loop">
												<c:if test="${foundTaskUserDone eq 'false'}">
													<c:if test="${job.jobID == task.jobID}">
														<c:set var="foundTaskUser" value="false" /> 
														<c:set var="foundTask" value="true" /> 
															<c:forEach var="user" items="${listUser}" varStatus="loop">																
																	<c:if test="${foundTaskUser eq 'false'}">
																		<c:if test="${user.userID == task.userID}">
																			<c:set var="foundTaskUser" value="true" /> 
																		</c:if>
																	</c:if>	
															</c:forEach>
															<c:if test="${foundTaskUser eq 'false'}">
																	<span style="color: red">Có công việc chưa có người đảm nhận<br /></span>
																	<c:set var="foundTaskUserDone" value="true" /> 								
															</c:if> 		
													</c:if>
												</c:if> 	
										</c:forEach>
										<c:if test="${foundTask eq 'false'}">
											<span style="color: red">Chưa có công việc và người tham gia<br /></span>
										</c:if> 
														
									</td>
									<td>${job.startDate }</td>
									<td>${job.endDate }</td>
									<td>
										<button style="float: left" type="button"
											class="btn btn-secondary btn-sm" data-toggle="modal"
											data-target="#modal-job-update" data-jobid="${job.jobID}"
											data-jobname="${job.jobName}"
											data-jobdescription="${job.jobDescription}"
											data-jobstartdate="${job.startDate}"
											data-jobenddate="${job.endDate }">
											<i class="fa fa-pen"></i>
										</button>
										<form
											action="<%=request.getContextPath() + UrlConst.JOB_DELETE%>"
											method="post" style="float: left">
											<input type="hidden" id="deleteID" name="deleteID"
												value="${job.jobID}">
											<button type="submit" class="btn btn-primary btn-sm">
												<i class="fa fa-trash"></i>
											</button>
										</form>
										<div style="clear: both;"></div>
									</td>
								</tr>
							</c:if>
							<c:if test="${currentUser.roleID == roleLeader}">
								<c:if test="${currentUser.userID == job.userCreatedID}">
								<tr>
									<th scope="row">${job.jobID}</th>
									<td>${job.jobName}</td>
									<td>${job.jobDescription}</td>
									<td>
										<c:set var="foundUser" value="false" /> 
										<c:forEach
											var="user" items="${listUser}" varStatus="loop">
											<c:if test="${user.userID == job.userCreatedID}">
												${user.fullName}
												<c:set var="foundUser" value="true" />
											</c:if>
										</c:forEach> <c:if test="${foundUser eq 'false'}">
											<span style="color: red">Người tạo đã bị xóa</span>
										</c:if></td>

									<td>
										<c:set var="foundTask" value="false" /> 
										<c:forEach var="user" items="${listUser}" varStatus="loop">
											<c:set var="foundUserDone" value="false" /> 
												<c:forEach var="task" items="${listTask}" varStatus="loop">
													<c:if test="${foundUserDone eq 'false'}">
														<c:if test="${user.userID == task.userID}">
															<c:if test="${job.jobID == task.jobID}">
																${user.fullName}<br />
																<c:set var="foundTask" value="true" /> 
																<c:set var="foundUserDone" value="true" /> 
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											<c:set var="foundUser" value="true" /> 
										</c:forEach>
										<c:set var="foundTaskUserDone" value="false" /> 
										<c:forEach var="task" items="${listTask}" varStatus="loop">
												<c:if test="${foundTaskUserDone eq 'false'}">
													<c:if test="${job.jobID == task.jobID}">
														<c:set var="foundTaskUser" value="false" />
														<c:set var="foundTask" value="true" />  
															<c:forEach var="user" items="${listUser}" varStatus="loop">																
																	<c:if test="${foundTaskUser eq 'false'}">
																		<c:if test="${user.userID == task.userID}">
																			<c:set var="foundTaskUser" value="true" /> 
																		</c:if>
																	</c:if>	
															</c:forEach>
															<c:if test="${foundTaskUser eq 'false'}">
																	<span style="color: red">Có công việc chưa có người đảm nhận<br /></span>
																	<c:set var="foundTaskUserDone" value="true" /> 								
															</c:if> 		
													</c:if>
												</c:if> 	
										</c:forEach>
										<c:if test="${foundTask eq 'false'}">
											<span style="color: red">Chưa có công việc và người tham gia<br /></span>
										</c:if> 						
									</td>
									<td>${job.startDate }</td>
									<td>${job.endDate }</td>
									<td>
										<button style="float: left" type="button"
											class="btn btn-secondary btn-sm" data-toggle="modal"
											data-target="#modal-job-update" data-jobid="${job.jobID}"
											data-jobname="${job.jobName}"
											data-jobdescription="${job.jobDescription}"
											data-jobstartdate="${job.startDate}"
											data-jobenddate="${job.endDate }">
											<i class="fa fa-pen"></i>
										</button>
										<form
											action="<%=request.getContextPath() + UrlConst.JOB_DELETE%>"
											method="post" style="float: left">
											<input type="hidden" id="deleteID" name="deleteID"
												value="${job.jobID}">
											<button type="submit" class="btn btn-primary btn-sm">
												<i class="fa fa-trash"></i>
											</button>
										</form>
										<div style="clear: both;"></div>
									</td>
								</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<input type="hidden" id="message" name="message" value="${message}">
	<input type="hidden" id="currentUserRoleID" name="currentUserRoleID"
		value="${currentUser.roleID}">
	<input type="hidden" id="roleAdmin" name="roleAdmin"
		value="${roleAdmin}">
	<input type="hidden" id="roleLeader" name="roleLeader"
		value="${roleLeader}">
	<input type="hidden" id="roleMember" name="roleMember"
		value="${roleMember}">
</body>
</html>