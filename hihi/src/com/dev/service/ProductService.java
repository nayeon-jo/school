package com.dev.service;

import java.util.ArrayList;

import com.dev.dao.ProductDAO;
import com.dev.vo.MemberVO;
import com.dev.vo.ProductVO;

public class ProductService {
	private static ProductService service = new ProductService();
	private ProductDAO dao = ProductDAO.getInstance();
	
	public void productInsert(ProductVO member)
	{
		dao.productInsert(member);
	}

	public static ProductService getInstance()
	{
		return service;
	}
	public ArrayList<ProductVO> productList()
	{
		ArrayList<ProductVO> arrayList;
		arrayList = dao.productList();
		return arrayList;
	}

	public boolean productLogin(String user_id) 
	{
		ProductVO acc = new ProductVO(user_id);
		return dao.productLogin(acc);
	}
	
}
