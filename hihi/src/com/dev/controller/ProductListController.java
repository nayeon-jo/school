package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.service.ProductService;
import com.dev.vo.ProductVO;

public class ProductListController implements Controller {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		
		ProductService service = ProductService.getInstance();
		ArrayList<ProductVO> list = service.productList();
		
		req.setAttribute("list", list);
		String path = "/result/productListOutput.jsp";
		HttpUtil.forward(req, resp, path);
	}
}