<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <title>NormCore</title>
    <link rel="stylesheet" type="text/css" href="style.css"><!--style.css 연결-->
    <meta http-equiv='refresh' content='boxtodayview.skin.php'>
    <link rel="stylesheet" type="text/css" href="style3.css">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <script src="gongzi.js" defer></script>
    
    <style>
   a:link     {color:#1a2f3e;text-decoration:none}
    a:visited  {color:#1a2f3e;text-decoration:none}
    a:active   {color:#1a2f3e;text-decoration:none}
    a:hover    {color:#1a2f3e;text-decoration:none}


    .container{
      width:1500px;
      margin:0 auto; 
    }
  
    
    .body{ 
          width:1400px;
           display:flex;
           margin:0 auto;  
        } 
    
    .nav-items{
      display:flex; 
      margin-left:auto; 
    }
    .nav-item{
      margin-left:20px;
      color:#1a2f3e;
    }
    .nav-item img {
        width:15px;
        height:15px;
    }


    .submit-img{
      float:right;
      width:15px;
      height:15px;
      padding:10px 0;
      margin-top: 7px;
      margin-right: 20px;
    }   
    .search-item-box{
       float:right;
        border-top:0px;
        border-right:0px;
        border-left:0px;
        border-bottom: 1px solid #1a2f3e;
        width:100px;
        text-align: center;
        padding:7px 0px;
        margin-left: 20px;
        margin-top: 5px;

    }

     *{
  transition: all ease-in 0.3s;
} 
 


     input:focus {outline:none;} /*클릭시 테두리 안나오게 하기 */ 
    .title{
        height:120px;
        margin-top: 50px;
        margin-bottom:50px;
        font-weight: bold;
        font-size:50px;
        text-align:center;
        color:#1a2f3e;
        
      
      }
       
        
      .aside{
        
        margin-right:30px;
        width:200px;
        height:700px;           
        float:left;
        font-size:25px;

      
      }
      
      .aside ul li { 
       list-style-type:none; 
       color:#1a2f3e;
       }
       .main{
        width:1000px;
        margin:0 auto;
       
       }
       /* 바꾼 부분 */
        .items1, .items2, .items3 ,.items4,.items5{
            display: flex;
            justify-content: center;
            
        } 
        
       .item1{
         margin-top: 15px;
        width:700px;
        height: 600px;
       } 
       .item1 img{
        margin-top: 15px;
        width:700px;
        height: 600px;
         
       }    
       /*  */ 
       .item img{
        width:270px;
        height:300px;
        margin:15px;
       }
       
        .aside2{       
         margin-left: 30px;
        width:200px;
        height:700px;          
        /* float:right; */
        font-size:20px;
      
        

      }
       .aside2-title{
           font-size: 25px;
           color:#1a2f3e;
       }
       .aside2-contentbox{
           width:150px;
           /* 바꿈 */
           height:400px;
           /*  */ 
           border:1px solid #1a2f3e;
       } 
       .footer{
        height:150px;
        text-align: center;
        color:#1a2f3e;
        /* 바꾼부분 */
        font-size:13px;
        margin-top: 50px;
       } 
      
       #parent{
        position: relative;
        display:inline-block;
        

       }
     .balloon{
       position:absolute;
       top:90%;
       left:10%;
       padding:7px 14px 7px 14px;
      font-size:15px;
       background-color:#1a2f3e;
      color:white;
      border-radius: 10%; 
      opacity: 0;
      transition:0.35s;
    } 
     #parent:hover .balloon{
      opacity:1;
    }
    .balloon:before{   
      content:'';
      width:0;
      height:0;
      border-style:solid;
      border-width :5px;
      border-color:transparent transparent #1a2f3e transparent;
      position:absolute;
      bottom:100%;
      left:30%;
      transform:translateX(50%);
    } 
  /* .top ul li  a:hover{
    font-weight: bold;
  } */

  .line {border-bottom:1px solid black;} /* 상품명 밑줄 */


.tabmenu {
    width:755px;
    font-size: 0;
    margin:0 auto;
    margin-top: 100px;
}

.tabmenu input[type="radio"] {
    display: none;
}

.tabmenu label {
    color:#1a2f3e;
    display: inline-block;
    width: 245px;
    padding: 20px 0;
    border:1px solid #1a2f3e;
    text-align: center;
    font-size: 20px;
    cursor: pointer;
}

 .tabmenu label:nth-of-type(2) {
    width: 258px;
} 

.tabmenu .cont{
    display: none;
    min-height: 500px;
    padding: 20px;

    
}

/* 탭 선택되면 탭 영역이 바뀌게 */
.tabmenu input[type="radio"]:checked + label {
    background-color:rgba(26,47,62,0.9);
    color:white;
}

.tabmenu #tab1:checked ~ #cont1,
.tabmenu #tab2:checked ~ #cont2,
.tabmenu #tab3:checked ~ #cont3 {
    display: block;
}

#cont1{
    text-align: center;
    
}
.item{
    margin:50px;
}


