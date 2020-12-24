<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/left-bar.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Quản lý sản phẩm</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Dashboard v1</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="row">
		<div class="col-md-12">
			<!-- Advanced Tables -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<div class="row">
							<div class="col-sm-6">
								<a href="<%=request.getContextPath()%>/admin/product/add"
									class="btn btn-success btn-md">Thêm</a>
							</div>
							<div class="col-sm-6" style="text-align: right;">
								<form method="post" action="">
									<input type="submit" name="search" value="Tìm kiếm"
										class="btn btn-warning btn-sm" style="float: right" /> <input
										type="search" class="form-control input-sm"
										placeholder="Nhập tên bài hát"
										style="float: right; width: 300px;" />
									<div style="clear: both"></div>
								</form>
								<br />
							</div>
						</div>
						<%
							if (request.getParameter("msg") != null) {
								int msg = Integer.parseInt(request.getParameter("msg"));
								switch (msg) {
								case 1:
									out.print("<p style='color: green; background: yellow'>Thêm thành công!</p>");
									break;
								}
							}
						%>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên sản phẩm</th>
									<th>Danh mục</th>
									<th>Đánh giá</th>
									<th>Hình ảnh</th>
									<th width="160px">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td class="center"></td>
									<td class="center"></td>
									<td class="center"></td>
									<td class="center"><img width="200px" height="200px"
										src="" alt="Đổi thay" /></td>
									<td class="center"><a href="" title=""
										class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a> <a
										href="" title="" class="btn btn-danger"><i
											class="fa fa-pencil"></i> Xóa</a></td>
								</tr>
							</tbody>
						</table>
						<div class="row">
							<div class="col-sm-6">
								<div class="dataTables_info" id="dataTables-example_info"
									style="margin-top: 27px">Hiển thị từ 1 đến 5 của 24
									truyện</div>
							</div>
							<div class="col-sm-6" style="text-align: right;">
								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTables-example_paginate">
									<ul class="pagination">
										<li class="paginate_button previous disabled"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_previous"><a href="#">Trang
												trước</a></li>
										<li class="paginate_button active"
											aria-controls="dataTables-example" tabindex="0"><a
											href="">1</a></li>
										<li class="paginate_button" aria-controls="dataTables-example"
											tabindex="0"><a href="">2</a></li>
										<li class="paginate_button" aria-controls="dataTables-example"
											tabindex="0"><a href="">3</a></li>
										<li class="paginate_button" aria-controls="dataTables-example"
											tabindex="0"><a href="">4</a></li>
										<li class="paginate_button" aria-controls="dataTables-example"
											tabindex="0"><a href="">5</a></li>
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a href="#">Trang tiếp</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!--End Advanced Tables -->
		</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@ include file="/templates/admin/inc/footer.jsp"%>