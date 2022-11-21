<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewsURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="EditNewsURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="NewsApiURL" value="/api/news" />
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
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
						<a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=2' />">Quản lý bài viết</a>
					</li>
						<li>
						<a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=2' />">Danh sách bài viết</a>
					</li>
					<li class="active">Bài viết</li>
				</ul><!-- /.breadcrumb -->
			</div>
			<div class="page-content">
	            <div class="row">
	                <div class="col-xs-12">
	                	<c:if test="${not empty message }">
	                		<div class="alert alert-${alert}">
	  							${message}
							</div>
	                	</c:if>
		                
	                    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="newsDTO">
	  
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="categoryCode"> Thể loại: </label>
	                    		<div class="col-sm-9">
									<form:select path="categoryCode" id="categoryCode">
										<form:option value="" label="--Chọn thể loại--" />
										<form:options items="${categories}" />
									</form:select>
	                    		</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tên bài viết </label>
								<div class="col-sm-9">
									<!-- Dùng path thay cho name và value -->
									<!--  <input type="text" class="col-xs-10 col-sm-5" id="title" name="title" value="${newsDTO.title}" />-->
									<form:input path="title" cssClass="col-xs-10 col-sm-5"/>
								</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Ảnh đại diện </label>
								<div class="col-sm-9">
									<input type="file" class="col-xs-10 col-sm-5" id="thumbnail" name = "thumbnail"/>
								</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="shortDescription"> Mô tả ngắn </label>
								<div class="col-sm-9">
									<!--  <textarea class="form-control" rows="5" cols="5" id="shortDescription" name="shortDescription">${newsDTO.shortDescription}</textarea>-->
									<form:textarea path="shortDescription" rows="5" cols="5" cssClass="form-control" id="shortDescription"/>
								</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="content"> Nội dung </label>
								<div class="col-sm-9">
									<form:textarea path="content" rows="10" cols="5" cssClass="form-control" id="content" name="content"/>
								</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tin nóng</label>
								<div class="col-sm-9">
									<form:checkbox path="breakingNews" value="true"/>  
								</div>
	                    	</div>
	                    	
	                    	<div class="form-group">
	                    		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tin mới</label>
								<div class="col-sm-9">
									<form:checkbox path="latestNews" value="true"/>
								</div>
	                    	</div>
	                    	
		                    <form:hidden path="id" id="newsId"/>
		                    
		                    <div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty newsDTO.id}">
										<button class="btn btn-info" type="button" id="btnAddOrUpdateNews">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Cập nhật bài viết
										</button>
									</c:if>
									<c:if test="${empty newsDTO.id}">
										<button class="btn btn-info" type="button" id="btnAddOrUpdateNews">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Thêm mới bài viết
										</button>
									</c:if>
									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=2' />">
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
	</div><!-- /.main-content -->
	<script>
		var editor = '';
		$(document).ready(function(){
			editor = CKEDITOR.replace('content');
		});
		
		$('#btnAddOrUpdateNews').click(function(e){
			e.preventDefault(); // để submit vào http://localhost:8080/api/news, nếu ko có sẽ ko có phần http://localhost:8080
			var data = {};
			var formData = $('#formSubmit').serializeArray(); //thay cho việc khai báo từng biến như var content = $('#content').val();
			$.each(formData, function (i, v) {
		        data[""+v.name+""] = v.value;
		    });
			data["content"] = editor.getData();
			var id = $('#newsId').val();
			if(id==""){
				addNews(data);
			}else{
				updateNews(data);
			}
		});
		
		function addNews(data){
			 $.ajax({
	            url: '${NewsApiURL}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${EditNewsURL}?id="+result.id+"&message=add_success";
	            },
	            error: function (error) {
	            	window.location.href = "${NewsURL}?page=1&limit=2&message=error_system";
	            }
	        });
		}
		
		function updateNews(data){
			$.ajax({
	            url: '${NewsApiURL}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${EditNewsURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${EditNewsURL}?id="+result.id+"&message=error_system";
	            }
	        });
		}
	</script>
	
</body>
</html>