</style>
</head>
<body onload="init();">
  <script language="JavaScript">
       
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

    </script>


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
 <table>
  <tr>
    <td width=100></td>
    <td rowspan=7><img src = "./image/outer1.jpg" width=400px height=400px></td>
    <td width=50></td>
    <td colspan=2 class="line">&nbsp;&nbsp;outer1</td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Price</td>
    <td>64,000</td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Color</td>
    <td>
    <select id="class1" >
      <option value="선택">- 옵션 선택 -</option>
      <option value2="ivory">Ivory</option>
      <option value2="navy">Navy</option>
    </select>
    </td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Size</td>
    <td>
    <select id="class">
      <option value="선택">- 옵션 선택 -</option>
      <option value="free">FREE</option>
    </select>
    </td>
  </tr>
$("class1 option:selected").attr('value2');

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Qty</td>
    <td>
      <form name="form" method="get">
        <input type="button" style="border:none; border: none; background: transparent;" value=" - " onclick="del();"> 

        <input type=hidden name="sell_price" value="64000">
        <input type="text" name="amount" value="1" size="3" style="text-align: center; background-color:transparent;border:0" onchange="change();">

        <input type="button" style="border:none; border: none; background: transparent;" value=" + " onclick="add();">
         
    </td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td>&nbsp;&nbsp;Total Price</td>
    <td>
        <input type="text" name="sum" size="8" style="text-align: right; font-size:20px; background-color:transparent;border:0;" readonly>원
      </from>
    </td>
  </tr>

  <tr>
    <td></td>
    <td width=50></td>
    <td><input type="submit" style="width:110pt;height:60pt;background: transparent;" value="구 매"></td>
    <td><input type="submit" style="width:110pt;height:60pt;background: transparent;" value="장바구니"></td>
  </tr>
</table>   

<div class="tabmenu">
    <input type="radio" name="tab" id="tab1" checked>
    <label for="tab1">Details</label>
    <input type="radio" name="tab" id="tab2">
    <label for="tab2">Product Info</label>
    <input type="radio" name="tab" id="tab3" >
    <label for="tab3">Delivery Info</label>
