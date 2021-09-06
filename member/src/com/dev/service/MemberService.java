package com.dev.service;

import java.util.ArrayList;

import com.dev.dao.MemberDAO;
import com.dev.vo.MemberVO;


public class MemberService {
	private static MemberService service=new MemberService();	
	private ArrayList<MemberVO> array=new ArrayList<MemberVO>();
	private MemberDAO dao=MemberDAO.getInstance();
	
	private MemberService() {}
	
	public static MemberService getInstance() {
		return service;
	}
	
	public void memberInsert(MemberVO member) {
		//array.add(member);
		dao.memberInsert(member);
	}
	
	public void memberDelete(String id)
	{
		dao.memberDelete(id);
	}
	
	public ArrayList<MemberVO> memberList()
	{
		ArrayList<MemberVO> array;
		array=dao.memberList();
		return array;
	}
	
	public MemberVO memberSearch(String id)
	{
		MemberVO member=dao.memberSearch(id);
		return member;
	}
	
	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}
	
}
