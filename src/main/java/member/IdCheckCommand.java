package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		memberDAO dao = new memberDAO();
		String name = dao.idCheck(mid);
		
		if(name.equals("")) {
			// 사용 가능한 아이디
			request.setAttribute("res", 1);
		} else {
			request.setAttribute("res", 0);
		}
		request.setAttribute("mid", mid);
	}

}
