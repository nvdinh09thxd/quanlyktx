package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Area;
import models.Room;
import util.DBConnectionUtil;

public class RoomDAO extends AbstractDAO {
	public List<Room> findAll() {
		con = DBConnectionUtil.getConnection();
		List<Room> listItems = new ArrayList<>();
		String sql = "SELECT * FROM rooms r JOIN area a ON r.area = a.id ORDER BY r.id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Room item = new Room(rs.getInt("id"), rs.getString("name"), new Area(rs.getInt("a.id"), rs.getString("a.name")),
						rs.getInt("number_of_bed"), rs.getBoolean("have_toilet"), rs.getFloat("price"));
				listItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listItems;
	}

	public List<Room> getEmptyRooms() {
		con = DBConnectionUtil.getConnection();
		List<Room> listItems = new ArrayList<>();
		String sql = "SELECT * FROM rooms r JOIN area a ON r.area = a.id WHERE status = 1 ORDER BY r.id";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Room item = new Room(rs.getInt("id"), rs.getString("name"), new Area(rs.getInt("a.id"), rs.getString("a.name")),
						rs.getInt("number_of_bed"), rs.getBoolean("have_toilet"), rs.getFloat("price"));
				listItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listItems;
	}
}
