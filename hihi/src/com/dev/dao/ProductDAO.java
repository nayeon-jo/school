package com.dev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dev.vo.ProductVO;

public class ProductDAO {

private static ProductDAO dao = new ProductDAO();
	
	private ProductDAO() {}
	
	public static ProductDAO getInstance()
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
	public void productInsert(ProductVO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("insert into product values(?,?,?,?,?,?,?);");
			pstmt.setString(1, member.getPn());
			pstmt.setString(2, member.getPs());
			pstmt.setString(3, member.getPc());
			pstmt.setString(4, member.getPp());
			pstmt.setString(5, member.getAm());
			pstmt.setString(6, member.getPtotal());
			pstmt.setString(7, member.getUser_id());
			
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("pInsert error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt);
		}
	}

	public ArrayList<ProductVO> productList()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		try
		{
			conn = connect();
			pstmt = conn.prepareStatement("select * from product;");
			
			rs = pstmt.executeQuery();
			ProductVO member = null;
			
			while(rs.next())
			{
				member = new ProductVO();
				member.setPn(rs.getString(1));
				member.setPs(rs.getString(2));
				member.setPc(rs.getString(3));
				member.setPp(rs.getString(4));
				member.setAm(rs.getString(5));
				member.setPtotal(rs.getString(6));
				member.setUser_id(rs.getString(7));
				
				list.add(member);
			}
		}
		catch(Exception e)
		{
			System.out.println("pList error!!!!" + e);
		}
		finally
		{
			close(conn, pstmt, rs);
		}
		return list;
	}

	public boolean productLogin(ProductVO acc) {
		Connection con = null;
		PreparedStatement psmt = null;
		boolean existAvail = false;
		ResultSet rs = null;
		try
		{
			con = connect();
			psmt = con.prepareStatement("select id from product where user_id = ?;");
			psmt.setString(1, acc.getUser_id());
			//psmt.setString(2, acc.getPasswd());			
			rs = psmt.executeQuery();
			
			if(rs.next()) existAvail = true;
			else existAvail= false;
			
		}catch(Exception e)
		{
			System.out.print("product - accountLogin Error!!!");
		}
		finally
		{
			close(con,psmt);
		}
		
		return existAvail;
		}
	
}
