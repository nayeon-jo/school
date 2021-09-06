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

        input {
            /* -webkit-writing-mode: horizontal-tb !important; */
            text-rendering: auto;
            color: initial;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            display: inline-block;
            text-align: start;
            -webkit-appearance: textfield;
            background-color: white;
            cursor: text;
            margin: 0em;
            font: 500 200px;
            padding: 10px 0px;
            border-style: inset;
            border-color: initial;
            border-image: initial;
        }

        .inner_login {
            position: absolute;
            }

        .login{     
            position: relative;
            width: 350px;
            margin: 0 auto;
        }

        .screen_out {
            position: absolute;
            width: 0;
            height: 0;
            text-indent: -9999px; 
        }

        body, button, input, select, td, textarea, th {
            font-size: 20px;
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        fieldset, img {
            border: 0;
        }

        .login .box_login {
            margin: 35px 0 10;
            width: 320px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-sizing: border-box;
            }

        .login .inp_text {
            position: relative;
            width: 320px;
            margin: 0;
            padding: 12px 12px 12px;
            box-sizing: border-box;
            }

        .login.inp_text+.inp_text {
            border-top: 1px solid #000;
            }

        .inp_text input {
            display: block;
            width: 320px;
            height: 100%;
            font-size: 15px;   /*폰트크기*/
            color: #000;
            border: none;
            outline: 0;
            -webkit-appearance: none;
            background-color: transparent;
            }


        .btn_login {
            width: 320px;
            height: 55px;
            font-size: 20px;     /*폰트크기*/
            color: #fff;
            background-color:#1a2f3e;
            border-color:#fff;
            border: none;
            margin-bottom: 3;
        }

        .btn_join {
            width: 320px;
            height: 50px;
            font-size: 20px;        /*폰트크기*/
            color: #1a2f3e;
            background-color: #fff;
            border-color:#909090;
        }



        .footer{
            height:150px;
            text-align: center;
            font-size:12px;
            color:#1a2f3e;
            margin-top: 10px;
        } 
</style>
</head>
<body>
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
              <li><a href="https://www.instagram.com/" target="blank"><img src="image/instagram.png"  width="25" height="25" alt="instagram" ></a>
                <a href="https://www.kakotalk.com/" target="blank">&nbsp <img src="image/talk.png"  width="25" height="25" alt="kakotalk"></a></li>
              <li>NOTICE</li>
              <li>Q&A</li>
            </ul>
        </div>
  <body>

<div class="login">
<form action = "login.do" method = "post">
    <fieldset>
        <div class="box_login">
            <div class="inp_text">
                <label for="loginId" class="screen_out">아이디</label>
                <input type="text" id="loginId" name="id" placeholder="ID" >
            </div>

            <div class="inp_text">
                <label for="loginPw" class="screen_out">비밀번호</label>
                <input type="password" id="loginPw" name="pwd" placeholder="Password" >
            </div>
        </div>

        <input type="submit" class="btn_login"  value = "LOGIN">
        <button type="button" class="btn_join" onClick="location.href='join.jsp'">JOIN MEMBER</button>

    </fieldset>
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