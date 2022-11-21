<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><dec:title default="Master-layout"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="<c:url value="/assets/user/css/bootstrap.css"/>" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="<c:url value="/assets/user/style.css"/>" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="<c:url value="/assets/user/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value="/assets/user/ico/favicon.ico"/>">
    <dec:head/>
  </head>
<body>

	<div class="container">
		<div id="gototop"> </div>
		<%@include file="/common/user/header.jsp" %>
		<dec:body/>
		<%@include file="/common/user/footer.jsp" %>
	</div><!-- /container -->

	<div class="copyright">
		<div class="container">
			<p class="pull-right">
				<a href="#"><img src="<c:url value="/assets/user/img/maestro.png"/>" alt="payment"></a>
				<a href="#"><img src="<c:url value="/assets/user/img/mc.png"/>" alt="payment"></a>
				<a href="#"><img src="<c:url value="/assets/user/img/pp.png"/>" alt="payment"></a>
				<a href="#"><img src="<c:url value="/assets/user/img/visa.png"/>" alt="payment"></a>
				<a href="#"><img src="<c:url value="/assets/user/img/disc.png"/>" alt="payment"></a>
			</p>
			<span>Copy &copy; 2022<br> Đại học bách khoa Hà Nội</span>
		</div>
	</div>
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/assets/ckeditor/ckeditor.js' />"></script>
    <script src="<c:url value='/assets/paging/jquery.twbsPagination.js' />"></script>
    <script src=" <c:url value="/assets/user/js/jquery.js" />"></script>
	<script src="<c:url value="/assets/user/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/user/js/jquery.easing-1.3.min.js" />"></script>
	<script src="<c:url value="/assets/user/js/jquery.scrollTo-1.4.3.1-min.js" />"></script>
	<script src="<c:url value="/assets/user/js/shop.js" /> "></script>
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
