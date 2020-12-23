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
	  public boolean checkIdRoom(List<Boot> listBoots, int idRoom){
	  	for(Boot objBoot : listBoots){
	  		if(objBoot.getIdRoom()==idRoom && objBoot.isStatus()) return true;
	  	}
	  	return false;
	  }
  %>
    <!-- main body -->
    <!-- ################################################################################################ -->
    <%
			if(request.getParameter("msg")!=null){
				int msg = Integer.parseInt(request.getParameter("msg"));
				switch(msg){
					case 1: out.print("<p style='background: yellow; color: green'>Đăng ký thành công!</p>");
					break;
				}
			}
	%>
	<a style="<%if(userLogin==null) out.print("display: none");%>" href="javascript:void(0)"
		onclick="onSaveBoot(<%if(userLogin!=null) out.print(userLogin.getId()); %>)">
	<img style="width:60px;height:50px;" alt="" src="<%=request.getContextPath()%>/uploads/images/saveicon.png">
	</a>
    <table>
	  <thead>
	    <tr>
	      <th style="text-align: center">Tên phòng</th>
	      <th style="text-align: center">Khu vực</th>
	      <th style="text-align: center">Số giường</th>
	      <th style="text-align: center">Có vệ sinh trong</th>
	      <th style="text-align: center">Giá tiền</th>
	      <th style="<%if(userLogin==null) out.print("display: none"); %>">Cảm xúc</th>
	      <th style="<%if(userLogin==null) out.print("display: none"); %>">Đặt phòng</th>
	    </tr>
	    <tr>
	      	<th>
		      	<input style="color: blue" type="text" placeholder="Nhập tên phòng..." id="name" onkeyup="filterName(1)" />
			</th>
	      	<th>
		      	<select style="color: blue" onchange="filterName(2)" id="area">
				  <option value="0">--Chọn khu vực--</option>
				  <option value="1">A</option>
				  <option value="2">B</option>
				  <option value="3">C</option>
				  <option value="4">D</option>
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
	      	<th style="<%if(userLogin==null) out.print("display: none"); %>"></th>
			<th style="<%if(userLogin==null) out.print("display: none"); %>"></th>
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
	       <td><%=objRoom.getArea() %></td>
	       <td><%=objRoom.getNumberOfBed() %> giường</td>
	       <td><input type="checkbox" <%if(objRoom.isHaveTolet()) out.print("checked"); %>></td>
	       <td><%=objRoom.getPrice() %></td>
	       <td style="<%if(userLogin==null) out.print("display: none"); %>"><a href="javascript:void(0)">
	       		<img style="width:60px;height:50px;" alt="" src="<%=request.getContextPath()%>/uploads/images/like.jpg"></a></td>
	       <td style="<%if(userLogin==null) out.print("display: none"); %>"><a href="javascript:void(0)" onclick="onSelectRoom(<%=objRoom.getId() %>)">
	       		<img style="width:40px;height:50px;" class="select"
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
	if(number==1){
		value = $("#name").val();
	} else if(number==2){
		value = $("#area").val();
	} else if(number==3){
		let arVal = [];
        $('.bed:checked').each(function(i){
        	arVal[i] = parseInt($(this).val());
        });
        value = JSON.stringify(arVal);
	} else if(number==4){
		$('.toilet:checked').each(function(i){
			value = $(this).val();
        });
	} else {
		value = $("#price").val();
	}
	//alert(value);
	
	$.ajax({
		url: '<%=request.getContextPath()%>/index',
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
	$.ajax({
		url: '<%=request.getContextPath()%>/index',
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
});

function onSelectRoom(id){
	//alert(id);
	$.ajax({
		url: '<%=request.getContextPath()%>/index',
		type: 'POST',
		data: {
			aid: id,
		},
		success: function(data){
			//alert("Đã chọn!");
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	})
}

function onSaveBoot(idMember){
	$.ajax({
		url: '<%=request.getContextPath()%>/index',
		type: 'POST',
		data: {
			aidMember: idMember,
		},
		success: function(data){
			alert("Đã lưu!");
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