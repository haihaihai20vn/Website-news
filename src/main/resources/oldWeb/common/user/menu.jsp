<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
	
	<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Trang nhất</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Mới nhất</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Xem nhiều</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Tin nóng</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Tin tức trong ngày</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Video</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Podcast</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Ảnh</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span> Xem thêm</a></li>
					<li style="border: 0">&nbsp;</li>
					<li><a class="totalInCart" href="cart.html">
						<strong>Tý giá USD 
					    	<span class="badge badge-warning pull-right" style="line-height: 18px;">23.423</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>Du lịch quốc tế</h2>
				<p>
					Mở cửa an toàn. <br> <br> <a
						class="defaultBtn" href="#">Click here </a>
				</p>
			</div>
			<div class="well well-small">
				<a href="#"><img
					src="<c:url value="/assets/user/img/paypal.jpg"/>"
					alt="payment method paypal"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Việc tốt nhất cho bạn <br>
				<small>Xem ngay</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<li>
					<div class="thumbnail">
						<a class="zoomTool" href="product_details.html"
							title="add to cart"><span class="icon-search"></span> QUICK
							VIEW</a> <img
							src="<c:url value="/assets/user/img/bootstrap-ecommerce-templates.PNG"/>"
							alt="bootstrap ecommerce templates">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="product_details.html">VIEW</a> <span
									class="pull-right">$22.00</span>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool" href="product_details.html"
							title="add to cart"><span class="icon-search"></span> QUICK
							VIEW</a> <img
							src="<c:url value="/assets/user/img/shopping-cart-template.PNG"/>"
							alt="shopping cart template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="product_details.html">VIEW</a> <span
									class="pull-right">$22.00</span>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
			</ul>

		</div>
	

</html>