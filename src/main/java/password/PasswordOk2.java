package password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/passwordOk2")
public class PasswordOk2 extends HttpServlet {
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
			String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
			
			System.out.println("=============================");
			System.out.println("입력된 아이디 : " + mid);
			System.out.println("입력된 비밀번호 : " + pwd);
			System.out.println("-----------------------------");
			
			
			//입력된 비밀번호 변환 / 문자 -> 숫자
			long intPwd;
			String strPwd = "";
			for(int i = 0; i < pwd.length(); i++) {
				intPwd = (long) pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("strPwd(아스키 코드 문자로 변환된 비밀번호) : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);	// 연산할 준비 완료...
			
			
			long key = 0x1234ABCD;		// 암호화를 위한 키 (0x1234ABCD)
			long encPwd, decPwd;
			
			// 암호화 작업(인코딩)
			encPwd = intPwd ^ key;	 // 원본 비번과 암호키값을 (XOR 시킨다. )
			strPwd = String.valueOf(encPwd);	// db에 저장하기 위해 문자로 변환
			System.out.println("인코딩된 비번 : " + encPwd);
			System.out.println("----------------------------");
			
			// DB에 저장된 암호를 다시 복호화시킨다. 
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("디코딩된 비번 : " + decPwd);
			System.out.println("----------------------------");
			
			// 복원된 비밀번호는 숫자로된 비밀번호 이기에 
			// 문자로 변경 후 2개씩 분리 후 다시 문자로 변환시킨다. 
			strPwd = String.valueOf(decPwd);
			
			String result = "";
			char ch;
			
			for(int i = 0; i < strPwd.length(); i += 2) {
				ch = (char) Integer.parseInt(strPwd.substring(i, i + 2));
				result += ch;
			}
			
			System.out.println("최종 변환된 비밀번호 : " + result);
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('콘솔 확인 요망');");
			out.println("location.href='"+request.getContextPath()+"/password';");
			out.println("</script>");
		}
}
