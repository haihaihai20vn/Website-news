<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewsURL" value="/test/news" />
<c:url var="EditNewsURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="CommentApiURL" value="/api/comment" />
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <title>Thể loại</title>
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
  	
  	.sizeImg{
  		height: 100px;
  		width: 100px;
  	}
  	
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
  
     <div class="main-panel">
       <div class="content-wrapper">
       	<%@include file="/common/user/navbar.jsp" %>
          <div class="row">
            <div class="col-md-8 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                	<div class="d-flex justify-content-between">
	                  <nav aria-label="breadcrumb">
						  <ul class="breadcrumb borderBread">
						    <li class="breadcrumb-item"><a href="<c:url value="/trang-chu"/>"><i class="mdi mdi-home"></i></a></li>
						    <li class="breadcrumb-item active" aria-current="page">${category.name}</li>
						  </ul>
						</nav>
	                 </div>
	                 <hr>
	                 <c:if test="${news.totalItem>0}">
	                 
                      	<c:forEach var="item" items="${news.listCategoryID}" varStatus="loop">
                      	<div class="row">
	                      	<div class="col-3">
	                      		<img class="sizeImg" src="<c:url value="/assets/user/img/a.jpg"/>" alt="">
	                        </div>
	                        <div class="col-9">
	                          <a href="<c:url value = "/tin-tuc/${item.id}"/>"><h5>${item.title }</h5></a>
	                          <p class="font-weight-500 mb-0">${item.shortDescription }</p>
	                        </div>
	                     </div>
	                     <hr>
						</c:forEach >
	                </c:if>
	                <div class="pagination" id="pagination">
						<c:forEach var="item" begin="1" end="${news.totalPage}" varStatus="loop">
						
						  <c:if test="${(loop.index) == news.page }">
						  	<a href="<c:url value = "/the-loai/${idCategory}?page=${news.page}&limit=${news.limit }"/>" class="active">${loop.index}</a>
						  </c:if>
						  <c:if test="${(loop.index) != news.page }">
						  	<a href="<c:url value = "/the-loai/${idCategory}?page=${loop.index}&limit=${news.limit }"/>">${loop.index}</a>
						  </c:if>
					  	</c:forEach>
					</div>
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
			              <div class="card-body">
			              <a href="<c:url value="/tin-tuc/${item.id}"/>">
			                <h4 class="card-title">${item.title }</h4>
			                 </a>
			                <p class="card-text">${item.shortDescription}</p>
			              
			              </div>
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

