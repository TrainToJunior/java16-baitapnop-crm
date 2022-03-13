<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>

<link href="<c:url value="/assets/images/favicon.ico"/>"
	rel="shortcut icon">

<!-- Perfect Scrollbar -->
<link type="text/css"
	href="<c:url value="/assets/vendor/perfect-scrollbar.css"/>"
	rel="stylesheet">

<!-- App CSS -->
<link type="text/css" href="<c:url value="/assets/css/app.css"/>"
	rel="stylesheet">
<link type="text/css" href="<c:url value="/assets/css/app.rtl.css"/>"
	rel="stylesheet">

<!-- Material Design Icons -->
<link type="text/css"
	href="<c:url value="/assets/css/vendor-material-icons.css"/>"
	rel="stylesheet">
<link type="text/css"
	href="<c:url value="/assets/css/vendor-material-icons.rtl.css"/>"
	rel="stylesheet">

<!-- Font Awesome FREE Icons -->
<link type="text/css"
	href="<c:url value="/assets/css/vendor-fontawesome-free.css"/>"
	rel="stylesheet">
<link type="text/css"
	href="<c:url value="/assets/css/vendor-fontawesome-free.rtl.css"/>"
	rel="stylesheet">
</head>

<body class="layout-login">





	<div class="layout-login__overlay"></div>
	<div class="layout-login__form bg-white" data-perfect-scrollbar>
		<div class="d-flex justify-content-center mt-2 mb-5 navbar-light">
			<a href="index.html" class="navbar-brand" style="min-width: 0"> <img
				class="navbar-brand-icon" src="assets/images/logo.png" width="250"
				alt="Stack">
			</a>
		</div>

		<h4 class="m-0">Welcome back!</h4>
		<p class="mb-5">Login to access your account</p>

		<form action="<%=request.getContextPath() + UrlConst.LOGIN%>"
			method="post" class="form-group">

			<label class="text-label" for="email_2">Email Address:</label>
			<div class="input-group input-group-merge">
				<input id="email_2" type="email" name="email_2"
					class="form-control form-control-prepended"
					placeholder="john@doe.com">
				<div class="input-group-prepend">
					<div class="input-group-text">
						<span class="far fa-envelope"></span>
					</div>
				</div>
			</div>


			<label class="text-label" for="password_2">Password:</label>
			<div class="input-group input-group-merge">
				<input id="password_2" type="password" name="password_2"
					class="form-control form-control-prepended"
					placeholder="Enter your password">
				<div class="input-group-prepend">
					<div class="input-group-text">
						<span class="fa fa-key"></span>
					</div>
				</div>
			</div>
			<button class="btn btn-primary mb-5" type="submit">Login</button>
			<br> <input type="hidden" id="message" name="message"
				value="Xin chào!">
		</form>

	</div>


	<!-- jQuery -->
	<script src="assets/vendor/jquery.min.js"></script>

	<!-- Bootstrap -->
	<script src="assets/vendor/popper.min.js"></script>
	<script src="assets/vendor/bootstrap.min.js"></script>

	<!-- Perfect Scrollbar -->
	<script src="assets/vendor/perfect-scrollbar.min.js"></script>

	<!-- DOM Factory -->
	<script src="assets/vendor/dom-factory.js"></script>

	<!-- MDK -->
	<script src="assets/vendor/material-design-kit.js"></script>

	<!-- App -->
	<script src="assets/js/toggle-check-all.js"></script>
	<script src="assets/js/check-selected-row.js"></script>
	<script src="assets/js/dropdown.js"></script>
	<script src="assets/js/sidebar-mini.js"></script>
	<script src="assets/js/app.js"></script>

	<!-- App Settings (safe to remove) -->
	<script src="assets/js/app-settings.js"></script>






</body>

</html>