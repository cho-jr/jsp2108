import board.BoardDAO;
import board.BoardVO;

// 더미 게시글 추가 ㅎ.ㅎ
public class Haha {
	public static void main(String args[]) {

		String mid = "안녕";
		String nickname = "하이";
		String title = "제목";
		String email = "이메일";
		String homePage = "홈페이지 주소";
		String content = "글내용";
		String hostIp = "127.0.0.";
		
		// title 필드에는 태그 사용 금지 (< --> %lt;  , > --> &gt;)
		
		for(int i = 1; i < 21; i++) {
			BoardVO vo = new BoardVO();
			vo.setMid(mid + i);
			vo.setNickName(nickname + i);
			vo.setTitle(title + i);
			vo.setEmail(i + email);
			vo.setHomePage(i + homePage);
			vo.setContent(content + i);
			vo.setHostIp(hostIp + i);
			
			BoardDAO dao = new BoardDAO();
			
			int res = dao.setBoInput(vo);
			System.out.println(i + "결과 : " + res);
		}
	}
}
