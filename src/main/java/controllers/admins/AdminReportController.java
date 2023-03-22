package controllers.admins;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.RoomDAO;
import models.Room;

@WebServlet("/admin/report")
public class AdminReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomDAO roomDao;

	public AdminReportController() {
		super();
		roomDao = new RoomDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Room> listEmptyRooms = roomDao.getEmptyRooms();
		request.setAttribute("listEmptyRooms", listEmptyRooms);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/report/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
