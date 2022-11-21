<%@ page import = "com.javaweb.utils.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="<c:url value="/assets/user/images/logo.svg"/>" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="<c:url value="/assets/user/images/logo-mini.svg"/>" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Tìm kiếm" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav">
		  	<li class="active"><a href="<c:url value='/trang-chu' />"><i class="mdi mdi-home"></i></a></li>
			  <c:forEach var="item" items="${category.listResult}" varStatus="index">
				 &nbsp;  &nbsp;  &nbsp;<li class=""><a href='<c:url value="/the-loai/${item.id}?page=1&limit=2"/>'> ${item.name}</a></li>
			  </c:forEach>
		  
		</ul>
        <ul class="navbar-nav navbar-nav-right">
	       	<security:authorize access="isAnonymous()">
	       		<li class="nav-item"> 
					<a href="<c:url value='/dang-nhap' />"><span class="mdi mdi-account-box"></span> Đăng nhập</a> 
				</li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				 <li class="nav-item">
		          	<%=SecurityUtils.getPrincipal().getFullname()%>
		          </li>
		          <li class="nav-item nav-profile dropdown">
		            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
		              <img src="<c:url value="/assets/user1/images/faces/face28.jpg"/>" alt="profile"/>
		            </a>
		            
		            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
		              <a class="dropdown-item">
		                <i class="ti-settings text-primary"></i>
		                Cài đặt
		              </a>
		              <a class="dropdown-item" href="<c:url value='/thoat' />">
		                <i class="ti-power-off text-primary"></i>
		                Thoát
		              </a>
		            </div>
		          </li>
			</security:authorize>
         
          
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>