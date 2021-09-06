<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dev.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"><!--style.css 연결-->
<script language="JavaScript" src="js/common.js"></script>
</head>
<body>
<!-- (바꾼부분) div를 삭제하고 nav, ul 태그 삽입  -->
<div class="container">
  <div class="top">
<nav>
  <ul>

    <input class="submit-img" type="image" src="image/search.PNG">
    <input class="search-item-box" type="text" >

      <li><a href="#"><img src="image/setting.png" width="15px" height="15px"> MYPAGE &nbsp</a>
        <ul>
          <li><a href="#"><img src="image/cart.png" width="15px" height="15px"> 장바구니</li></a>
          <li><a href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp" target="blank"><img src="image/box.png" width="15px" height="15px"> 배송 현황</li></a>
          <li><a href="#"><img src="image/paper.png" width="15px" height="15px"> 회원 정보</li></a>
        </ul>
      </li>
      
      <li id="parent"><a href="#"><img src="image/join.png" width="15px" height="15px"> JOIN<div class="balloon">2000</div></a></li>
      <li><a href="#"><img src="image/login.png" width="15px" height="15px"> LOGIN</a></li>

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

  <form name="frmJoin" action="" method="get" onSubmit="return CheckForm(this)"> 
  <br>
  <table style="margin:auto; border: 2px solid #036; width:700px;">
    <tr>
      <td style="border-bottom:1px solid #D5D5D5;">
      <br>  
        <p style = "font-size: 20px; font-weight: bold; color:#036; text-align: left ">&nbsp&nbsp&nbsp Order/Payment &nbsp&nbsp&nbsp주문/결제</p>
        <br>
      </td>
    </tr>
    <tr>
      <td>
      <table class="type09" style="margin:auto;">
        <thead>
        <tr>
            <th>Recipient Info</th>
            <th scope="cols">수령자 정보</th>
        </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">수령인</th>
            <td>
              <input type="text" name="name" id = "name" size = "5">
            </td>

           </tr>
           <tr>
            <th scope="row">휴대전화</th>
            <td>
              <select id="class" >
              <option value="010" name="010" id="010">010</option>
              <option value="011" name="011" id="011">011</option>
              <option value="016" name="016" id="016">016</option>
              <option value="017" name="017" id="017">017</option>
            </select> 
            -
          <input type = "text" id="userphone2" onkeyup="checkNumber()" maxlength="4" size="4" name = "userphone2" style='IME-MODE: disabled' id = "userphone2" /> -
          <input type = "text" id="userphone3" onkeyup="checkNumber()" maxlength="4" size="4"  name ="userphone3" style='IME-MODE: disabled' id ="userphone3"/>
            </td>
          </tr>
          <tr>
              <th scope="row">전화번호</th>
               <td>
                <select id="class" >
                <option value="031" name="031" id = "031">031</option>
                <option value="02" name="02" id = "02">02</option>
                <option value="051" name="051" id = "051">051</option>
                <option value="032" name="032" id = "032">032</option>
              </select>
              -
            <input type = "text" id="userphone5" onkeyup="checkNumber()" maxlength="4" size="4" name = "userphone5" style='IME-MODE: disabled' id = "userphone5" /> -
            <input type = "text" id="userphone6" onkeyup="checkNumber()" maxlength="4" size="4"  name = "userphone6" style='IME-MODE: disabled' id = "userphone5"/>
              </td>
          </tr>
          <tr>
              <th scope="row">배송지 주소</th>
              <td>
                <input type="text" id="postcode" size="4" placeholder="우편번호">
                
                <input type="text" id="address" style="width:300px;" placeholder="주소" /><br>
                <input type="text" id="detailAddress"  placeholder="상세주소"   />
                <input type="text" id="extraAddress" placeholder="참고항목"> 
              </td>
          </tr>
        <tr>
          <th scope="row">배송 메모</th>
          <td>
            <input type="text" name="note" id="note" style="width:300px; height:40px;">
          </td>
          </tbody>
            <thead>
              <tr>
                  <th >Product Info </th>
                  <th scope="cols">상품 정보</th>
              </tr>
           </thead>
   <!--   <table class="type08" border="1" style = "margin:auto;">
        <tbody>
            <tr>
              <td width="300" text-align="center"><font size=2>상품 정보</font></td>
              <td><font size=2px align="center">수량</font></td>
              <td width="90" text-align="center"><font size=2>상품 금액</font></td>
              <td><font size=2px text-align="center">적립금</font></td>
            </tr>
            <tr>
              <td text-align="right">
              </td>
              <td text-align="right"><font size=2>개</font></td>
              <td text-align="right"><font size=2>원</font></td>
              <td text-align="right"><font size=2>원</font></td>
            </tr>
        </tbody>
    </table> -->
    <%
	ArrayList<ProductVO> list = (ArrayList<ProductVO>)request.getAttribute("list");
	if(!list.isEmpty()){	%>
		<table class="type08" border="1" style = "margin:auto;">
		<tbody>
			<tr>
				<th width="300" >상품명&nbsp;</th>
				<th>수량&nbsp;</th>
				<th width="90">사이즈&nbsp;</th>
				<th>토탈 금액&nbsp;</th>
			</tr>
			<% for (int i = 0; i < list.size(); i++){
				ProductVO member = list.get(i);%>
				<tr>
					<td><%= member.getPn() %></td>
					<td><%= member.getAm() %>개</td>
					<td><%= member.getPs() %></td>
					<td><%= member.getPtotal() %>원</td>
				</tr>
			<% }
	}
	else
	{
		out.print("No Product!!!");
	}
			%>
			</tbody>	
		</table>
      <table class="type09" style="margin:auto;">
        <thead>
            <tr>
                <th>Payment Info </th>
                <th scope="cols">결제 정보</th>
            </tr>
         </thead>
         <tbody>
        <tr>
            <th scope="row">결제 수단</th>
            <td>
              
              <input type="checkbox" name="checkbox1" value="1" onclick="oneCheckbox(this)"><font size=2px>신용 카드</font>
              <input type="checkbox" name="checkbox1" value="2" onclick="oneCheckbox(this)"><font size=2px>가상 계좌(무통장)</font>
              <input type="checkbox" name="checkbox1" value="3" onclick="oneCheckbox(this)"><font size=2px>계좌이체</font>
            </td>
          </tr>
          <th scope="row">품절 시 처리 방법</th>
            <td>
              <input type="checkbox" name="checkbox2" value="4" onclick="twoCheckbox(this)"><font size=2px>Refund 환불</font>
              <input type="checkbox" name="checkbox2" value="5" onclick="twoCheckbox(this)"><font size=2px>Exchange 교환</font>
            </td>
          <tr>

            <th scope="row">주문자 동의</th>
            <td>
              <input type="checkbox" id="U_checkAgreement1" name="U_checkAgreement1" value="1"><font size=2px>개인정보 제3자 제공 동의(필수)</font><br>
              <input type="checkbox" id="U_checkAgreement2" name="U_checkAgreement2" value="2"><font size=2px>위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.(필수)</font>
            </td>
          </tr>

         </tbody>
        </table>

        <br>
      </td>
      </tr>
  </table>

  <table style="margin:auto;">
    <tr style="height:20px;">
    </tr>
  <tr>
    <td>
    <input type = "submit"  onClick="return Form_chk();" id="Payment" name="Payment" value="Payment" 
    style="border:none; background:#036 ; text-align:center; color: #f3f6f7; font-size:15pt; height:50px; width:120px; border-radius:5px;">
    </td>
  </tr>
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
   
    
   
</body>
</html>