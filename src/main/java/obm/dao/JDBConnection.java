package obm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnection {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

//		DB에 연결
			String url = "jdbc:mysql://localhost:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String id = "root";
			String pw = "123456";

			con = DriverManager.getConnection(url, id, pw);

			System.out.println("DB 연결 성공");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
}