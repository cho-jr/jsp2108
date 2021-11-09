package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GInputOk")
public class GInputOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String homepage = request.getParameter("homepage")==null? "" : request.getParameter("homepage");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null? "" : request.getParameter("hostIp");
		GuestVO  vo = new GuestVO();
		
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomepage(homepage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		
		GuestDAO dao = new GuestDAO();
		
		boolean res = dao.gInputOk(vo);
		
		PrintWriter out = response.getWriter();
		if(res) {
			out.println("<script>");
			out.println("alert('방문 소감 등록 완료!')");
			out.println("location.href='"+request.getContextPath()+"/guest/gList.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('방문 소감 등록 실패!')");
			out.println("location.href='"+request.getContextPath()+"/guest/gInput.jsp'");
			out.println("</script>");
		}
	}
}
