package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obm.dto.Review;

public class ReviewDAO extends JDBConnection implements Serializable{

	private static final long serialVersionUID = 1L;

	public List<Review> readList(){
		List<Review> reviewList = new ArrayList<Review>();
		
		String sql = "SELECT * FROM review;";

		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Review review = new Review();
				
				review.setReviewId(rs.getInt("review_id"));
				review.setUserId(rs.getString("user_id"));
				review.setCourseName(rs.getString("course_name"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setRegDate(rs.getDate("reg_date"));
				review.setUpdDate(rs.getDate("upd_date"));
				
				reviewList.add(review);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reviewList;
		
	}
	
	
	//SQL문을 통한 간이 검색리스트
	
	public List<Review> readList(String search){
		
		List<Review> reviewList = new ArrayList<Review>();
		
		String sql = "SELECT * FROM review"
				+ "WHERE user_id LIKE ? "
				+ "OR course_name LIKE ? "
				+ "OR title LIKE ? "
				+ "OR content LIKE ? ;";

		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+search+"%");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Review review = new Review();
				
				review.setReviewId(rs.getInt("review_id"));
				review.setUserId(rs.getString("user_id"));
				review.setCourseName(rs.getString("course_name"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setRegDate(rs.getDate("reg_date"));
				review.setUpdDate(rs.getDate("upd_date"));
				
				reviewList.add(review);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reviewList;
		
	}
	
	
	
	
	public Review choice(int reviewId) {
		Review review = new Review();
		
		String sql = "SELECT * FROM review WHERE review_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, reviewId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				review.setReviewId(rs.getInt("review_id"));
				review.setUserId(rs.getString("user_id"));
				review.setCourseName(rs.getString("course_name"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setRegDate(rs.getDate("reg_date"));
				review.setUpdDate(rs.getDate("upd_date"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return review;
		
	}
	
	
	public int add(Review review) {
		
		int result = 0;
		
		String sql = "INSERT INTO review (user_id,course_name,title,content,reg_date,upd_date) VALUES (?,?,?,?,NOW(),NOW());";

		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, review.getUserId());
			psmt.setString(2, review.getCourseName());
			psmt.setString(3, review.getTitle());
			psmt.setString(4, review.getContent());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	public int delReview(int reviewId) {
		
		int result = 0;
		
		String sql = "DELETE FROM review WHERE review_id = ?";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, reviewId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}
	
	public int update(Review review, int reviewId) {
		
		int result = 0;
		
		String sql = "UPDATE review"
				+ " SET course_name = ?,"
				+ " title = ?,"
				+ " content = ?,"
				+ " upd_date = now()"
				+ " WHERE review_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, review.getCourseName());
			psmt.setString(2, review.getTitle());
			psmt.setString(3, review.getContent());
			psmt.setInt(4, reviewId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	
	
	
}
