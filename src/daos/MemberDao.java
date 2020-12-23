package daos;

import java.sql.SQLException;

import models.Member;
import util.DBConnectionUtil;

public class MemberDao extends AbstractDAO {

	public int addItem(Member item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO members (firstname, lastname, gender, address, email, password) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getFirstName());
			pst.setString(2, item.getLastName());
			pst.setBoolean(3, item.isGender());
			pst.setString(4, item.getAddress());
			pst.setString(5, item.getEmail());
			pst.setString(6, item.getPassword());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public Member getItem(String email, String password) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM members WHERE email = ? AND password = ?";
		Member item = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				item = new Member(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
						rs.getBoolean("gender"), rs.getString("address"), rs.getString("email"),
						rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return item;
	}

}
