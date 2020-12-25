<%@page import="models.Boot"%>
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
					<h1 class="m-0">Quản lý đặt phòng</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- Main content -->
	<div class="row">
		<div class="col-md-12">
			<!-- Advanced Tables -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên phòng</th>
									<th>Tên người đặt</th>
									<th>Xét duyệt</th>
								</tr>
							</thead>
							<tbody>
							<%
								if(request.getAttribute("listBoots")!=null){
									List<Boot> listBoots = (List<Boot>) request.getAttribute("listBoots");
									for(Boot objBoot : listBoots){
										String picture = objBoot.isAccept()?"active.gif":"deactive.gif";
							%>
								<tr>
									<td class="center"><%=objBoot.getId() %></td>
									<td class="center"><%=objBoot.getRoom().getName() %></td>
									<td class="center"><%=objBoot.getMember().getFullName() %></td>
									<td class="center">
										<a href="javascript: void(0)"><img width="20px" height="20px" class="<%=objBoot.getRoom().getId() %>"
										src="<%=request.getContextPath()%>/uploads/images/<%=picture %>" alt="<%=objBoot.getId() %>" />
										</a>
									</td>
								</tr>
								<%
								}}
								%>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<!--End Advanced Tables -->
		</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
    $("img").click(function(){
	    var image = $(this);
	    $.ajax({
			url: '<%=request.getContextPath()%>/admin/boot',
				type : 'POST',
				cache : false,
				data : {
					aid: image.attr("alt"),
					asrc : image.attr("src"),
					aidRoom: image.attr("class")
				},
				success : function(data) {
					image.attr("src", data)
				},
				error : function() {
					alert("Có lỗi xảy ra");
				}
			});
		});
</script>
<%@ include file="/templates/admin/inc/footer.jsp"%>