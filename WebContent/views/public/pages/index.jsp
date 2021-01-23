<%@page import="models.Boot"%>
<%@page import="models.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div class="wrapper row2">
    <div id="breadcrumb" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Lorem</a></li>
        <li><a href="#">Ipsum</a></li>
        <li><a href="#">Dolor</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear">
 <%!
 	/* Kiểm tra id room đã có trong list boot chưa (phòng này đã đặt chưa) */
	 public boolean checkIdRoom(List<Boot> listBoots, int idRoom){
	 	for(Boot objBoot : listBoots){
	 		if(objBoot.getRoom().getId()==idRoom && objBoot.isStatus()) return true;
	 	}
	 	return false;
	 }
 
	/* Kiểm tra đã xác nhận đặt phòng chưa */			
	public boolean checkIdAccept(List<Boot> listBoots, int idRoom){
	 	for(Boot objBoot : listBoots){
	 		if(objBoot.getRoom().getId()==idRoom && objBoot.isAccepted()) return true;
	 	}
	 	return false;
	}
 %>
    <!-- main body -->
    <!-- ################################################################################################ -->
	<a style="<%if(userLogin==null) out.print("display: none");%>" href="javascript:void(0)"
		onclick="onSaveBoot(<%if(userLogin!=null) out.print(userLogin.getId()); %>)">
	<img style="width:60px;height:50px;" alt="" src="<%=request.getContextPath()%>/uploads/images/saveicon.png">
	</a>
    <table>
	  <thead>
	    <tr>
	      <th style="text-align: center">Tên phòng</th>
	      <th style="text-align: center">Khu vực</th>
	      <th style="text-align: center">Tổng số giường</th>
	      <th style="text-align: center">Số giường trống</th>
	      <th style="text-align: center">Có vệ sinh trong</th>
	      <th style="text-align: center">Giá tiền</th>
	      <th style="<%if(userLogin==null) out.print("display: none"); %>">Cảm xúc</th>
	      <th style="<%if(userLogin==null) out.print("display: none"); %>">Đặt phòng</th>
	    </tr>
	    <tr style="<%if(userLogin!=null) out.print("display: none"); %>">
	      	<th>
		      	<input style="color: blue" type="text" placeholder="Nhập tên phòng..." id="name" onkeyup="filterName(1)" />
			</th>
	      	<th>
		      	<select style="color: blue" onchange="filterName(2)" id="area">
				  <option value="0">--Chọn khu vực--</option>
				  <option value="1">Khu A</option>
				  <option value="2">Khu B</option>
				  <option value="3">Khu C</option>
				  <option value="4">Khu D</option>
				</select>
			</th>
	      	<th>
		      	<input type="checkbox" class="bed" value="4" onchange="filterName(3)">
				<label> 4 </label>
				<input type="checkbox" class="bed" value="6" onchange="filterName(3)">
				<label> 6 </label>
				<input type="checkbox" class="bed" value="8" onchange="filterName(3)">
				<label> 8 </label>
			</th>
			<th></th>
	      	<th>
				<input type="radio" class="toilet" name="toilet" value="true" onchange="filterName(4)">
				<label>Có</label>
				<input type="radio" class="toilet" name="toilet" value="false" onchange="filterName(4)">
				<label>Không</label>
			</th>
	      	<th>
		      	<select style="color: blue" onchange="filterName(5)" id="price">
				  <option value="0">--Chọn giá tiền--</option>
				  <option value="1">Dưới 500 Ngàn</option>
				  <option value="2">Từ 500 Ngàn - 1 Triệu</option>
				  <option value="3">Trên 1 Triệu</option>
				</select>
			</th>
	    </tr>
	   </thead>
	   <tbody>
	   <%
	   List<Boot> listBoots = (List<Boot>) session.getAttribute("listBoots");
	   
	   if(request.getAttribute("listRooms")!=null){
	   List<Room> listRooms = (List<Room>) request.getAttribute("listRooms");
	   if(listRooms.size()>0){
		   for(Room objRoom: listRooms){
	   %>
	     <tr>
	       <td><%=objRoom.getName() %></td>
	       <td>Khu <%=objRoom.getArea().getName() %></td>
	       <td><%=objRoom.getTotalBed() %> giường</td>
	       <td><%=objRoom.getEmptyBed() %> giường</td>
	       <td><input type="checkbox" <%if(objRoom.isHaveToilet()) out.print("checked"); %> onclick="return false;" ></td>
	       <td><%=objRoom.getPrice() %></td>
	       <td style="<%if(userLogin==null) out.print("display: none"); %>"><a href="javascript:void(0)">
	       		<img style="width:60px;height:50px;" alt="" src="<%=request.getContextPath()%>/uploads/images/like.jpg"></a></td>
	       <td style="<%if(userLogin==null) out.print("display: none"); %>"><a href="javascript:void(0)"
	       		onclick="onSelectRoom(<%if(listBoots!=null) out.print(checkIdAccept(listBoots, objRoom.getId()));%>, <%=objRoom.getId() %>, <%=objRoom.getEmptyBed() %>)">
	       		<img style="width:40px;height:50px;" class="select" alt="<%if(listBoots!=null) out.print(checkIdAccept(listBoots, objRoom.getId()));%>" id="<%=objRoom.getEmptyBed() %>"
	       		src="<%=request.getContextPath()%>/uploads/images/<%if(listBoots!=null && checkIdRoom(listBoots, objRoom.getId())) out.print("tick.png"); else out.print("cancel.png"); %>"></a></td>
	     </tr>
	     <%
	   		}}}
	     %>
	  </tbody>
	</table>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<script type="text/javascript">
function filterName(number){
	let value;
	switch(number){
		case 1:
			value = $("#name").val();
			break;
		case 2:
			value = $("#area").val();
			break;
		case 3:
			let arVal = [];
	        $('.bed:checked').each(function(i){
	        	arVal[i] = parseInt($(this).val());
	        });
	        value = JSON.stringify(arVal);//chuyển mảng string sang kiểu string
			break;
		case 4:
			$('.toilet:checked').each(function(i){
				value = $(this).val();
	        });
			break;
		case 5:
			value = $("#price").val();
			break;
	}
	
	$.ajax({
		url: '<%=request.getContextPath()%>/rooms',
		type: 'POST',
		data: {
			anumber: number,
			avalue: value
		},
		success: function(data){
			$('tbody').html(data);
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	})
}

$("img[class=select]").click(function(){
	let image = $(this);
	// Nếu chưa xác nhận và còn giường
	if(image.attr("alt")==="false" && image.attr("id")>0) {
		$.ajax({
			url: '<%=request.getContextPath()%>/rooms',
				type : 'POST',
				cache : false,
				data : {
					asrc : image.attr("src")
				},
				success : function(data) {
					image.attr("src", data)
				},
				error : function() {
					alert("Có lỗi xảy ra");
				}
			});
	}
});

function onSelectRoom(check, idRoom, empty){
	if(check) {
		alert("Không thể hủy phòng đã được xác nhận!");
		exit();
	}
	if(!empty) {
		alert("Phòng này đã hết giường rồi!");
		exit();
	}
	$.ajax({
		url: '<%=request.getContextPath()%>/rooms',
		type: 'POST',
		data: {
			aidRoom: idRoom,
		},
		success: function(data){
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	})
}

function onSaveBoot(idStudent){
	$.ajax({
		url: '<%=request.getContextPath()%>/rooms',
		type: 'POST',
		data: {
			aidStudent: idStudent,
		},
		success: function(data){
			alert("Đặt phòng thành công!");
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	})
}
</script>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="/templates/public/inc/footer.jsp" %>