package com.dev.service;

import java.util.ArrayList;
import java.util.Vector;

import com.dev.dao.ClothesDAO;
import com.dev.vo.ClothesVO;
import com.dev.vo.MemberVO;

import order.OrderBean;


public class ClothesService {
	private static ClothesService service = new ClothesService();
	private ClothesDAO dao = ClothesDAO.getInstance();
	
	private ClothesService() {}
	
	public static ClothesService getInstance()
	{
		return service;
	}
	
	public ArrayList<ClothesVO> ClothesList()
	{
		ArrayList<ClothesVO> arrayList;
		arrayList = dao.ClothesList();
		return arrayList;
	}
	
//	public Vector<ClothesVO> getAllClothes(){
//
//		Vector<ClothesVO> arrayList;
//		arrayList = dao.getAllClothes();
//		return arrayList;
//	}
	
	public ClothesVO getOneCloth(int no) {
	
		return dao.getOneCloth(no);
	}
	
	public ClothesVO  getCloth(String no) {
		return dao.getCloth(no);
	}
	public void reduceProduct(OrderBean bean) {
		
	}
	
	public ArrayList<ClothesVO> getClothesAll() {
		ArrayList<ClothesVO> arrayList;
		arrayList = dao.ClothesList();
		return arrayList;
	}
}
