<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="EditAccountURL" value="/quan-tri/tai-khoan/chinh-sua" />
<c:url var="AccountApiURL" value="/api/account" />
<c:url var="AccountURL" value="/quan-tri/tai-khoan/danh-sach" />
<html>
<head>
    <title>Thay đổi trạng thái tài khoản</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>
	
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a>
					</li>
	
					<li>
						<a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=2'/>">Quản lý tài khoản</a>
					</li>
						<li>
						<a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=2'/>">Tài khoản người dùng</a>
					</li>
					<li class="active">Bài viết</li>
				</ul><!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="page-header">
					<h1>
						Thông tin tài khoản
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							Khóa hoặc mở khóa tài khoản người dùng
						</small>
					</h1>
				</div><!-- /.page-header -->
	            <div class="row">
	                <div class="col-xs-12">
	                	<c:if test="${not empty message }">
	                		<div class="alert alert-${alert}">
	  							${message}
							</div>
	                	</c:if>
		 				<div class="profile-user-info profile-user-info-striped">
	                    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="userDTO">
							<div class="profile-info-row">
								<div class="profile-info-name"> ID </div>

								<div class="profile-info-value">
									<span class="editable" id="id">${userDTO.id}</span>
								</div>
							</div>
							
							<div class="profile-info-row">
								<div class="profile-info-name"> Tên tài khoản </div>

								<div class="profile-info-value">
									<span class="editable" id="userName">${userDTO.userName}</span>
								</div>
							</div>
							
							<div class="profile-info-row">
								<div class="profile-info-name"> Mật khẩu </div>

								<div class="profile-info-value">
									<span class="editable" id="password">${userDTO.password}</span>
								</div>
							</div>
							
							<div class="profile-info-row">
								<div class="profile-info-name"> Tên đầy đủ </div>

								<div class="profile-info-value">
									<span class="editable" id="fullName">${userDTO.fullName}</span>
								</div>
							</div>
							
							<div class="profile-info-row">
								<div class="profile-info-name"> Email </div>

								<div class="profile-info-value">
									<span class="editable" id="email">${userDTO.email}</span>
								</div>
							</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Trạng thái tài khoản: </label>
	                    		<div class="col-sm-9">
									<form:select path="status" id="status">
										<form:option value="1" label="Kích hoạt tài khoản" />
										<form:option value="0" label="Khóa tài khoản" />
									</form:select>
	                    		</div>
	                    	</div>
	                    	
	        
	                    	
		                    <form:hidden path="id" id="userId"/>
		                    
		                    <div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty userDTO.id}">
										<button class="btn btn-info" type="button" id="btnUpdateStatus">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Cập nhật trạng thái
										</button>
									</c:if>
									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=2' />">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											Hủy
										</a>
									</button>
								</div>
							</div>
						</form:form>
						</div>
	                </div>
	            </div>
	        </div>
        </div>
	</div><!-- /.main-content -->
	<script>
		
		$('#btnUpdateStatus').click(function(e){
			e.preventDefault(); // để submit vào http://localhost:8080/api/news, nếu ko có sẽ ko có phần http://localhost:8080
			var data = {};
			var formData = $('#formSubmit').serializeArray(); //thay cho việc khai báo từng biến như var content = $('#content').val();
			$.each(formData, function (i, v) {
		        data[""+v.name+""] = v.value;
		    });
			var id = $('#userId').val();
			
			updateStatus(data);
		});
		
		function updateStatus(data){
			$.ajax({
	            url: '${AccountApiURL}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${EditAccountURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${EditAccountURL}?id="+result.id+"&message=error_system";
	            }
	        });
		}
	</script>
	
</body>
</html>
