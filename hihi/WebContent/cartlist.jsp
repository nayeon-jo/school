<%@page import="com.dev.vo.ClothesVO"%>
<%@page import="com.dev.dao.ClothesDAO" %>
<%@page import="order.OrderBean"%>

<%@page import="java.util.Enumeration"%>

<%@page import="java.util.Hashtable"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="cartmanager" class="order.CartManager" scope="session" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"><!--style.css 연결-->
<script language="JavaScript" src="js/script.js"></script>
</head>
<body>
<!-- (바꾼부분) div를 삭제하고 nav, ul 태그 삽입  -->
<div class="container">
  <div class="top">
<nav>
  <ul>
	<%
		if(session.getAttribute("id")==null){
		%>
		 <li id="parent"><a href="join.jsp"><img src="image/join.png" width="15px" height="15px"> JOIN<div class="balloon">2000</div></a></li>
      <li><a href="login.jsp"><img src="image/login.png" width="15px" height="15px"> LOGIN</a></li>
		
		<%	
		}else{
			%>
			<li><a href="#"><img src="image/setting.png" width="15px" height="15px"> MYPAGE &nbsp</a>
        <ul>
          <li><a href="#"><img src="image/cart.png" width="15px" height="15px"> 장바구니</li></a>
          <li><a href="#"><img src="image/box.png" width="15px" height="15px"> 배송 현황</li></a>
          <li><a href="#"><img src="image/paper.png" width="15px" height="15px"> 회원 정보</li></a>
        </ul>
      </li>
      
      
        <li><a href="login.do"><img src="image/login.png" width="15px" height="15px"> LOGOUT</a></li>

			
			<% 
		}
	%>

      

  </ul>
</nav>
  </div>
   <div class="title"><a href="main.html">NormCore</a></div>
    </div>
       <div class="body">
        <div class="aside">
          <ul>
              <li>BEST</li>
              <li>NEW</li>
              <li>OUTER</li>
              <li><a href="menu_top.jsp">TOP</a></li>
              <li>BOTTOM</li>
              <li>SHOES</li>
              <li>ACC</li><br>
               <li><a href="https://www.instagram.com/normcore__official/" target="blank"><img src="image/instagram.png"  width="25" height="25" alt="instagram" ></a>
                <a href="https://open.kakao.com/o/gmcePkhc" target="blank">&nbsp <img src="image/talk.png"  width="25" height="25" alt="kakotalk"></a></li>
              <li>NOTICE</li>
              <li>Q&A</li>
            </ul>
        </div>
<div class="main">


	

	<form action="cartprocess.jsp" method="get">

   <div style="margin-left:120px; margin-bottom:30px; font-size:30px;">SHOPPING CART</div>
  <table style="margin:0px auto; ">

     
            
          <table class="type08" border="1" style = "margin:0px auto;">
            <tbody>
            <tr>
            <td width="120" style="text-align:center"><font size=2>IMAGE</font></td>
              <td width="120" style="text-align:center"><font size=2>INFO</font></td>
              <td width="120" style="text-align:center"><font size=2>PRICE</font></td>
              <td width="120" style="text-align:center"><font size=2>QTY</font></td>
              <td width="120" style="text-align:center"><font size=2>MODIFY/DELETE</font></td>
              
             
              
             
            </tr>



			<%
				int totalPrice = 0;

				Hashtable<String, OrderBean> hCart = cartmanager.getCartList();

				//장바구니가 비었을경우

				if (hCart.size() == 0) {
			%>
			<tr>
			<td colspan="5">
			<p style="text-align:center; margin:30px 0px 30px 0px;">장바구니가 비어있습니다.</p></td>
			</tr>
			<%
				//장바구니에 내용이 있을경우

				} else {

					//카트의 모든 제품코드(키값)을 추출

					Enumeration<String> enu = hCart.keys();

					while (enu.hasMoreElements()) { //남은 키 값이 있다면

						//해당 제품코드(키값)의 카트내용을 담음

						OrderBean order = (OrderBean) hCart.get(enu.nextElement());

						//해당 제품코드의 제품정보를 db에서 가져옴
						ClothesDAO dao=ClothesDAO.getInstance();

						ClothesVO clothes = dao.getCloth(order.getProduct_no());

						int price = clothes.getPrice();

						int quantity = Integer.parseInt(order.getQuantity());

						int subTotal = price * quantity;

						totalPrice += subTotal;
			%>
			


			<tr style="text-align: center; ">
				<td><img src="image/<%=clothes.getImage()%>" width=120px height=120px></td>
				<td><%=clothes.getName()%></td>

				<td><%=subTotal%></td>

				<td><input type="text" name="quantity" size="5"
					value="<%=order.getQuantity()%>" style="text-align: center;">

				</td>

				<td>
					<!-- form 에서 가져갈 데이터 --> <input type="hidden" name="flag">

					<input type="hidden" name="product_no"
					value="<%=clothes.getNo()%>"> <!-- 수정/삭제 버튼 --> <input
					type="button" value="수정" onclick="cartUpdate(this.form)"
					style="background-color: silver"> / <input type="button"
					value="삭제" onclick="cartDelete(this.form)"
					style="background-color: silver">

				</td>

				

			</tr>

			<%
				}
			%>

			<tr>

				<td colspan="5"><br /> <b>총 결제 금액 : <%=totalPrice%> 원
				</b> &nbsp;&nbsp;&nbsp; <a href="orderprocess.jsp">[ 주문하기 ]</a></td>

			</tr>

			<%
				}
			%>

		</table>
</table>
</form>
</div>

 <div class="aside2">
  <div class="aside2-content"><img src="image/event.png" style="width:200px;height:500px;"></div>
</div>
    </div> 
      <div class="footer">
        <p>대표이사. 놈코어 │ 사업자등록번호. 123-45-67890 │ 통신판매업신고. 2020-경기용인-0835 │ 개인정보보호책임자. 놈코어 [사업자정보확인]<br><br>
          회사명. ㈜NormCore │ 전화. 031-265-8138 │ 팩스. 02-123-4567 │ 이메일. NormCore@yongin.ac.kr │ 주소. 경기도 용인시 <br><br>
          ⓒ 2020 NormCore All rights reserved. │ 개인정보처리방침 │ 영상정보처리기기운영･관리방침 │ 이용약관 │ Hosting by cafe24 
          </p>
      </div>
   
 
  <script type="text/javascript" src="js/slider.js"></script> 
</body>
</html>

