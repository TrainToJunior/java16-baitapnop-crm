<%@page import="cybersoft.javabackend.crm.util.JspConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<div class="container-sm">
	<h1>Chào mừng đã quay trở lại ^^</h1>
	<input type="hidden" id="currentUserRoleID" name="currentUserRoleID" value="${currentUser.roleID}">
	<input type="hidden" id="roleAdmin" name="roleAdmin" value="${roleAdmin}">
	<input type="hidden" id="roleLeader" name="roleLeader" value="${roleLeader}">
	<input type="hidden" id="roleMember" name="roleMember" value="${roleMember}">
	</div>
</body>
</html>