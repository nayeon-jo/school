<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <title>NormCore</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"><!--style.css 연결-->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

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
          <div class="items1">
              <div class="item1">
            <ul>
                <li><img src="image/blouse1.jpg"></li>
                <li><img src="image/knit1.jpg"></li>
                <li><img src="image/blouse1.jpg"></li>
              </ul>
          </div>
        </div>

             <div class="sub-title">   
                <p style="font-size:35px;">>Weekly Best<<br><br></p>
                <p>한 주간 가장 많이 사랑 받은 아이템들을 확인하세요<br></p>
             </div>
      
           <div class="items2">
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/toptop.webp" alt="jacket1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/toptop2.webp" alt="knit1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/top3.webp" alt="knit1"></div>
            </div>
            <div class="items3">
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/blouse1.jpg" alt="glasses1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/top3.webp" alt="tshirt1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/knit1.jpg" alt="knit1"></div>
           </div>    
          <!-- 바꾼부분 -->
           <div class="items4">
             <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/glasses1.jpg" alt="glasses1"></div>
             <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/tshirt1.PNG" alt="tshirt1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/knit1.jpg" alt="knit1"></div>
            </div>       
            <div class="items5">
             <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/glasses1.jpg" alt="glasses1"></div>
             <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/tshirt1.PNG" alt="tshirt1"></div>
            <div class="item" data-text="꽈배기니트
            25,000원"><img src="image/knit1.jpg" alt="knit1"></div>
            </div>
         
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