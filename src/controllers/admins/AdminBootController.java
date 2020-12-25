package controllers.admins;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.BootDAO;
import models.Boot;
import models.Room;

@WebServlet("/admin/boot")
public class AdminBootController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BootDAO bootDao;

	public AdminBootController() {
		super();
		bootDao = new BootDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Boot> listBoots = bootDao.findAll();
		request.setAttribute("listBoots", listBoots);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/boot/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("aid"));
		int idRoom = Integer.parseInt(request.getParameter("aidRoom"));
		String src = request.getParameter("asrc");
		int idx = src.lastIndexOf("/");
		String firstName = src.substring(0, idx + 1);
		String lastName = src.substring(idx + 1);
		String fileName = "";
		boolean active = true;
		if (lastName.equals("active.gif")) {
			fileName = firstName + "deactive.gif";
			active = false;
		} else {
			fileName = firstName + "active.gif";
		}
		Boot boot = new Boot(id, new Room(idRoom), active);
		if (bootDao.editAccept(boot) > 0) {
			out.print(fileName);
		} else {
			out.print(src);
		}
	}

}
