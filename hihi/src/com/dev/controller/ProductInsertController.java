package com.dev.controller;

import java.io.IOException;
//import java.io.PrintWriter;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.service.ProductService;
import com.dev.vo.ProductVO;

public class ProductInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 입력 화면에서 query string의 각 입력값 가져오기
		String p_name = req.getParameter("p_name");
		String p_size = req.getParameter("p_size");
		String p_color = req.getParameter("p_color");
		String p_sell_price = req.getParameter("sell_price");
		String p_amount = req.getParameter("amount");
		String p_total = req.getParameter("sum");
		
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("id");
				
		if(p_name.isEmpty() || p_size.isEmpty() || p_color.isEmpty() || p_sell_price.isEmpty())
		{
			req.setAttribute("error", "Enter All information!!");
			HttpUtil.forward(req, resp, "/memberInsert.jsp");
			return;
		}
		
		//2. 입력값으로 ProductVO 객체 생성
		ProductVO member = new ProductVO();
		member.setPn(p_name);
		member.setPs(p_size);
		member.setPc(p_color);
		member.setPp(p_sell_price);
		member.setAm(p_amount);
		member.setPtotal(p_total);
		member.setUser_id(user_id);
		
		//3. ProductService에게 전달, 처리
		ProductService service = ProductService.getInstance();
		service.productInsert(member);
		
		//4. 사용자에게 결과 알려주기
		/*PrintWriter out = resp.getWriter();
		out.print("Join success");
		out.close();*/
		String path="/실험.jsp";
		//RequestDispatcher dispather = req.getRequestDispatcher(path);
		//dispather.forward(req, resp);
		req.setAttribute("id", user_id);
		HttpUtil.forward(req, resp, path);
	}

}