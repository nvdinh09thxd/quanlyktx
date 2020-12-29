package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Boot;
import models.Student;
import models.Room;
import util.DBConnectionUtil;

public class BootDAO extends AbstractDAO {

	public List<Boot> findAll() {
		con = DBConnectionUtil.getConnection();
		List<Boot> listItems = new ArrayList<>();
		String sql = "SELECT b.id, b.accept, s.firstname, s.lastname, r.id, r.name FROM boots b"
				+ " JOIN students s ON b.id_student = s.id JOIN rooms r ON b.id_room = r.id"
				+ " WHERE b.status = 1 ORDER BY b.id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Boot item = new Boot(rs.getInt("b.id"),
						new Student(rs.getString("s.firstname"), rs.getString("s.lastname")),
						new Room(rs.getInt("r.id") ,rs.getString("r.name")), rs.getBoolean("b.accept"));
				listItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listItems;
	}

	public List<Boot> findByStudent(int idStudent) {
		con = DBConnectionUtil.getConnection();
		List<Boot> listItems = new ArrayList<>();
		String sql = "SELECT * FROM boots WHERE id_student = ? ORDER BY id";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, idStudent);
			rs = pst.executeQuery();
			while (rs.next()) {
				Boot item = new Boot(new Room(rs.getInt("id_room")), rs.getBoolean("status"));
				listItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listItems;
	}

	public int addList(List<Boot> listBoots, int idStudent) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO boots (id_student, id_room) VALUES (?, ?)";
		try {
			pst = con.prepareStatement(sql);
			for (Boot objBoot : listBoots) {
				pst.setInt(1, idStudent);
				pst.setInt(2, objBoot.getRoom().getId());
				result = pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int add(Boot boot, int idStudent) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO boots (id_student, id_room) VALUES (?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, idStudent);
			pst.setInt(2, boot.getRoom().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int edit(Boot objBoot, int idStudent) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE boots SET status = ? WHERE id_student = ? AND id_room = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setBoolean(1, objBoot.isStatus());
			pst.setInt(2, idStudent);
			pst.setInt(3, objBoot.getRoom().getId());
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;
	}

	public int editAccept(Boot boot) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sqlBoot = "UPDATE boots SET accept = ? WHERE id = ?";
		String sqlRoom = "UPDATE rooms SET status = !status WHERE id = ?";
		try {
			pst = con.prepareStatement(sqlBoot);
			pst.setBoolean(1, boot.isAccept());
			pst.setInt(2, boot.getId());
			results = pst.executeUpdate();
			
			pst = con.prepareStatement(sqlRoom);
			pst.setInt(1, boot.getRoom().getId());
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;
	}
}
