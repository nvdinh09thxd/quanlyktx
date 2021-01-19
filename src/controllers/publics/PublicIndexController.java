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
import javax.servlet.http.HttpSession;

import daos.BootDAO;
import daos.RoomDAO;
import models.Boot;
import models.Student;
import models.Room;

@WebServlet("/index")
public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RoomDAO roomDao;
	BootDAO bootDao;
	List<Room> listRooms;
	List<Boot> listBoots;
	HttpSession session;
	Student userLogin;

	public PublicIndexController() {
		super();
		roomDao = new RoomDAO();
		bootDao = new BootDAO();
		listRooms = new ArrayList<>();
		listBoots = new ArrayList<>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		if (session.getAttribute("userLogin") != null && session.getAttribute("listBoots") == null) {
			userLogin = (Student) session.getAttribute("userLogin");
			listBoots = bootDao.findByStudent(userLogin.getId());
			session.setAttribute("listBoots", listBoots);
		}
		listRooms = roomDao.findAll();
		request.setAttribute("listRooms", listRooms);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/pages/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		if (request.getParameter("aidRoom") != null) {
			SelectRoom(request, response);
		} else if (request.getParameter("asrc") != null) {
			changeIcon(request, response);
		} else if (request.getParameter("anumber") != null) {
			FilterRooms(request, response);
		} else {
			saveBoot(request, response);
		}

	}

	protected void FilterRooms(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
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
				if (!"0".equals(value) && objRoom.getArea().getId() == Integer.parseInt(value)) {
					listRoomsFilter.add(objRoom);
				} else if ("0".equals(value)) {
					listRoomsFilter.add(objRoom);
				}
				break;
			case 3:
				String replace = value.replace("[", "");
				value = replace.replace("]", "");
				String[] listChecked = value.split(",");
				if (listChecked.length > 0 && listChecked[0].length() != 0) {
					for (String objChecked : listChecked) {
						if (objRoom.getTotalBed() == Integer.parseInt(objChecked))
							listRoomsFilter.add(objRoom);
					}
				} else {
					listRoomsFilter.add(objRoom);
				}
				break;
			case 4:
				if (objRoom.isHaveToilet() == Boolean.parseBoolean(value))
					listRoomsFilter.add(objRoom);
				break;
			case 5:
				if ("0".equals(value)) {
					listRoomsFilter.add(objRoom);
				}
				if ("1".equals(value) && objRoom.getPrice() < 500000)
					listRoomsFilter.add(objRoom);
				if ("2".equals(value) && 500000 <= objRoom.getPrice() && objRoom.getPrice() <= 1000000)
					listRoomsFilter.add(objRoom);
				if ("3".equals(value) && objRoom.getPrice() > 1000000)
					listRoomsFilter.add(objRoom);
				break;
			}
		}
		for (Room objRoom : listRoomsFilter) {
			String checked = objRoom.isHaveToilet() ? " checked " : "";
			out.print("<tr>");
			out.print("<td>" + objRoom.getName() + "</td>");
			out.print("<td>Khu " + objRoom.getArea().getName() + "</td>");
			out.print("<td>" + objRoom.getTotalBed() + " giường</td>");
			out.print("<td>" + objRoom.getEmptyBed() + " giường</td>");
			out.print("<td> <input type='checkbox'" + checked + " onclick='return false;' /></td>");
			out.print("<td>" + objRoom.getPrice() + "</td>");
			out.print("</tr>");
		}
	}

	@SuppressWarnings("unchecked")
	protected void SelectRoom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idRoom = Integer.parseInt(request.getParameter("aidRoom"));
		Boot boot = new Boot(new Room(idRoom), new Student(userLogin.getId()), true);
		boolean check = false;
		listBoots = (List<Boot>) session.getAttribute("listBoots");
		for (Boot objBoot : listBoots) {
			if (objBoot.getRoom().getId() == idRoom) {
				objBoot.setStatus(!objBoot.isStatus());
				check = true;
				break;
			}
		}
		if (!check) {
			listBoots.add(boot);
		}
	}

	protected void changeIcon(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String src = request.getParameter("asrc");
		PrintWriter out = response.getWriter();
		int idx = src.lastIndexOf("/");
		String firstName = src.substring(0, idx + 1);
		String lastName = src.substring(idx + 1);
		String fileName = "";
		if (lastName.equals("tick.png")) {
			fileName = firstName + "cancel.png";
		} else {
			fileName = firstName + "tick.png";
		}
		out.print(fileName);
	}

	@SuppressWarnings("unchecked")
	protected void saveBoot(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idStudent = Integer.parseInt(request.getParameter("aidStudent"));
		listBoots = (List<Boot>) session.getAttribute("listBoots");
		if (listBoots != null && listBoots.size() > 0) {
			for (Boot objBoot : listBoots) {
				if (bootDao.add(objBoot, idStudent) == 0) {
					bootDao.edit(objBoot, idStudent);
				}
			}
		}
		// sau khi lưu thông tin đặt phòng thì set lại listBoots
		List<Boot> listBoots = bootDao.findByStudent(userLogin.getId());
		session.setAttribute("listBoots", listBoots);
	}

}
