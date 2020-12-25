<%@page import="models.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Limberly</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="<%=request.getContextPath()%>/templates/public/css/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=request.getContextPath() %>/templates/public/js/jquery.min.js"></script>
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->
<div class="bgded overlay" style="background-image:url('<%=request.getContextPath()%>/uploads/images/toancanh.jpg');"> 
  <!-- ################################################################################################ -->
  <div class="wrapper row0">
    <div id="topbar" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div class="fl_left">
      	<%
			      Member userLogin = (Member) session.getAttribute("userLogin");
		    %>
        <ul class="nospace">
          <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
          <li><a href="#">About</a></li>
          <li><a href="<%=request.getContextPath()%>/auth/login">Admin</a></li>
          <li style="<%if(userLogin!=null) out.print("display: none"); %>"><a href="<%=request.getContextPath()%>/login">Login</a></li>
          <li style="<%if(userLogin!=null) out.print("display: none"); %>"><a href="<%=request.getContextPath()%>/register">Register</a></li>
          <li style="<%if(userLogin==null) out.print("display: none"); %>"><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
          <li>Xin chào <%if(userLogin!=null) out.print(userLogin.getLastName()); else out.print("Khách"); %></li>
        </ul>
      </div>
      <div class="fl_right">
        <ul class="nospace">
          <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
          <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
        </ul>
      </div>
      <!-- ################################################################################################ -->
    </div>
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="<%=request.getContextPath()%>/views/public/index.jsp">Limberly</a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="<%=request.getContextPath()%>/index">Home</a></li>
          <li><a class="drop" href="#">Pages</a>
            <ul>
              <li><a href="<%=request.getContextPath()%>/views/pages/gallery.jsp">Gallery</a></li>
              <li><a href="<%=request.getContextPath()%>/views/pages/full-width.jsp">Full Width</a></li>
              <li><a href="<%=request.getContextPath()%>/views/pages/sidebar-left.jsp">Sidebar Left</a></li>
              <li><a href="<%=request.getContextPath()%>/views/pages/sidebar-right.jsp">Sidebar Right</a></li>
              <li><a href="<%=request.getContextPath()%>/views/pages/basic-grid.jsp">Basic Grid</a></li>
            </ul>
          </li>
          <li><a class="drop" href="#">Dropdown</a>
            <ul>
              <li><a href="#">Level 2</a></li>
              <li><a class="drop" href="#">Level 2 + Drop</a>
                <ul>
                  <li><a href="#">Level 3</a></li>
                  <li><a href="#">Level 3</a></li>
                  <li><a href="#">Level 3</a></li>
                </ul>
              </li>
              <li><a href="#">Level 2</a></li>
            </ul>
          </li>
          <li><a href="#">Link Text</a></li>
          <li><a href="#">Link Text</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </header>
  </div>