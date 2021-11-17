package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 저장소에 담아서 관리자 화면으로 넘겨야 함
		 * 1. 준회원 수 
		 * 2. 최근 게시글
		 * 3. 오늘 방문 횟수
		 */
		
		MemberDAO memberDao = new MemberDAO();
		int newMember = memberDao.getNewMember();
		request.setAttribute("newMember", newMember);
		
	}

}
