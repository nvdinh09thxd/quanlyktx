package daos;

import java.sql.SQLException;

import models.Student;
import util.DBConnectionUtil;

public class StudentDao extends AbstractDAO {

	public int addItem(Student item) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO students (firstname, lastname, gender, address, email, password, id_user) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getFirstName());
			pst.setString(2, item.getLastName());
			pst.setBoolean(3, item.isGender());
			pst.setString(4, item.getAddress());
			pst.setString(5, item.getEmail());
			pst.setString(6, item.getPassword());
			pst.setInt(7, item.getId_user());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, con);
		}
		return result;
	}

	public Student getItem(String email, String password) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM students WHERE email = ? AND password = ?";
		Student item = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				item = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
						rs.getBoolean("gender"), rs.getString("address"), rs.getString("email"),
						rs.getString("password"), rs.getInt("id_user"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return item;
	}

}
