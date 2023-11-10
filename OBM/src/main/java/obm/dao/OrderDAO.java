package obm.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import obm.dto.Order;

public class OrderDAO extends JDBConnection implements Serializable{

	
	
	private static final long serialVersionUID = 1L;

	
	
	public List<Order> getOrderList(){
		List<Order> orderList = new ArrayList<Order>();
		
		String sql = "SELECT * FROM `order`;";
		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return orderList;
		
	}
	
	
	public Order getRecentInfo(String phone) {
		Order order = new Order();
		
		String sql = "SELECT * FROM `order` WHERE"
				+ " order_id = ("
				+ "SELECT MAX(order_id)"
				+ " FROM `order`"
				+ " WHERE phone = ?);";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, phone);
			rs = psmt.executeQuery();
			if(rs.next()) {
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return order;
	}
	
	
	public List<Order> getOrderListByUser(String user_id){
		List<Order> orderList = new ArrayList<Order>();
		
		String sql = "SELECT * FROM `order` WHERE user_id = ?;";
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return orderList;
		
	}
	
	
	public int add(Order order) {
		int result = 0;
		
		String sql = "INSERT INTO `order` (user_id,course_name,res_date, res_time,duration,reg_date,isCancel,hc,phone,isDone,price,res_name) VALUES (?,?,?,?,?,NOW(),0,?,?,0,?,?);";		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, order.getUserId());	//세션에서 가져와서 order에 담은 것.
			psmt.setString(2, order.getCourseName()); //선택한 코스에서 가져와 담은 것
			psmt.setString(3, order.getResDate());
			psmt.setInt(4, order.getResTime());		//넘겨받을 때는 23091212
			psmt.setInt(5, order.getDuration());	//선택한 코스에서 가져와 담은 것
			psmt.setInt(6, order.getHc());
			psmt.setString(7, order.getPhone());
			psmt.setInt(8, order.getPrice());
			psmt.setString(9, order.getResName());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
		
	}
	

	
	public int userValue(String user_id) {
		int userValue = 0;
		
		String sql = "SELECT SUM(price) AS userValue FROM `order` WHERE user_id = ? AND isCancel = 0 AND isDone = 1;";
		
		
		try {
		
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				userValue = rs.getInt("userValue");
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userValue;
		
	}
	
	
	//고객이 정보 수정하면 isCancel을 진행하고 새로 주문하는 식으로
	
	public int isCancel(int orderId) {
		int result = 0;
		
		String sql = "UPDATE `order` SET isCancel = 1 WHERE order_id = ?;";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, orderId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public Order choice(int orderId) {
		Order order = new Order();
		
		String sql = "SELECT * FROM `order` WHERE order_id = ?;";
		
		
		try {
			
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, orderId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return order;
		
	}


	public List<Order> doingList() {
		List<Order> doingList = new ArrayList<Order>();
		
		String sql = "SELECT * FROM `order` WHERE isDone = 0 ;";
		
		try {
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Order order = new Order();
				
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
				
				doingList.add(order);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return doingList;
		
	}
	
	public int done(int orderId) {
		int result = 0;
		
		String sql = "UPDATE `order` SET isDone = 1 WHERE order_id = ?;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, orderId);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return result;
	}
	

	
	
	public List<Order> resDateCheck(String resDate,String courseName) {
		
		List<Order> orderList = new ArrayList<Order>();
		
		String sql = "SELECT * FROM `order` WHERE res_date = ? AND course_name = ? AND isDone = 0;";
		
		try {

			psmt = con.prepareStatement(sql);
			psmt.setString(1, resDate);
			psmt.setString(2, courseName);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Order order = new Order();
				
				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getString("user_id"));
				order.setCourseName(rs.getString("course_name"));
				order.setResDate(rs.getString("res_date"));
				order.setResTime(rs.getInt("res_time"));
				order.setDuration(rs.getInt("duration"));
				order.setRegDate(rs.getDate("reg_date"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setHc(rs.getInt("hc"));
				order.setPhone(rs.getString("phone"));
				order.setIsDone(rs.getInt("isDone"));
				order.setPrice(rs.getInt("price"));
				order.setResName(rs.getString("res_name"));
				
				orderList.add(order);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return orderList;
	}
	
	
	
}
