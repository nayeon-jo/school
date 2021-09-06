package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberListController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 MemberService service=MemberService.getInstance(); 
		 ArrayList<MemberVO> list=service.memberList();
		 
		 req.setAttribute("list",list);
		 
		 String path="/result/memberList.jsp"; 
		 HttpUtil.forward(req, resp, path); 
		 }
	}
