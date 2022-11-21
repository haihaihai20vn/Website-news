<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<style type="text/css">
	.sizeImg{
  		height: 100px;
  		width: 100px;
  	}
  	
  	.hideScroll{
  		overflow-x: hidden; /* Hide horizontal scrollbar */
  	}
  	
  	.marginVideo{
  		margin-left: 20px;
  	}
  	
  	.sizeVideo{
  		width: 380px;
  	}
  	
  	.marginDate{
  		margin-top: 20px;
  	}
</style>
</head>
<body>
	<div class="main-panel">
        <div class="content-wrapper">
        	<%@include file="/common/user/navbar.jsp" %>
	        <div class="row">
	            <div class="col-md-12 grid-margin stretch-card">
	              <div class="card position-relative">
	                <div class="card-body">
	                	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <ol class="carousel-indicators">
						    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						  </ol>
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img class="d-block w-100" src="<c:url value="/assets/user/images/banner.jpg"/>" alt="First slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="<c:url value="/assets/user/images/banner.jpg"/>" alt="Second slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="<c:url value="/assets/user/images/banner.jpg"/>" alt="Third slide">
						    </div>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
	                </div>
	              </div>
	            </div>
	         </div>
	         <div class="row fixedRow">
	            <div class="col-md-12 grid-margin stretch-card">
	              <div class="card position-relative">
	                <div class="card-body">
	                	  <div class="d-flex justify-content-between">
			                  <p class="card-title">Tin mới</p>
			                  <!--Controls-->
			                  <div class="card-title">
							    <a class="left carousel-control buttonSlide" href="#multi-item-example" role="button" data-slide="prev">
			                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                      <span class="sr-only">Previous</span>
			                    </a>
			                    <a class="right carousel-control buttonSlide" href="#multi-item-example" role="button" data-slide="next">
			                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                      <span class="sr-only">Next</span>
			                    </a>
			                    </div>
			                 </div>
			                 <hr>
	                 <!--Carousel Wrapper-->
						  <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
						   <!--Indicators-->
						    <ol class="carousel-indicators">
						      <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
						      <li data-target="#multi-item-example" data-slide-to="1"></li>
						      <li data-target="#multi-item-example" data-slide-to="2"></li>
						    </ol>
						    <!--/.Indicators-->
						
						    <!--Slides-->
					    	 <div class="carousel-inner" role="listbox">
								<c:if test="${news.totalItem>0 }">
									<div class="carousel-item active">
								        <div class="row">
									       <c:forEach var="item" items="${news.listResult}" varStatus="loop">
									          <div class="col-md-4">
									            <div class="card mb-2">
									              <img class="card-img-top" src="<c:url value="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"/>"
									                   alt="Card image cap">
									              <div class="card-body">
									              <a href="<c:url value="/tin-tuc/${item.id}"/>">
									                <h4 class="card-title">${item.title }</h4>
									              </a>
									                <p class="card-text">${item.shortDescription}</p>
									                 <p class="card-description">
									                    <small class="text-muted">${item.createdDate}</small>
									                  </p>
									              </div>
									            </div>
									          </div>
									          <c:if test="${(loop.index+1)%3==0||(loop.index+1)==news.totalItem }">
										          </div>
										         </div>
										          <c:if test="${(loop.index+1)<news.totalItem}">
										          	<div class="carousel-item">
										          		 <div class="row">
										          </c:if>
									          </c:if>
									          </c:forEach>
								</c:if>
							</div>
						    
						    <!--/.Slides-->
						</div>
					  </div>
	                </div>
	              </div>
	            </div>
          <div class="row">
	            <div class="col-md-7 grid-margin stretch-card">
	              <div class="card position-relative">
	                <div class="card-body">
	                	<div class="d-flex justify-content-between">
		                  <p class="card-title">Tin nóng</p>
		                  <a href="#" class="text-info">View all</a>
		                 </div>
		                 <hr>
	                      	<c:forEach var="item" items="${news.listBreakingNews}">
	                      	<div class="row">
		                      	<div class="col-2">
		                      		<img class="sizeImg" src="<c:url value="/assets/user/img/a.jpg"/>" alt="">
		                        </div>
		                        <div class="col-10">
		                          <a href="<c:url value = "/tin-tuc/${item.id}"/>"><h5>${item.title }</h5></a>
		                          <address>
					                 <p class="font-weight-500 mb-0">${item.shortDescription }</p>
					                <small class="text-muted">${item.createdDate}</small>
					              </address>
		                        </div>
		                     </div>
		                     <hr>
							</c:forEach >	
	                </div>
         			</div>
          		</div>
          		<div class="col-md-5 grid-margin stretch-card">
		              <div class="row">
		                <div class="col-md-12 grid-margin stretch-card">
		                  <div class="card">
		                <div class="card-body">
		               		<h4 class="card-title">Thị trường</h4>
		                  <p class="card-description">
		                    Add class <code>.table</code>
		                  </p>
		                  <div class="table-responsive hideScroll">
		                    <table class="table ">
		                      <thead>
		                        <tr>
		                          <th>Giá vàng</th>
		                          <th>Mua</th>
		                          <th>Bán</th>
		                        </tr>
		                      </thead>
		                      <tbody>
		                        <tr>
		                          <td>Vàng SJC(triệu đồng/lượng)</td>
		                          <td>65,3</td>
		                          <td>66,3</td>
		                        </tr>
		                        <tr>
		                          <td>Thế giới(USD/ounce)</td>
		                          <td>1.695</td>
		                          <td>1.695,5</td>
		                        </tr>
		                        
		                      </tbody>
		                    </table>
		                  </div>
		                </div>
		              </div>
		              </div>
		              <div class="col-md-12 grid-margin stretch-card">
		                  <div class="card">
		                <div class="card-body">
		               		<h4 class="card-title">Video</h4>
		                  	<c:forEach var="item" items="${news.listVideo}">
	                      	<div class="row">
	                      		<div class="marginVideo sizeVideo" >${item.content}</div>
	                      		<address>
			                      	<h5 class="card-text marginVideo">${item.title}</h5>
			                      	<small class="text-muted marginVideo">${item.createdDate}</small>
		                      	</address>
		                     </div>
		                     <hr>
							</c:forEach >
		                </div>
		              </div>
		              </div>
		              </div>
	             
           	 </div>
           	 
          	</div>
          	
          
          
          
        </div>
        <!-- content-wrapper ends -->
         <%@include file="/common/user/footer.jsp" %>
      </div>
      <!-- main-panel ends -->
     
</body>
</html>