<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<c:url var="AccountApiURL" value="/api/register" />
<c:url var="RegisterURL" value="/dang-nhap" />
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Đăng nhập</title>
	</head>

	<body>
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Ace</span>
									<span class="white" id="id-text2">Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">Trang đăng nhập</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Mời bạn nhập thông tin
											</h4>

											<div class="space-6"></div>
											<c:if test="${param.incorrectAccount != null}">
												<div class="alert alert-danger">
														Tên tài khoản hoặc mật khẩu không đúng
												</div>
											</c:if>
											<c:if test="${param.accessDenied != null}">
												<div class="alert alert-danger">
														Bạn phải đăng nhập để được truy cập trang
												</div>
											</c:if>
											<c:if test="${not empty message }">
	                							<div class="alert alert-${alert}">
	  												${message}
												</div>
	                						</c:if>
											<form action="j_spring_security_check" id="formLogin" method="post">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Nhớ tài khoản</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Đăng nhập</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">Hoặc sử dụng</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													Quên mật khẩu
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													Đăng ký tài khoản
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Lấy lại mật khẩu
											</h4>

											<div class="space-6"></div>
											<p>
												Nhập email và nhận hướng dẫn
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Gửi tôi!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Trở lại trang đăng nhập
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												Đăng ký tài khoản
											</h4>

											<div class="space-6"></div>
											<p> Nhập thông tin của bạn: </p>
											
											<form:form action="dang-ky" method="POST" modelAttribute="user" id="formSubmit">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input type="email" class="form-control" placeholder="Email"  path="email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input type="text" class="form-control" placeholder="Tên tài khoản" path="userName"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input type="password" class="form-control" placeholder="Mật khẩu" path="password"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input type="password" class="form-control" placeholder="Nhập lại mật khẩu" path="password"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input type="text" class="form-control" placeholder="Họ và tên" path="fullName"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															Tôi đồng ý với
															<a href="#">chính sách người dùng</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button type="button" id="btnAddAccount" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Đăng ký</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form:form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Trở lại trang đăng nhập
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Tối</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Mờ</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Sáng</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

			<!--[if IE]>
				<script src="assets/js/jquery.1.11.1.min.js"></script>
				<![endif]-->
				
						<!--[if !IE]> -->
						<script type="text/javascript">
							window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
						</script>
				
						<!-- <![endif]-->
				
						<!--[if IE]>
				<script type="text/javascript">
				 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
				</script>
			<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src="<c:url value="/assets/admin/assets/js/jquery.mobile.custom.min.js"/>">"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
			
			$('#btnAddAccount').click(function(e){
				e.preventDefault(); // để submit vào http://localhost:8080/api/news, nếu ko có sẽ ko có phần http://localhost:8080
				var data = {};
				var formData = $('#formSubmit').serializeArray(); //thay cho việc khai báo từng biến như var content = $('#content').val();
				$.each(formData, function (i, v) {
			        data[""+v.name+""] = v.value;
			    });
				addAccount(data);
			});
			
			function addAccount(data){
				 $.ajax({
		            url: '${AccountApiURL}',
		            type: 'POST',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            dataType: 'json',
		            success: function (result) {
		            	window.location.href = "${RegisterURL}?message=add_success";
		            },
		            error: function (error) {
		            	window.location.href = "${RegisterURL}?message=error_system";
		            }
		        });
			}
		</script>
	</body>
</html>
