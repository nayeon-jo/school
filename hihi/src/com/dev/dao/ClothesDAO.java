package com.dev.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import com.dev.vo.ClothesVO;
import com.dev.vo.MemberVO;
import com.dev.vo.ProductVO;

import order.OrderBean;


public class ClothesDAO {

	private static ClothesDAO dao = new ClothesDAO();

	private ClothesDAO() {
	}

	public static ClothesDAO getInstance() {
		return dao;
	}

	private Connection connect() {
		Connection conn = null;

		try {
			// 1. JDBC Driver ·Îµù
			Class.forName("com.mysql.jdbc.Driver");

			// 2. Server Connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?serverTimezone=Asia/Seoul", "root",
					"1234");
		} catch (Exception e) {
			System.out.println("Conn error!!!!");
		}
		return conn;
	}

	private void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
	}

	private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
	}

	public ArrayList<ClothesVO> ClothesList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ClothesVO> list = new ArrayList<ClothesVO>();

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from clothes;");

			rs = pstmt.executeQuery();
			ClothesVO clothes = null;

			while (rs.next()) {
				clothes = new ClothesVO();
				clothes.setNo(rs.getInt(1));
				clothes.setName(rs.getString(2));
				clothes.setPrice(rs.getInt(3));
				clothes.setStock(rs.getInt(4));
				clothes.setImage(rs.getString(5));
				list.add(clothes);
			}
		} catch (Exception e) {
			System.out.println("cList error!!!!" + e);
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

//	public Vector<ClothesVO> getAllClothes(){
//		Vector<ClothesVO> v=new Vector<>();
//		ClothesVO bean=null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try
//		{
//			conn = connect();
//			pstmt = conn.prepareStatement("select * from clothes;");
//			
//			rs = pstmt.executeQuery();
//			ClothesVO clothes = null;
//			
//			while(rs.next())
//			{
//				clothes = new ClothesVO();
//				clothes.setNo(rs.getInt(1));
//				clothes.setName(rs.getString(2));
//				clothes.setPrice(rs.getInt(3));
//				clothes.setStock(rs.getInt(4));
//				clothes.setImage(rs.getString(5));
//				v.add(clothes);
//			}
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//		return v;
//	}

	public ClothesVO getOneCloth(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClothesVO clothes = new ClothesVO();
		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from clothes where no=?;");
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				clothes.setNo(rs.getInt(1));
				clothes.setName(rs.getString(2));
				clothes.setPrice(rs.getInt(3));
				clothes.setStock(rs.getInt(4));
				clothes.setImage(rs.getString(5));

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clothes;

	}

	public ClothesVO getCloth(String no) {
		ClothesVO clothes = new ClothesVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from clothes where no=?;");
			pstmt.setString(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				clothes.setNo(rs.getInt(1));
				clothes.setName(rs.getString(2));
				clothes.setPrice(rs.getInt(3));
				clothes.setStock(rs.getInt(4));
				clothes.setImage(rs.getString(5));

			}
			conn.close();
		} catch (Exception e) {
			System.out.println("getCloth err : ");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return clothes;
	}

	public void reduceProduct(OrderBean bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			conn = connect();
			pstmt = conn.prepareStatement("update clothes set stock=(stock-?) where no=?;");

			pstmt.setString(1, bean.getQuantity());

			pstmt.setString(2, bean.getProduct_no());

			pstmt.executeUpdate();

		} catch (Exception e) {

			System.out.println("reduceProduct err : " + e);

		} finally {

			try {

				if (rs != null)
					rs.close();

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

	}
	public ArrayList<ClothesVO> getClothesAll() {
		ArrayList<ClothesVO> list = new ArrayList<ClothesVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			conn = connect();
			pstmt = conn.prepareStatement("select * from clothes;");
			
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				ClothesVO clothes = new ClothesVO();
				clothes.setNo(rs.getInt("no"));
				clothes.setName(rs.getString("name"));
				clothes.setPrice(rs.getInt("price"));
				clothes.setStock(rs.getInt("stock"));
				clothes.setImage(rs.getString("image"));
				list.add(clothes);
			}

		} catch (Exception e) {
			System.out.println("getProductAll err : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
