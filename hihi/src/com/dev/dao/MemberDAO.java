package com.dev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dev.vo.MemberVO;
import com.mysql.cj.xdevapi.PreparableStatement;

public class MemberDAO {

	private static MemberDAO dao = new MemberDAO();
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance()
	{
		return dao;
	}
	private Connection connect()
	{
		Connection conn = null;
		
		try
		{
			//1. JDBC Driver ·Îµù
			Class.forName("com.mysql.jdbc.Driver");
	
			//2. Server Connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?serverTimezone=Asia/Seoul", "root", "1234");
		}
		catch(Exception e)
		{
			System.out.println("Conn error!!!!");
		}
		return conn;
	}
	
	private void close(Connection conn, PreparedStatement ps)
	{
		if(ps != null)
		{
			try
			{
				ps.close();
			}catch(Exception e) {}
		}
		if(conn != null)
		{
			try
			{
				conn.close();
			}catch(Exception e) {}
		}	
	}
	
	private void close(Connection conn, PreparedStatement ps, ResultSet rs)
	{
		if(ps != null)
		{
			try
			{
				ps.close();
			}catch(Exception e) {}
		}
		if(conn != null)
		{
			try
			{
				conn.close();
			}catch(Exception e) {}
		}
		if(rs != null)
		{
			try
			{
				rs.close();
			}catch(Exception e) {}
		}
	}
	
	public void memberInsert(MemberVO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?);");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getMail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getZip());
			pstmt.setString(7, member.getAdd());
			
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("mInsert error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt);
		}
	}
	public ArrayList<MemberVO> memberList()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("select * from member;");
			
			rs = pstmt.executeQuery();
			MemberVO member = null;
			
			while(rs.next())
			{
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
				list.add(member);
			}
		}
		catch(Exception e)
		{
			System.out.println("mList error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt, rs);
		}
		return list;
	}

	public MemberVO memberSearch(String id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where id = ?;");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
			}
		}
		catch(Exception e)
		{
			System.out.println("mList error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt, rs);
		}
	return member;
	}

	public void memberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("update member set password = ?, name = ?, email = ? where id = ?;");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getMail());
			pstmt.setString(4, member.getId());
			
			pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.println("mList error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt);
		}
	}

	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("delete from member where id = ?;");
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("mList error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt);
		}
	}

	public boolean memberLogin(MemberVO acc) {
		Connection con = null;
		PreparedStatement psmt = null;
		boolean existAvail = false;
		ResultSet rs = null;
		try
		{
			con = connect();
			psmt = con.prepareStatement("select id from member where id = ? and password = ?;");
			psmt.setString(1, acc.getId());
			psmt.setString(2, acc.getPasswd());			
			rs = psmt.executeQuery();
			
			if(rs.next()) existAvail = true;
			else existAvail= false;
			
		}catch(Exception e)
		{
			System.out.print("accountLogin Error!!!");
		}
		finally
		{
			close(con,psmt);
		}
		
		return existAvail;
	}

}
