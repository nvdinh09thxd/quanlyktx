package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.StudentDao;
import daos.UserDao;
import models.Student;
import models.User;

@WebServlet("/register")
public class PublicRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentDao studentDao;

	public PublicRegisterController() {
		super();
		studentDao = new StudentDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		List<User> listUsers = userDao.findAll();
		request.setAttribute("listUsers", listUsers);
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
		int id_user = Integer.parseInt(request.getParameter("id_user"));
		password = util.StringUtil.md5(password);
		Student member = new Student(0, firstname, lastname, gender, address, email, password, id_user);
		if (studentDao.addItem(member) > 0) {
			response.sendRedirect(request.getContextPath() + "/index?msg=1");
			return;
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/public/pages/register.jsp?msg=0");
			rd.forward(request, response);
			return;
		}
	}
}
