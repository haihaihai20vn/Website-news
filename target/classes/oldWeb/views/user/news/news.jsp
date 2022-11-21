<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewsURL" value="/tin-tuc/" />
<c:url var="EditNewsURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="CommentApiURL" value="/api/comment" />
<head>
<meta charset="UTF-8">
<title>Tin tức</title>
<style>
	.news-content{
		overflow-x: hidden;
	}
	
	.news-background{
		background-color: white;
	}
	
	.buttonComment{
		margin-left: 20px
	}
	
</style>
</head>
<body>
<div class="row news-content">
	<%@ include file="/common/user/menu.jsp" %>
	<div class="span9">
	    <ul class="breadcrumb">
		    <li><a href="index.html">Trang chủ</a> <span class="divider">/</span></li>
		    <li><a href="products.html">Thể loại</a> <span class="divider">/</span></li>
		    <li class="active">${news.title}</li>
	    </ul>	
	<div class="well well-small">
		<div class="row-fluid news-background">
				<p>
				${news.content}
				</p>
			</div>
			<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Tin tức liên quan</a></li>
              <li class=""><a href="#profile" data-toggle="tab">Bình luận </a></li>
            </ul>
           <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
		        <div class="row-fluid">	  
					<div class="span2">
						<img src="assets/img/d.jpg" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
						
					</div>
				</div>
			 </div>
			<div class="tab-pane fade" id="profile">
			<c:if test="${not empty message }">
	           	<div class="alert alert-${alert}">
					${message}
				</div>
           	</c:if>
			<form:form class="row-fluid" role="form" id="formSubmit" modelAttribute="comment">  
				<div class="span2">
					<img src="<c:url value="/assets/user/img/d.jpg"/>" alt="">
				</div>
				<div class="span10">
					<h5>Người dùng </h5>
					<form:textarea path="context" rows="5" cols="5" id="context"/>
					<form:hidden path="id" id="commentId"/>
					<h4>Bình luận</button></h4>
						<c:if test="${not empty news.id}">
							<button class="shopBtn btn-large pull-right" id="btnWriteOrEditComment" type="button"> 
								<i class="ace-icon fa fa-check bigger-110"></i>
								Chỉnh sửa
							</button>
						</c:if>
						<c:if test="${empty news.id}">
							<button class="shopBtn btn-large pull-right" id="btnWriteOrEditComment" type="button"> 
								<i class="ace-icon fa fa-check bigger-110"></i>
								Bình luận
							</button>
						</c:if>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="reset">
							<a href="<c:url value='/tin-tuc/${news.id}' />">
								<i class="ace-icon fa fa-undo bigger-110"></i>
								Hủy
							</a>
						</button>
				</div>
			</form:form>
			<hr class="soft">

			<c:forEach var="item" items="${comment.listResult}">
				<div class="row-fluid">	  
				<div class="span2">
					<img src="<c:url value="/assets/user/img/d.jpg"/>" alt="">
				</div>
				<div class="span10">
					<h5>Người dùng</h5>
					<p>${item.context}</p>
				</div>
				</div>
				<hr class="soft"/>
			</c:forEach>
			</div>
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
</body>
</html>