<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="NewsApiURL" value="/api/news" />
<c:url var="NewsURL" value="/quan-tri/bai-viet/danh-sach" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
		<style>
		.pagination {
			  display: flex;
			  justify-content:center;
			}
		</style>
	</head>

	<body>
		<div class="main-content">
		<form action="<c:url value='/quan-tri/bai-viet/danh-sach'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">Trang chủ</a>
						</li>
						<li>
							<a href="<c:url value='/quan-tri/bai-viet/danh-sach'/>">Quản lý bài viết</a>
						</li>
						<li class="active">Danh sách bài viết</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message }">
	                			<div class="alert alert-${alert}">
	  								${message}
								</div>
	                		</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<c:url var="createNewsURL" value="/quan-tri/bai-viet/chinh-sua" />
											<a flag="info"
											   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
											   title='Thêm bài viết' href='${createNewsURL}'>
												<span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
												</span>
											</a>
											<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
													class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
												<span>
													<i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>ID</th>
													<th>Tên bài viết</th>
													<th>Mô tả ngắn</th>
													<th>Tin nóng</th>
													<th>Tin mới</th>
													<th>Người viết</th>
													<th>Ngày viết</th>
													<th>Người sửa</th>
													<th>Ngày sửa</th>
													<th>Chỉnh sửa</th>
													<th>Chọn</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td>${item.id }</td>
														<td>${item.title}</td>
														<td>${item.shortDescription}</td>
														<td>
															<c:if test="${item.breakingNews==true }">
																<span class="label label-sm label-warning">Tin nóng</span>
															</c:if>
															<c:if test="${item.breakingNews==false }">
																<span></span>
															</c:if>
														</td>
														<td>
															<c:if test="${item.latestNews==true }">
																<span class="label label-sm label-success">Tin mới</span>
															</c:if>
															<c:if test="${item.latestNews==false }">
																<span></span>
															</c:if>
														</td>
														<td>${item.createdBy}</td>
														<td>${item.createdDate}</td>
														<td>${item.modifiedBy}</td>
														<td>${item.modifiedDate}</td>
														<td>
															<c:url var="updateNewsURL" value="/quan-tri/bai-viet/chinh-sua" >
																<c:param name="id" value="${item.id}"/>
															</c:url>																
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
															   title="Cập nhật bài viết" href='${updateNewsURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</a>
														</td>
														<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>	
										<input type="hidden" value="" id="page" name="page"/>
										<input type="hidden" value="" id="limit" name="limit"/>									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
		<!-- /.main-content -->
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
		
		function warningBeforeDelete(){
			swal({
			  title: "Xác nhận xóa bài viết?",
			  text: "Bạn có chắc muốn xóa bài viết này?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			  closeOnConfirm: false,
			  closeOnCancel: false
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    // call api delete
				var ids = $('tbody input[type=checkbox]:checked').map(function () {
			        return $(this).val();
			    }).get();
					deleteNews(ids);
			  	}
			});
		}
		
		function deleteNews(data){
			$.ajax({
				url: '${NewsApiURL}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function(result){
					window.location.href = "${NewsURL}?page=1&limit=2&message=delete_success";
				},
				error: function(error){
					window.location.href = "${NewsURL}?page=1&limit=2&message=error_system";
				}
			});
	   }
		
	</script>
</body>
</html>