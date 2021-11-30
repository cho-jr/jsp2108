import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PracController")
public class PracController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("data/pdsTest"); // contextPath 아래 "data/pdsTest" 경로 얻음
		int maxSize = 1024*1024*10;
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = multipartRequest.getOriginalFileName("photo");	// (input[type=file] 태그 name) 해당 태그에서 불러온 파일의 실제 이름
		String filesystemName = multipartRequest.getFilesystemName("photo");	// 태그에서 불러온 파일의 서버 저장 이름
		
		
		System.out.println("서버에 저장되는 실제 경로 : "+ realPath);
		System.out.println("원본 파일 이름 : " + originalFileName);
		System.out.println("서버 저장 파일 이름 : " + filesystemName);
	}
}
