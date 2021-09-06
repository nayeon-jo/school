package com.dev.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{

HashMap<String, Controller> list = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		list = new HashMap<String, Controller>();
		list.put("/memberInsert.do", new MemberInsertController());
		
		list.put("/productInsert.do", new ProductInsertController());
//		list.put("/memberDelete.do", new MemberDeleteController());
		list.put("/productList.do", new ProductListController());
//		list.put("/memberSearch.do", new MemberSearchController());
//		list.put("/memberUpdate.do", new MemberUpdateController());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Controller subController = list.get(path);
		subController.execute(req, resp);
	}
}