<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
<title>Trang chủ</title>
</head>
<body>
	<div class="row">
		<%@ include file="/common/user/menu.jsp" %>
		<div class="span9">
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">
						<div class="item">
			                <img style="width:100%" src="<c:url value="/assets/user/img/slide/bootstrap_free-ecommerce.png"/>" alt="bootstrap ecommerce templates">
			                <div class="carousel-caption">
			                      <h4>Bootstrap shopping cart</h4>
			                      <p><span>Very clean simple to use</span></p>
			                </div>
			              </div>
						  <div class="item">
			                <img style="width:100%" src="<c:url value="/assets/user/img/slide/carousel1.png"/>" alt="bootstrap ecommerce templates">
			                <div class="carousel-caption">
			                      <h4>Bootstrap Ecommerce template</h4>
			                      <p><span>Highly Google seo friendly</span></p>
			                </div>
			              </div>
						  <div class="item active">
			                <img style="width:100%" src="<c:url value="/assets/user/img/slide/carousel3.png"/>" alt="bootstrap ecommerce templates">
			                <div class="carousel-caption">
			                      <h4>Twitter Bootstrap cart</h4>
			                      <p><span>Very easy to integrate and expand.</span></p>
			                </div>
			              </div>
			              <div class="item">
			                <img style="width:100%" src="<c:url value="/assets/user/img/slide/bootstrap-templates.png"/>" alt="bootstrap templates">
			                <div class="carousel-caption">
			                      <h4>Bootstrap templates integration</h4>
			                      <p><span>Compitable to many more opensource cart</span></p>
			                </div>
			              </div>
					</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
								href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</div>
			<!--
New Products
-->
			<div class="well well-small">
				<h3>Tin nóng</h3>
				<hr class="soften" />
				<div class="row-fluid">
					<div id="newProductCar" class="carousel slide">
						<div class="carousel-inner">
							<c:if test="${news.totalItem>0 }">
								<div class="item active">
									<ul class="thumbnails">
									<c:forEach var="item" items="${news.listResult}" varStatus="loop">
										<li class="span4">
											<div class="thumbnail">
												<a href="tin-tuc/${item.id}"><h5>${item.title}</h5></a>
												<div class="caption">
													<span>${item.shortDescription}</span>
												</div>
											</div>	
										</li>
										<c:if test="${(loop.index+1)%3==0||(loop.index+1)==news.totalItem }">
												</ul>
											</div>
											<c:if test="${(loop.index+1)<news.totalItem}">
												<div class="item">
													<ul class ="thumbnails">
											</c:if>
										</c:if>
									</c:forEach>
							</c:if>
						</div>
						<a class="left carousel-control" href="#newProductCar"
							data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
							href="#newProductCar" data-slide="next">&rsaquo;</a>
					</div>
				</div>
			</div>
			<!--
	Featured Products
	-->
			<div class="well well-small">
				<h3>
					<a class="btn btn-mini pull-right" href="products.html"
						title="View more">VIew More<span class="icon-plus"></span></a>
					Tin mới
				</h3>
				<hr class="soften" />
				
						<c:if test="${news.totalItem>0}">
						<div class="row-fluid">
							<c:forEach var="item" items="${news.listLatestNews}" varStatus="loop">
								<div class="span2">
									<img src="<c:url value="/assets/user/img/${item.thumbnail}"/>" alt="">
								</div>
								<div class="span10">
									<h5>${item.title}</h5>
									<p>${item.shortDescription}</p>
								</div>
							<c:if test="${(loop.index+1)%1==0||(loop.index+1)==news.totalItem }">
								</div>
									<hr class="soften">
								<c:if test="${(loop.index+1)<news.totalItem}">
									<div class="row-fluid">
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
			


			<div class="well well-small">
				<a class="btn btn-mini pull-right" href="#">View more <span
					class="icon-plus"></span></a> Popular Products
			</div>
			<hr>
			<div class="well well-small">
				<a class="btn btn-mini pull-right" href="#">View more <span
					class="icon-plus"></span></a> Best selling Products
			</div>
			</div>
		</div>
</body>
</html>