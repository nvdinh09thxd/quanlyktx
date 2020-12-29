package controllers.publics;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.StudentDao;
import models.Student;
import util.StringUtil;

@WebServlet("/login")
public class PublicLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDao memberDao;

	public PublicLoginController() {
		super();
		memberDao = new StudentDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Chuyển tiếp sang trang login
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/pages/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get dữ liệu từ form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// mã hóa password bằng phương thức md5
		password = StringUtil.md5(password);
		// Nếu tồn tại username và password trong csdl thì chuyển hướng đến trang admin
		if (memberDao.getItem(email, password) != null) {
			HttpSession session = request.getSession();
			Student userLogin = memberDao.getItem(email, password);
			session.setAttribute("userLogin", userLogin);
			response.sendRedirect(request.getContextPath() + "/index");
		} else {
			// Nếu không tồn tại username và password trong csdl thì chuyển tiếp đến trang
			// login và thông báo lỗi
			RequestDispatcher rd = request.getRequestDispatcher("/views/pages/login.jsp?err=0");
			rd.forward(request, response);
		}
	}
}
