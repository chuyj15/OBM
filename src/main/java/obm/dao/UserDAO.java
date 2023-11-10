package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obm.dto.User;

public class UserDAO extends JDBConnection implements Serializable {

	private static final long serialVersionUID = 1L;

	public int login(String id, String pw) {
		int result = 0;

		String sql = "SELECT user_id, password FROM `user` WHERE user_id = ? ";
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				
				if (pw.equals(rs.getString("password"))) {
					//아이디 , 비번 둘 다 O
					result = 1;
				} else {
					//아이디 O, 비번 X
					result = 2;
				}
			}else {
				// 아이디 X
				result=3;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;

	}
	
	
	public User getInfo(String id) {
		User user = new User();
		
		String sql = "SELECT * FROM `user` WHERE user_id = ?;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				user.setUserId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPoint(rs.getInt("point"));
				user.setGrade(rs.getString("grade"));
				user.setPhone(rs.getString("phone"));
				user.setRegDate(rs.getDate("reg_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}

	
	public int join(User user) {
		int result = 0;
		
		String sql = "INSERT INTO `user` (user_id,name,password,email,point,grade,phone,reg_date) VALUES (?,?,?,?,0,'common',?,NOW());";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getUserId());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getEmail());
			psmt.setString(5, user.getPhone());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	public int delUser(String userId) {
		int result = 0;
		
		String sql = "DELETE FROM `user` WHERE user_id = ?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			result = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}

	public int update(User user,String userId) {
		int result = 0;
		
		String sql = "UPDATE `user` SET name = ?, password = ?, email = ?, phone = ? WHERE user_id = ? ;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getEmail());
			psmt.setString(4, user.getPhone());
			psmt.setString(5, user.getUserId());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	
	
	
	public int addPoint(String userId,int price) {
		int result = 0;
		
		String sql = "UPDATE `user` SET point = (point + ?) WHERE user_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, price);
			psmt.setString(2, userId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	
	public List<User> userListByAdmin(){
		List<User> userList = new ArrayList<User>();
		
		String sql = "SELECT * FROM `user`;";
		
		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				User user = new User();
				
				user.setUserId(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPoint(rs.getInt("point"));
				user.setGrade(rs.getString("grade"));
				user.setPhone(rs.getString("phone"));
				user.setRegDate(rs.getDate("reg_date"));
				
				userList.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	
	
	public int setGrade(String userId,String grade) {
		int result = 0;
		
		String sql = "UPDATE `user` SET grade = ? WHERE user_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, grade);
			psmt.setString(2, userId);
			result = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	public int usePoint(String userId, int inputPoint) {
		int result = 0;
		
		String sql = "UPDATE `user` SET point = (point - ?) WHERE user_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, inputPoint);
			psmt.setString(2, userId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
}
