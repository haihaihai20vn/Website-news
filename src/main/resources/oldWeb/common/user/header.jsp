<%@ page import = "com.javaweb.utils.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
	Upper Header Section 
-->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="topNav">
		<div class="container">
			<div class="alignR">
				<div class="pull-left socialNw">
					<a href="#"><span class="icon-twitter"></span></a>
					<a href="#"><span class="icon-facebook"></span></a>
					<a href="#"><span class="icon-youtube"></span></a>
					<a href="#"><span class="icon-tumblr"></span></a>
				</div>
				<a class="active" href="<c:url value='/trang-chu' />"> <span class="icon-home"></span> Trang chủ</a> 
				<security:authorize access="isAnonymous()"> 
					<a href="<c:url value='/dang-nhap' />"><span class="icon-user"></span> Đăng nhập</a> 
					<a href="<c:url value='/dang-ky' />"><span class="icon-edit"></span> Đăng ký </a> 
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<a href="contact.html"><span class="icon-envelope"></span> Chào mừng <%=SecurityUtils.getPrincipal().getFullname()%> </a>
					<a href="<c:url value='/thoat' />"><span class="badge badge-warning"> Thoát</span></a>
				</security:authorize>
			</div>
		</div>
	</div>
</div>

<!--
Lower Header Section 
-->
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="index.html"><span>Twitter Bootstrap ecommerce template</span> 
		<img src="<c:url value="/assets/user/img/logo-bootstrap-shoping-cart.png"/>" alt="bootstrap sexy shop">
	</a>
	</h1>
	</div>
	<div class="span4">
		<div class="offerNoteWrapper">
			<h1 class="dotmark">
				<i class="icon-cut"></i>
				Twitter Bootstrap shopping cart HTML template is available @ $14
			</h1>
		</div>
	</div>
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<span class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span>
	<span class="btn btn-warning btn-mini">$</span>
	<span class="btn btn-mini">&pound;</span>
	<span class="btn btn-mini">&euro;</span>
	</div>
</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
		  	<ul class="nav">
		  		<li class="active"><a href="<c:url value='/trang-chu' />">Trang chủ	</a></li>
			  <c:forEach var="item" items="${category.listResult}" varStatus="index">
					<!--<c:if test="${index.first}">
						<li class="active">
					</c:if>
					<c:if test="${not index.first }">
						<li class="">
					</c:if>-->
					<li class=""><a href='<c:url value="/the-loai/${item.id}?page=1&limit=2"/>'>${item.name}</a></li>
				</c:forEach>
			  
			</ul>
			
			<form action="#" class="navbar-search pull-left">
			  <input type="text" placeholder="Tìm kiếm" class="search-query span2">
			</form>
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Đăng nhập <b class="caret"></b></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm">
				  <div class="control-group">
					<input type="text" class="span2" id="inputEmail" placeholder="Email">
				  </div>
				  <div class="control-group">
					<input type="password" class="span2" id="inputPassword" placeholder="Password">
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Nhớ tài khoản
					</label>
					<button type="submit" class="shopBtn btn-block">Đăng nhập</button>
				  </div>
				</form>
				</div>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>