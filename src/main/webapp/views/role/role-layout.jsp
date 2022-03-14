<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wrong way</title>
</head>
<body>
	<h1 style="color: red">Bạn không được phép truy cập vào trang này! </h1>
	<h2 style="color: red">Quay lại đi. <a href="<%=request.getContextPath() + UrlConst.HOME%>">Đây nè</a></h2>
</body>
</html>