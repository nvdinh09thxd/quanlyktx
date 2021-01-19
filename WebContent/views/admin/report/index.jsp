<%@page import="models.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/left-bar.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/dist/css/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/dist/css/ui.jqgrid.min.css">
<script src="<%=request.getContextPath() %>/templates/admin/dist/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/templates/admin/dist/js/jquery.jqgrid.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Danh sách các phòng còn trống</h1>
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
						<table id="grid"></table>
					</div>

				</div>
			</div>
			<!--End Advanced Tables -->
		</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%
	List<Room> listEmptyRooms = null;
	if(request.getAttribute("listEmptyRooms")!=null){
		listEmptyRooms = (List<Room>) request.getAttribute("listEmptyRooms");
	}
%>
<script>
	$(function () {
	    "use strict";
	    let myData  = [];
		<%if(listEmptyRooms != null){for(Room objRoom: listEmptyRooms){%>
			myData.push({id: "<%=objRoom.getId()%>", name: "<%=objRoom.getName()%>", empty_bed: "<%=objRoom.getEmptyBed()%>"});
		<%}}%>
	    $("#grid").jqGrid({
	        colModel: [
	            { name: "id" },
	            { name: "name" },
	            { name: "empty_bed" }
	        ],
	        data: myData
	    });
	});
</script>
<%@ include file="/templates/admin/inc/footer.jsp"%>