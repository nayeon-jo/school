<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.dev.vo.ClothesVO"
    import="com.dev.dao.ClothesDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <title>NormCore</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"><!--style.css 연결-->
</head>
<body onload="init();">
<%
	
	ClothesDAO dao=ClothesDAO.getInstance();
	ClothesVO clothes=dao.getOneCloth(2);
	
	
%>
  <script language="JavaScript">
  <!-- 
  /* 수량, 토탈 금액 */
  var sell_price;
  var amount;

  function init () {
    sell_price = document.form.sell_price.value;
    amount = document.form.amount.value;
    document.form.sum.value = sell_price;
    change();
  }

  function add () {
    hm = document.form.amount;
    sum = document.form.sum;
    hm.value ++ ;

    sum.value = parseInt(hm.value) * sell_price;
  }

  function del () {
    hm = document.form.amount;
    sum = document.form.sum;
      if (hm.value > 1) {
        hm.value -- ;
        sum.value = parseInt(hm.value) * sell_price;
      }
  }

  function change () {
    hm = document.form.amount;
    sum = document.form.sum;

      if (hm.value < 0) {
        hm.value = 0;
      }
    sum.value = parseInt(hm.value) * sell_price;
  }  
  //-->
</script>

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

       
   <div class="title"><a href="main.jsp">NormCore</a></div>
    </div>
  </div>
       <div class="body">
        <div class="aside">
          <ul>
              <li>BEST</li>
              <li>NEW</li>
              <li>OUTER</li>
              <li>TOP</li>
              <li>BOTTOM</li>
              <li>SHOES</li>
              <li>ACC</li><br>
              <li><a href="https://www.instagram.com/" target="blank"><img src="image/instagram.png"  width="25" height="25" alt="instagram" >
                <a href="https://www.kakotalk.com/" target="blank">&nbsp <img src="image/talk.png"  width="25" height="25" alt="kakotalk"></a></a></li>
              <li>NOTICE</li>
              <li>Q&A</li>
            </ul>
        </div>
        <div class="main">
<form name="form" action = "cartprocess.jsp">
 <table>
  <tr>
    <td width=100></td>
    <td rowspan=7><img src = "image/<%=clothes.getImage() %>" width=400px height=400px></td>
    <td width=50></td>
    <td colspan=2 class="line"><input type="hidden" name="p_name" value="ddd"> &nbsp;&nbsp;<%=clothes.getName() %></td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Price</td>
    <td><%=clothes.getPrice() %></td>
  </tr>


  
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Qty</td>
    <td>
      
        <input type="button" style="border:none; border: none; background: transparent;" value=" - " onclick="del();"> 

        <input type=hidden name="sell_price" value="<%=clothes.getPrice() %>">
        <input type="text" name="quantity" value="1" size="3" style="text-align: center; background-color:transparent;border:0" onchange="change();">

        <input type="button" style="border:none; border: none; background: transparent;" value=" + " onclick="add();">
  
    </td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Total Price</td>
    <td>
        <input type="text" name="sum" size="8" style="text-align: right; font-size:20px; background-color:transparent;border:0;" readonly>원
      
    </td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td><input type="button" style="width:110pt;height:60pt;background: transparent;" onClick="location.href='productList.do'"value="구 매"></td>
    <td><input type="submit" style="width:110pt;height:60pt;background: transparent;" value="장바구니"></td>
  	<input type="hidden" name="product_no" value="<%=clothes.getNo() %>">
  

  	

  	
  </tr>
</table>   
</form>
             <div class="borderline">  
                <p><br><b>>Weekly Best<</b><br>
                한 주간 가장 많이 사랑 받은 아이템들을 확인하세요<br></p>
             </div>
             
      </div>
     <div class="aside2">
        <div class="aside2-title">최근 본 상품</div>
            <div class="aside2-contentbox"></div>
      </div>
    </div> 
      <div class="footer">
        <p>대표이사. 놈코어 │ 사업자등록번호. 123-45-67890 │ 통신판매업신고. 2020-경기용인-0835 │ 개인정보보호책임자. 놈코어 [사업자정보확인]<br>
          회사명. ㈜NormCore │ 전화. 031-265-8138 │ 팩스. 02-123-4567 │ 이메일. NormCore@yongin.ac.kr │ 주소. 경기도 용인시 <br>
          ⓒ 2020 NormCore All rights reserved. │ 개인정보처리방침 │ 영상정보처리기기운영･관리방침 │ 이용약관 │ Hosting by cafe24 
          </p>
      </div>
   

</body>
</html>