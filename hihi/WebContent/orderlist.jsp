<%@page import="com.dev.vo.ClothesVO"%>
<%@page import="com.dev.dao.ClothesDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript" src="js/script.js?ver=1.0"></script>

</head>

<body>

	

	<table style="width: 80%">

		<tr style="background-color: gold">

			<th>상품</th><th>가격</th><th>재고량</th><th>상세보기</th>

		</tr>

	<%	
		ClothesDAO dao=ClothesDAO.getInstance();
		ArrayList<ClothesVO> list = dao.getClothesAll(); 

		for(ClothesVO clothes : list){

	%>

			<tr>

				<td>

					<img src="image/<%=clothes.getImage() %>" width="100">☜<%=clothes.getName() %>

				</td>

				<td><%=clothes.getPrice() %></td>

				<td><%=clothes.getStock() %></td>

				<td><a href="javascript:productDetail('<%=clothes.getNo()%>')">보기</a></td>

			</tr>

	<%	} %>

	</table>

	

	

	<!-- 제품번호를 상세보기로 넘기기 위한 form -->

	<form action="productdetail_guest.jsp" name="detailFrm" method="post">

		<input type="hidden" name="no">

	</form>

</body>

</html>