<!-- size, color 맞춰서 적어놓기 -->
    <div class="cont" id="cont1">
        <p style="margin-top:50px;font-size:30px;text-align: center;">Black</p>
        <div class="item"><img src="image/outerivory1-1.jpg"  style="width:600px;height:650px;"></div>
        <div class="item"><img src="image/outerivory1-2.jpg"  style="width:600px;height:650px;"></div>
        <p style="margin-top: 50px;font-size:30px;text-align: center;">White</p>
        <div class="item"><img src="image/outernavy1-1.jpg"  style="width:600px;height:650px;"></div>
        <div class="item"><img src="image/outernavy1-2.jpg"  style="width:600px;height:650px;"></div>
        <p style="margin-top:150px; margin-bottom:150px; font-size:17px; line-height: 30px;">
            size(cm)<br>
            총장66 허리57 가슴57 암홀28 팔길이56 소매13 밑단(조절가능)<br><br>

            model size<br>
            170cm / top 55 / bottom 27(S) / shoes 245mm
        </p>
        
    </div>
    <div class="cont" id="cont2">
        <p style="font-size: 30px; line-height: 70px;">Product</p>
        <p style="font-size: 15px; line-height: 30px;">
            -모든 사움은 결제가 완료된 후 주문이 들어갑니다.<br>
            -품절 또는 지연 상품의 경우 주문 완료 후 익일부터 문자로 안내해드립니다.<br>
            -거래처 상품 품절시 100% 환불 처리 해드립니다.<br>
            -상세 사이즈는 재는 방법에 따라 1-2cm 오차가 발생할 수 있습니다.<br>
            -PC화면마다 해상도가 달라 색상 차이가 있을 수 있습니다.<br><br>
        </p>

        <p style="font-size: 30px; line-height: 70px;">EXCHANGE / REFUND</p>
        <p style="font-size:15px; line-height: 30px; margin-bottom: 100px;">
            -교환 및 반품시 상품을 수령하신 날로부터 <b>24시간 이내</b>로 연락 부탁드립니다.<br>
            &nbsp;&nbsp;[콜센터 운영시간 : PM 2:00 - PM 5:00]<br>
            -<b>단순 변심</b>에 의한 교환/환불은 <b>왕복 택배비 5000원</b>을 부담해주셔야 합니다.<br>
            -<b>화이트/아이보리/크림 계열/핸드 메이드,니트,가죽,신발,가방 및 악세사리류</b>는 <b>교환/환불이 불가능</b>합니다.<br>
            -타 택배사 이용시 추가 비용이 발생할 수 있으며 반드시 선불로 보내주셔야 합니다.<br>
            -교환/반품 상품과 왕복 배송비 5000원을 동봉하여 받으신 운송장 번호로 예약 후 보내주시면 됩니다.<br>
            &nbsp;&nbsp;/ 선불로 타 택배사 이용시 편도 택배비 2500원을 동봉해주시면 됩니다.<br>
            -타 택배사 이용시 추가 비용이 발생할 수 있으며 반드시 선불로 보내주셔야 합니다.<br>
            -상품 불량시 배송 수령 당일 <b>24시간 내</b>로 연락주시면 같은 상품으로 교환 처리 됩니다.<br>
            &nbsp;&nbsp;/ 기간이 지나서 연락주시면 처리 불가능합니다.<br>
            &nbsp;&nbsp;/ 불량 및 오배송으로 인한 교환 및 반품 비용은 NormCore에서 부담합니다.<br>
            -상품에 따라 교환/환불이 불가능 할 경우도 있으니 충분한 상담 후 구매 바랍니다.<br>
        </p>
            
    </div>
    <div class="cont" id="cont3">
        <p style="font-size: 30px; line-height: 70px;">Delivery</p>
        <p style="font-size:15px; line-height: 30px;">
            -배송 지역 : 국내<br>
            -배송 업체 : 우체국택배<br>
            -배송 비용 : 50,000원 이상 구매시 무료 배송<br>
            -배송 기간 : 결제 후 3-7일 소요 (주말 및 공휴일 제외)<br>
            &nbsp;&nbsp;+ 거래처의 상황에 따라 변동 가능성 있습니다.<br>
            &nbsp;&nbsp;+ 자체제작 상품 - 제작기간 7~10일 소요<br>
            /복수 구매의 경우 합배송을 원칙으로 합니다.

        </p>
    </div>
</div>


            
             
      </div>
     <div class="aside2">
        <div class="aside2-title"></div>
            <div class="aside2-contentbox"></div>
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