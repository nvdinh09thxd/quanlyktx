<%@page import="models.User"%>
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
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
      <%
			String msg = request.getParameter("msg");
			if (msg != null) {
				out.print("<h3 style='background: #67FF67; color: red'>Xảy ra lỗi trong quá trình xử lý!</h3>");
			}
		%>
        <form class="primari-box personal-info-box" id="personalinfo" method="post">
			<h3 class="box-subheading">Your personal information</h3>
			<div class="personal-info-content">
				<div class="form-group primary-form-group p-info-group">
					<label>Gender</label>
					<span class="radio-box">
						<input id="radio1" type="radio" name="gender" value="true" checked="checked">
						<label for="radio1">Mr.</label>
					</span>
					<span class="radio-box">
						<input id="radio2" type="radio" name="gender" value="false">
						
						<label for="radio2">Mrs.</label>
					</span>
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="firstname">First Name <sup>*</sup></label>
					<input type="text" value="" name="firstname" id="firstname" class="form-control input-feild">
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="lastname">Last Name <sup>*</sup></label>
					<input type="text" value="" name="lastname" id="lastname" class="form-control input-feild">
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="lastname">Address <sup>*</sup></label>
					<input type="text" value="" name="address" id="address" class="form-control input-feild">
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="email">Email<sup>*</sup></label>
					<input type="email" value="" name="email" id="email" class="form-control input-feild">
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="password">Password <sup>*</sup></label>
					<input type="password" value="" name="password" id="password" class="form-control input-feild">
					<span class="min-pass">(Five characters minimum)</span>
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label for="admin">Nhân viên quản lý<sup>*</sup></label>
					<select id="id_user" name="id_user" class="form-control">
                    <%
                    if(request.getAttribute("listUsers")!=null) {
                    	List<User> listUsers = (List<User>) request.getAttribute("listUsers");
                    	if(listUsers.size()>0){
                    		for(User cat : listUsers){
                    %>
                     <option value="<%=cat.getId()%>"><%=cat.getFullname() %></option>
                    <%
                   		}}}
                    %>
                    </select>
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label class="cheker">
						<input type="checkbox" name="checkbox">
						<span></span>
					</label>
					<a href="#">Sign up for our newsletter!</a>
				</div>
				<div class="form-group primary-form-group p-info-group">
					<label class="cheker">
						<input type="checkbox" name="checkbox">
						<span></span>
					</label>
					<a href="#">Receive special offers from our partners!</a>
				</div>
				<div class="submit-button p-info-submit-button">
					<a href="javascript:void(0)" id="SubmitCreate" class="btn main-btn">
						<span>
							<i class="fa fa-chevron-right"></i>
							<button>Register</button>
						</span>											
					</a>
					<span class="required-field"><sup>*</sup>Required field</span>
				</div>
			</div>
		</form>
      </div>
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->
      <nav class="pagination">
        <ul>
          <li><a href="#">&laquo; Previous</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">6</a></li>
          <li class="current"><strong>7</strong></li>
          <li><a href="#">8</a></li>
          <li><a href="#">9</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">14</a></li>
          <li><a href="#">15</a></li>
          <li><a href="#">Next &raquo;</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<%@ include file="/templates/public/inc/footer.jsp" %>