package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberInsertController implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. �Է�ȭ�鿡�� query string �� �� �Է°� ��������
		String id=req.getParameter("id");
		String pwd= req.getParameter("pwd");
		String name= req.getParameter("name");
		String email= req.getParameter("email");
				
		//2. �Է°����� MemberVO ��ü ����
		MemberVO member=new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setMail(email);
		
		//3.MemberService ���� ����,ó��
		MemberService service=MemberService.getInstance();
		service.memberInsert(member);
		
		//4. ����ڿ��� ��� �˷��ֱ�
		/*
		 * PrintWriter out=resp.getWriter(); out.print("join sucess"); out.close();
		 */
		String path="/result/memberInsertO.jsp";
		
		HttpUtil.forward(req, resp, path);
	}
}
