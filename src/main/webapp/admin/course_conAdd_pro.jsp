<!-- 관리자가 코스를 추가합니다.  -->
<%@page import="obm.dto.Course"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="courseDAO" class="obm.dao.CourseDAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
//경로 수정해야합니당!~
String path = "C:\\CYJ\\upload";

String root = request.getContextPath();

DiskFileUpload upload = new DiskFileUpload();
upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
upload.setRepositoryPath(path);			// 임시 저장 경로

List<FileItem> items = upload.parseRequest(request);
Iterator params = items.iterator();

Course course = new Course();
String file = "";
while( params.hasNext() ) {
	FileItem item = (FileItem) params.next();
	
	// FileItem
	// .getFieldName()		: 요청 파라미터 이름 - productId
	// .getString()			: 요청 파라미터 값   - P1001
	
	String value = item.getString("utf-8");			// P1001
	// 일반 데이터
	if( item.isFormField() ) {
		switch(item.getFieldName()) {
			case "courseName" 		: course.setCourseName( value );  break;
			case "courseDes" 		: course.setDescription( value );  break;
			case "coursePrice" 		: course.setPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
   			case "courseDur" 		: course.setDuration(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
   			case "coursePopul" 		: course.setPopularity(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
		}
	}
	// 파일 데이터
	else {
		String fileName = item.getName(); //파일이름을 가져옴. 
		if (item==null  || fileName==null || fileName=="") continue;	//이미지 없이 업로드
		File fileObj = new File(path + "/" + fileName); //경로, 이름이 들어있는 파일객체 생성
		item.write(fileObj);			// 파일 저장
		file = fileObj.getPath();	//파일 경로 문자열임	
		course.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
	}
}
int result = courseDAO.add(course);
 response.sendRedirect(root + "?msg=courseAdd"); 
 

%>

