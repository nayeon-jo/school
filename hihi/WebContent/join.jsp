<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <title>NormCore</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"><!--style.css 연결-->
    <style>
.table{
         margin:0 auto;
        
        border-collapse: collapse;
      }
   th, td {
    border: 1px solid #bdbebd;
 
  }
#btnSubmit{

  width: 300px;
    height: 50px;
    font-size: 20px; 
    /* color:white;
    background-color:rgba(26,47,62,0.95); */
    color:#1a2f3e;
    background-color: bdbebd;
    border:1px solid black;
    float:right;
   
    /* outline: 0; */
}
 #btnclear{

    width: 200px;
    height: 40px;
    font-size: 16px; 
    color: black;
    background-color: #bdbebd; 
    float:right;
    border:0;
    outline: 0;
 } 

</style>

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
            <p style="margin:0px 0px 20px 115px; font-size: 30px;">Register</p>
            <form name="regForm" method="post" action="memberInsert.do">
              
            <table class="table" border="0">
                               
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;아이디</td>
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="text" name="id" size="15">
                                   </td>
                               </tr>
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;패스워드</td>
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="password" name="pwd" size="15">
                                   </td>
                               </tr>
                              
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;이름</td>
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="text" name="name" size="15">
                                   </td>            
                               </tr>
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;이메일</td>
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="text" name="email" size="27"></td>           
                               </tr>
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;전화번호</td>   
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="text" name="phone" size="20"></td>          
                               </tr>            
                               <tr>
                                   <td style="width: 170px; height: 45px; border-right: 0px;">&nbsp;우편번호</td>            
                                   <td style="width: 550px; height: 45px; border-left:0px;">            
                                       <input type="text" name="zipcode" style = "border-right: 0px;" size="7">     
                                   </td>
                               </tr>            
                               <tr>           
                                   <td style="width: 150px; height: 45px; border-right: 0px;">&nbsp;주소</td>           
                                   <td style="width: 550px; height: 45px; border-left:0px;">
                                   <input type="text" name="address" size="60"></td>           
                               </tr>
                               <tr>
                                <td colspan="2" style="text-align: right; border:0px">
                                    <!-- <input type="reset" value="CANCEL" id="btnclear"> -->
                                    <input type="submit" value="JOIN MEMBER" id="btnSubmit" onclick="location.href='./memberInsertOutput.jsp'">
                                </td>
                            </tr>
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
   
    
    </div>
  </div>
</body>
</html>