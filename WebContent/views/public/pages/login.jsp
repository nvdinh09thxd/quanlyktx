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
			String username = request.getParameter("username");
			if (request.getParameter("err") != null) {
				int err = Integer.parseInt(request.getParameter("err"));
				switch (err) {
					case 0 :
						out.print("<h3 style='background: #67FF67; color: red'>Sai tài khoản!</h3>");
						break;
				}
			}
		%>
		<form class="new-account-box" id="accountLogin" method="post">
			<h3 class="box-subheading">Already registered?</h3>
			<div class="form-content">
				<div class="form-group primary-form-group">
					<label for="loginemail">Email address</label>
					<input type="text" value="nvdinh0766777123@gmail.com" name="email" id="loginemail" class="form-control input-feild">
				</div>
				<div class="form-group primary-form-group">
					<label for="password">Password</label>
					<input type="password" name="password" id="password" value="123" class="form-control input-feild">
				</div>
				<div class="forget-password">
					<p><a href="#">Forgot your password?</a></p>
				</div>
				<div class="submit-button">
					<a href="javascript:void(0)" id="signinCreate" class="btn main-btn">
					<span>
						<i class="fa fa-lock submit-icon"></i>
						<button>Sign in</button>
					</span>
					</a>
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