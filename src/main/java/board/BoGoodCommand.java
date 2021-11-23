package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoGoodCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

		BoardDAO dao = new BoardDAO();
		
		// 조회수 증가처리
		// 세션 배열(객체 배열 : ArrayList()) : 고유 세션아이디 + 'good' + '현재 글의 고유번호'
		HttpSession session = request.getSession();
		ArrayList<String> goodIdx = (ArrayList<String>) session.getAttribute("sGoodIdx");
		if(goodIdx == null ) {
			goodIdx = new ArrayList<String>();
			session.setAttribute("sGoodIdx", goodIdx);
		}
		String imsiGoodIdx = session.getId() + "good" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			dao.setGoodUpdate(idx);
			goodIdx.add(imsiGoodIdx);
		}
		
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
