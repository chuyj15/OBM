package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;

import obm.dto.AutoLogin;

public class AutoLoginDAO extends JDBConnection implements Serializable{

	private static final long serialVersionUID = 1L;

	public AutoLogin getAlSession(int alSession) {
		AutoLogin al = new AutoLogin();
		
		String sql = "SELECT * FROM `autoLogin` WHERE al_session = ?;";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, alSession);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				al.setAlId(rs.getInt("al_id"));
				al.setAlSession(rs.getInt("al_session"));
				al.setUserId(rs.getString("user_id"));
				al.setUserPw(rs.getString("user_pw"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		
		
		return al;
		
		
	}
	
	public int add(String userId, String userPw) {
		int result = 0;
		int newAlSession = (int) Math.floor(Math.random()*60000);
		
		String sql = "INSERT INTO `auto_login` (al_session,user_id,user_pw) VALUES (?,?,?);";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, newAlSession);
			psmt.setString(2, userId);
			psmt.setString(3, userPw);
			psmt.executeUpdate();
			result = newAlSession;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int isSession(String userId) {
		int result = 0;
		
		String sql = "SELECT al_session FROM `auto_login` WHERE user_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			if(rs.next()) result = rs.getInt("al_session");
			else;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
