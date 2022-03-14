<%@page import="cybersoft.javabackend.crm.util.UrlConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mdk-header-layout__content page">
            <div class="page__header mb-0">
                <div class="container page__container">
                    <div class="navbar navbar-secondary navbar-light navbar-expand-sm p-0">
                        <button class="navbar-toggler navbar-toggler-right" data-toggle="collapse" data-target="#navbarsExample03" type="button">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="navbar-collapse collapse" id="navbarsExample03">
                            <ul class="nav navbar-nav flex">
                                <li class="nav-item">
                                    <a class="nav-link active" href="<%=request.getContextPath()+ UrlConst.HOME%>">
                                        Home</a>
                                </li>
                                 <li class="nav-item" >
                                    <a id="navJob" class="nav-link active" href="<%=request.getContextPath()+ UrlConst.JOB%>">
                                        Dự án</a>
                                </li>
                                <li class="nav-item">
                                    <a  id = "navTask" class="nav-link active" href="<%=request.getContextPath()+ UrlConst.TASK%>">
                                        Công việc</a>
                                </li>
                                <li class="nav-item" >
                                    <a id = "navUser" class="nav-link active" href="<%=request.getContextPath()+ UrlConst.USER%>">
                                        Thành viên</a>
                                </li>
                             
                     
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>