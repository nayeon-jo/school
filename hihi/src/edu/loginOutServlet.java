package edu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.service.MemberService;

@WebServlet("/login.do")
public class loginOutServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		if(id.isEmpty() || pwd.isEmpty())
		{
			out.print("<script>alert('ID 또는 비밀번호를 입력해주세요.'); location.href='login.jsp';</script>");
			return;
		}
		
		HttpSession session = req.getSession();
		if(session.isNew()||session.getAttribute("id")==null)
		{
			MemberService service = MemberService.getInstance();
			boolean result = service.memberLogin(id, pwd);
			
			if(result)
			{
				session = req.getSession();
				session.setAttribute("id", id);
				
				out.print("<script>alert('로그인 성공'); location.href='main.jsp';</script>");
			}

			else
			{
				out.print("<script>alert('없는 회원입니다.'); location.href='login.jsp';</script>");
			}
		}
		else {
			
			out.println("<script>alert('현재 로그인 상태입니다.'); location.href='main.jsp';</script>");
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession(false);
		if(session != null && session.getAttribute("id") != null)
		{
			session.invalidate();
			RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
			rd.forward(req, resp);
		}
		else {
			out.println("<script>alert('현재 로그인 상태가 아닙니다.'); location.href='main.jsp';</script>");
		}
		out.close();
	}
}
