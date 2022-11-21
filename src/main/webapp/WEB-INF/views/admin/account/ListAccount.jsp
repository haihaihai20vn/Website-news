<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="AccountApiURL" value="/api/account" />
<c:url var="AccountURL" value="/quan-tri/tai-khoan/danh-sach" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lý tài khoản</title>
		<style>
		.pagination {
			  display: flex;
			  justify-content:center;
			}
		</style>
	</head>

	<body>
		<div class="main-content">
		<form action="<c:url value='/quan-tri/tai-khoan/danh-sach'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">Trang chủ</a>
						</li>
						<li>
							<a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=2'/>">Quản lý tài khoản</a>
						</li>
						<li class="active">Tài khoản người dùng</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="alert alert-info">
							<i class="ace-icon fa fa-hand-o-right"></i>
							Có thể thay đổi trạng thái tài khoản bằng cách click vào cột thay đổi trạng thái và có thể xóa tài khoản bằng cách click chọn vào hàng tương ứng và nhấn biểu tượng thùng rác ở phía trên bên phải của bảng.  
							<button class="close" data-dismiss="alert">
								<i class="ace-icon fa fa-times"></i>
							</button>
						</div>
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
											<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
													class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa tài khoản'>
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
													<th class="center">ID</th>
													<th class="center">Tên tài khoản</th>
													<th class="center">Mật khẩu</th>
													<th class="center">Tên đầy đủ</th>
													<th class="center">Email</th>
													<th class="center">Trạng thái</th>
													<th class="center">Thay đổi trạng thái</th>
													<th class="center"><input type="checkbox" id="checkAll"/> Chọn tất cả</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${user.listResult}">
													<tr>
														<td class="center">${item.id }</td>
														<td>${item.userName}</td>
														<td>${item.password}</td>
														<td>${item.fullName}</td>
														<td>${item.email}</td>
														<td class="center">
														   <c:if test="${item.status==1 }">
														   		<a class="btn btn-sm btn-link btn-edit" data-toggle="tooltip" title="Đang hoạt động">
														  		 <label>
														   		<input name="switch-field-1" class="ace ace-switch ace-switch-4 btn-empty" type="checkbox" checked />
																<span class="lbl"></span>
																</label>
																</a>
														   </c:if>
															<c:if test="${item.status==0 }">
														   		<a class="btn btn-sm btn-link btn-edit" data-toggle="tooltip" title="Tài khoản bị khóa">
														  		 <label>
														   		<input name="switch-field-1" class="ace ace-switch ace-switch-4 btn-empty" type="checkbox" />
																<span class="lbl"></span>
																</label>
																</a>
														   </c:if>
																
														</td>
														<td class="center">
															<c:url var="updateAccountURL" value="/quan-tri/tai-khoan/chinh-sua" >
																<c:param name="id" value="${item.id}"/>
															</c:url>																
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
															   title="Cập nhật trạng thái" href='${updateAccountURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</a>
															
														</td>
														<td class="center">
															<input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
														</td>
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
		var totalPages = ${user.totalPage};
		var currentPage = ${user.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 10,
	            startPage: currentPage,
	            first: 'Trang đầu',
	            prev: '<<',
	            next: '>>',
	            last: 'Trang cuối',
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
			  title: "Xác nhận xóa tài khoản?",
			  text: "Bạn có chắc muốn xóa tài khoản này?",
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
					deleteAccount(ids);
			  	}
			});
		}
		
		function deleteAccount(data){
			$.ajax({
				url: '${AccountApiURL}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function(result){
					window.location.href = "${AccountURL}?page=1&limit=2&message=delete_success";
				},
				error: function(error){
					window.location.href = "${AccountURL}?page=1&limit=2&message=error_system";
				}
			});
	   }
		
		
	</script>
</body>
</html>