<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Tin tức</title>
	<style>
		.pagination {
			  display: flex;
			  justify-content:center;
			}
	
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		  transition: background-color .3s;
		  border: 1px solid #ddd;
		}

		.pagination a.active {
		  background-color: #FFA500;
		  color: white;
		  border: 1px solid #FFA500;
		}

		.pagination a:hover:not(.active) {background-color: #ddd;}
	</style>
</head>
<body>
	<div class="row">
		<%@ include file="/common/user/menu.jsp" %>
		<div class="span9">
			<form action="<c:url value='/the-loai/${idCategory}?page=${model.page}&limit=${model.limit }'/>" id="formSubmit" method="get">
			<div class="well well-small">
					<h3>
						<a class="btn btn-mini pull-right" href="products.html"
							title="View more">Xem thêm<span class="icon-plus"></span></a>
						Tin tức
					</h3>
					<hr class="soften" />
					<c:if test="${model.totalItem>0}">
						<div class="row-fluid">
							<c:forEach var="item" items="${model.listCategoryID}" varStatus="loop">
								<div class="span2">
									<img src="<c:url value="/assets/user/img/${item.thumbnail}"/>" alt="">
								</div>
								<div class="span10">
									<a href="<c:url value = "/tin-tuc/${item.id}"/>"><h5>${item.title}</h5></a>
									<p>${item.shortDescription}</p>
								</div>
								<c:if test="${(loop.index+1)%1==0||(loop.index+1)==model.totalItem }">
									</div>
									<hr class="soften">
									<c:if test="${(loop.index+1)<model.totalItem}">
										<div class="row-fluid">
									</c:if>
								</c:if>
							</c:forEach>
					</c:if>
					<div class="pagination" id="pagination">
						<c:forEach var="item" begin="1" end="${model.totalPage}" varStatus="loop">
						
						  <c:if test="${(loop.index) == model.page }">
						  	<a href="<c:url value = "/the-loai/${idCategory}/${loop.index}?page=${model.page}&limit=${model.limit }"/>" class="active">${loop.index}</a>
						  </c:if>
						  <c:if test="${(loop.index) != model.page }">
						  	<a href="<c:url value = "/the-loai/${idCategory}/${loop.index}?page=${loop.index}&limit=${model.limit }"/>">${loop.index}</a>
						  </c:if>
					  	</c:forEach>
					</div>
				
			</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>