<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberInsert.do" method="get">
		ID: <input type="text" name="id"><br>
		Password: <input type="password" name="pwd"><br>
		Name: <input type="text" name="name"><br>
		E-mail: <input type="text" name="email"><br>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>