package com.dev.service;

import java.util.ArrayList;

import com.dev.dao.MemberDAO;
import com.dev.vo.MemberVO;

public class MemberService {
	private static MemberService service = new MemberService();
	private MemberDAO dao = MemberDAO.getInstance();
	
	private MemberService() {}
	
	public static MemberService getInstance()
	{
		return service;
	}
	
	public void memberInsert(MemberVO member)
	{
		//arrayList.add(member);
		dao.memberInsert(member);
	}
	
	public void memberDelete(String id)
	{
		dao.memberDelete(id);
	}
	public ArrayList<MemberVO> memberList()
	{
		ArrayList<MemberVO> arrayList;
		arrayList = dao.memberList();
		return arrayList;
	}

	public MemberVO memberSearch(String id)
	{
		MemberVO member = dao.memberSearch(id);
		return member;
	}

	public void memberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		dao.memberUpdate(member);
	}

	public boolean memberLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		MemberVO acc = new MemberVO(id,pwd);
		return dao.memberLogin(acc);
	}

	
}