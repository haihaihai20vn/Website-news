<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewsURL" value="/tin-tuc/" />
<c:url var="EditNewsURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="CommentApiURL" value="/api/comment" />
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <title>Tin tức</title>
  <style>
  	.sidebarColor{
  		background-color: #F5F7FF;
  	}
  	
  	.slideNews{
  		background-color: purple;
  	}
  	.gray{
  		background-color: gray;
  	}
  	
  	.buttonSlide{
  		color: blue;
  		background-color: blue;
  		padding: 5px;
  		padding-top: 10px;
  		margin-left: 1px;
  	}
  	
  	.fixedRow{
  		height:500px;
  	}
  	
  	.images{
  		width:100px;
  		height:100px;
  	}
  	
  	.rightButton{
  		margin-left: 400px;
  	}
  	
  	.marginButton{
  		margin-right: 5px;
  	}
  	
  	.borderBread{
  		border: none;
  	}
  	
  	.colorTime{
  		color: gray;
  	}
  	.icons{
  		margin-left: 430px;
  	}
  	.iconItem{
  		margin-right: 10px;
  	}
  	
  	.marginTitle{
  		margin-top: 10px;
  	}
  </style>
</head>
<body>
  
      <div class="main-panel">
        <div class="content-wrapper">
          <%@include file="/common/user/navbar.jsp" %>  
          <div class="row">
	            <div class="col-md-8 grid-margin stretch-card">
	              <div class="card position-relative">
	                <div class="card-body">
	                	<div class="d-flex justify-content-between">
		                  <nav aria-label="breadcrumb">
							  <ul class="breadcrumb borderBread">
							    <li class="breadcrumb-item"><a href="<c:url value="/test"/>"><i class="mdi mdi-home"></i></a></li>
							    <li class="breadcrumb-item"><a href="#">Thể loại</a></li>
							    <li class="breadcrumb-item active" aria-current="page">${news.title}</li>
							  </ul>
							</nav>
		                 </div>
		                 <p>${news.content}</p>
		                 <hr>
		                  <div class="icons">
		                  	  <i class="mdi mdi-thumb-up-outline iconItem"></i>
		                  	  <i class="mdi mdi-thumb-down-outline iconItem"></i>
		                  	  <i class="mdi mdi-content-save iconItem"></i>
		                  	  <i class="mdi mdi-link-variant iconItem"></i>
			                  <i class="mdi mdi-facebook-box iconItem"></i>
					          <i class="mdi mdi-twitter-circle iconItem"></i>
					          <i class="mdi mdi-flag"></i>
				          </div>
		                 <div class="row m-b-30">
                           <div class="col-lg-12 col-xl-12">
                               <!-- Nav tabs -->
                               <ul class="nav nav-tabs md-tabs" role="tablist">
                                   <li class="nav-item">
                                       <a class="nav-link active" data-toggle="tab" href="#home3" role="tab">Bình luận</a>
                                       <div class="slide"></div>
                                   </li>
                                   <li class="nav-item">
                                       <a class="nav-link" data-toggle="tab" href="#profile3" role="tab">Liên quan</a>
                                       <div class="slide"></div>
                                   </li>
                               </ul>
                               <!-- Tab panes -->
                               <div class="tab-content card-block">
                                   <div class="tab-pane active" id="home3" role="tabpanel">
                                       		<c:if test="${not empty message }">
								           	<div class="alert alert-${alert}">
												${message}
											</div>
							           	</c:if>
										<form:form class="#" role="form" id="formSubmit" modelAttribute="comment">  
											<ul class="icon-data-list">
											<li>
												<div class="d-flex">
													<img src="<c:url value="/assets/user/images/faces/face1.jpg"/>" alt="user">
													<p class="text-info mb-1">Người dùng</p>
												</div>
											</li>
											<li>
												<form:textarea path="context" rows="5" cols="80" id="context"/>
												<form:hidden path="id" id="commentId"/>
											</li>
											<li>
												<div class="d-flex rightButton">						
													<h4><button class="btn waves-effect waves-light btn-primary marginButton" id="btnWriteOrEditComment" type="button"> Bình luận</button></h4>
													<h4><a href="login.html" class="btn waves-effect waves-light btn-danger"> Hủy</a></h4>
												</div>
											</li>
											</ul>
										</form:form>
										<hr class="soft">
										<ul class="icon-data-list">
										<c:forEach var="item" items="${comment.listResult}">
							                   <li>
							                     <div class="d-flex">
							                       <img src="<c:url value="/assets/user/images/faces/face1.jpg"/>" alt="user">
							                       <div>
							                         <p class="text-info mb-1">Người dùng <small class="colorTime" > 9:30 am</small></p>
							                         <span class="mb-0">${item.context}</span>
							                        
							                       </div>
							                     </div>
							                   </li>
							                   
							                
											<hr class="soft"/>
										</c:forEach>
										 </ul>
                                   </div>
                                    <div class="tab-pane" id="profile3" role="tabpanel">
                                      <c:forEach var="item" items="${news.listResult}" varStatus="loop">
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
                                      </c:forEach>
                                   </div>
                               </div>
                           </div>
                       </div>
        				<ul class="pagination" id="pagination"></ul>	
	                </div>
         			</div>
          		</div>
          		<div class="col-md-4 grid-margin stretch-card">
	              <div class="card position-relative">
	                <div class="card-body">
	                	<div class="d-flex justify-content-between">
		                  <p class="card-title">Có thể bạn quan tâm</p>
		                 </div>
	                	<c:forEach var="item" items="${news.listBreakingNews}" varStatus="loop">
				           <div class="card" style="width: 18rem;">
				              <img class="card-img-top" src="<c:url value="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"/>"
				                   alt="Card image cap">
				              <a href="<c:url value="/tin-tuc/${item.id}"/>">
				                <h4 class="card-title marginTitle">${item.title }</h4>
				              </a>
				                <address>
			                      	<p class="card-text">${item.shortDescription}</p>
			                      	<small class="text-muted">${item.createdDate}</small>
		                      	</address>
				              
				            </div>
				          <hr>
				          </c:forEach>
	                </div>
	              </div>
	            </div>
          	</div>
	            
          <script type="text/javascript">
	$('#btnWriteOrEditComment').click(function(e){
		e.preventDefault(); // để submit vào http://localhost:8080/api/news, nếu ko có sẽ ko có phần http://localhost:8080
		var data = {};
		var formData = $('#formSubmit').serializeArray(); //thay cho việc khai báo từng biến như var content = $('#content').val();
		$.each(formData, function (i, v) {
	        data[""+v.name+""] = v.value;
	    });
		var id = $('#commentId').val();
		if(id==""){
			writeComment(data);
		}else{
			editComment(data);
		}
	});
	function writeComment(data){
		 $.ajax({
	       url: '${CommentApiURL}',
	       type: 'POST',
	       contentType: 'application/json',
	       data: JSON.stringify(data),
	       dataType: 'json',
	       success: function (result) {
	       	window.location.href = "${NewsURL}id="+result.id+"?message=add_success";
	       },
	       error: function (error) {
	       	window.location.href = "${NewsURL}id="+result.id+"?message=error_system";
	       }
	   });
	}
	
	function editComment(data){
		$.ajax({
            url: '${CommentApiURL}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${NewsURL}id="+result.id+"?message=update_success";
            },
            error: function (error) {
            	window.location.href = "${NewsURL}id="+result.id+"?message=error_system";
            }
        });
	}
</script>
          
          
        </div>
        <!-- content-wrapper ends -->
         <%@include file="/common/user/footer.jsp" %>
      </div>
      <!-- main-panel ends -->
      
  <!-- container-scroller -->
	
</body>

</html>

