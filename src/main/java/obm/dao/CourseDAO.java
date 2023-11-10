package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obm.dto.Course;

public class CourseDAO extends JDBConnection implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public List<Course> getCourseList(){
		List<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT * FROM course;";
		
		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Course course = new Course();
				course.setCourseId(rs.getInt("course_id"));
				course.setCourseName(rs.getString("course_name"));
				course.setDescription(rs.getString("description"));
				course.setPrice(rs.getInt("price"));
				course.setPopularity(rs.getInt("popularity"));
				course.setDuration(rs.getInt("duration"));
				course.setFile(rs.getString("file"));
				
				courseList.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return courseList;
		
	}
	
	
	public int add(Course course) {
		int result = 0;
	
		String sql = "INSERT INTO course (course_name,description,price,popularity,duration,file) VALUES (?,?,?,?,?,?);";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, course.getCourseName());
			psmt.setString(2, course.getDescription());
			psmt.setInt(3, course.getPrice());
			psmt.setInt(4, course.getPopularity());
			psmt.setInt(5, course.getDuration());
			psmt.setString(6, course.getFile());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int update(Course course,int courseId) {
		int result = 0;
		String sql = "UPDATE course SET course_name = ?, description = ?, price = ?, popularity = ?, duration = ?, file = ? WHERE course_id = ?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, course.getCourseName());
			psmt.setString(2, course.getDescription());
			psmt.setInt(3, course.getPrice());
			psmt.setInt(4, course.getPopularity());
			psmt.setInt(5, course.getDuration());
			psmt.setString(6, course.getFile());
			psmt.setInt(7, courseId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public int delete(int courseId) {
		int result = 0;
		
		String sql = "DELETE FROM course WHERE course_id = ?;";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, courseId);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
	
	public Course choice(int courseId) {
		Course course = new Course();
		
		String sql = "SELECT * FROM course WHERE course_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, courseId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				course.setCourseId(rs.getInt("course_id"));
				course.setCourseName(rs.getString("course_name"));
				course.setDescription(rs.getString("description"));
				course.setPrice(rs.getInt("price"));
				course.setPopularity(rs.getInt("popularity"));
				course.setDuration(rs.getInt("duration"));
				course.setFile(rs.getString("file"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return course;
		
	}
	
}
