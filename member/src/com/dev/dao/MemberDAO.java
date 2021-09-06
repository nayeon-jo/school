package com.dev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dev.vo.MemberVO;

public class MemberDAO {
	private static MemberDAO dao=new MemberDAO();
	private MemberDAO() {}
	
	public static MemberDAO getInstance()
	{
		return dao;
	}
	
	private Connection connect()
	{
		Connection conn=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/memberdb?serverTimezone=Asia/Seoul", "root", "0516");
		}catch(Exception e)
		{
			System.out.println("Conn error!");
		}
		return conn;
	}
	
	private void close(Connection conn, PreparedStatement ps)
	{
		if(ps!=null)
		{
			try
			{
				ps.close();
			}catch(Exception e) {}
		}
		if(conn!=null)
		{
			try
			{
				conn.close();
			}catch(Exception e) {}
		}
	}
	
	
	
	
	private void close(Connection conn, PreparedStatement ps, ResultSet rs)
	{
		if(ps!=null)
		{
			try
			{
				ps.close();
			}catch(Exception e) {}
		}
		if(conn!=null)
		{
			try
			{
				conn.close();
			}catch(Exception e) {}
		}
		if(rs!=null)
		{
			try
			{
				rs.close();
			}catch(Exception e) {}
		}
	}
	
	
	
	
	
	public void memberInsert(MemberVO member)
	{
		Connection conn=null;
		PreparedStatement pst=null;
		
		try
		{
			conn=connect();
			pst=conn.prepareStatement("insert into member values(?,?,?,?);");
			pst.setString(1, member.getId());
			pst.setString(2, member.getPwd());
			pst.setString(3, member.getName());
			pst.setString(4, member.getMail());
			
			pst.executeUpdate();
		}catch(Exception e)
		{
			System.out.println("mInsert error!"+e);
		}
		finally
		{
			close(conn,pst);
		}
	
	}

	public ArrayList<MemberVO> memberList() {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		try
		{
			conn=connect();
			pst=conn.prepareStatement("select*from member;");
			
			rs=pst.executeQuery();
			MemberVO member=null;
			while(rs.next())
			{
				member=new MemberVO();
				member.setId(rs.getString(1));
				member.setPwd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
				list.add(member);
			}
		}catch(Exception e)
		{
			System.out.println("mList error!"+e);
		}
		finally
		{
			close(conn,pst,rs);
		}
		return list;
	}
	
	public MemberVO memberSearch(String id) {
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		MemberVO member=null;
		
		try
		{
			conn=connect();
			pst=conn.prepareStatement("select*from member where id=?;");
			pst.setString(1, id);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				member=new MemberVO();
				member.setId(rs.getString(1));
				member.setPwd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
			}
		}catch(Exception e)
		{
			System.out.println("mList error!"+e);
		}
		finally
		{
			close(conn,pst,rs);
		}
		return member;
	}

	

	public void memberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement pst=null;
		
		try
		{
			conn=connect();
			pst=conn.prepareStatement("update member set password=?, name=?, email=? where id=?;");
			pst.setString(1, member.getPwd());
			pst.setString(2, member.getName());
			pst.setString(3, member.getMail());
			pst.setString(4, member.getId());
			
			pst.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.println("mList error!"+e);
		}
		finally
		{
			close(conn,pst);
		}
	}
	
	
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement pst=null;
		
		try
		{
			conn=connect();
			pst=conn.prepareStatement("delete from member where id=?;");
			pst.setString(1, id);
			
			pst.executeUpdate();
		}catch(Exception e)
		{
			System.out.println("mList error!"+e);
		}
		finally
		{
			close(conn,pst);
		}
		
	}
}
