<%@page import="obm.dto.Course"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="courseDAO" class="obm.dao.CourseDAO"></jsp:useBean>
<%
String root = request.getContextPath();	
request.setCharacterEncoding("UTF-8");
    //경로 수정해줘야합니당.
	String path = "C:\\CYJ\\upload"; 
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
	upload.setRepositoryPath(path);			// 임시 저장 경로
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Course course = new Course();
	String file = "";
	boolean newFile = false; //새 이미지 파일 업로드 여부
	/* 추가 */
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		/* 
		// FileItem  
		//-->일반데이터일 경우에 쓰는 두 메소드
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		// 이미지데이터일 경우에 쓰는 한 메소드
		// .getName()            : 파일이름을 가져옴. 
		*/
		
		String value = item.getString("utf-8");			// P1001
		// 일반 데이터
		if( item.isFormField() ) {
			switch(item.getFieldName()) {
				case "courseId" 		: course.setCourseId( Integer.parseInt(value) );  break;
				case "courseName" 		: course.setCourseName( value );  break;
				case "courseDes" 			: course.setDescription( value );  break;
				case "coursePrice" 		:   course.setPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
                case "courseDur" 		: course.setDuration(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
                case "coursePopul" 		: course.setPopularity(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName(); //파일이름을 가져옴. 
			if (item==null  || fileName==null || fileName=="") continue;	//이미지 없이 업로드한 경우 null 체크
			//업로드파일명 중복 방지
			fileName = UUID.randomUUID().toString().substring(0,11) + "_" + fileName;
			//이미지가 있는 경우엔 이미지를 저장
			File fileObj = new File(path + "/" + fileName); //경로, 이름이 들어있는 파일객체 생성
			item.write(fileObj);			// 파일 저장
			file = fileObj.getPath();	//파일 경로 문자열임	
			course.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
			//추가	
			newFile = true;	//업로드한 이미지 파일이 있음.
		}
	}
	/* 기존 이미지 삭제 */
	Course oldCourse = courseDAO.choice( course.getCourseId() );
	//새로운 이미지를 업로드 하지 않은 경우엔 기존의 이미지파일이 그대로 가져와줘야 한다. 
	//새로운이미지를 업로드한경우
	if (newFile ){
		String oldFilePath = oldCourse.getFile();
		if (oldFilePath ==null){
			oldFilePath ="";
		}
		File oldFile = new File(oldFilePath);
		if( oldFile.exists() ) {
			// delete()
			// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
			if( oldFile.delete() ) {
				System.out.println("파일 삭제 성공!!!");
			}
			else {
				System.err.println("파일 삭제 실패!!!");
			}
		} else {
			System.err.println("파일이 존재하지 않습니다!!!");
		}
	} else {
		//새로운이미지를 업로드하지 않은 경우 (이전이미지파일경로를 세팅해줌. 안그러면 null처리 됨. 위에서 새 course를 생성했기 때문에)
		course.setFile(oldCourse.getFile());
	}
	
	int Id = course.getCourseId();
	int result = courseDAO.update(course, Id);
	
	//String courseId = course.getCourseId();
	if (result >0){
		response.sendRedirect(root + "/index.jsp?msg=courseUpd");
		} else {		
		response.sendRedirect(root + "/index.jsp?msg=courseNotUpd");
		}
%>





