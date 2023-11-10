package obm.service;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import obm.dao.OrderDAO;
import obm.dao.UserDAO;
import obm.dto.Order;
import obm.dto.User;

public class UserManagement implements Serializable{

	private static final long serialVersionUID = 1L;

	public String autoDone() {

		autoSetGrade();
		String msg = "";

		OrderDAO orderDAO = new OrderDAO();

		List<Order> doingList = orderDAO.doingList();

		Date now = new Date();
		
		
		
		SimpleDateFormat sdfT = new SimpleDateFormat("HH");
		SimpleDateFormat sdfD = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdfD2 = new SimpleDateFormat("yyyy-MM-dd");

		int nowTime = Integer.parseInt(sdfT.format(now));
		int nowDate = Integer.parseInt(sdfD.format(now));

		for (Order order : doingList) {
			System.out.println("doingList 진입");
			int orderId = order.getOrderId();
			String orderResDate = order.getResDate();
try {
	
	System.out.println(nowDate);
			if ((order.getResTime() <= nowTime &&Integer.parseInt(sdfD.format(sdfD2.parse(orderResDate)))==nowDate)|| Integer.parseInt(sdfD.format(sdfD2.parse(orderResDate))) <= nowDate) {
				
				int resultDone = orderDAO.done(orderId);

				if (resultDone > 0) {
					System.out.println("done() success");
					UserDAO userDAO = new UserDAO();

					// price에 나누기하면 됨 포인트 적립비율 조정
					int resultAddPoint = 0;
					if (!order.getUserId().equals("비회원")) {
						resultAddPoint = userDAO.addPoint(order.getUserId(), order.getPrice());
					}
					if (resultAddPoint > 0)
						System.out.println("addPoint() success");
					else
						System.err.println("addPoint() failed");

				} else {
					System.err.println("done() failed");
					
				}
				
			}
}catch(Exception e) {
	e.printStackTrace();
}
			
		}
		
		return msg;
	}


	

	public String autoSetGrade() {
		String msg = "";

		UserDAO userDAO = new UserDAO();
		OrderDAO orderDAO = new OrderDAO();
		List<User> userList = userDAO.userListByAdmin();

		for (User user : userList) {

			int userValue = orderDAO.userValue(user.getUserId());

			String grade = "";

			if (userValue < 100000) {
				grade = "common";
			} else if (userValue < 300000) {
				grade = "Silver";
			} else if (userValue < 500000) {
				grade = "Gold";
			} else if (userValue < 1000000) {
				grade = "Diamond";
			} else {
				grade = "Sherlock";
			}

			int result = userDAO.setGrade(user.getUserId(), grade);

			if (result > 0) {
				System.out.println("setGrade() success");
				msg = "setGrade() success";
			} else {
				System.err.println("setGrade() failed");
				msg = "setGrade() failed";

			}

		}

		return msg;
	}

}
