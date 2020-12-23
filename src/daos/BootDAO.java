package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Boot;
import util.DBConnectionUtil;

public class BootDAO extends AbstractDAO {
	public int addList(List<Boot> listBoots, int idMember) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO boots (id_member, id_room) VALUES (?, ?)";
		try {
			pst = con.prepareStatement(sql);
			for (Boot objBoot : listBoots) {
				pst.setInt(1, idMember);
				pst.setInt(2, objBoot.getIdRoom());
				result = pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public int add(Boot boot, int idMember) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO boots (id_member, id_room) VALUES (?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, idMember);
			pst.setInt(2, boot.getIdRoom());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public List<Boot> findAll(int idMember) {
		con = DBConnectionUtil.getConnection();
		List<Boot> listItems = new ArrayList<>();
		String sql = "SELECT * FROM boots WHERE id_member = ? ORDER BY id";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, idMember);
			rs = pst.executeQuery();
			while (rs.next()) {
				Boot item = new Boot(rs.getInt("id_room"), rs.getBoolean("status"));
				listItems.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listItems;
	}

	
	public int edit(Boot objBoot, int idMember) {
		int results = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE boots SET status = ? WHERE id_member = ? AND id_room = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setBoolean(1, objBoot.isStatus());
			pst.setInt(2, idMember);
			pst.setInt(3, objBoot.getIdRoom());
			results = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return results;		
	}
}
