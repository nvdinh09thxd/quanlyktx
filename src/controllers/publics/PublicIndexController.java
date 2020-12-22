package controllers.publics;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Room;
import daos.RoomDAO;

@WebServlet("/index")
public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomDAO roomDao;
	List<Room> listRooms;

	public PublicIndexController() {
		super();
		roomDao = new RoomDAO();
		listRooms = new ArrayList<>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		listRooms = roomDao.findAll();
		request.setAttribute("listRooms", listRooms);
		RequestDispatcher rd = request.getRequestDispatcher("/views/pages/basic-grid.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		List<Room> listRoomsFilter = new ArrayList<>();
		int number = Integer.parseInt(request.getParameter("anumber"));
		String value = request.getParameter("avalue");
		for (Room objRoom : listRooms) {
			switch (number) {
			case 1:
				if (objRoom.getName().toUpperCase().startsWith(value.toUpperCase()))
					listRoomsFilter.add(objRoom);
				break;
			case 2:
				if (!"0".equals(value) && objRoom.getArea() == Integer.parseInt(value)) {
					listRoomsFilter.add(objRoom);
				}else if("0".equals(value)) {
					listRoomsFilter.add(objRoom);
				}
				break;
			case 3:
				String replace = value.replace("[", "");
				value = replace.replace("]", "");
				String[] myList = value.split(",");
				if (myList.length > 0 && myList[0].length() != 0) {
					for (String obj : myList) {
						if (objRoom.getNumberOfBed() == Integer.parseInt(obj))
							listRoomsFilter.add(objRoom);
					}
				} else {
					listRoomsFilter.add(objRoom);
				}
				break;
			case 4:
				if (objRoom.isHaveTolet() == Boolean.parseBoolean(value))
					listRoomsFilter.add(objRoom);
				break;
			case 5:
				if("0".equals(value)) {
					listRoomsFilter.add(objRoom);
				}
				if ("1".equals(value) && objRoom.getPrice() < 500000)
					listRoomsFilter.add(objRoom);
				if ("2".equals(value) && 500000 < objRoom.getPrice() && objRoom.getPrice() < 1000000)
					listRoomsFilter.add(objRoom);
				if ("3".equals(value) && objRoom.getPrice() > 1000000)
					listRoomsFilter.add(objRoom);
				break;
			}
		}
		for (Room objRoom : listRoomsFilter) {
			String checked = objRoom.isHaveTolet() ? " checked " : "";
			out.print("<tr>");
			out.print("<td>" + objRoom.getName() + "</td>");
			out.print("<td>" + objRoom.getArea() + "</td>");
			out.print("<td>" + objRoom.getNumberOfBed() + " giường</td>");
			out.print("<td> <input type='checkbox'" + checked + " /></td>");
			out.print("<td>" + objRoom.getPrice() + "</td>");
			out.print("</tr>");
		}

	}

}
