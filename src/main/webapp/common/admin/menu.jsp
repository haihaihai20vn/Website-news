<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar responsive ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
   
    <ul class="nav nav-list">
		<li class="active">
			<a href="<c:url value='/quan-tri/trang-chu' />">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> Trang chủ </span>
			</a>

			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="<c:url value='/quan-tri/trang-chu' />" class="dropdown-toggle">
				<i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text">
					 Quản lý bài viết
				</span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=2' />">
						<i class="menu-icon fa fa-caret-right"></i>
							Danh sách bài viết
					</a>

					<b class="arrow"></b>

					<!-- <ul class="submenu">
						<li class="">
							<a href="top-menu.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Thời sự
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="two-menu-1.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Thế giới
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="two-menu-2.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Kinh doanh
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-1.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Thể thao
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-2.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Giải trí
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-3.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Giáo dục
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>  -->

				<li class="">
					<a href="typography.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Thời sự
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="elements.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Thế giới
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="buttons.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Kinh doanh
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="content-slider.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Thể thao
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="treeview.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Giải trí
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="jquery-ui.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Giáo dục
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="nestable-list.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Hài
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-caret-right"></i>

						Khác
						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="">
							<a href="#">
								<i class="menu-icon fa fa-leaf green"></i>
								Ý kiến
							</a>

							<b class="arrow"></b>
						</li>
						
						<li class="">
							<a href="two-menu-1.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Tâm sự
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="#" class="dropdown-toggle">
								<i class="menu-icon fa fa-pencil orange"></i>

								Đời sống
								<b class="arrow fa fa-angle-down"></b>
							</a>

							<b class="arrow"></b>

							<ul class="submenu">
								<li class="">
									<a href="#">
										<i class="menu-icon fa fa-plus purple"></i>
										Sức khỏe
									</a>

									<b class="arrow"></b>
								</li>

								<li class="">
									<a href="#">
										<i class="menu-icon fa fa-eye pink"></i>
										Du lịch
									</a>

									<b class="arrow"></b>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-list"></i>
				<span class="menu-text"> Quản lý bình luận </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="<c:url value='/quan-tri/bai-viet/binh-luan?page=1&limit=2' />">
						<i class="menu-icon fa fa-caret-right"></i>
						Bài viết &amp; bình luận
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="jqgrid.html">
						<i class="menu-icon fa fa-caret-right"></i>
						jqGrid plugin
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-pencil-square-o"></i>
				<span class="menu-text"> Quản lý tài khoản </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="form-elements.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Tài khoản quản trị viên
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=2' />">
						<i class="menu-icon fa fa-caret-right"></i>
						Tài khoản người dùng
					</a>

					<b class="arrow"></b>
				</li>

				<!--  <li class="">
					<a href="form-wizard.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Wizard &amp; Validation
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="wysiwyg.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Wysiwyg &amp; Markdown
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="dropzone.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Dropzone File Upload
					</a>

					<b class="arrow"></b>
				</li>-->
			</ul>
		</li>

		<li class="">
			<a href="widgets.html">
				<i class="menu-icon fa fa-list-alt"></i>
				<span class="menu-text"> Thống kê </span>
			</a>

			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="calendar.html">
				<i class="menu-icon fa fa-calendar"></i>

				<span class="menu-text">
					Lịch

					<span class="badge badge-transparent tooltip-error" title="2 Important Events">
						<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
					</span>
				</span>
			</a>

			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="gallery.html">
				<i class="menu-icon fa fa-picture-o"></i>
				<span class="menu-text"> Hình ảnh </span>
			</a>

			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tag"></i>
				<span class="menu-text"> Báo cáo </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="profile.html">
						<i class="menu-icon fa fa-caret-right"></i>
						User Profile
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="inbox.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Inbox
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="pricing.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Pricing Tables
					</a>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-file-o"></i>

				<span class="menu-text">
					Các chức năng khác

					<!--  <span class="badge badge-primary">5</span>-->
				</span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="faq.html">
						<i class="menu-icon fa fa-caret-right"></i>
						FAQ
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>
	</ul><!-- /.nav-list -->
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>