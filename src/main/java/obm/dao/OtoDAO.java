package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obm.dto.Oto;

public class OtoDAO extends JDBConnection implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public List<Oto> readListByUser(String user_id){
		List<Oto> otoList = new ArrayList<Oto>();
		
		String sql = "SELECT * FROM oto WHERE user_id = ?;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Oto oto = new Oto();
				
				oto.setOtoId(rs.getInt("oto_id"));
				oto.setUserId(rs.getString("user_id"));
				oto.setPhone(rs.getString("phone"));
				oto.setTitle(rs.getString("title"));
				oto.setContent(rs.getString("content"));
				oto.setCategory(rs.getString("category"));
				oto.setRegDate(rs.getDate("reg_date"));
				oto.setReply(rs.getString("reply"));
				
				otoList.add(oto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return otoList;
		
		
	}

	public List<Oto> readListByAdmin(){
		List<Oto> otoList = new ArrayList<Oto>();
		
		String sql = "SELECT * FROM oto ORDER BY reg_date DESC;";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Oto oto = new Oto();
				
				oto.setOtoId(rs.getInt("oto_id"));
				oto.setUserId(rs.getString("user_id"));
				oto.setPhone(rs.getString("phone"));
				oto.setTitle(rs.getString("title"));
				oto.setContent(rs.getString("content"));
				oto.setCategory(rs.getString("category"));
				oto.setRegDate(rs.getDate("reg_date"));
				oto.setReply(rs.getString("reply"));
				
				otoList.add(oto);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return otoList;
		
		
	}
	
	
	public int add(Oto oto) {
		int result = 0;
		
		String sql = "INSERT INTO oto (user_id,phone,title,content,category) VALUES (?,?,?,?,?)";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, oto.getUserId());
			psmt.setString(2, oto.getPhone());
			psmt.setString(3, oto.getTitle());
			psmt.setString(4, oto.getContent());
			psmt.setString(5, oto.getCategory());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
		
	}
	
	
	
	
	public Oto choiceOto(int otoId) {
		Oto oto = new Oto();
		
		String sql = "SELECT * FROM oto WHERE oto_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);	
			psmt.setInt(1, otoId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				oto.setOtoId(rs.getInt("oto_id"));
				oto.setUserId(rs.getString("user_id"));
				oto.setPhone(rs.getString("phone"));
				oto.setTitle(rs.getString("title"));
				oto.setContent(rs.getString("content"));
				oto.setCategory(rs.getString("category"));
				oto.setRegDate(rs.getDate("reg_date"));
				oto.setReply(rs.getString("reply"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return oto;
	}
	
	public int replyOto(String reply, int otoId) {
		int result = 0;
		
		String sql = "UPDATE oto SET reply = ? WHERE oto_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, reply);
			psmt.setInt(2, otoId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
		
	}
	
	
	
}
