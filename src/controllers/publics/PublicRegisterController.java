package controllers.publics;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MemberDao;
import models.Member;

@WebServlet("/register")
public class PublicRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDao memberDao;

	public PublicRegisterController() {
		super();
		memberDao = new MemberDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/pages/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		// get dữ liệu từ form
		boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		password = util.StringUtil.md5(password);
		Member member = new Member(0, firstname, lastname, gender, address, email, password);
		if (memberDao.addItem(member) > 0) {
			response.sendRedirect(request.getContextPath() + "/index?msg=1");
			return;
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/checkout-registration.jsp?msg=0");
			rd.forward(request, response);
			return;
		}
	}
}
