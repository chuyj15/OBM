package obm.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obm.dao.CourseDAO;
import obm.dto.Course;

/**
 * Servlet implementation class ImgServlet
 */
@WebServlet("/img")
public class ImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		// productId 로 해당 상품 정보 조회
		CourseDAO courseDAO = new CourseDAO();
		Course course = courseDAO.choice( Integer.parseInt(id));
		System.out.println(course);	
		String file = course.getFile();	// 파일 경로
		
		System.out.println(file);
		//상품 이미지가 없을 때, 기본 이미지로 응답
		if (file==null || file.equals("")) {
			file= "D:\\cyj\\escapeimg\\no-image.jpg";
		}
		// 백슬래시 기호를 하나만 쓰면.. \t \n 기호랑 겹쳐가지고 백슬래시를 사용하려면 \\ 이렇게 두 개를 써야 한다. 
		
		String ext = file.substring( file.lastIndexOf(".") + 1 ).toUpperCase(); //확장자 추출
		System.out.println("확장자 : " + ext);
		
		String mediaType = "image/jpeg";
		
		switch (ext) {
			case "JPG": 
			case "JPEG": mediaType = "image/jpeg"; break;
			case "PNG" : mediaType = "image/png"; break;
			case "GIF" : mediaType = "image/gif"; break;
			case "WEBP" : mediaType = "image/webp"; break;
		}
		
		response.setContentType( mediaType );// 이미지 파일로 컨텐츠 타입 지정
        try (FileInputStream fis = new FileInputStream(file);	//파일경로를 파일인풋스트림에 넣어줌.
             OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int data;
            
            while ((data = fis.read(buffer)) != -1) {
                out.write(buffer, 0, data);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





