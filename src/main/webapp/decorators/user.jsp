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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><dec:title default="TH Epress"/></title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/feather/feather.css"/>">
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/ti-icons/css/themify-icons.css"/>">
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/css/vendor.bundle.base.css"/>">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>">
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/ti-icons/css/themify-icons.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/js/select.dataTables.min.css"/>">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<c:url value="/assets/user/css/vertical-layout-light/style.css"/>">
  <!-- endinject -->
  <link rel="shortcut icon" href="<c:url value="/assets/user/images/favicon.png"/>" />
  
  <!-- icons -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="<c:url value="/assets/user/vendors/mdi/css/materialdesignicons.min.css"/>">
  <!-- inject:css -->
  <link rel="stylesheet" href="<c:url value="/assets/user/css/vertical-layout-light/style.css"/>">
  <!-- endinject -->
  <link rel="shortcut icon" href="<c:url value="/assets/user/images/favicon.png"/>" />
   <dec:head/>
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
  		height:600px;
  	}
  </style>
</head>
<body>
  <div class="container-scroller">
    <%@include file="/common/user/header.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
     
      <nav class="sidebar sidebar-offcanvas sidebarColor" id="sidebar">
        
      </nav>
      <!-- partial -->
       <dec:body/>
      <nav class="sidebar sidebar-offcanvas sidebarColor" id="sidebar">
        
      </nav>
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="<c:url value="/assets/user/vendors/js/vendor.bundle.base.js"/>"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="<c:url value="/assets/user/vendors/chart.js/Chart.min.js"/>"></script>
  <script src="<c:url value="/assets/user/vendors/datatables.net/jquery.dataTables.js"/>"></script>
  <script src="<c:url value="/assets/user/vendors/datatables.net-bs4/dataTables.bootstrap4.js"/>"></script>
  <script src="<c:url value="/assets/user/js/dataTables.select.min.js"/>"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="<c:url value="/assets/user/js/off-canvas.js"/>"></script>
  <script src="<c:url value="/assets/user/js/hoverable-collapse.js"/>"></script>
  <script src="<c:url value="/assets/user/js/template.js"/>"></script>
  <script src="<c:url value="/assets/user/js/settings.js"/>"></script>
  <script src="<c:url value="/assets/user/js/todolist.js"/>"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="<c:url value="/assets/user/js/dashboard.js"/>"></script>
  <script src="<c:url value="/assets/user/js/Chart.roundedBarCharts.js"/>"></script>
  <!-- End custom js for this page-->
  
  <!-- Thêm -->
  <script src="<c:url value='/assets/paging/jquery.twbsPagination.js' />"></script>
	<script src="<c:url value='/assets/user/css/bootstrap/css/bootstrap.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/assets/admin/assets/js/bootstrap.min.js'/>"></script>
	
	<!-- page specific plugin scripts -->
	<script src="<c:url value='/assets/admin/assets/js/jquery-ui.min.js'/>"></script>
	
	<script>
	var totalPages = ${model.totalPage};
	var currentPage = ${model.page};
	$(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            first: 'Đầu',
            prev: '<<',
            next: '>>',
            last: 'Cuối',
            onPageClick: function (event, page) {
            	if (currentPage != page) {
    				$('#limit').val(2);
    				$('#page').val(page); //page kế tiếp
					$('#formSubmit').submit();
				}
            }
        });
   });
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

