package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=req.getParameter("id");
		String job=req.getParameter("job");
		
		String path=null;
		if(job.equals("search"))
			path="/memberSearch.jsp";
		else if(job.equals("update"))
			path="/memberUpdate.jsp";
		else if(job.equals("delete"))
			path="/memberDelete.jsp";
		
		if(id.isEmpty()) {
			req.setAttribute("error", "enter ID!!!!");
			HttpUtil.forward(req, resp, path);
			return;
		}
		
		MemberService service=MemberService.getInstance();
		MemberVO member=service.memberSearch(id);
		
		
		if(member==null)
			req.setAttribute("result", "no information");
		req.setAttribute("member", member);
		
		if(job.equals("search")) path="/result/memberSearchO.jsp";
		HttpUtil.forward(req, resp, path);
	}
}
//
