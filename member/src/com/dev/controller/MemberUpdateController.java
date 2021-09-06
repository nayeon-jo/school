package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=req.getParameter("id");
		String pwd= req.getParameter("pwd");
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		
		if(id.isEmpty()||pwd.isEmpty() || name.isEmpty()|| email.isEmpty())
		{
			req.setAttribute("error", "please enter all items!!");
			String path="/memberUpdate.jsp";
			HttpUtil.forward(req, resp, path);
			return;
		}
		
		MemberVO member=new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setMail(email);	
		
		MemberService service=MemberService.getInstance();
		service.memberUpdate(member);
		
		req.setAttribute("id", id);
		HttpUtil.forward(req, resp, "/result/memberUpdateO.jsp");
	}
}
