package com.dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.service.MemberService;


public class MemberDeleteController implements Controller{
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=req.getParameter("id");
		
		MemberService service=MemberService.getInstance();
		//boolean existId=
		service.memberDelete(id);
		
		
		req.setAttribute("id",id);
		
		String path="/result/memberDeleteO.jsp";
		HttpUtil.forward(req, resp, path);
	}
}
//