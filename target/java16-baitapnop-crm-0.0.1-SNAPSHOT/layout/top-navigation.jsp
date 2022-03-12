<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->

<div id="header" class="mdk-header bg-dark js-mdk-header m-0 shadow"
	data-fixed data-effects="waterfall">
	<div class="mdk-header__content">
		<div
			class="navbar navbar-expand-sm navbar-main navbar-dark bg-white pr-0"
			id="navbar" data-primary>
			<div class="container">
				<!-- Navbar toggler -->

				<button
					class="navbar-toggler navbar-toggler-right d-block d-md-none"
					type="button" data-toggle="sidebar">
					<span class="navbar-toggler-icon" style="color: lightgray"></span>
				</button>

				<!-- Navbar Brand -->
				<a href="dashboard.html" class="navbar-brand"> <img
					class="navbar-brand-icon" src="assets/images/logo.png" height="50"
					alt="Cybersoft" />
				</a> <span class="mr-3"></span>
				<ul
					class="nav navbar-nav d-none d-sm-flex border-left navbar-border navbar-height align-items-center">
					<li class="nav-item dropdown"><a href="#account_menu"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						data-caret="false"> <span class="avatar avatar-sm"> <span
								class="avatar-title rounded-circle bg-warning">${currentUser.getName()}</span>
						</span>
					</a>
						<div id="account_menu" class="dropdown-menu dropdown-menu-right">
							<div class="dropdown-item-text dropdown-item-text--lh">
								<div>
									<strong>${currentUser.fullName}</strong>
								</div>
								<div>${currentUser.email}</div>
							</div>
							<form action="<%=request.getContextPath() + UrlConst.HOME%>"
								method="POST">
								<input class="dropdown-item" type="submit" value="Log out" />
							</form>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- // END Header -->