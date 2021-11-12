package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		
		memberDAO dao = new memberDAO();
		String name = dao.nickCheck(nickName);
		
		if(name.equals("")) {
			// 사용 가능한 닉네임
			request.setAttribute("res", 1);
		} else {
			// 사용 불가능한 닉네임
			request.setAttribute("res", 0);
		}
		request.setAttribute("nickName", nickName);
	}

}
